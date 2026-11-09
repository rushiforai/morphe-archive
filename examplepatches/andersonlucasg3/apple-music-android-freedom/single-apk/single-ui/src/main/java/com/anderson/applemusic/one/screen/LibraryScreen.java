package com.anderson.applemusic.one.screen;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.TextView;

import com.anderson.applemusic.one.media.ArtworkLoader;
import com.anderson.applemusic.one.media.CatalogResolver;
import com.anderson.applemusic.one.media.CatalogSearch;
import com.anderson.applemusic.one.media.MediaClient;
import com.anderson.applemusic.one.theme.Inter;
import com.anderson.applemusic.one.theme.Shapes;
import com.anderson.applemusic.one.theme.Tokens;
import com.anderson.applemusic.one.widget.CircleButton;
import com.anderson.applemusic.one.widget.CoverCard;
import com.anderson.applemusic.one.widget.EmptyState;
import com.anderson.applemusic.one.widget.Focus;
import com.anderson.applemusic.one.widget.IconView;
import com.anderson.applemusic.one.widget.Icons;
import com.anderson.applemusic.one.widget.ListRow;
import com.anderson.applemusic.one.widget.Perf;
import com.anderson.applemusic.one.widget.Pill;
import com.anderson.applemusic.one.widget.ScrollMemory;
import com.anderson.applemusic.one.widget.SectionHeader;
import com.anderson.applemusic.one.widget.SeeAllCard;
import com.anderson.applemusic.one.widget.ShelfView;
import com.anderson.applemusic.one.widget.Skeleton;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;

/**
 * Biblioteca: the engine's five library nodes as sections, not just five category rows.
 *
 * <p>The Auto tree only exposes collection-level persistent ids
 * ({@code 6-} artist, {@code 3-} album, {@code 4-} playlist) and no artwork for artists,
 * so a section lists what the tree returned and a tap resolves the catalogue id by name
 * (the same normalisation the search uses) before opening {@link DetailScreen}; when the
 * name is not in the catalogue the tap degrades to the old browse list, and the
 * "Aleatória" node is played directly because the tree only marks it playable.
 */
public final class LibraryScreen implements ChildSink {

    private static final int KIND_RANDOM = 0;
    private static final int KIND_RECENT = 1;
    private static final int KIND_PLAYLISTS = 2;
    private static final int KIND_ARTISTS = 3;
    private static final int KIND_ALBUMS = 4;

    /** Cards per shelf; "Ver tudo" opens the complete node and the local filter finds any of them. */
    private static final int MAX_CARDS = 20;

    /** Persisted section order: engine/library order (recent) or A–Z, applied locally. */
    private static final String PREFS = "one-library";
    private static final String KEY_SORT = "sort";
    private static final String SORT_RECENT = "recent";
    private static final String SORT_AZ = "az";

    /** One library category: the browse node, its loaded items and its shelf. */
    private static final class Category {
        final String id;
        final String title;
        final int kind;
        final int icon;
        final List<MediaClient.Item> items = new ArrayList<MediaClient.Item>();
        boolean loaded;
        boolean failed;
        ShelfView shelf;

        Category(String id, String title, int kind, int icon) {
            this.id = id;
            this.title = title;
            this.kind = kind;
            this.icon = icon;
        }
    }

    private final Context context;
    private final ScreenHost host;
    private final ArtworkLoader artwork;
    private final CatalogSearch catalog;

    private final FrameLayout root;
    private final TextView titleView;
    private final TextView subtitleView;
    private final EditText input;
    private final CircleButton clear;
    private final ScrollView scroll;
    private final FrameLayout contentHost;
    private final LinearLayout body;
    private final LinearLayout sortRow;
    private final SharedPreferences prefs;
    private final List<Category> categories = new ArrayList<Category>();
    private String sort;

