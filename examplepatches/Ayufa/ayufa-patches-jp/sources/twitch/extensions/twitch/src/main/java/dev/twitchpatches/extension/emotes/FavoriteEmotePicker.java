package dev.twitchpatches.extension.emotes;

import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public final class FavoriteEmotePicker {
    private static final String TITLE = "Favorites";
    private static ImageView button;
    private static int footerShiftFrom;
    private static int footerShiftBy;
    private static int insertedItems;
    private static int position = -1;

    private FavoriteEmotePicker() { }

    public static void longClicked(View tile, Object clicked) {
        if (!FavoriteEmotes.enabled()) return;
        String id = FavoriteEmoteBridge.emoteId(clicked);
        String key = id == null ? null : FavoriteEmoteKeys.ofPickerId(id);
        if (key == null) return;
        FavoriteEmoteDetails details = FavoriteEmoteDetails.of(FavoriteEmoteBridge.lockedToken(clicked),
                FavoriteEmoteBridge.lockedChannel(clicked), FavoriteEmoteBridge.lockedKind(clicked));
        FavoriteEmoteMenu.show(tile, FavoriteEmotes.keys().contains(key), FavoriteEmoteBridge.hasVariants(clicked),
                () -> FavoriteEmotes.toggle(key, details));
    }

    // Twitch's Channel button jumps to the end of the first section, where Favorites sits.
    public static Integer footerTarget(int target) {
        return footerShiftBy > 0 && target == footerShiftFrom ? target + footerShiftBy : target;
    }

    static List<?> insert(List<?> sections) {
        footerShiftBy = 0;
        insertedItems = 0;
        position = -1;
        List<?> result = FavoriteEmotes.enabled() ? withFavorites(sections) : sections;
        updateButton();
        return result;
    }

    static int insertedItems() { return insertedItems; }

    static void bind(LinearLayout bar, ImageView anchor, ScrollTarget scroll) {
        if (!FavoriteEmotes.enabled()) return;
        ImageView star = new ImageView(bar.getContext());
        star.setLayoutParams(new LinearLayout.LayoutParams(anchor.getMinimumWidth(), bar.getLayoutParams().height));
        star.setPadding(anchor.getPaddingLeft(), anchor.getPaddingTop(), anchor.getPaddingRight(), anchor.getPaddingBottom());
        star.setImageResource(FavoriteEmoteMenu.drawable(bar.getContext(), FavoriteEmoteMenu.STAR_EMPTY));
        star.setImageTintList(anchor.getImageTintList());
        star.setContentDescription(TITLE);
        star.setOnClickListener(clicked -> { if (position >= 0) scroll.scrollTo(position); });
        bar.addView(star, bar.indexOfChild(anchor) - 1);
        button = star;
        updateButton();
    }

    static void close() {
        button = null;
        FavoriteEmoteMenu.dismiss();
    }

    private static List<?> withFavorites(List<?> sections) {
        Map<String, Object> available = new HashMap<>();
        for (Object section : sections) {
            for (Object model : FavoriteEmoteBridge.entries(section)) {
                Object clicked = FavoriteEmoteBridge.clicked(model);
                String id = clicked == null ? null : FavoriteEmoteBridge.emoteId(clicked);
                String key = id == null ? null : FavoriteEmoteKeys.ofPickerId(id);
                if (key != null) available.putIfAbsent(key, model);
            }
        }
        List<Object> favorites = new ArrayList<>();
        for (String key : FavoriteEmotes.keys()) {
            Object model = available.get(key);
            if (model == null) model = lockedElsewhere(key);
            if (model != null) favorites.add(model);
        }
        if (favorites.isEmpty()) return sections;
        int index = !sections.isEmpty() && FavoriteEmoteBridge.frequentlyUsed(sections.get(0)) ? 1 : 0;
        position = EmotePickerBridge.itemCount(sections.subList(0, index));
        insertedItems = favorites.size() + 1;
        footerShiftFrom = position;
        footerShiftBy = index == 0 ? 0 : insertedItems;
        List<Object> result = new ArrayList<>(sections);
        result.add(index, EmotePickerBridge.section(TITLE, favorites));
        return result;
    }

    private static Object lockedElsewhere(String key) {
        FavoriteEmoteDetails details = FavoriteEmotes.details(key);
        if (details == null || !key.startsWith("t:")) return null;
        return FavoriteEmoteBridge.lockedModel(key.substring(2), details.token, details.channel, details.kind);
    }

    private static void updateButton() {
        if (button != null) button.setVisibility(position >= 0 ? View.VISIBLE : View.GONE);
    }

    interface ScrollTarget {
        void scrollTo(int position);
    }
}
