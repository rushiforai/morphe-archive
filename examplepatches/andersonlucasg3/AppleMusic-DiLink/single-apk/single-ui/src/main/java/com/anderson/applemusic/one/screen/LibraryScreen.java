package com.anderson.applemusic.one.screen;

import android.content.Context;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import com.anderson.applemusic.one.media.ArtworkLoader;
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
import com.anderson.applemusic.one.widget.Pill;
import com.anderson.applemusic.one.widget.SectionHeader;
import com.anderson.applemusic.one.widget.SeeAllCard;
import com.anderson.applemusic.one.widget.ShelfView;
import com.anderson.applemusic.one.widget.Skeleton;

import java.text.Normalizer;
import java.util.ArrayList;
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
    private final LinearLayout body;
    private final List<Category> categories = new ArrayList<Category>();

    private LinearLayout page;
    private LinearLayout results;
    private Skeleton skeleton;
    private String rootId;
    private String rootTitle = "Biblioteca";
    private int downFocusId = View.NO_ID;

    public LibraryScreen(Context context, ScreenHost host, ArtworkLoader artwork,
                         CatalogSearch catalog) {
        this.context = context;
        this.host = host;
        this.artwork = artwork;
        this.catalog = catalog;

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

        FrameLayout contentHost = new FrameLayout(context);
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
        results = null;
        input.setText("");
        showSkeleton();
        host.loadChildren(parentId, this);
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
        results = new LinearLayout(context);
        results.setOrientation(LinearLayout.VERTICAL);
        results.setVisibility(View.GONE);
        body.addView(page, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        body.addView(results, new LinearLayout.LayoutParams(
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
        ShelfView shelf = category.shelf;
        if (shelf == null) return;
        shelf.cards().removeAllViews();
        shelf.setItemCount(children.size());
        if (children.isEmpty()) {
            shelf.setVisibility(View.GONE);
            updateSummary();
            return;
        }
        shelf.setVisibility(View.VISIBLE);
        SeeAllCard seeAll = new SeeAllCard(context, children.size(), cardSize());
        seeAll.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                host.openCollection(category.title, category.id, false);
            }
        });
        shelf.addCard(seeAll);
        int limit = Math.min(children.size(), MAX_CARDS);
        for (int i = 0; i < limit; i++) {
            shelf.addCard(card(category, children.get(i)));
        }
        linkFocus();
        updateSummary();
        if (input.getText().length() > 0) buildResults(input.getText().toString().trim());
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
        if (page == null || results == null) return;
        boolean filtered = term.length() > 0;
        page.setVisibility(filtered ? View.GONE : View.VISIBLE);
        results.setVisibility(filtered ? View.VISIBLE : View.GONE);
        if (!filtered) {
            results.removeAllViews();
            updateSummary();
            scrollToTop();
            return;
        }
        buildResults(term);
    }

    private void buildResults(String term) {
        if (results == null) return;
        results.removeAllViews();
        String needle = normalize(term);
        int total = 0;
        for (Category category : categories) {
            List<MediaClient.Item> matches = new ArrayList<MediaClient.Item>();
            for (MediaClient.Item item : category.items) {
                if (matches(item, needle)) matches.add(item);
            }
            if (matches.isEmpty()) continue;
            SectionHeader header = new SectionHeader(context, category.title, category.icon);
            header.setCount(matches.size());
            LinearLayout.LayoutParams headerParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            headerParams.topMargin = Tokens.dp(16);
            headerParams.bottomMargin = Tokens.dp(6);
            results.addView(header, headerParams);
            for (MediaClient.Item item : matches) addResultRow(item, category);
            total += matches.size();
        }
        if (total == 0) {
            results.addView(new EmptyState(context, Icons.SEARCH,
                            "Nada encontrado na biblioteca",
                            "Nenhum artista, álbum ou playlist carregado corresponde a \""
                                    + term + "\"."),
                    new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT));
        }
        subtitleView.setText(total + (total == 1 ? " resultado" : " resultados"));
        scrollToTop();
    }

    private void addResultRow(final MediaClient.Item item, Category category) {
        String subtitle = item.subtitle.length() > 0 ? item.subtitle : label(category.kind);
        ListRow row = new ListRow(context, artwork, item.title, subtitle,
                item.artworkUri, true);
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
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.bottomMargin = Tokens.dp(8);
        results.addView(row, params);
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

    /**
     * Library rows carry only the persistent id (no catalogue id), so the rich screen is
     * reached by resolving the name; a miss keeps the previous browse behaviour instead of
     * dead-ending the tap.
     */
    private void open(final MediaClient.Item item) {
        String last = lastSegment(item.id).toLowerCase(Locale.ROOT);
        if (last.startsWith("6-")) {
            resolveArtist(item);
            return;
        }
        if (last.startsWith("3-")) {
            resolveAlbum(item);
            return;
        }
        if (last.startsWith("4-")) {
            resolvePlaylist(item);
            return;
        }
        if (item.playable) {
            host.play(item);
            return;
        }
        host.status("Item não reproduzível");
    }

    private void resolveArtist(final MediaClient.Item item) {
        host.status("Abrindo " + item.title + "…");
        catalog.findArtist(item.title, new CatalogSearch.MatchCallback() {
            @Override
            public void onMatch(CatalogSearch.Result match) {
                host.openArtist(match.id, item.title,
                        match.artworkUrl != null ? match.artworkUrl : item.artworkUri);
            }

            @Override
            public void onFailure(String message) {
                host.status("Artista sem catálogo · abrindo os álbuns da biblioteca");
                host.openCollection(item.title, item.id, false);
            }
        });
    }

    private void resolveAlbum(final MediaClient.Item item) {
        host.status("Abrindo " + item.title + "…");
        catalog.findAlbumMatch(item.title, item.subtitle, new CatalogSearch.MatchCallback() {
            @Override
            public void onMatch(CatalogSearch.Result match) {
                host.openAlbum(match.id, item.title, item.subtitle,
                        match.artworkUrl != null ? match.artworkUrl : item.artworkUri);
            }

            @Override
            public void onFailure(String message) {
                host.status("Álbum sem catálogo · abrindo a lista de faixas");
                host.openLibraryCollection(CollectionScreen.ALBUM, item.title, item.subtitle,
                        item.id);
            }
        });
    }

    private void resolvePlaylist(final MediaClient.Item item) {
        host.status("Abrindo " + item.title + "…");
        catalog.findPlaylistMatch(item.title, item.subtitle,
                new CatalogSearch.MatchCallback() {
                    @Override
                    public void onMatch(CatalogSearch.Result match) {
                        host.openPlaylist(match.id, item.title, item.subtitle,
                                match.artworkUrl != null ? match.artworkUrl
                                        : item.artworkUri);
                    }

                    @Override
                    public void onFailure(String message) {
                        host.status("Playlist sem catálogo · abrindo a lista de faixas");
                        host.openLibraryCollection(CollectionScreen.PLAYLIST, item.title,
                                item.subtitle, item.id);
                    }
                });
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

    private static String lastSegment(String id) {
        if (id == null) return "";
        int slash = id.lastIndexOf('/');
        return slash < 0 ? id : id.substring(slash + 1);
    }

    private static int kindOf(String id) {
        String last = lastSegment(id).toLowerCase(Locale.ROOT);
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