    private LinearLayout page;
    /** Recycled list of filter results; the section shelves stay in {@link #scroll}. */
    private ListView resultsList;
    private ResultAdapter resultAdapter;
    private Skeleton skeleton;
    private String rootId;
    private String rootTitle = "Biblioteca";
    private int downFocusId = View.NO_ID;
    /** Filter and scroll being restored after a rotation; consumed by {@link #bind}. */
    private String pendingFilter;
    private float pendingScroll;

    public LibraryScreen(Context context, ScreenHost host, ArtworkLoader artwork,
                         CatalogSearch catalog) {
        this.context = context;
        this.host = host;
        this.artwork = artwork;
        this.catalog = catalog;
        this.prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        this.sort = prefs.getString(KEY_SORT, SORT_RECENT);

        root = new FrameLayout(context);
        root.setBackgroundColor(Tokens.BG);

        LinearLayout outer = new LinearLayout(context);
        outer.setOrientation(LinearLayout.VERTICAL);
        root.addView(outer, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        LinearLayout header = new LinearLayout(context);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        header.setPadding(Tokens.dp(16), Tokens.dp(10), Tokens.dp(16), Tokens.dp(4));

        LinearLayout heading = new LinearLayout(context);
        heading.setOrientation(LinearLayout.VERTICAL);
        titleView = Inter.text(context, "Biblioteca", Tokens.SECTION, Inter.BOLD, Tokens.TEXT);
        titleView.setMaxLines(1);
        titleView.setEllipsize(TextUtils.TruncateAt.END);
        subtitleView = Inter.text(context, "", Tokens.CAPTION, Inter.REGULAR, Tokens.TEXT_DIM);
        subtitleView.setMaxLines(2);
        subtitleView.setEllipsize(TextUtils.TruncateAt.END);
        heading.addView(titleView);
        heading.addView(subtitleView);
        header.addView(heading, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        outer.addView(header, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        sortRow = new LinearLayout(context);
        sortRow.setOrientation(LinearLayout.HORIZONTAL);
        sortRow.setGravity(Gravity.CENTER_VERTICAL);
        sortRow.setPadding(Tokens.dp(16), 0, Tokens.dp(16), Tokens.dp(6));
        outer.addView(sortRow, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        renderSortRow();

        LinearLayout searchRow = new LinearLayout(context);
        searchRow.setOrientation(LinearLayout.HORIZONTAL);
        searchRow.setGravity(Gravity.CENTER_VERTICAL);
        searchRow.setPadding(Tokens.dp(16), Tokens.dp(6), Tokens.dp(16), Tokens.dp(10));

        LinearLayout field = new LinearLayout(context);
        field.setOrientation(LinearLayout.HORIZONTAL);
        field.setGravity(Gravity.CENTER_VERTICAL);
        field.setBackground(Shapes.rounded(Tokens.SURFACE, Tokens.RADIUS_CONTROL));
        field.setPadding(Tokens.dp(14), 0, Tokens.dp(8), 0);
        field.setMinimumHeight(Tokens.dp(48));

        IconView searchIcon = new IconView(context, Icons.SEARCH, Tokens.TEXT_DIM);
        LinearLayout.LayoutParams iconParams =
                new LinearLayout.LayoutParams(Tokens.dp(20), Tokens.dp(20));
        iconParams.rightMargin = Tokens.dp(10);
        field.addView(searchIcon, iconParams);

        input = new EditText(context);
        input.setHint("Filtrar artistas, álbuns e playlists");
        input.setContentDescription("Filtrar a biblioteca");
        input.setTextColor(Tokens.TEXT);
        input.setSingleLine(true);
        input.setBackground(null);
        input.setPadding(0, 0, 0, 0);
        input.setInputType(android.text.InputType.TYPE_CLASS_TEXT);
        Inter.style(input, 16f, Inter.REGULAR, Tokens.TEXT);
        input.setHintTextColor(Tokens.TEXT_DIM);
        input.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }

            @Override
            public void afterTextChanged(Editable s) {
                onFilterChanged(s.toString());
            }
        });
        field.addView(input, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        clear = new CircleButton(context, Icons.CLOSE, 36f, 0x00000000, Tokens.TEXT_DIM, 16f);
        clear.setContentDescription("Limpar filtro");
        clear.setVisibility(View.GONE);
        clear.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                input.setText("");
            }
        });
        field.addView(clear, new LinearLayout.LayoutParams(Tokens.dp(36), Tokens.dp(36)));

