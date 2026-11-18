package io.github.sabopura.morphe.extension.twitch.chat.emotes;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.BaseAdapter;
import android.widget.GridView;

import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;
import io.github.sabopura.morphe.extension.twitch.ui.Text;
import io.github.sabopura.morphe.extension.twitch.ui.Ui;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * The picker's grid of third-party emote images for one channel. A tap picks an emote, a long press
 * adds it to or takes it out of the favourites. Cells are recycled, so a channel with a thousand
 * emotes costs no more than the ones on screen.
 */
public final class EmoteGrid extends GridView {
    public static final int FAVORITES = 0, CHANNEL = 1, GLOBAL = 2;
    private static final int CELL_DP = 52, IMAGE_DP = 32, MAX_RESULTS = 300;

    public interface Listener {
        void picked(String name);

        /** Something to tell the user, such as what a long press just did. */
        void said(String text);

        /** The emotes on show changed, which also happens when a channel's list arrives. */
        void listed();
    }

    private final String channelId;
    private final Listener listener;
    private final Ui ui;
    private final float density;
    private final List<Emote> shown = new ArrayList<>();
    private final Set<String> favoriteKeys = new HashSet<>();
    private final java.util.function.Consumer<String> onImage = this::imageReady;
    private int tab = CHANNEL;
    private String query = "";

