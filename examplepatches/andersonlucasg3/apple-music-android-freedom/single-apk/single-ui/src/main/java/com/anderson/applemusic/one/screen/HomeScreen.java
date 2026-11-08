package com.anderson.applemusic.one.screen;

import android.content.Context;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import com.anderson.applemusic.one.media.ArtworkLoader;
import com.anderson.applemusic.one.media.MediaClient;
import com.anderson.applemusic.one.theme.Inter;
import com.anderson.applemusic.one.theme.Shapes;
import com.anderson.applemusic.one.theme.Tokens;
import com.anderson.applemusic.one.widget.CoverCard;
import com.anderson.applemusic.one.widget.EmptyState;
import com.anderson.applemusic.one.widget.Focus;
import com.anderson.applemusic.one.widget.Icons;
import com.anderson.applemusic.one.widget.Pill;
import com.anderson.applemusic.one.widget.SeeAllCard;
import com.anderson.applemusic.one.widget.ShelfView;
import com.anderson.applemusic.one.widget.Skeleton;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Início: a hero card for the first shelf, then the engine's shelves as horizontal rows of
 * cover cards with a trailing "Ver tudo" card. While a shelf loads it keeps its exact
 * card footprint (static blocks), so the page does not jump when the covers arrive.
 */
public final class HomeScreen implements ChildSink {

    private final Context context;
    private final ScreenHost host;
    private final ArtworkLoader artwork;
    private final FrameLayout root;
    private final LinearLayout column;
    private final Map<String, ShelfView> shelves = new HashMap<String, ShelfView>();
    private final Map<String, String> shelfTitles = new HashMap<String, String>();

    private MediaClient.Item tab;
    private String tabId;
    private String firstShelfId;
    private String firstShelfTitle;
    private Skeleton skeleton;
    private int downFocusId = View.NO_ID;

    private FrameLayout hero;
    private ImageView heroCover;
    private TextView heroTitle;
    private TextView heroSubtitle;
    private MediaClient.Item heroItem;