        searchRow.addView(field, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        outer.addView(searchRow, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        contentHost = new FrameLayout(context);
        scroll = new ScrollView(context);
        scroll.setFillViewport(true);
        body = new LinearLayout(context);
        body.setOrientation(LinearLayout.VERTICAL);
        body.setPadding(Tokens.dp(16), Tokens.dp(4), Tokens.dp(16), Tokens.dp(24));
        scroll.addView(body, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        contentHost.addView(scroll, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        outer.addView(contentHost, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
    }

    public View view() {
        return root;
    }

    /** D-pad "down" target of the last shelf (the mini player), like the Início shelves. */
    public void setDownFocusId(int id) {
        downFocusId = id;
        linkFocus();
    }

    /**
     * Section shelves stack vertically, so DOWN must walk to the next section instead of
     * jumping straight to the mini player; only the last shelf links there.
     */
    private void linkFocus() {
        for (Category category : categories) {
            if (category.shelf != null) category.shelf.linkFocus(View.NO_ID);
        }
        for (int i = 0; i < categories.size(); i++) {
            Category category = categories.get(i);
            if (category.shelf == null || category.shelf.getVisibility() != View.VISIBLE) continue;
            int downId = View.NO_ID;
            for (int j = i + 1; j < categories.size(); j++) {
                Category next = categories.get(j);
                if (next.shelf == null || next.shelf.getVisibility() != View.VISIBLE
                        || next.shelf.cards().getChildCount() == 0 || !next.loaded) {
                    continue;
                }
                downId = next.shelf.cards().getChildAt(0).getId();
                break;
            }
            if (downId == View.NO_ID) downId = downFocusId;
            LinearLayout cards = category.shelf.cards();
            for (int k = 0; k < cards.getChildCount(); k++) {
                View child = cards.getChildAt(k);
                if (downId != View.NO_ID) child.setNextFocusDownId(downId);
            }
        }
    }

    /** Starts at the library tab root: the category nodes come from the tree itself. */
    public void bind(String parentId, String title) {
        rootId = parentId;
        if (title != null && title.length() > 0) rootTitle = title;
        titleView.setText(rootTitle);
        categories.clear();
        page = null;
        resultAdapter = null;
        if (resultsList != null) resultsList.setVisibility(View.GONE);
        // The local filter is part of the state: restore it (and its results) after a
        // rotation instead of showing the unfiltered sections again.
        String filter = pendingFilter;
        pendingFilter = null;
        input.setText(filter == null ? "" : filter);
        showSkeleton();
        host.loadChildren(parentId, this);
    }

    /** Local filter + scroll position, kept across a rotation. */
    public void saveState(Bundle out) {
        out.putString("one.library.filter", input.getText().toString());
        ScrollMemory.save(out, "one.library.scroll", scroll);
    }

    public void restoreState(Bundle in) {
        if (in == null) return;
        pendingFilter = in.getString("one.library.filter", "");
        pendingScroll = in.getFloat("one.library.scroll", 0f);
    }

    // --- loading -------------------------------------------------------------------

    private void showSkeleton() {
        body.removeAllViews();
        subtitleView.setText("Carregando a biblioteca…");
        skeleton = Skeleton.rows(context, 5);
        body.addView(skeleton, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    private void stopSkeleton() {
        if (skeleton != null) {
            skeleton.stop();
            body.removeView(skeleton);
            skeleton = null;
        }
    }

    @Override
    public void onChildren(String parentId, List<MediaClient.Item> children) {
        if (rootId != null && rootId.equals(parentId)) {
            buildSections(children);
            return;
        }
        Category category = find(parentId);
        if (category == null) return;
        populate(category, children);
    }

    @Override
    public void onFailed(String parentId) {
        if (rootId != null && rootId.equals(parentId)) {
            stopSkeleton();
            body.removeAllViews();
            EmptyState failure = new EmptyState(context, Icons.CLOSE,
                    "Não foi possível carregar",
                    "Sem conexão com o Apple Music. Verifique a rede e tente de novo.");
            Pill retry = Pill.surface(context, Icons.REFRESH, "Tentar de novo");
            retry.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    bind(rootId, rootTitle);
                }
            });
            failure.addAction(retry);
            body.addView(failure, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            subtitleView.setText("");
            host.status("Não foi possível carregar a Biblioteca");
            return;
        }
        Category category = find(parentId);
        if (category == null || category.shelf == null) return;
        category.failed = true;
        category.loaded = true;
        category.shelf.cards().removeAllViews();
        category.shelf.setItemCount(0);
        TextView failure = Inter.text(context, "Não foi possível carregar agora",
                Tokens.CAPTION, Inter.REGULAR, Tokens.TEXT_DIM);
        failure.setPadding(0, Tokens.dp(12), 0, Tokens.dp(12));
        category.shelf.cards().addView(failure);
        updateSummary();
    }

    // --- page ----------------------------------------------------------------------

    private void buildSections(List<MediaClient.Item> children) {
        stopSkeleton();
        body.removeAllViews();
        categories.clear();

        page = new LinearLayout(context);
        page.setOrientation(LinearLayout.VERTICAL);
        body.addView(page, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        List<MediaClient.Item> random = new ArrayList<MediaClient.Item>();
        for (MediaClient.Item child : children) {
            int kind = kindOf(child.id);
            if (kind < 0) continue;
            if (kind == KIND_RANDOM) {
                random.add(child);
                continue;
            }
            categories.add(new Category(child.id, child.title, kind, iconOf(kind)));
        }
        for (MediaClient.Item item : random) {
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.topMargin = Tokens.dp(2);
            params.bottomMargin = Tokens.dp(6);
            page.addView(randomRow(item), params);
        }
        if (categories.isEmpty() && random.isEmpty()) {
            page.addView(new EmptyState(context, Icons.LIBRARY, "Biblioteca vazia",
                            "O Apple Music não expôs categorias para esta conta."),
                    new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT));
            subtitleView.setText("");
            host.status("");
            return;
        }

        for (Category category : categories) {
            ShelfView shelf = new ShelfView(context, category.title, category.icon);
            category.shelf = shelf;
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.topMargin = Tokens.dp(22);
            page.addView(shelf, params);
            addPlaceholders(shelf);
            host.loadChildren(category.id, this);
        }
        linkFocus();
        updateSummary();
        if (input.getText().length() > 0) onFilterChanged(input.getText().toString());
        host.status("");
        applyPendingScroll();
    }

    private void addPlaceholders(ShelfView shelf) {
        int size = cardSize();
        for (int i = 0; i < 3; i++) {
            View block = new View(context);
            block.setBackground(Shapes.rounded(Tokens.SURFACE, Tokens.RADIUS_CARD));
            block.setLayoutParams(new LinearLayout.LayoutParams(size, size));
            shelf.addCard(block);
        }
    }

    private void populate(final Category category, List<MediaClient.Item> children) {
        category.items.clear();
        category.items.addAll(children);
        category.loaded = true;
        renderShelf(category);
        if (input.getText().length() > 0) buildResults(input.getText().toString().trim());
    }

    /** Paints one section in the persisted order; also called when the order changes. */
    private void renderShelf(final Category category) {
        ShelfView shelf = category.shelf;
        if (shelf == null) return;
        shelf.cards().removeAllViews();
        shelf.setItemCount(category.items.size());
        if (category.items.isEmpty()) {
            shelf.setVisibility(View.GONE);
            updateSummary();
            return;
        }
        shelf.setVisibility(View.VISIBLE);
        SeeAllCard seeAll = new SeeAllCard(context, category.items.size(), cardSize());
        seeAll.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                host.openCollection(category.title, category.id, false);
            }
        });
        shelf.addCard(seeAll);
        List<MediaClient.Item> ordered = ordered(category);
        int limit = Math.min(ordered.size(), MAX_CARDS);
        for (int i = 0; i < limit; i++) {
            shelf.addCard(card(category, ordered.get(i)));
        }
        linkFocus();
        updateSummary();
    }

    /** A–Z is local; "recentes" keeps the order the engine delivered for that library node. */
    private List<MediaClient.Item> ordered(Category category) {
        if (!SORT_AZ.equals(sort) || category.kind == KIND_RECENT
                || category.kind == KIND_RANDOM) {
            return category.items;
        }
        List<MediaClient.Item> sorted = new ArrayList<MediaClient.Item>(category.items);
        Collections.sort(sorted, new Comparator<MediaClient.Item>() {
            @Override
            public int compare(MediaClient.Item left, MediaClient.Item right) {
                int byTitle = normalize(left.title).compareTo(normalize(right.title));
                return byTitle != 0 ? byTitle : left.title.compareToIgnoreCase(right.title);
            }
        });
        return sorted;
    }

    private void renderSortRow() {
        sortRow.removeAllViews();
        sortRow.addView(sortPill("A–Z", SORT_AZ), sortPillParams());
        sortRow.addView(sortPill("Recentes", SORT_RECENT), sortPillParams());
    }

    private View sortPill(String label, final String value) {
        boolean active = value.equals(sort);
        Pill pill = active
                ? Pill.accent(context, 0, label)
                : Pill.surface(context, 0, label);
        pill.setContentDescription(label + (active ? ", selecionado" : ""));
        pill.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                setSort(value);
            }
        });
        return pill;
    }

    private LinearLayout.LayoutParams sortPillParams() {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.rightMargin = Tokens.dp(8);
        return params;
    }

    private void setSort(String value) {
        if (value.equals(sort)) return;
        sort = value;
        prefs.edit().putString(KEY_SORT, sort).apply();
        renderSortRow();
        for (Category category : categories) {
            if (category.loaded && !category.failed) renderShelf(category);
        }
        if (input.getText().length() > 0) {
            buildResults(input.getText().toString().trim());
        } else {
            updateSummary();
        }
    }

    private int cardSize() {
        return Math.round(Tokens.screenWidth() * (Tokens.wide() ? 0.135f : 0.35f));
    }

    private View card(final Category category, final MediaClient.Item item) {
        int size = cardSize();
        if (category.kind == KIND_ARTISTS) return artistCard(item, size);
        final CoverCard card = new CoverCard(context, artwork, item, size);
        card.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                open(item);
            }
        });
        card.setOnLongClickListener(new View.OnLongClickListener() {
            @Override
            public boolean onLongClick(View v) {
                host.itemActions(item);
                return true;
            }
        });
        return card;
    }

    /**
     * Artist tile: the tree carries no artwork for artists, so the fallback is the initial
     * on a disc; when a node ever ships an icon it is clipped into the same circle.
     */
    private View artistCard(final MediaClient.Item item, int size) {
        FrameLayout card = new FrameLayout(context);
        card.setBackground(Shapes.rounded(Tokens.SURFACE, Tokens.RADIUS_CARD));
        Shapes.clip(card, Tokens.RADIUS_CARD);

        LinearLayout column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setGravity(Gravity.CENTER);
        column.setPadding(Tokens.dp(8), Tokens.dp(12), Tokens.dp(8), Tokens.dp(10));

        int avatarSize = Math.round(size * 0.58f);
        FrameLayout avatar = new FrameLayout(context);
        avatar.setBackground(Shapes.circle(Tokens.SURFACE_HOVER));
        if (item.artworkUri != null && item.artworkUri.length() > 0) {
            ImageView cover = new ImageView(context);
            cover.setScaleType(ImageView.ScaleType.CENTER_CROP);
            cover.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            avatar.addView(cover, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            artwork.load(item.artworkUri, cover);
            Shapes.clip(avatar, avatarSize / 2f / Tokens.dp(1));
        } else {
            TextView initial = Inter.text(context, initial(item.title), 26f, Inter.BOLD,
                    Tokens.TEXT_DIM);
            initial.setGravity(Gravity.CENTER);
            avatar.addView(initial, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        }
        column.addView(avatar, new LinearLayout.LayoutParams(avatarSize, avatarSize));

        TextView name = Inter.text(context, item.title, 13f, Inter.SEMIBOLD, Tokens.TEXT);
        name.setMaxLines(2);
        name.setEllipsize(TextUtils.TruncateAt.END);
        name.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams nameParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        nameParams.topMargin = Tokens.dp(9);
        column.addView(name, nameParams);

        card.addView(column, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        Focus.attach(card, Tokens.RADIUS_CARD, Tokens.SURFACE, Tokens.SURFACE_HOVER, null);
        Focus.rippleOnTop(card, Tokens.RADIUS_CARD);
        card.setLayoutParams(new LinearLayout.LayoutParams(size, size));
        card.setContentDescription(item.title + ", artista");
        card.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                open(item);
            }
        });
        card.setOnLongClickListener(new View.OnLongClickListener() {
            @Override
            public boolean onLongClick(View v) {
                host.itemActions(item);
                return true;
            }
        });
        return card;
    }

    /** "Aleatória" is the only playable library node: the tree exposes no track list. */
    private View randomRow(final MediaClient.Item item) {
        ListRow row = new ListRow(context, artwork, item.title,
                "Tocar a biblioteca inteira", null, false);
        row.cover().setImageDrawable(new Icons.IconDrawable(Icons.PLAY, Tokens.ACCENT));
        int pad = Tokens.dp(15);
        row.cover().setPadding(pad, pad, pad, pad);
        row.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                host.playId(item.id, item.title);
            }
        });
        return row;
    }

    private void updateSummary() {
        if (input.getText().length() > 0) return;
        List<String> parts = new ArrayList<String>();
        boolean loaded = false;
        for (Category category : categories) {
            if (!category.loaded) continue;
            loaded = true;
            if (category.failed || category.items.isEmpty()) continue;
            parts.add(category.items.size() + " " + noun(category.kind));
        }
        if (!parts.isEmpty()) {
            subtitleView.setText(join(parts));
        } else {
            subtitleView.setText(loaded ? "Biblioteca vazia" : "Carregando a biblioteca…");
        }
    }

    // --- local filter --------------------------------------------------------------

    private void onFilterChanged(String value) {
        String term = value == null ? "" : value.trim();
        clear.setVisibility(term.length() > 0 ? View.VISIBLE : View.GONE);
        if (page == null) return;
        boolean filtered = term.length() > 0;
        scroll.setVisibility(filtered ? View.GONE : View.VISIBLE);
        if (resultsList != null) {
            resultsList.setVisibility(filtered ? View.VISIBLE : View.GONE);
        }
        if (!filtered) {
            resultAdapter = null;
            updateSummary();
            scrollToTop();
            return;
        }
        buildResults(term);
    }

    private void buildResults(String term) {
        String needle = normalize(term);
        List<Object> entries = new ArrayList<Object>();
        int total = 0;
        for (Category category : categories) {
            List<MediaClient.Item> matches = new ArrayList<MediaClient.Item>();
            for (MediaClient.Item item : ordered(category)) {
                if (matches(item, needle)) matches.add(item);
            }
            if (matches.isEmpty()) continue;
            entries.add(new ResultHeader(category.title, category.icon, matches.size()));
            for (MediaClient.Item item : matches) {
                entries.add(new ResultEntry(item, category.kind));
            }
            total += matches.size();
        }
        if (total == 0) entries.add(new ResultEmpty(term));
        if (resultsList == null) {
            resultsList = new ListView(context);
            resultsList.setDivider(new ColorDrawable(0x00000000));
            resultsList.setDividerHeight(Tokens.dp(8));
            resultsList.setSelector(android.R.color.transparent);
            resultsList.setItemsCanFocus(true);
            resultsList.setFocusable(true);
            resultsList.setClipToPadding(false);
            resultsList.setPadding(Tokens.dp(16), Tokens.dp(4), Tokens.dp(16), Tokens.dp(24));
            contentHost.addView(resultsList, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        }
        resultAdapter = new ResultAdapter(entries);
        resultsList.setAdapter(resultAdapter);
        resultsList.setVisibility(View.VISIBLE);
        resultsList.setSelection(0);
        subtitleView.setText(total + (total == 1 ? " resultado" : " resultados"));
        scrollToTop();
        applyPendingScroll();
        final int found = total;
        resultsList.post(new Runnable() {
            @Override
            public void run() {
                Log.i("AppleMusicOne", "perf library results=" + found
                        + " rows=" + resultsList.getChildCount()
                        + " views=" + Perf.views(resultsList));
            }
        });
    }

    /** Section header inside the filter list (never recycled: only a handful per query). */
    private static final class ResultHeader {
        final String title;
        final int icon;
        final int count;

        ResultHeader(String title, int icon, int count) {
            this.title = title;
            this.icon = icon;
            this.count = count;
        }
    }

    /** One matching library item; keeps the category so the subtitle can fall back to its label. */
    private static final class ResultEntry {
        final MediaClient.Item item;
        final int kind;

        ResultEntry(MediaClient.Item item, int kind) {
            this.item = item;
            this.kind = kind;
        }
    }

    private static final class ResultEmpty {
        final String term;

        ResultEmpty(String term) {
            this.term = term;
        }
    }

    private final class ResultAdapter extends BaseAdapter {

        private final List<Object> entries;

        ResultAdapter(List<Object> entries) {
            this.entries = entries;
        }

        @Override
        public int getCount() {
            return entries.size();
        }

        @Override
        public Object getItem(int position) {
            return entries.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public int getViewTypeCount() {
            return 3;
        }

        @Override
        public int getItemViewType(int position) {
            Object entry = entries.get(position);
            return entry instanceof ResultHeader ? 0 : entry instanceof ResultEmpty ? 2 : 1;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            Object entry = entries.get(position);
            if (entry instanceof ResultHeader) {
                ResultHeader header = (ResultHeader) entry;
                SectionHeader view = new SectionHeader(context, header.title, header.icon);
                view.setCount(header.count);
                view.setPadding(0, Tokens.dp(16), 0, Tokens.dp(6));
                return view;
            }
            if (entry instanceof ResultEmpty) {
                return new EmptyState(context, Icons.SEARCH, "Nada encontrado na biblioteca",
                        "Nenhum artista, álbum ou playlist carregado corresponde a \""
                                + ((ResultEmpty) entry).term + "\".");
            }
            final ResultEntry result = (ResultEntry) entry;
            final MediaClient.Item item = result.item;
            ListRow row = convertView instanceof ListRow
                    ? (ListRow) convertView
                    : new ListRow(context, artwork, "", "", null, true);
            String subtitle = item.subtitle.length() > 0 ? item.subtitle : label(result.kind);
            row.bind(artwork, item.title, subtitle, item.artworkUri, true);
            row.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    open(item);
                }
            });
            row.setOnLongClickListener(new View.OnLongClickListener() {
                @Override
                public boolean onLongClick(View v) {
                    host.itemActions(item);
                    return true;
                }
            });
            return row;
        }
    }

    /** Puts the scroll back where it was before the rotation, once the content is in. */
    private void applyPendingScroll() {
        if (pendingScroll <= 0f) return;
        ScrollMemory.restore(scroll, pendingScroll);
        pendingScroll = 0f;
    }

    private void scrollToTop() {
        scroll.post(new Runnable() {
            @Override
            public void run() {
                scroll.scrollTo(0, 0);
            }
        });
    }

    // --- navigation ----------------------------------------------------------------

    /** Same resolution the search's local scope uses (library ids have no catalogue id). */
    private void open(final MediaClient.Item item) {
        LibraryOpener.open(host, catalog, item);
    }

    /** BACK first clears the local filter, then leaves the tab. */
    public boolean back() {
        if (input.getText().length() > 0) {
            input.setText("");
            return true;
        }
        return false;
    }

    /** Library cards carry no playing marker; the mini player already shows the session. */
    public void updatePlayback(MediaClient.Snapshot snapshot) {
    }

    public void dispose() {
        stopSkeleton();
        host.forgetChildren(this);
    }

    // --- helpers -------------------------------------------------------------------

    private Category find(String id) {
        for (Category category : categories) {
            if (category.id.equals(id)) return category;
        }
        return null;
    }

    private static int kindOf(String id) {
        String last = CatalogResolver.lastSegment(id).toLowerCase(Locale.ROOT);
        if (last.equals("songs") || last.equals("random")) return KIND_RANDOM;
        if (last.equals("recently_added")) return KIND_RECENT;
        if (last.equals("playlists")) return KIND_PLAYLISTS;
        if (last.equals("artists")) return KIND_ARTISTS;
        if (last.equals("albums")) return KIND_ALBUMS;
        return -1;
    }

    private static int iconOf(int kind) {
        switch (kind) {
            case KIND_RECENT:
                return Icons.PLUS;
            case KIND_PLAYLISTS:
                return Icons.QUEUE;
            case KIND_ARTISTS:
                return Icons.ACCOUNT;
            case KIND_ALBUMS:
                return Icons.NOTE;
            default:
                return Icons.PLAY;
        }
    }

    private static String noun(int kind) {
        switch (kind) {
            case KIND_RECENT:
                return "recentes";
            case KIND_PLAYLISTS:
                return "playlists";
            case KIND_ARTISTS:
                return "artistas";
            case KIND_ALBUMS:
                return "álbuns";
            default:
                return "itens";
        }
    }

    private static String label(int kind) {
        switch (kind) {
            case KIND_RECENT:
                return "Adição recente";
            case KIND_PLAYLISTS:
                return "Playlist";
            case KIND_ARTISTS:
                return "Artista";
            case KIND_ALBUMS:
                return "Álbum";
            default:
                return "Item";
        }
    }

    private static String initial(String title) {
        String text = title == null ? "" : title.trim();
        return text.length() == 0 ? "?" : text.substring(0, 1).toUpperCase(Locale.ROOT);
    }

    private static boolean matches(MediaClient.Item item, String needle) {
        return normalize(item.title).contains(needle)
                || normalize(item.subtitle).contains(needle);
    }

    /** Case/diacritic-insensitive comparison, shared by the filter and its results. */
    private static String normalize(String value) {
        String text = value == null ? "" : value;
        text = Normalizer.normalize(text, Normalizer.Form.NFD)
                .replaceAll("\\p{M}+", "");
        return text.toLowerCase(Locale.ROOT).replaceAll("\\s+", " ").trim();
    }

    private static String join(List<String> values) {
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < values.size(); i++) {
            if (i > 0) builder.append(" · ");
            builder.append(values.get(i));
        }
        return builder.toString();
    }
}