    private final BaseAdapter adapter = new BaseAdapter() {
        @Override
        public int getCount() {
            return shown.size();
        }

        @Override
        public Object getItem(int position) {
            return shown.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(int position, View recycled, ViewGroup parent) {
            Cell cell = recycled instanceof Cell ? (Cell) recycled : new Cell(getContext());
            Emote emote = shown.get(position);
            cell.bind(emote, favoriteKeys.contains(emote.favoriteKey()));
            return cell;
        }
    };

    public EmoteGrid(Context context, String channelId, Listener listener) {
        super(context);
        this.channelId = channelId;
        this.listener = listener;
        ui = Ui.of(context);
        density = context.getResources().getDisplayMetrics().density;
        setNumColumns(AUTO_FIT);
        setColumnWidth(Math.round(CELL_DP * density));
        setStretchMode(STRETCH_COLUMN_WIDTH);
        setSelector(ui.pressable(context, 0, 12));
        setDrawSelectorOnTop(true);
        setAdapter(adapter);
        setOnItemClickListener((parent, view, position, id) -> listener.picked(shown.get(position).name));
        setOnItemLongClickListener((parent, view, position, id) -> {
            toggleFavorite(shown.get(position));
            return true;
        });
    }

    /** How many emotes a tab holds, so the picker can open on the first tab with something in it. */
    public int count(int tab) {
        return list(tab).size();
    }

    /** Shows a tab, or the matches for {@code query} in every tab when there is one. */
    public void show(int tab, String query) {
        this.tab = tab;
        this.query = query.trim();
        reload();
    }

    public boolean isEmpty() {
        return shown.isEmpty();
    }

    /** Reads the lists again: a channel's emotes arrive from the network after the grid is on screen. */
    private void reload() {
        favoriteKeys.clear();
        for (FavoriteEmotes.Entry entry : favorites().entries) favoriteKeys.add(entry.key);
        shown.clear();
        if (query.isEmpty()) {
            shown.addAll(list(tab));
        } else {
            Map<String, Emote> all = new LinkedHashMap<>();
            for (Emote emote : list(CHANNEL)) all.put(emote.name, emote);
            for (Emote emote : list(GLOBAL)) all.put(emote.name, emote);
            for (String name : EmoteCompletion.rank(all.keySet(), query, MAX_RESULTS)) shown.add(all.get(name));
        }
        adapter.notifyDataSetChanged();
        listener.listed();
    }

    private List<Emote> list(int which) {
        Context context = getContext();
        if (which != FAVORITES) return EmoteSupport.catalog().emotes(context, channelId, which == GLOBAL);
        // Favourites are stored by key; here they are the ones this channel can draw, in the order kept.
        Map<String, Emote> known = new HashMap<>();
        for (Emote emote : EmoteSupport.catalog().emotes(context, channelId, false)) known.put(emote.favoriteKey(), emote);
        for (Emote emote : EmoteSupport.catalog().emotes(context, channelId, true)) known.put(emote.favoriteKey(), emote);
        List<Emote> found = new ArrayList<>();
        for (FavoriteEmotes.Entry entry : favorites().entries) {
            Emote emote = known.get(entry.key);
            if (emote != null) found.add(emote);
        }
        return found;
    }

    /** Name-only entries take their id-based key as soon as the channel's catalog knows them. */
    private FavoriteEmotes favorites() {
        SharedPreferences prefs = ChatSettings.preferences(getContext());
        FavoriteEmotes favorites = FavoriteEmotes.load(prefs);
        if (favorites.resolve(name -> EmoteSupport.find(getContext(), channelId, name))) favorites.save(prefs);
        return favorites;
    }

    private void toggleFavorite(Emote emote) {
        FavoriteEmotes favorites = favorites();
        boolean was = favorites.indexOf(emote) >= 0;
        if (!favorites.toggle(emote)) {
            listener.said(Text.label("お気に入りは" + FavoriteEmotes.LIMIT + "件までです", "Up to " + FavoriteEmotes.LIMIT + " favorites"));
            return;
        }
        favorites.save(ChatSettings.preferences(getContext()));
        performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
        reload();
        listener.said(was ? Text.label(emote.name + " をお気に入りから外しました", "Removed " + emote.name + " from favorites")
                : Text.label(emote.name + " をお気に入りに追加しました", "Added " + emote.name + " to favorites"));
    }

    /** An image finished loading: only the cells still waiting for it take it. */
    private void imageReady(String url) {
        for (int i = 0; i < getChildCount(); i++) {
            View child = getChildAt(i);
            if (child instanceof Cell) ((Cell) child).imageReady(url);
        }
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        EmoteSupport.addImageListener(onImage);
        EmoteSupport.onCatalogChanged(this::reload);
    }

    @Override
    protected void onDetachedFromWindow() {
        EmoteSupport.removeImageListener(onImage);
        EmoteSupport.onCatalogChanged(null);
        super.onDetachedFromWindow();
    }

    private final class Cell extends EmoteImageView {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF box = new RectF();
        private final Path star = new Path();
        private Emote emote;
        private boolean favorite;

        Cell(Context context) {
            super(context);
            inset = Math.round((CELL_DP - IMAGE_DP) / 2f * density);
            setLayoutParams(new AbsListView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Math.round(CELL_DP * density)));
        }

        void bind(Emote emote, boolean favorite) {
            this.emote = emote;
            this.favorite = favorite;
            setContentDescription(favorite ? emote.name + Text.label("、お気に入り", ", favorite") : emote.name);
            EmoteImageLoader.Image image = EmoteSupport.images().image(getResources(), emote);
            show(image);
            if (image == null) EmoteSupport.images().request(getContext(), emote, Math.round(IMAGE_DP * density));
        }

        void imageReady(String url) {
            if (emote != null && !hasImage() && emote.url.equals(url)) bind(emote, favorite);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            if (!hasImage()) {
                paint.setColor(ui.line);
                box.set(inset, inset, getWidth() - inset, getHeight() - inset);
                canvas.drawRoundRect(box, 8 * density, 8 * density, paint);
            }
            super.onDraw(canvas);
            if (!favorite) return;
            float cx = getWidth() - 10 * density, cy = 10 * density, reach = 5.5f * density;
            star.rewind();
            for (int i = 0; i < 10; i++) {
                double angle = Math.PI / 5 * i - Math.PI / 2;
                float r = i % 2 == 0 ? reach : reach * .45f;
                float x = cx + (float) Math.cos(angle) * r, y = cy + (float) Math.sin(angle) * r;
                if (i == 0) star.moveTo(x, y);
                else star.lineTo(x, y);
            }
            star.close();
            paint.setColor(ui.accent);
            canvas.drawPath(star, paint);
        }
    }
}
