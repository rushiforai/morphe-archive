package com.anderson.applemusic.one.screen;

import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
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
import com.anderson.applemusic.one.widget.Perf;
import com.anderson.applemusic.one.widget.Pill;
import com.anderson.applemusic.one.widget.ScrollMemory;
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
 *
 * <p>Only the first {@link #INITIAL_SHELVES} shelves subscribe on open; the rest are added
 * in batches of {@link #SHELF_BATCH} when the page nears the bottom (or by "Carregar
 * mais"), so the account's ~16-20 shelves no longer fire ~225 cover requests at once. The
 * "Atualizar" pill re-subscribes the root and the materialized shelves and keeps the
 * scroll fraction.
 */
public final class HomeScreen implements ChildSink {

    /** Shelves subscribed on the first load; the acceptance criterion for the 1.9.9 Home. */
    private static final int INITIAL_SHELVES = 6;
    /** Shelves added per "Carregar mais"/scroll batch. */
    private static final int SHELF_BATCH = 6;
    /** Distance from the bottom that triggers the next batch. */
    private static final int LOAD_MORE_MARGIN_DP = 480;

    private final Context context;
    private final ScreenHost host;
    private final ArtworkLoader artwork;
    private final FrameLayout root;
    private final ScrollView scroll;
    private final LinearLayout column;
    private final Map<String, ShelfView> shelves = new HashMap<String, ShelfView>();
    private final Map<String, String> shelfTitles = new HashMap<String, String>();
    /** Root children split by kind; browsable ones are the paged shelves. */
    private final List<MediaClient.Item> browsable = new ArrayList<MediaClient.Item>();
    private final List<MediaClient.Item> playables = new ArrayList<MediaClient.Item>();

    private MediaClient.Item tab;
    private String tabId;
    private String firstShelfId;
    private String firstShelfTitle;
    private Skeleton skeleton;
    private int downFocusId = View.NO_ID;
    /** Scroll position being restored after a rotation (fraction of the range). */
    private float pendingScroll;
    /** Shelves to materialize on the next root build (rotation/refresh); 6 on a cold open. */
    private int requestedShelves = INITIAL_SHELVES;
    /** How many browsable shelves are currently in the page. */
    private int shelfCursor;
    private boolean restored;
    private boolean refreshing;
    private boolean building;
    private View loadMoreRow;
    private Pill refreshPill;
    private ShelfView playNowShelf;

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
        scroll = new ScrollView(context);
        scroll.setFillViewport(true);
        column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setPadding(Tokens.dp(16), Tokens.dp(6), Tokens.dp(16), Tokens.dp(24));
        scroll.addView(column, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        root.addView(scroll, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        scroll.setOnScrollChangeListener(new View.OnScrollChangeListener() {
            @Override
            public void onScrollChange(View v, int scrollX, int scrollY, int oldX, int oldY) {
                // Load the next batch before the "Carregar mais" pill is the only thing left,
                // so a plain scroll also pages the shelves (the pill remains for D-pad/TV).
                if (building || refreshing || shelfCursor >= browsable.size()) return;
                View content = scroll.getChildAt(0);
                if (content == null) return;
                if (scrollY + scroll.getHeight()
                        >= content.getHeight() - Tokens.dp(LOAD_MORE_MARGIN_DP)) {
                    loadMore();
                }
            }
        });
    }

    public View view() {
        return root;
    }

    public void setDownFocusId(int id) {
        downFocusId = id;
        linkFocus();
    }

    /** Position of the shelves + how many were expanded, kept across a rotation. */
    public void saveState(Bundle out) {
        ScrollMemory.save(out, "one.home.scroll", scroll);
        out.putInt("one.home.shelves", shelfCursor);
    }

    public void restoreState(Bundle in) {
        pendingScroll = in == null ? 0f : in.getFloat("one.home.scroll", 0f);
        int saved = in == null ? INITIAL_SHELVES : in.getInt("one.home.shelves", INITIAL_SHELVES);
        requestedShelves = Math.max(INITIAL_SHELVES, saved);
        restored = true;
    }

    public void bind(MediaClient.Item tab) {
        this.tab = tab;
        this.tabId = tab.id;
        if (!restored) requestedShelves = INITIAL_SHELVES;
        restored = false;
        heroItem = null;
        firstShelfId = null;
        shelfCursor = 0;
        shelves.clear();
        shelfTitles.clear();
        browsable.clear();
        playables.clear();
        loadMoreRow = null;
        playNowShelf = null;
        refreshPill = null;
        refreshing = false;
        column.removeAllViews();
        skeleton = Skeleton.home(context);
        column.addView(skeleton, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        host.loadChildren(tabId, this);
    }

    /**
     * Explicit refresh: re-subscribes the root and the shelves already on screen, keeping
     * both the scroll fraction and the number of expanded shelves.
     */
    public void refresh() {
        if (tab == null || refreshing) return;
        refreshing = true;
        requestedShelves = Math.max(INITIAL_SHELVES, shelfCursor);
        pendingScroll = ScrollMemory.fraction(scroll);
        if (refreshPill != null) refreshPill.setEnabled(false);
        host.status("Atualizando o Início…");
        host.refreshChildren(tabId, this);
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
            refreshing = false;
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
        building = true;
        stopSkeleton();
        column.removeAllViews();
        shelves.clear();
        shelfTitles.clear();
        browsable.clear();
        playables.clear();
        playNowShelf = null;
        refreshPill = null;
        loadMoreRow = null;
        for (MediaClient.Item item : children) {
            if (item.browsable) browsable.add(item);
            else if (item.playable) playables.add(item);
        }
        if (browsable.isEmpty() && playables.isEmpty()) {
            refreshing = false;
            building = false;
            column.addView(new EmptyState(context, Icons.NOTE, "Nada para mostrar",
                    "O Apple Music não expôs prateleiras para esta conta."),
                    new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            host.status("");
            return;
        }

        column.addView(buildHero(), new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, heroHeight()));
        // Below the hero, so DOWN from the tab bar keeps landing on the hero.
        LinearLayout.LayoutParams refreshParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        refreshParams.topMargin = Tokens.dp(12);
        column.addView(buildRefreshRow(), refreshParams);

        if (!browsable.isEmpty()) {
            firstShelfId = browsable.get(0).id;
            firstShelfTitle = browsable.get(0).title;
            heroTitle.setText(firstShelfTitle);
            heroSubtitle.setText("Destaque");
        }
        shelfCursor = 0;
        int target = Math.max(INITIAL_SHELVES, Math.min(requestedShelves, browsable.size()));
        addShelves(target);
        updateLoadMore();
        addPlayNowIfReady();
        linkFocus();
        host.status("");
        applyPendingScroll();
        refreshing = false;
        building = false;
        Log.i("AppleMusicOne", "perf home shelves=" + shelfCursor + "/" + browsable.size()
                + " requested=" + requestedShelves + " views=" + Perf.views(scroll));
    }

    /** Materializes up to {@code count} more browsable shelves and subscribes each node. */
    private void addShelves(int count) {
        int end = Math.min(browsable.size(), shelfCursor + count);
        for (; shelfCursor < end; shelfCursor++) {
            MediaClient.Item shelfItem = browsable.get(shelfCursor);
            ShelfView shelf = addShelf(shelfItem.title);
            shelves.put(shelfItem.id, shelf);
            shelfTitles.put(shelfItem.id, shelfItem.title);
            addPlaceholders(shelf);
            if (refreshing) host.refreshChildren(shelfItem.id, this);
            else host.loadChildren(shelfItem.id, this);
        }
    }

    private void loadMore() {
        if (shelfCursor >= browsable.size()) return;
        addShelves(SHELF_BATCH);
        updateLoadMore();
        addPlayNowIfReady();
        linkFocus();
    }

    private void addPlayNowIfReady() {
        if (playables.isEmpty() || playNowShelf != null) return;
        if (shelfCursor < browsable.size()) return;
        playNowShelf = addShelf("Tocar agora");
        shelves.put("__play_now__", playNowShelf);
        populateShelf(playNowShelf, playables);
        linkFocus();
    }

    /** Rebuilds the "Carregar mais" pill after the expanded shelf block. */
    private void updateLoadMore() {
        if (loadMoreRow != null) {
            column.removeView(loadMoreRow);
            loadMoreRow = null;
        }
        if (shelfCursor >= browsable.size()) return;
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER);
        Pill more = Pill.surface(context, Icons.PLUS, "Carregar mais");
        more.setContentDescription("Carregar mais prateleiras");
        more.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                loadMore();
            }
        });
        row.addView(more, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = Tokens.dp(22);
        params.bottomMargin = Tokens.dp(8);
        column.addView(row, params);
        loadMoreRow = row;
    }

    private View buildRefreshRow() {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.END);
        refreshPill = Pill.surface(context, Icons.REFRESH, "Atualizar");
        refreshPill.setContentDescription("Atualizar o Início");
        refreshPill.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                refresh();
            }
        });
        row.addView(refreshPill, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return row;
    }

    /** Puts the scroll back where it was before the rotation/refresh, once the shelves are in. */
    private void applyPendingScroll() {
        if (pendingScroll <= 0f) return;
        ScrollMemory.restore(scroll, pendingScroll);
        pendingScroll = 0f;
    }

    private void linkFocus() {
        for (ShelfView shelf : shelves.values()) shelf.linkFocus(downFocusId);
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
        Log.i("AppleMusicOne", "perf home shelf=" + shelfKey(shelf) + " shelves="
                + shelfCursor + "/" + browsable.size() + " views=" + Perf.views(scroll));

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
        heroCover.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
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
        hero.setContentDescription("Destaque");

        return hero;
    }

    private void setHero(final MediaClient.Item item) {
        heroItem = item;
        heroTitle.setText(item.title);
        heroSubtitle.setText(item.subtitle.length() > 0 ? item.subtitle : "Apple Music");
        hero.setContentDescription("Destaque: " + item.title
                + (item.subtitle.length() > 0 ? ", " + item.subtitle : ""));
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
            host.status("Item não reprodutível");
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
        browsable.clear();
        playables.clear();
    }
}
