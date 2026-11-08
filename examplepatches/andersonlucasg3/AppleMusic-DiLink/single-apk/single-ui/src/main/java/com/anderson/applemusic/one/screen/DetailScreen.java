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
import com.anderson.applemusic.one.media.CatalogSearch;
import com.anderson.applemusic.one.media.MediaClient;
import com.anderson.applemusic.one.theme.Inter;
import com.anderson.applemusic.one.theme.Shapes;
import com.anderson.applemusic.one.theme.Tokens;
import com.anderson.applemusic.one.widget.CircleButton;
import com.anderson.applemusic.one.widget.CoverCard;
import com.anderson.applemusic.one.widget.EmptyState;
import com.anderson.applemusic.one.widget.Focus;
import com.anderson.applemusic.one.widget.Icons;
import com.anderson.applemusic.one.widget.Pill;
import com.anderson.applemusic.one.widget.SectionHeader;
import com.anderson.applemusic.one.widget.Skeleton;
import com.anderson.applemusic.one.widget.TrackRow;

import java.util.ArrayList;
import java.util.List;

/**
 * Catalogue detail stack: artist → album → artist → song, each level pushed on the same
 * stack so the breadcrumb and BACK walk the history that was actually followed.
 *
 * <p>Everything here comes from amp-api by id ({@link CatalogSearch#artist},
 * {@link CatalogSearch#album}, {@link CatalogSearch#song},
 * {@link CatalogSearch#playlist}); the album/playlist track list carries the
 * {@code durationInMillis} and the 1-based track number, and "Tocar" plays the catalogue
 * collection id, while tapping track N starts the queue at N.
 */
public final class DetailScreen {

    public static final int ARTIST = 0;
    public static final int ALBUM = 1;
    public static final int PLAYLIST = 2;
    public static final int SONG = 3;

    /** One level of the stack: what to fetch and what has already arrived. */
    private static final class Node {
        final int kind;
        final String id;
        String title;
        final String subtitle;
        final String artworkUrl;
        String focusTrackId;
        CatalogSearch.ArtistDetail artist;
        CatalogSearch.AlbumDetail album;
        CatalogSearch.SongDetail song;
        CatalogSearch.PlaylistDetail playlist;

        Node(int kind, String id, String title, String subtitle, String artworkUrl) {
            this.kind = kind;
            this.id = id == null ? "" : id;
            this.title = title == null ? "" : title;
            this.subtitle = subtitle == null ? "" : subtitle;
            this.artworkUrl = artworkUrl;
        }
    }

    private final Context context;
    private final ScreenHost host;
    private final ArtworkLoader artwork;
    private final CatalogSearch catalog;

    private final FrameLayout root;
    private final CircleButton back;
    private final TextView titleView;
    private final TextView subtitleView;
    private final LinearLayout column;
    private final ScrollView scroll;
    private final Pill playAll;
    private final List<Node> stack = new ArrayList<Node>();
    private final List<TrackRow> trackRows = new ArrayList<TrackRow>();
    private final List<String> trackIds = new ArrayList<String>();
    private final List<String> trackTitles = new ArrayList<String>();
    private Skeleton skeleton;
    private boolean exitOnRootBack;
    /** Guards amp-api callbacks against a level the user already left. */
    private int generation;