    public HomeScreen(Context context, ScreenHost host, ArtworkLoader artwork) {
        this.context = context;
        this.host = host;
        this.artwork = artwork;

        root = new FrameLayout(context);
        root.setBackgroundColor(Tokens.BG);
        ScrollView scroll = new ScrollView(context);
        scroll.setFillViewport(true);
        column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setPadding(Tokens.dp(16), Tokens.dp(6), Tokens.dp(16), Tokens.dp(24));
        scroll.addView(column, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        root.addView(scroll, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
    }

    public View view() {
        return root;
    }

    public void setDownFocusId(int id) {
        downFocusId = id;
        for (ShelfView shelf : shelves.values()) shelf.linkFocus(downFocusId);
    }

    public void bind(MediaClient.Item tab) {
        this.tab = tab;
        this.tabId = tab.id;
        heroItem = null;
        firstShelfId = null;
        shelves.clear();
        shelfTitles.clear();
        column.removeAllViews();
        skeleton = Skeleton.home(context);
        column.addView(skeleton, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        host.loadChildren(tabId, this);
    }

    @Override
    public void onChildren(String parentId, List<MediaClient.Item> children) {
        if (tabId != null && tabId.equals(parentId)) {
            buildRoot(children);
            return;
        }
        ShelfView shelf = shelves.get(parentId);
        if (shelf != null) populateShelf(shelf, children);
    }

    @Override
    public void onFailed(String parentId) {
        if (tabId != null && tabId.equals(parentId)) {
            stopSkeleton();
            column.removeAllViews();
            EmptyState failure = new EmptyState(context, Icons.CLOSE,
                    "Não foi possível carregar o Início",
                    "Sem conexão com o Apple Music. Verifique a rede e tente de novo.");
            Pill retry = Pill.surface(context, Icons.REFRESH, "Tentar de novo");
            retry.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    if (tab != null) bind(tab);
                }
            });
            failure.addAction(retry);
            column.addView(failure, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            host.status("Não foi possível carregar o Início");
            return;
        }
        host.status("Não foi possível carregar uma prateleira");
    }

    private void buildRoot(List<MediaClient.Item> children) {
        stopSkeleton();
        column.removeAllViews();
        shelves.clear();
        shelfTitles.clear();

        List<MediaClient.Item> browsable = new ArrayList<MediaClient.Item>();
        List<MediaClient.Item> playables = new ArrayList<MediaClient.Item>();
        for (MediaClient.Item item : children) {
            if (item.browsable) browsable.add(item);
            else if (item.playable) playables.add(item);
        }
        if (browsable.isEmpty() && playables.isEmpty()) {
            column.addView(new EmptyState(context, Icons.NOTE, "Nada para mostrar",
                    "O Apple Music não expôs prateleiras para esta conta."),
                    new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            host.status("");
            return;
        }

        column.addView(buildHero(), new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, heroHeight()));

        if (!browsable.isEmpty()) {
            firstShelfId = browsable.get(0).id;
            firstShelfTitle = browsable.get(0).title;
            heroTitle.setText(firstShelfTitle);
            heroSubtitle.setText("Destaque");
        }
        for (MediaClient.Item shelfItem : browsable) {
            ShelfView shelf = addShelf(shelfItem.title);
            shelves.put(shelfItem.id, shelf);
            shelfTitles.put(shelfItem.id, shelfItem.title);
            addPlaceholders(shelf);
            host.loadChildren(shelfItem.id, this);
        }
        if (!playables.isEmpty()) {
            ShelfView shelf = addShelf("Tocar agora");
            shelves.put("__play_now__", shelf);
            populateShelf(shelf, playables);
        }
        for (ShelfView shelf : shelves.values()) shelf.linkFocus(downFocusId);
        host.status("");
    }

    private ShelfView addShelf(String title) {
        ShelfView shelf = new ShelfView(context, title);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = Tokens.dp(26);
        column.addView(shelf, params);
        return shelf;
    }

    private int heroHeight() {
        return Tokens.wide() ? Tokens.dp(300) : Tokens.dp(240);
    }

    private int cardSize() {
        return Math.round(Tokens.screenWidth() * (Tokens.wide() ? 0.155f : 0.35f));
    }

    private void addPlaceholders(ShelfView shelf) {
        int size = cardSize();
        int count = Tokens.wide() ? 5 : 2;
        for (int i = 0; i < count; i++) {
            View block = new View(context);
            block.setBackground(Shapes.rounded(Tokens.SURFACE, Tokens.RADIUS_CARD));
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(size, size);
            params.rightMargin = Tokens.dp(12);
            shelf.cards().addView(block, params);
        }
    }

    private void populateShelf(ShelfView shelf, List<MediaClient.Item> items) {
        shelf.cards().removeAllViews();
        shelf.setItemCount(items.size());
        if (items.isEmpty()) {
            shelf.setVisibility(View.GONE);
            return;
        }
        shelf.setVisibility(View.VISIBLE);
        final String title = shelfTitles.get(shelfKey(shelf));
        String shelfId = shelfKey(shelf);
        SeeAllCard seeAll = new SeeAllCard(context, items.size(), cardSize());
        seeAll.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (shelfId != null) host.openCollection(title == null ? "Itens" : title, shelfId, false);
            }
        });
        shelf.addCard(seeAll);

        for (MediaClient.Item item : items) {
            final MediaClient.Item target = item;
            CoverCard card = new CoverCard(context, artwork, item, cardSize());
            card.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    choose(target);
                }
            });
            card.setOnLongClickListener(new View.OnLongClickListener() {
                @Override
                public boolean onLongClick(View v) {
                    host.itemActions(target);
                    return true;
                }
            });
            shelf.addCard(card);
        }
        shelf.linkFocus(downFocusId);

        if (firstShelfId != null && firstShelfId.equals(shelfKey(shelf)) && heroItem == null) {
            setHero(items.get(0));
        }
    }

    private String shelfKey(ShelfView shelf) {
        for (Map.Entry<String, ShelfView> entry : shelves.entrySet()) {
            if (entry.getValue() == shelf) return entry.getKey();
        }
        return null;
    }

    private View buildHero() {
        hero = new FrameLayout(context);
        hero.setBackground(Shapes.rounded(Tokens.SURFACE, Tokens.RADIUS_CARD));
        Shapes.clip(hero, Tokens.RADIUS_CARD);
        heroCover = new ImageView(context);
        heroCover.setScaleType(ImageView.ScaleType.CENTER_CROP);
        heroCover.setBackgroundColor(Tokens.SURFACE_HOVER);
        hero.addView(heroCover, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        View scrim = new View(context);
        scrim.setBackground(Shapes.coverScrim());
        hero.addView(scrim, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        LinearLayout textBlock = new LinearLayout(context);
        textBlock.setOrientation(LinearLayout.VERTICAL);
        textBlock.setPadding(Tokens.dp(20), 0, Tokens.dp(20), Tokens.dp(18));
        TextView eyebrow = Inter.text(context, "EM DESTAQUE", 12f, Inter.SEMIBOLD, Tokens.ACCENT);
        eyebrow.setLetterSpacing(0.12f);
        textBlock.addView(eyebrow);
        heroTitle = Inter.text(context, "", Tokens.DISPLAY, Inter.BOLD, Tokens.TEXT);
        heroTitle.setMaxLines(2);
        heroTitle.setEllipsize(TextUtils.TruncateAt.END);
        LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        titleParams.topMargin = Tokens.dp(4);
        textBlock.addView(heroTitle, titleParams);
        heroSubtitle = Inter.text(context, "", Tokens.BODY, Inter.REGULAR, Tokens.TEXT_DIM);
        heroSubtitle.setMaxLines(1);
        heroSubtitle.setEllipsize(TextUtils.TruncateAt.END);
        LinearLayout.LayoutParams subtitleParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        subtitleParams.topMargin = Tokens.dp(2);
        textBlock.addView(heroSubtitle, subtitleParams);
        Pill play = Pill.accent(context, Icons.PLAY, "Tocar");
        play.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                playHero();
            }
        });
        LinearLayout.LayoutParams playParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        playParams.topMargin = Tokens.dp(12);
        textBlock.addView(play, playParams);

        FrameLayout.LayoutParams textParams = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM);
        hero.addView(textBlock, textParams);

        View outline = new View(context);
        outline.setBackground(Shapes.rounded(0x00000000, Tokens.RADIUS_CARD, Tokens.ACCENT, 2f));
        hero.addView(outline, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        // The hero is full-bleed: scaling it would clip at the screen edges, so the D-pad
        // feedback is the accent outline only (cards still scale 1.05).
        Focus.attach(hero, Tokens.RADIUS_CARD, Tokens.SURFACE, Tokens.SURFACE_HOVER, outline,
                false);
        Focus.rippleOnTop(hero, Tokens.RADIUS_CARD);
        hero.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (heroItem != null) {
                    choose(heroItem);
                } else {
                    playHero();
                }
            }
        });

        return hero;
    }

    private void setHero(final MediaClient.Item item) {
        heroItem = item;
        heroTitle.setText(item.title);
        heroSubtitle.setText(item.subtitle.length() > 0 ? item.subtitle : "Apple Music");
        artwork.load(item.artworkUri, heroCover);
    }

    private void playHero() {
        if (heroItem != null) {
            host.play(heroItem);
        } else if (firstShelfId != null) {
            host.openCollection(firstShelfTitle == null ? "Itens" : firstShelfTitle,
                    firstShelfId, false);
        }
    }

    private void choose(MediaClient.Item item) {
        String last = lastSegment(item.id);
        if (last.startsWith("3-")) {
            host.openAlbum(last.substring(2), item.title, item.subtitle, item.artworkUri);
            return;
        }
        if (last.startsWith("4-")) {
            host.openPlaylist(last.substring(2), item.title, item.subtitle, item.artworkUri);
            return;
        }
        if (last.startsWith("6-")) {
            host.openArtist(last.substring(2), item.title, item.artworkUri);
            return;
        }
        if (item.browsable) {
            host.openCollection(item.title, item.id, false);
        } else if (item.playable) {
            host.play(item);
        } else {
            host.status("Item não reproduzível");
        }
    }

    private static String lastSegment(String id) {
        int slash = id.lastIndexOf('/');
        return slash < 0 ? id : id.substring(slash + 1);
    }

    private void stopSkeleton() {
        if (skeleton != null) {
            skeleton.stop();
            column.removeView(skeleton);
            skeleton = null;
        }
    }

    public void dispose() {
        host.forgetChildren(this);
        stopSkeleton();
        shelves.clear();
    }
}
