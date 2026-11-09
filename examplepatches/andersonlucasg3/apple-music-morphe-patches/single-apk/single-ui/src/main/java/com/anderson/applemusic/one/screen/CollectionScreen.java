package com.anderson.applemusic.one.screen;

import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.TextView;

import com.anderson.applemusic.one.media.ArtworkLoader;
import com.anderson.applemusic.one.media.CatalogResolver;
import com.anderson.applemusic.one.media.CatalogSearch;
import com.anderson.applemusic.one.media.MediaClient;
import com.anderson.applemusic.one.theme.Inter;
import com.anderson.applemusic.one.theme.Tokens;
import com.anderson.applemusic.one.widget.CircleButton;
import com.anderson.applemusic.one.widget.CoverCard;
import com.anderson.applemusic.one.widget.EmptyState;
import com.anderson.applemusic.one.widget.Icons;
import com.anderson.applemusic.one.widget.ListRow;
import com.anderson.applemusic.one.widget.Perf;
import com.anderson.applemusic.one.widget.Pill;
import com.anderson.applemusic.one.widget.ScrollMemory;
import com.anderson.applemusic.one.widget.Skeleton;
import com.anderson.applemusic.one.widget.TrackRow;

import java.util.ArrayList;
import java.util.List;

/**
 * Category browser used by Biblioteca (list), Rádio (grid) and the "Ver tudo"/
 * browsable-item overlay. Keeps its own stack, so every level has a breadcrumb and a
 * back action; it is deliberately not the Home screen with a different title.
 *
 * <p>Two kinds of level live in the same stack. The engine's Auto tree exposes the
 * library categories, the artists and the artist's albums (subscribing an artist id is
 * what lists its albums, even though the artist item itself is flagged
 * {@code browsable=false}), so those are plain browse nodes. Albums and playlists are
 * playable leaves with only a library persistent id in the browse tree, so their track
 * list comes from amp-api by name ({@link CatalogSearch#findAlbum}, {@link
 * CatalogSearch#findPlaylist}); when that resolution fails the level degrades to "play
 * the whole collection" instead of breaking.
 */
public class CollectionScreen implements ChildSink {

    public static final int LIST = 0;
    public static final int GRID = 1;

    private static final int BROWSE = 0;
    public static final int ALBUM = 1;
    public static final int PLAYLIST = 2;

    /** One level of the stack: either a browse node or a catalogue album/playlist. */
    private static final class Node {
        final String id;
        final String title;
        final String subtitle;
        final int kind;
        /** Catalogue id when the browse id already carries it (Home shelves). */
        final String directId;
        String catalogId;
        List<CatalogSearch.Result> items;
        boolean failed;
        String failure;

        Node(String id, String title, String subtitle, int kind, String directId) {
            this.id = id == null ? "" : id;
            this.title = title == null ? "" : title;
            this.subtitle = subtitle == null ? "" : subtitle;
            this.kind = kind;
            this.directId = directId;
        }
    }

    protected final Context context;
    protected final ScreenHost host;
    protected final ArtworkLoader artwork;
    protected final CatalogSearch catalog;
    private final CatalogResolver resolver;

    private final int mode;
    private final int emptyIcon;
    private final FrameLayout root;
    private final CircleButton back;
    private final TextView titleView;
    private final TextView subtitleView;
    private final FrameLayout contentHost;
    /** Grid/skeleton/empty content; the list levels use {@link #list} instead. */
    private final LinearLayout column;
    private final ScrollView scroll;
    private final Pill playAll;
    /** Recycled list used by LIST levels (the 281-album "Ver tudo" and track lists). */
    private ListView list;
    private RowAdapter adapter;
    private int pendingListPosition;
    private int pendingListTop;
    private boolean pendingListScroll;
    private final List<Node> stack = new ArrayList<Node>();
    private Skeleton skeleton;
    private String failedId;
    private boolean exitOnRootBack;
    private boolean trackList;
    /** Guards amp-api callbacks against a level the user already left. */
    private int generation;
    /** Scroll position being restored after a rotation (fraction of the range). */
    private float pendingScroll;