    public DetailScreen(Context context, ScreenHost host, ArtworkLoader artwork,
                        CatalogSearch catalog) {
        this.context = context;
        this.host = host;
        this.artwork = artwork;
        this.catalog = catalog;

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
        subtitleView.setEllipsize(TextUtils.TruncateAt.END);
        heading.addView(titleView);
        heading.addView(subtitleView);
        header.addView(heading, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        playAll = Pill.accent(context, Icons.PLAY, "Tocar");
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

        FrameLayout contentHost = new FrameLayout(context);
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

    /** Overlay stack: the back affordance also closes the screen at its root. */
    public void setExitOnRootBack(boolean exit) {
        exitOnRootBack = exit;
        renderHeader();
    }

    // --- stack ---------------------------------------------------------------------

    public void openArtist(String id, String name, String artworkUrl) {
        clear(ARTIST, id, name, "", artworkUrl);
    }

    public void openAlbum(String id, String title, String artist, String artworkUrl) {
        clear(ALBUM, id, title, artist, artworkUrl);
    }

    public void openPlaylist(String id, String title, String curator, String artworkUrl) {
        clear(PLAYLIST, id, title, curator, artworkUrl);
    }

    public void openSong(String id, String title, String artist, String artworkUrl) {
        clear(SONG, id, title, artist, artworkUrl);
    }

    private void clear(int kind, String id, String title, String subtitle, String artworkUrl) {
        stack.clear();
        generation++;
        push(new Node(kind, id, title, subtitle, artworkUrl));
    }

    private Node top() {
        return stack.isEmpty() ? null : stack.get(stack.size() - 1);
    }

    private void push(Node node) {
        stack.add(node);
        render();
    }

    /** Pops one level; false when already at the root and not in overlay mode. */
    public boolean back() {
        if (stack.size() <= 1) {
            if (exitOnRootBack) {
                host.closeDetail();
                return true;
            }
            return false;
        }
        stack.remove(stack.size() - 1);
        generation++;
        render();
        return true;
    }

    // --- loading -------------------------------------------------------------------

    private void render() {
        renderHeader();
        showLoading();
        scroll.post(new Runnable() {
            @Override
            public void run() {
                scroll.scrollTo(0, 0);
            }
        });
        final Node node = top();
        if (node == null) return;
        final int token = ++generation;
        if (!Tokens.touch()) {
            // TV: a new level must not leave the D-pad on the screen underneath.
            back.post(new Runnable() {
                @Override
                public void run() {
                    back.requestFocus();
                }
            });
        }
        if (node.kind == ARTIST) {
            catalog.artist(node.id, new CatalogSearch.ArtistCallback() {
                @Override
                public void onArtist(CatalogSearch.ArtistDetail artist) {
                    if (!isCurrent(node, token)) return;
                    node.artist = artist;
                    node.title = artist.name;
                    renderArtist(node);
                }

                @Override
                public void onFailure(String message) {
                    if (!isCurrent(node, token)) return;
                    renderFailure(message);
                }
            });
            return;
        }
        if (node.kind == ALBUM) {
            catalog.album(node.id, new CatalogSearch.AlbumCallback() {
                @Override
                public void onAlbum(CatalogSearch.AlbumDetail album) {
                    if (!isCurrent(node, token)) return;
                    node.album = album;
                    node.title = album.title;
                    renderAlbum(node);
                }

                @Override
                public void onFailure(String message) {
                    if (!isCurrent(node, token)) return;
                    renderFailure(message);
                }
            });
            return;
        }
        if (node.kind == PLAYLIST) {
            catalog.playlist(node.id, new CatalogSearch.PlaylistCallback() {
                @Override
                public void onPlaylist(CatalogSearch.PlaylistDetail playlist) {
                    if (!isCurrent(node, token)) return;
                    node.playlist = playlist;
                    node.title = playlist.title;
                    renderPlaylist(node);
                }

                @Override
                public void onFailure(String message) {
                    if (!isCurrent(node, token)) return;
                    renderFailure(message);
                }
            });
            return;
        }
        catalog.song(node.id, new CatalogSearch.SongCallback() {
            @Override
            public void onSong(CatalogSearch.SongDetail song) {
                if (!isCurrent(node, token)) return;
                node.song = song;
                node.title = song.title;
                renderSong(node);
            }

            @Override
            public void onFailure(String message) {
                if (!isCurrent(node, token)) return;
                renderFailure(message);
            }
        });
    }

    private boolean isCurrent(Node node, int token) {
        return token == generation && top() == node;
    }

    private void showLoading() {
        stopSkeleton();
        column.removeAllViews();
        clearTrackRows();
        skeleton = Skeleton.rows(context, 6);
        column.addView(skeleton, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    private void stopSkeleton() {
        if (skeleton != null) {
            skeleton.stop();
            column.removeView(skeleton);
            skeleton = null;
        }
    }

    private void clearTrackRows() {
        trackRows.clear();
        trackIds.clear();
        trackTitles.clear();
    }

    private void renderHeader() {
        Node node = top();
        if (node == null) return;
        titleView.setText(node.title);
        back.setVisibility(stack.size() > 1 || exitOnRootBack ? View.VISIBLE : View.GONE);
        String subtitle = node.subtitle;
        if (stack.size() > 1) {
            subtitle = breadcrumb();
        } else if (subtitle.length() == 0) {
            subtitle = label(node.kind);
        }
        subtitleView.setText(subtitle);
        // amp-api exposes no playable artist collection: playFromMediaId(<artistId>) and
        // ra.<artistId> both leave the session untouched (measured), so the artist page
        // offers the albums and top songs instead of a broken "Tocar".
        playAll.setVisibility(node.kind == ARTIST ? View.GONE : View.VISIBLE);
    }

    private String breadcrumb() {
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < stack.size(); i++) {
            if (i > 0) builder.append("  ›  ");
            builder.append(stack.get(i).title);
        }
        return builder.toString();
    }

    private static String label(int kind) {
        switch (kind) {
            case ARTIST:
                return "Artista";
            case ALBUM:
                return "Álbum";
            case PLAYLIST:
                return "Playlist";
            default:
                return "Música";
        }
    }

    // --- artist --------------------------------------------------------------------

    private void renderArtist(final Node node) {
        CatalogSearch.ArtistDetail artist = node.artist;
        if (artist == null) return;
        stopSkeleton();
        column.removeAllViews();
        clearTrackRows();
        renderHeader();

        addHero(artist.artworkUrl, artist.name, join(artist.genres));
        if (artist.albums.isEmpty() && artist.topSongs.isEmpty()) {
            column.addView(empty("Artista sem catálogo",
                    "O Apple Music não retornou álbuns nem músicas para este artista."),
                    new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT));
            return;
        }
        if (!artist.albums.isEmpty()) {
            addSection("Álbuns", artist.albums.size());
            addAlbumGrid(artist.albums);
        }
        addSection("Músicas principais", artist.topSongs.size());
        if (artist.topSongs.isEmpty()) {
            column.addView(empty("Sem músicas principais",
                    "O Apple Music não devolveu a lista de músicas populares."),
                    new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT));
        } else {
            addTracks(artist.topSongs, node, null, true);
        }
    }

    private void addAlbumGrid(List<CatalogSearch.Result> albums) {
        int columns = Tokens.wide() ? 5 : 2;
        int gap = Tokens.dp(12);
        int available = Tokens.screenWidth() - Tokens.dp(32);
        int size = Math.max(Tokens.dp(96), (available - gap * (columns - 1)) / columns);
        LinearLayout row = null;
        for (int i = 0; i < albums.size(); i++) {
            if (i % columns == 0) {
                row = new LinearLayout(context);
                row.setOrientation(LinearLayout.HORIZONTAL);
                LinearLayout.LayoutParams rowParams = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT);
                rowParams.bottomMargin = gap;
                column.addView(row, rowParams);
            }
            final CatalogSearch.Result album = albums.get(i);
            MediaClient.Item item = new MediaClient.Item("3-" + album.id, album.title,
                    album.artist, album.artworkUrl, false, false);
            CoverCard card = new CoverCard(context, artwork, item, size);
            card.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    push(new Node(ALBUM, album.id, album.title, album.artist,
                            album.artworkUrl));
                }
            });
            LinearLayout.LayoutParams cardParams = new LinearLayout.LayoutParams(size, size);
            cardParams.rightMargin = gap;
            row.addView(card, cardParams);
        }
    }

    // --- album ---------------------------------------------------------------------

    private void renderAlbum(final Node node) {
        CatalogSearch.AlbumDetail album = node.album;
        if (album == null) return;
        stopSkeleton();
        column.removeAllViews();
        clearTrackRows();
        renderHeader();

        LinearLayout block = addHero(album.artworkUrl, album.title, meta(album));
        if (album.artist.length() > 0) {
            if (album.artistId.length() > 0) {
                block.addView(link(album.artist, new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        push(new Node(ARTIST, album.artistId, album.artist, "", null));
                    }
                }), linkParams());
            } else {
                TextView name = Inter.text(context, album.artist, Tokens.BODY, Inter.SEMIBOLD,
                        Tokens.TEXT_DIM);
                block.addView(name, linkParams());
            }
        }
        String credits = credits(album);
        if (credits.length() > 0) {
            TextView creditView = Inter.text(context, credits, Tokens.CAPTION, Inter.REGULAR,
                    Tokens.TEXT_DIM);
            creditView.setMaxLines(3);
            creditView.setLineSpacing(Tokens.dp(2), 1f);
            LinearLayout.LayoutParams creditParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            creditParams.bottomMargin = Tokens.dp(10);
            column.addView(creditView, creditParams);
        }

        addSection("Faixas", album.trackCount);
        if (album.tracks.isEmpty()) {
            column.addView(empty("Sem faixas",
                    "O catálogo não devolveu as faixas deste álbum. Use Tocar para ouvir a coleção."),
                    new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT));
            return;
        }
        addTracks(album.tracks, node, album.id, false);
    }

    private String meta(CatalogSearch.AlbumDetail album) {
        List<String> parts = new ArrayList<String>();
        if (album.year().length() > 0) parts.add(album.year());
        if (album.trackCount > 0) {
            parts.add(album.trackCount + (album.trackCount == 1 ? " faixa" : " faixas"));
        }
        if (!album.genres.isEmpty()) parts.add(album.genres.get(0));
        return join(parts);
    }

    private static String credits(CatalogSearch.AlbumDetail album) {
        List<String> parts = new ArrayList<String>();
        if (album.recordLabel.length() > 0) parts.add("Gravadora: " + album.recordLabel);
        if (album.copyright.length() > 0) parts.add(album.copyright);
        return join(parts);
    }

    // --- playlist ------------------------------------------------------------------

    private void renderPlaylist(final Node node) {
        CatalogSearch.PlaylistDetail playlist = node.playlist;
        if (playlist == null) return;
        stopSkeleton();
        column.removeAllViews();
        clearTrackRows();
        renderHeader();

        List<String> metaParts = new ArrayList<String>();
        if (playlist.curator.length() > 0) metaParts.add(playlist.curator);
        metaParts.add(playlist.tracks.size()
                + (playlist.tracks.size() == 1 ? " faixa" : " faixas"));
        addHero(playlist.artworkUrl, playlist.title, join(metaParts));
        if (playlist.description.length() > 0) {
            TextView description = Inter.text(context, playlist.description, Tokens.CAPTION,
                    Inter.REGULAR, Tokens.TEXT_DIM);
            description.setMaxLines(3);
            description.setEllipsize(TextUtils.TruncateAt.END);
            description.setLineSpacing(Tokens.dp(2), 1f);
            LinearLayout.LayoutParams descriptionParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            descriptionParams.bottomMargin = Tokens.dp(10);
            column.addView(description, descriptionParams);
        }
        addSection("Faixas", playlist.tracks.size());
        if (playlist.tracks.isEmpty()) {
            column.addView(empty("Sem faixas",
                    "O catálogo não devolveu as faixas desta playlist."),
                    new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT));
            return;
        }
        addTracks(playlist.tracks, node, playlist.id, false);
    }

    // --- song ----------------------------------------------------------------------

    private void renderSong(final Node node) {
        CatalogSearch.SongDetail song = node.song;
        if (song == null) return;
        stopSkeleton();
        column.removeAllViews();
        clearTrackRows();
        renderHeader();

        LinearLayout block = addHero(song.artworkUrl, song.title, song.durationText());
        if (song.artist.length() > 0) {
            if (song.artistId.length() > 0) {
                block.addView(link("Artista: " + song.artist, new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        push(new Node(ARTIST, song.artistId, song.artist, "", null));
                    }
                }), linkParams());
            } else {
                block.addView(Inter.text(context, "Artista: " + song.artist, Tokens.BODY,
                        Inter.SEMIBOLD, Tokens.TEXT_DIM), linkParams());
            }
        }
        String album = song.albumName;
        if (album.length() == 0 && song.albumId.length() == 0) return;
        if (song.albumId.length() > 0) {
            block.addView(link("Álbum: " + (album.length() > 0 ? album : "Abrir"),
                    new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            Node target = new Node(ALBUM, song.albumId,
                                    album.length() > 0 ? album : song.title, song.artist, null);
                            target.focusTrackId = song.id;
                            push(target);
                        }
                    }), linkParams());
        } else {
            block.addView(Inter.text(context, "Álbum: " + album, Tokens.BODY, Inter.SEMIBOLD,
                    Tokens.TEXT_DIM), linkParams());
        }
    }

    // --- shared views --------------------------------------------------------------

    private LinearLayout addHero(String artworkUrl, String title, String meta) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        int size = Tokens.wide() ? Tokens.dp(200) : Tokens.dp(140);
        ImageView cover = new ImageView(context);
        cover.setScaleType(ImageView.ScaleType.CENTER_CROP);
        cover.setBackgroundColor(Tokens.SURFACE_HOVER);
        Shapes.clip(cover, Tokens.RADIUS_CARD);
        LinearLayout.LayoutParams coverParams = new LinearLayout.LayoutParams(size, size);
        coverParams.rightMargin = Tokens.dp(18);
        row.addView(cover, coverParams);
        artwork.load(artworkUrl, cover);

        LinearLayout block = new LinearLayout(context);
        block.setOrientation(LinearLayout.VERTICAL);
        TextView name = Inter.text(context, title, Tokens.SECTION, Inter.BOLD, Tokens.TEXT);
        name.setMaxLines(2);
        name.setEllipsize(TextUtils.TruncateAt.END);
        block.addView(name);
        if (meta != null && meta.length() > 0) {
            TextView metaView = Inter.text(context, meta, Tokens.BODY, Inter.REGULAR,
                    Tokens.TEXT_DIM);
            metaView.setMaxLines(2);
            metaView.setEllipsize(TextUtils.TruncateAt.END);
            LinearLayout.LayoutParams metaParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            metaParams.topMargin = Tokens.dp(6);
            block.addView(metaView, metaParams);
        }
        row.addView(block, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        LinearLayout.LayoutParams rowParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        rowParams.bottomMargin = Tokens.dp(14);
        column.addView(row, rowParams);
        return block;
    }

    private LinearLayout.LayoutParams linkParams() {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = Tokens.dp(4);
        return params;
    }

    private TextView link(String text, View.OnClickListener listener) {
        TextView view = Inter.text(context, text, Tokens.BODY, Inter.SEMIBOLD, Tokens.ACCENT);
        view.setMaxLines(1);
        view.setEllipsize(TextUtils.TruncateAt.END);
        view.setPadding(Tokens.dp(4), Tokens.dp(6), Tokens.dp(4), Tokens.dp(6));
        Focus.attach(view, Tokens.RADIUS_CONTROL, 0x00000000, Tokens.SURFACE, null);
        view.setOnClickListener(listener);
        return view;
    }

    private void addSection(String title, int count) {
        SectionHeader header = new SectionHeader(context, title);
        header.setCount(count);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = Tokens.dp(18);
        params.bottomMargin = Tokens.dp(8);
        column.addView(header, params);
    }

    private void addTracks(List<CatalogSearch.Track> tracks, final Node node,
                           final String collectionId, final boolean showAlbum) {
        TrackRow scrollTarget = null;
        for (int i = 0; i < tracks.size(); i++) {
            final CatalogSearch.Track track = tracks.get(i);
            final int index = i;
            List<String> subtitleParts = new ArrayList<String>();
            if (showAlbum && track.albumName.length() > 0) subtitleParts.add(track.albumName);
            if (track.durationText().length() > 0) subtitleParts.add(track.durationText());
            TrackRow row = new TrackRow(context, i + 1, track.title, join(subtitleParts));
            boolean focused = node.focusTrackId != null && node.focusTrackId.equals(track.id);
            if (focused) {
                row.setEmphasis(true);
                scrollTarget = row;
            }
            row.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    if (collectionId != null && collectionId.length() > 0) {
                        host.playCollectionFrom(collectionId, node.title, index, item(track));
                    } else {
                        host.playId(track.id, track.title);
                    }
                }
            });
            row.setOnLongClickListener(new View.OnLongClickListener() {
                @Override
                public boolean onLongClick(View v) {
                    host.itemActions(item(track));
                    return true;
                }
            });
            trackRows.add(row);
            trackIds.add(track.id);
            trackTitles.add(track.title);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.bottomMargin = Tokens.dp(2);
            column.addView(row, params);
        }
        final TrackRow target = scrollTarget;
        if (target != null) {
            scroll.post(new Runnable() {
                @Override
                public void run() {
                    scroll.smoothScrollTo(0, Math.max(0, target.getTop() - Tokens.dp(8)));
                }
            });
        }
        updatePlayback(host.nowPlaying());
    }

    private static MediaClient.Item item(CatalogSearch.Track track) {
        return new MediaClient.Item(track.id, track.title, track.artist, null, false, true);
    }

    private void playTop() {
        Node node = top();
        if (node == null || node.kind == ARTIST) return;
        // The catalogue id is the node id, so "Tocar" also works when the track list
        // failed and only the EmptyState is on screen.
        host.playId(node.id, node.title);
    }

    private void renderFailure(String message) {
        stopSkeleton();
        column.removeAllViews();
        clearTrackRows();
        EmptyState failure = new EmptyState(context, Icons.CLOSE,
                "Não foi possível carregar", message);
        Pill retry = Pill.surface(context, Icons.REFRESH, "Tentar de novo");
        retry.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                render();
            }
        });
        failure.addAction(retry);
        column.addView(failure, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        host.status("");
    }

    private View empty(String title, String message) {
        return new EmptyState(context, Icons.NOTE, title, message);
    }

    /** Marks the track that is playing now (accent glyph + title). */
    public void updatePlayback(MediaClient.Snapshot snapshot) {
        if (snapshot == null || trackRows.isEmpty()) return;
        for (int i = 0; i < trackRows.size(); i++) {
            String mediaId = trackIds.get(i);
            boolean playing = mediaId.length() > 0
                    ? mediaId.equals(snapshot.mediaId)
                    : trackTitles.get(i).equalsIgnoreCase(snapshot.title);
            trackRows.get(i).setPlaying(playing);
        }
    }

    private static String join(List<String> values) {
        StringBuilder builder = new StringBuilder();
        for (String value : values) {
            if (value == null || value.length() == 0) continue;
            if (builder.length() > 0) builder.append(" · ");
            builder.append(value);
        }
        return builder.toString();
    }

    public void dispose() {
        generation++;
        if (skeleton != null) {
            skeleton.stop();
            skeleton = null;
        }
    }
}