    public CollectionScreen(Context context, ScreenHost host, ArtworkLoader artwork,
                            CatalogSearch catalog, int mode, int emptyIcon) {
        this.context = context;
        this.host = host;
        this.artwork = artwork;
        this.catalog = catalog;
        this.resolver = new CatalogResolver(catalog);
        this.mode = mode;
        this.emptyIcon = emptyIcon;

        root = new FrameLayout(context);
        root.setBackgroundColor(Tokens.BG);

        LinearLayout page = new LinearLayout(context);
        page.setOrientation(LinearLayout.VERTICAL);
        root.addView(page, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        LinearLayout header = new LinearLayout(context);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        header.setPadding(Tokens.dp(16), Tokens.dp(10), Tokens.dp(16), Tokens.dp(6));

        back = new CircleButton(context, Icons.CHEVRON_LEFT, 44f, Tokens.SURFACE,
                Tokens.TEXT, 22f);
        back.setContentDescription("Voltar");
        LinearLayout.LayoutParams backParams =
                new LinearLayout.LayoutParams(Tokens.dp(44), Tokens.dp(44));
        backParams.rightMargin = Tokens.dp(14);
        header.addView(back, backParams);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                back();
            }
        });

        LinearLayout heading = new LinearLayout(context);
        heading.setOrientation(LinearLayout.VERTICAL);
        titleView = Inter.text(context, "", Tokens.SECTION, Inter.BOLD, Tokens.TEXT);
        titleView.setMaxLines(1);
        titleView.setEllipsize(TextUtils.TruncateAt.END);
        subtitleView = Inter.text(context, "", Tokens.CAPTION, Inter.REGULAR, Tokens.TEXT_DIM);
        subtitleView.setMaxLines(1);
        heading.addView(titleView);
        heading.addView(subtitleView);
        header.addView(heading, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        // "Tocar": plays the whole collection. Shown for track lists (browse) and for the
        // album/playlist levels, where it plays the catalogue id (or the browse collection
        // when the catalogue lookup failed).
        playAll = Pill.accent(context, Icons.PLAY, "Tocar");
        playAll.setVisibility(View.GONE);
        LinearLayout.LayoutParams playAllParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        playAllParams.leftMargin = Tokens.dp(12);
        playAll.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                playTop();
            }
        });
        header.addView(playAll, playAllParams);

        page.addView(header, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        contentHost = new FrameLayout(context);
        scroll = new ScrollView(context);
        scroll.setFillViewport(true);
        column = new LinearLayout(context);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setPadding(Tokens.dp(16), Tokens.dp(4), Tokens.dp(16), Tokens.dp(24));
        scroll.addView(column, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        contentHost.addView(scroll, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        page.addView(contentHost, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
    }

    public View view() {
        return root;
    }

    /** Overlay browser: the back affordance also closes the screen at its root. */
    public void setExitOnRootBack(boolean exit) {
        exitOnRootBack = exit;
        renderHeader();
    }

    /** Starts at a browse node (the tab root). */
    public void bind(String parentId, String title) {
        stack.clear();
        generation++;
        push(new Node(parentId, title, "", BROWSE, null));
    }

    /**
     * Starts directly at an album/playlist that only has a library persistent id: the track
     * list is still resolved by name and "Tocar" uses the library id when that fails.
     */
    public void bindCollection(int kind, String title, String subtitle, String libraryId) {
        stack.clear();
        generation++;
        push(new Node(libraryId, title, subtitle,
                kind == PLAYLIST ? PLAYLIST : ALBUM, null));
    }

    private Node top() {
        return stack.isEmpty() ? null : stack.get(stack.size() - 1);
    }

    /**
     * Breadcrumb + scroll, kept across a rotation. Every level is stored (id/title/kind), so
     * BACK still walks the same path; only the top level is fetched again.
     */
    public void saveState(Bundle out, String prefix) {
        int count = stack.size();
        String[] ids = new String[count];
        String[] titles = new String[count];
        String[] subtitles = new String[count];
        String[] directs = new String[count];
        int[] kinds = new int[count];
        for (int i = 0; i < count; i++) {
            Node node = stack.get(i);
            ids[i] = node.id;
            titles[i] = node.title;
            subtitles[i] = node.subtitle;
            directs[i] = node.directId;
            kinds[i] = node.kind;
        }
        out.putInt(prefix + ".count", count);
        out.putStringArray(prefix + ".ids", ids);
        out.putStringArray(prefix + ".titles", titles);
        out.putStringArray(prefix + ".subtitles", subtitles);
        out.putStringArray(prefix + ".directs", directs);
        out.putIntArray(prefix + ".kinds", kinds);
        if (list != null && list.getVisibility() == View.VISIBLE) {
            out.putInt(prefix + ".list.pos", list.getFirstVisiblePosition());
            View first = list.getChildAt(0);
            out.putInt(prefix + ".list.top", first == null ? 0 : first.getTop());
        } else {
            ScrollMemory.save(out, prefix + ".scroll", scroll);
        }
    }

    /** Rebuilds the saved stack and reloads only its top level; false when nothing to do. */
    public boolean restoreState(Bundle in, String prefix) {
        if (in == null) return false;
        int count = in.getInt(prefix + ".count", 0);
        String[] ids = in.getStringArray(prefix + ".ids");
        String[] titles = in.getStringArray(prefix + ".titles");
        String[] subtitles = in.getStringArray(prefix + ".subtitles");
        String[] directs = in.getStringArray(prefix + ".directs");
        int[] kinds = in.getIntArray(prefix + ".kinds");
        if (count <= 0 || ids == null || titles == null || subtitles == null
                || directs == null || kinds == null || ids.length < count
                || titles.length < count || subtitles.length < count
                || directs.length < count || kinds.length < count) {
            return false;
        }
        stack.clear();
        generation++;
        for (int i = 0; i < count; i++) {
            stack.add(new Node(ids[i], titles[i], subtitles[i], kinds[i], directs[i]));
        }
        pendingScroll = in.getFloat(prefix + ".scroll", 0f);
        pendingListPosition = in.getInt(prefix + ".list.pos", 0);
        pendingListTop = in.getInt(prefix + ".list.top", 0);
        pendingListScroll = pendingListPosition > 0 || pendingListTop != 0;
        render();
        return true;
    }

    private void push(Node node) {
        stack.add(node);
        render();
    }

    /** Header, loading state and the source (browse children or amp-api) of the top level. */
    private void render() {
        renderHeader();
        Node node = top();
        showLoading();
        // Every level starts at its first row: the ScrollView keeps the previous level offset.
        scroll.post(new Runnable() {
            @Override
            public void run() {
                scroll.scrollTo(0, 0);
            }
        });
        if (node == null) return;
        if (node.kind == BROWSE) {
            host.loadChildren(node.id, this);
        } else {
            loadRemote(node);
        }
    }

    private void renderHeader() {
        Node node = top();
        if (node == null) return;
        titleView.setText(node.title);
        back.setVisibility(stack.size() > 1 || exitOnRootBack ? View.VISIBLE : View.GONE);
        subtitleView.setText(stack.size() > 1 ? breadcrumb() : "Apple Music");
    }

    private String breadcrumb() {
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < stack.size(); i++) {
            if (i > 0) builder.append("  ›  ");
            builder.append(stack.get(i).title);
        }
        return builder.toString();
    }

    private void showLoading() {
        stopSkeleton();
        showScrollContent();
        column.removeAllViews();
        clearTrackRows();
        playAll.setVisibility(View.GONE);
        skeleton = Skeleton.rows(context, 6);
        column.addView(skeleton, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    /** Grid rows, skeletons and empty states live in the ScrollView; lists use ListView. */
    private void showScrollContent() {
        scroll.setVisibility(View.VISIBLE);
        if (list != null) list.setVisibility(View.GONE);
    }

    private void clearTrackRows() {
        trackList = false;
        adapter = null;
    }

    private void stopSkeleton() {
        if (skeleton != null) {
            skeleton.stop();
            column.removeView(skeleton);
            skeleton = null;
        }
    }

    /** Puts the scroll back where it was before the rotation, once the level is in. */
    private void applyPendingScroll() {
        if (list != null && list.getVisibility() == View.VISIBLE) {
            if (pendingListScroll) {
                list.setSelectionFromTop(pendingListPosition, pendingListTop);
                pendingListScroll = false;
            }
            return;
        }
        if (pendingScroll <= 0f) return;
        ScrollMemory.restore(scroll, pendingScroll);
        pendingScroll = 0f;
    }

    // --- browse levels ------------------------------------------------------------

    @Override
    public void onChildren(String parentId, List<MediaClient.Item> children) {
        Node node = top();
        if (node == null || node.kind != BROWSE || !parentId.equals(node.id)) return;
        stopSkeleton();
        showScrollContent();
        column.removeAllViews();
        clearTrackRows();
        if (children.isEmpty()) {
            column.addView(empty("Nada aqui",
                    "O Apple Music não retornou itens para " + node.title + "."));
            subtitleView.setText("0 itens");
            host.status("");
            return;
        }
        trackList = isTrackList(parentId, children);
        playAll.setVisibility(trackList ? View.VISIBLE : View.GONE);
        subtitleView.setText(children.size() + (trackList ? " faixas" : " itens"));
        host.status("");
        if (mode == GRID) {
            addGrid(children);
        } else {
            showList(children, node, false);
        }
        updatePlayback(host.nowPlaying());
        applyPendingScroll();
    }

    /**
     * True when the node lists tracks rather than more collections. The engine's Auto tree
     * marks albums/playlists as playable leaves too, so "playable and not browsable" is not
     * enough: the node must also be the songs node or hand out bare track ids (catalogue
     * style) instead of child browse ids.
     */
    private static boolean isTrackList(String parentId, List<MediaClient.Item> children) {
        for (MediaClient.Item child : children) {
            if (child.browsable || !child.playable) return false;
        }
        if (children.isEmpty()) return false;
        if (parentId != null && parentId.contains("/songs")) return true;
        for (MediaClient.Item child : children) {
            for (int i = 0; i < child.id.length(); i++) {
                if (!Character.isDigit(child.id.charAt(i))) return false;
            }
        }
        return true;
    }

    /**
     * Repaints the "tocando agora" line: the accent glyph sits on the row whose media id
     * (or, when the queue has no media id, whose title) matches the session metadata.
     */
    public void updatePlayback(MediaClient.Snapshot snapshot) {
        if (snapshot == null || adapter == null || !trackList) return;
        int index = adapter.indexOfPlaying(snapshot);
        if (index == adapter.playing) return;
        adapter.playing = index;
        adapter.notifyDataSetChanged();
    }

    @Override
    public void onFailed(String parentId) {
        Node node = top();
        if (node == null || node.kind != BROWSE || !parentId.equals(node.id)) return;
        stopSkeleton();
        showScrollContent();
        column.removeAllViews();
        failedId = parentId;
        EmptyState failure = new EmptyState(context, Icons.CLOSE, "Não foi possível carregar",
                "Sem conexão com o Apple Music (" + node.title + ").");
        Pill retry = Pill.surface(context, Icons.REFRESH, "Tentar de novo");
        retry.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (failedId != null) render();
            }
        });
        failure.addAction(retry);
        column.addView(failure, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        host.status("Não foi possível carregar " + node.title);
    }

    // --- album/playlist levels (amp-api) -------------------------------------------

    private void loadRemote(final Node node) {
        final int token = ++generation;
        CatalogSearch.CollectionCallback callback = new CatalogSearch.CollectionCallback() {
            @Override
            public void onCollection(CatalogSearch.Collection collection) {
                if (!isCurrent(node, token)) return;
                node.catalogId = collection.id;
                node.items = collection.items;
                node.failed = collection.items.isEmpty();
                renderRemote(node);
            }

            @Override
            public void onFailure(String message) {
                if (!isCurrent(node, token)) return;
                node.failed = true;
                node.failure = message;
                renderRemote(node);
            }
        };
        if (node.kind == ALBUM) {
            if (node.directId != null) {
                catalog.albumTracks(node.directId, callback);
            } else {
                catalog.findAlbum(node.title, node.subtitle, callback);
            }
        } else {
            if (node.directId != null) {
                catalog.playlistTracks(node.directId, callback);
            } else {
                catalog.findPlaylist(node.title, node.subtitle, callback);
            }
        }
    }

    private boolean isCurrent(Node node, int token) {
        return token == generation && top() == node;
    }

    private void renderRemote(Node node) {
        stopSkeleton();
        showScrollContent();
        column.removeAllViews();
        clearTrackRows();
        playAll.setVisibility(View.VISIBLE);
        if (node.failed) {
            subtitleView.setText("Sem lista de faixas");
            String message = node.failure != null && node.failure.length() > 0
                    ? node.failure
                    : "O catálogo não devolveu as faixas deste item.";
            EmptyState state = new EmptyState(context, emptyIcon, "Faixas indisponíveis",
                    message + " Use Tocar para ouvir a coleção inteira.");
            column.addView(state, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            host.status("");
            return;
        }
        trackList = true;
        subtitleView.setText(node.items.size() + " faixas");
        host.status("");
        List<MediaClient.Item> items = new ArrayList<MediaClient.Item>(node.items.size());
        for (CatalogSearch.Result item : node.items) {
            items.add(new MediaClient.Item(item.id, item.title, item.artist,
                    item.artworkUrl, false, true));
        }
        showList(items, node, true);
        updatePlayback(host.nowPlaying());
        applyPendingScroll();
    }

    private void playTop() {
        Node node = top();
        if (node == null) return;
        if (node.kind == BROWSE) {
            if (trackList) host.playId(node.id, node.title);
            return;
        }
        host.playId(node.catalogId != null ? node.catalogId : node.id, node.title);
    }

    // --- rendering ----------------------------------------------------------------

    private View empty(String title, String message) {
        return new EmptyState(context, emptyIcon, title, message);
    }

    /** Real list level: ListView + adapter, so 281 albums only inflate the visible rows. */
    private void showList(List<MediaClient.Item> items, Node node, boolean remote) {
        scroll.setVisibility(View.GONE);
        column.removeAllViews();
        if (list == null) {
            list = new ListView(context);
            list.setDivider(new ColorDrawable(0x00000000));
            list.setSelector(android.R.color.transparent);
            list.setItemsCanFocus(true);
            list.setFocusable(true);
            list.setClipToPadding(false);
            list.setPadding(Tokens.dp(16), Tokens.dp(4), Tokens.dp(16), Tokens.dp(24));
            list.setLayoutParams(new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            contentHost.addView(list);
        }
        list.setDividerHeight(Tokens.dp(trackList ? 2 : 8));
        list.setVisibility(View.VISIBLE);
        adapter = new RowAdapter(node, items, trackList, remote);
        list.setAdapter(adapter);
        if (pendingListScroll) {
            list.setSelectionFromTop(pendingListPosition, pendingListTop);
            pendingListScroll = false;
        } else {
            list.setSelection(0);
        }
        final int total = items.size();
        list.post(new Runnable() {
            @Override
            public void run() {
                Log.i("AppleMusicOne", "perf collection list items=" + total
                        + " rows=" + list.getChildCount() + " views=" + Perf.views(list));
            }
        });
    }

    /** Row recycling for both flavours of list: collections (ListRow) and tracks (TrackRow). */
    private final class RowAdapter extends BaseAdapter {

        private final Node node;
        private final List<MediaClient.Item> items;
        private final boolean tracks;
        private final boolean remote;
        private int playing = -1;

        RowAdapter(Node node, List<MediaClient.Item> items, boolean tracks, boolean remote) {
            this.node = node;
            this.items = items;
            this.tracks = tracks;
            this.remote = remote;
        }

        @Override
        public int getCount() {
            return items.size();
        }

        @Override
        public Object getItem(int position) {
            return items.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        int indexOfPlaying(MediaClient.Snapshot snapshot) {
            for (int i = 0; i < items.size(); i++) {
                MediaClient.Item item = items.get(i);
                boolean match = item.id.length() > 0
                        ? item.id.equals(snapshot.mediaId)
                        : item.title.equalsIgnoreCase(snapshot.title);
                if (match) return i;
            }
            return -1;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            final int index = position;
            final MediaClient.Item item = items.get(position);
            if (tracks) {
                TrackRow row = convertView instanceof TrackRow
                        ? (TrackRow) convertView : new TrackRow(context, index + 1, "", "");
                row.bind(index + 1, item.title, item.subtitle);
                row.setPlaying(index == playing);
                row.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        playTrack(index);
                    }
                });
                row.setOnLongClickListener(remote ? null : new View.OnLongClickListener() {
                    @Override
                    public boolean onLongClick(View v) {
                        host.itemActions(item);
                        return true;
                    }
                });
                return row;
            }
            ListRow row = convertView instanceof ListRow
                    ? (ListRow) convertView
                    : new ListRow(context, artwork, "", "", null, false);
            row.bind(artwork, item.title, item.subtitle, item.artworkUri, drills(item));
            row.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    choose(item);
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

    private void playTrack(int index) {
        MediaClient.Item item = adapter == null ? null : (MediaClient.Item) adapter.getItem(index);
        if (item == null) return;
        Node node = top();
        if (node == null) return;
        if (adapter.remote) {
            if (node.catalogId == null) {
                host.status("Toque em Tocar para ouvir esta coleção");
                return;
            }
            host.playCollectionFrom(node.catalogId, node.title, index, item);
        } else {
            host.playCollectionFrom(node.id, node.title, index, item);
        }
    }

    private void addGrid(List<MediaClient.Item> items) {
        int columns = Tokens.wide() ? 5 : 2;
        int gap = Tokens.dp(12);
        int available = Tokens.screenWidth() - Tokens.dp(32);
        int size = Math.max(Tokens.dp(96), (available - gap * (columns - 1)) / columns);
        LinearLayout row = null;
        for (int i = 0; i < items.size(); i++) {
            if (i % columns == 0) {
                row = new LinearLayout(context);
                row.setOrientation(LinearLayout.HORIZONTAL);
                LinearLayout.LayoutParams rowParams = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT);
                rowParams.bottomMargin = gap;
                column.addView(row, rowParams);
            }
            final MediaClient.Item item = items.get(i);
            CoverCard card = new CoverCard(context, artwork, item, size);
            card.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    choose(item);
                }
            });
            card.setOnLongClickListener(new View.OnLongClickListener() {
                @Override
                public boolean onLongClick(View v) {
                    host.itemActions(item);
                    return true;
                }
            });
            LinearLayout.LayoutParams cardParams = new LinearLayout.LayoutParams(size, size);
            cardParams.rightMargin = gap;
            row.addView(card, cardParams);
        }
    }

    // --- hierarchy ----------------------------------------------------------------

    /**
     * True when the row opens another level: browsable nodes, and the library rows whose
     * id is an artist ("6-"), album ("3-") or playlist ("4-") persistent id.
     */
    private static boolean drills(MediaClient.Item item) {
        String last = CatalogResolver.lastSegment(item.id);
        return item.browsable
                || (item.id.contains("/library/") && last.startsWith("6-"))
                || last.startsWith("3-")
                || last.startsWith("4-");
    }

    private void choose(MediaClient.Item item) {
        String last = CatalogResolver.lastSegment(item.id);
        boolean library = item.id.contains("/library/");
        // Catalogue ids (Home/Rádio shelves) open the detail stack; library ids carry only
        // the persistent id, so they resolve the catalogue id by name and open the same
        // rich screen, falling back to the browse level when the name is not in the store.
        if (!library && last.startsWith("3-")) {
            host.openAlbum(last.substring(2), item.title, item.subtitle, item.artworkUri);
            return;
        }
        if (!library && last.startsWith("4-")) {
            host.openPlaylist(last.substring(2), item.title, item.subtitle, item.artworkUri);
            return;
        }
        if (!library && last.startsWith("6-")) {
            host.openArtist(last.substring(2), item.title, item.artworkUri);
            return;
        }
        if (library && last.startsWith("6-")) {
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
        if (item.browsable) {
            push(new Node(item.id, item.title, item.subtitle, BROWSE, null));
            return;
        }
        if (item.playable) {
            host.play(item);
            return;
        }
        host.status("Item não reproduzível");
    }

    /** Library artist ({@code 6-}): catalogue id by name, browse albums as the fallback. */
    private void resolveArtist(final MediaClient.Item item) {
        final Node source = top();
        host.status("Abrindo " + item.title + "…");
        resolver.artist(item.title, item.artworkUri, new CatalogResolver.Match() {
            @Override
            public void onMatch(String id, String artworkUrl) {
                if (top() != source) return;
                host.openArtist(id, item.title, artworkUrl);
            }

            @Override
            public void onMiss(String message) {
                if (top() != source) return;
                host.status("");
                push(new Node(item.id, item.title, item.subtitle, BROWSE, null));
            }
        });
    }

    /** Library album ({@code 3-}): catalogue track list by name, browse level as fallback. */
    private void resolveAlbum(final MediaClient.Item item) {
        final Node source = top();
        host.status("Abrindo " + item.title + "…");
        resolver.album(item.title, item.subtitle, item.artworkUri, new CatalogResolver.Match() {
            @Override
            public void onMatch(String id, String artworkUrl) {
                if (top() != source) return;
                host.openAlbum(id, item.title, item.subtitle, artworkUrl);
            }

            @Override
            public void onMiss(String message) {
                if (top() != source) return;
                host.status("");
                push(new Node(item.id, item.title, item.subtitle, ALBUM, null));
            }
        });
    }

    /** Library playlist ({@code 4-}): catalogue track list by name, browse as fallback. */
    private void resolvePlaylist(final MediaClient.Item item) {
        final Node source = top();
        host.status("Abrindo " + item.title + "…");
        resolver.playlist(item.title, item.subtitle, item.artworkUri,
                new CatalogResolver.Match() {
                    @Override
                    public void onMatch(String id, String artworkUrl) {
                        if (top() != source) return;
                        host.openPlaylist(id, item.title, item.subtitle, artworkUrl);
                    }

                    @Override
                    public void onMiss(String message) {
                        if (top() != source) return;
                        host.status("");
                        push(new Node(item.id, item.title, item.subtitle, PLAYLIST, null));
                    }
                });
    }

    /** Breadcrumb back: false when the screen is already at its tab root. */
    public boolean back() {
        if (stack.size() <= 1) {
            if (exitOnRootBack) {
                host.closeCollection();
                return true;
            }
            return false;
        }
        stack.remove(stack.size() - 1);
        generation++;
        failedId = null;
        render();
        return true;
    }

    public void dispose() {
        generation++;
        host.forgetChildren(this);
        if (skeleton != null) {
            skeleton.stop();
            skeleton = null;
        }
    }
}
