package app.spicetify.extension.spotify.settings;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Outline;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.InputType;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewTreeObserver;
import android.view.WindowManager;
import android.widget.AbsListView;
import android.widget.BaseAdapter;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;
import app.spicetify.extension.spotify.localserver.MusicCatalog;
import app.spicetify.extension.spotify.localserver.ServerArtwork;
import app.spicetify.extension.spotify.localserver.ServerConfig;
import app.spicetify.extension.spotify.localserver.ServerIndex;
import app.spicetify.extension.spotify.localserver.ServerPlayback;
import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Server albums, artists and songs laid out like Spotify's own pages; albums play through Spotify's player. */
public final class ServerMusicActivity extends Activity {
    private static final String EXTRA_ALBUM = "album";
    private static final String EXTRA_ARTIST = "artist";
    private static final String EXTRA_PLAY = "play";
    private static final int SEARCH_LIMIT = 30;

    private enum Page { ALBUMS, ARTISTS, SONGS, SEARCH, ALBUM, ARTIST }
    private enum Kind { BROWSE_HEADER, ALBUM_HEADER, ARTIST_HEADER, SECTION, ALBUM, ARTIST, SONG, TRACK, MESSAGE }

    /** One list item; {@code id} names the album, artist or track it opens or plays. */
    private static final class Item {
        final Kind kind;
        final String id, title, subtitle, image;

        Item(Kind kind, String id, String title, String subtitle, String image) {
            this.kind = kind; this.id = id; this.title = title; this.subtitle = subtitle; this.image = image;
        }
    }

    private static final class NavState {
        final Page page;
        final String id;
        final int tone;
        NavState(Page page, String id, int tone) { this.page = page; this.id = id; this.tone = tone; }
    }

    private static WeakReference<Activity> host = new WeakReference<>(null);
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final List<Item> items = new ArrayList<>();
    private final ArrayDeque<NavState> history = new ArrayDeque<>();
    private final Adapter adapter = new Adapter();
    private final Runnable refresh = new Runnable() {
        @Override public void run() {
            MusicCatalog current = ServerIndex.catalog();
            if (current != catalog && (current.trackCount() > 0 || catalog.trackCount() > 0)) {
                catalog = current;
                if (!openPending() && ((page == Page.ALBUM && catalog.album(selectedId) == null)
                        || (page == Page.ARTIST && catalog.artist(selectedId) == null))) {
                    showNotice("The server library changed, so this page was closed.");
                    history.clear();
                    show(browsePage, null, SpotifyStyle.surface());
                }
                render();
            }
            handler.postDelayed(this, 1000);
        }
    };
    private final ViewTreeObserver.OnGlobalLayoutListener hostLayout = this::fitAboveSpotifyBars;
    private final Runnable hideSnackbar = () -> { if (this.snackbar != null) this.snackbar.setVisibility(View.GONE); };
    private MusicCatalog catalog;
    private Page page = Page.ALBUMS;
    private Page browsePage = Page.ALBUMS;
    private String selectedId;
    private String query = "";
    private String pendingAlbum, pendingArtist;
    private boolean pendingPlay;
    private int headerTone;
    private int topInset;
    private int tabBarTop;
    private int windowHeight = -1;
    private View header;
    private String headerKey;
    private ListView list;
    private FrameLayout bar;
    private TextView barTitle;
    private TextView snackbar;
    private EditText search;
    private View observedHost;
    private NowPlayingWatcher nowPlaying;
    private String playingTitle, playingAlbum;
    private Object backCallback;

    public static void open(Context context) {
        start(context, new Intent(context, ServerMusicActivity.class));
    }

    /** Opens one album and starts playing it from the first track. */
    public static void playAlbum(Context context, String albumId) {
        start(context, new Intent(context, ServerMusicActivity.class).putExtra(EXTRA_ALBUM, albumId).putExtra(EXTRA_PLAY, true));
    }

    public static void openArtist(Context context, String artistId) {
        start(context, new Intent(context, ServerMusicActivity.class).putExtra(EXTRA_ARTIST, artistId));
    }

    private static void start(Context context, Intent intent) {
        if (!(context instanceof Activity)) {
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            host = new WeakReference<>(null);
        } else if (!(context instanceof ServerMusicActivity)) {
            host = new WeakReference<>((Activity) context);
        }
        context.startActivity(intent);
    }

    @SuppressWarnings("deprecation")
    @Override protected void onCreate(Bundle state) {
        setTheme(android.R.style.Theme_Material_NoActionBar);
        super.onCreate(state);
        catalog = ServerIndex.catalog();
        headerTone = SpotifyStyle.surface();
        getWindow().setStatusBarColor(Color.TRANSPARENT);
        getWindow().setNavigationBarColor(SpotifyStyle.background());
        getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_STABLE | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN);

        FrameLayout root = new FrameLayout(this);
        root.setBackgroundColor(SpotifyStyle.background());
        list = new ListView(this);
        list.setDivider(null);
        list.setSelector(android.R.color.transparent);
        list.setClipToPadding(false);
        list.setAdapter(adapter);
        list.setOnItemClickListener((parent, view, position, id) -> open(items.get(position)));
        list.setOnScrollListener(new AbsListView.OnScrollListener() {
            @Override public void onScrollStateChanged(AbsListView view, int state) {}
            @Override public void onScroll(AbsListView view, int first, int visible, int total) { updateBar(); }
        });
        root.addView(list, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        bar = new FrameLayout(this);
        View back = SpotifyStyle.backButton(this);
        back.setOnClickListener(view -> { if (!backToList()) finish(); });
        FrameLayout.LayoutParams backParams = new FrameLayout.LayoutParams(dp(48), dp(48), Gravity.START | Gravity.BOTTOM);
        backParams.setMargins(dp(4), 0, 0, dp(4));
        bar.addView(back, backParams);
        barTitle = SpotifyStyle.text(this, "", 16, Color.WHITE, SpotifyStyle.Font.BOLD);
        barTitle.setSingleLine(true);
        barTitle.setEllipsize(TextUtils.TruncateAt.END);
        barTitle.setGravity(Gravity.CENTER_VERTICAL);
        FrameLayout.LayoutParams titleParams = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, dp(56), Gravity.CENTER_HORIZONTAL | Gravity.BOTTOM);
        titleParams.setMargins(dp(64), 0, dp(64), 0);
        bar.addView(barTitle, titleParams);
        search = searchField();
        FrameLayout.LayoutParams searchParams = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(40), Gravity.BOTTOM);
        searchParams.setMargins(dp(56), 0, dp(16), dp(8));
        bar.addView(search, searchParams);
        root.addView(bar, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP));

        snackbar = SpotifyStyle.text(this, "", 14, Color.BLACK, SpotifyStyle.Font.BOLD);
        GradientDrawable snack = new GradientDrawable();
        snack.setColor(Color.WHITE);
        snack.setCornerRadius(dp(8));
        snackbar.setBackground(snack);
        snackbar.setPadding(dp(16), dp(14), dp(16), dp(14));
        snackbar.setVisibility(View.GONE);
        snackbar.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        FrameLayout.LayoutParams snackParams = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM);
        snackParams.setMargins(dp(8), 0, dp(8), dp(16));
        root.addView(snackbar, snackParams);

        root.setOnApplyWindowInsetsListener((view, insets) -> {
            int top = insets.getSystemWindowInsetTop();
            if (top != topInset) {
                topInset = top;
                headerKey = null;
            }
            bar.setPadding(insets.getSystemWindowInsetLeft(), topInset, insets.getSystemWindowInsetRight(), 0);
            list.setPadding(insets.getSystemWindowInsetLeft(), 0, insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom() + dp(24));
            ((FrameLayout.LayoutParams) snackbar.getLayoutParams()).bottomMargin = insets.getSystemWindowInsetBottom() + dp(16);
            adapter.notifyDataSetChanged();
            return insets.consumeSystemWindowInsets();
        });
        setContentView(root);
        if (Build.VERSION.SDK_INT >= 33) backCallback = Api33.register(this);
        if (state == null) {
            pendingAlbum = getIntent().getStringExtra(EXTRA_ALBUM);
            pendingArtist = getIntent().getStringExtra(EXTRA_ARTIST);
            pendingPlay = getIntent().getBooleanExtra(EXTRA_PLAY, false);
            openPending();
        }
        render();
    }

    private EditText searchField() {
        EditText field = new EditText(this);
        field.setSingleLine(true);
        field.setHint("What do you want to listen to?");
        field.setInputType(InputType.TYPE_CLASS_TEXT);
        SpotifyStyle.style(field);
        field.setTextSize(15);
        field.setTypeface(SpotifyStyle.font(this, SpotifyStyle.Font.REGULAR));
        Drawable magnifier = SpotifyStyle.icon(this, "encore_icon_search_16");
        if (magnifier != null) {
            field.setCompoundDrawablesRelativeWithIntrinsicBounds(magnifier, null, null, null);
            field.setCompoundDrawablePadding(dp(8));
        }
        field.setVisibility(View.GONE);
        field.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence value, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence value, int start, int before, int count) {
                String next = value.toString().trim();
                if (next.equals(query)) return;
                query = next;
                if (page == Page.SEARCH) render();
            }
            @Override public void afterTextChanged(Editable value) {}
        });
        return field;
    }

    @Override protected void onResume() {
        super.onResume();
        handler.post(refresh);
        if (nowPlaying == null) nowPlaying = new NowPlayingWatcher(this, (title, album) -> {
            if (TextUtils.equals(title, playingTitle) && TextUtils.equals(album, playingAlbum)) return;
            playingTitle = title;
            playingAlbum = album;
            adapter.notifyDataSetChanged();
        });
        nowPlaying.start();
        Activity spotify = host.get();
        if (Build.VERSION.SDK_INT >= 30 && spotify != null && !spotify.isDestroyed()) {
            observedHost = spotify.getWindow().getDecorView();
            observedHost.getViewTreeObserver().addOnGlobalLayoutListener(hostLayout);
        }
        fitAboveSpotifyBars();
    }

    @Override protected void onPause() {
        handler.removeCallbacks(refresh);
        if (nowPlaying != null) nowPlaying.stop();
        if (observedHost != null) {
            observedHost.getViewTreeObserver().removeOnGlobalLayoutListener(hostLayout);
            observedHost = null;
        }
        super.onPause();
    }

    @Override protected void onDestroy() {
        handler.removeCallbacks(hideSnackbar);
        if (Build.VERSION.SDK_INT >= 33 && backCallback != null) Api33.unregister(this, backCallback);
        super.onDestroy();
    }

    /**
     * Ends this window above Spotify's mini player and tab bar in the screen that opened it, so both stay
     * visible and usable; runs again whenever that screen lays out, for example when the mini player
     * appears. Uses the full screen when those bars or that screen are gone.
     */
    private void fitAboveSpotifyBars() {
        if (Build.VERSION.SDK_INT < 30) return;
        Activity spotify = host.get();
        int bottom = 0;
        tabBarTop = 0;
        if (spotify != null && !spotify.isFinishing() && !spotify.isDestroyed()) {
            int[] origin = new int[2];
            spotify.getWindow().getDecorView().getLocationOnScreen(origin);
            int miniPlayer = barTop(spotify, "now_playing_view_container");
            tabBarTop = barTop(spotify, "navigation_bar");
            bottom = (miniPlayer > 0 ? miniPlayer : tabBarTop) - origin[1];
            if (tabBarTop > 0) tabBarTop -= origin[1];
        }
        int height = bottom > 0 ? bottom : WindowManager.LayoutParams.MATCH_PARENT;
        if (height == windowHeight) return;
        windowHeight = height;
        WindowManager.LayoutParams attributes = getWindow().getAttributes();
        int watchOutside = WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL | WindowManager.LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH;
        if (bottom > 0) {
            setTranslucent(true);
            getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            attributes.flags |= watchOutside;
        } else {
            attributes.flags &= ~watchOutside;
        }
        attributes.height = height;
        attributes.gravity = Gravity.TOP;
        getWindow().setAttributes(attributes);
    }

    /** The screen position of the top of one of Spotify's bars, or 0 when it is not showing. */
    private static int barTop(Activity spotify, String name) {
        int id = spotify.getResources().getIdentifier(name, "id", spotify.getPackageName());
        View bar = id == 0 ? null : spotify.getWindow().getDecorView().findViewById(id);
        if (bar == null || !bar.isShown() || bar.getHeight() == 0) return 0;
        int[] location = new int[2];
        bar.getLocationOnScreen(location);
        return location[1];
    }

    /** A touch on Spotify's tab bar leaves this page; the mini player opens Now Playing on top of it. */
    @Override public boolean onTouchEvent(MotionEvent event) {
        if (event.getAction() == MotionEvent.ACTION_OUTSIDE && tabBarTop > 0 && (event.getRawY() <= 0 || event.getRawY() >= tabBarTop)) {
            finish();
            overridePendingTransition(0, 0);
            return false;
        }
        return super.onTouchEvent(event);
    }

    /** Opens the album or artist this screen was started for once the catalog has it; true when it did. */
    private boolean openPending() {
        if (pendingAlbum == null && pendingArtist == null) return false;
        if (catalog.trackCount() == 0) return false;
        if (pendingAlbum != null && catalog.album(pendingAlbum) != null) {
            show(Page.ALBUM, pendingAlbum, SpotifyStyle.surface());
            if (pendingPlay) play(catalog.album(pendingAlbum).tracks, 0);
        } else if (pendingArtist != null && catalog.artist(pendingArtist) != null) {
            show(Page.ARTIST, pendingArtist, SpotifyStyle.surface());
        } else {
            showNotice(pendingAlbum != null ? "This album is not in the current scan." : "This artist is not in the current scan.");
        }
        pendingAlbum = pendingArtist = null;
        return true;
    }

    private void show(Page next, String id, int tone) {
        page = next;
        selectedId = id;
        headerTone = tone;
        headerKey = null;
    }

    private void render() {
        items.clear();
        switch (page) {
            case ALBUM: renderAlbum(); break;
            case ARTIST: renderArtist(); break;
            default: renderBrowse(); break;
        }
        search.setVisibility(page == Page.SEARCH ? View.VISIBLE : View.GONE);
        adapter.notifyDataSetChanged();
        updateBar();
    }

    private void renderBrowse() {
        items.add(new Item(Kind.BROWSE_HEADER, null, providerName(), null, null));
        if (catalog.trackCount() == 0) {
            String waiting = pendingAlbum != null || pendingArtist != null ? "Loading the server library…" : "No server tracks are ready.";
            items.add(new Item(Kind.MESSAGE, null, waiting, "Scan status: " + ServerIndex.status()
                    + "\nReturn to Spicetify settings to scan a library.", null));
            return;
        }
        switch (page) {
            case ARTISTS:
                for (MusicCatalog.Artist artist : catalog.allArtists()) items.add(new Item(Kind.ARTIST, artist.id, artist.name, "Artist", null));
                break;
            case SONGS:
                for (MusicCatalog.Track track : catalog.allTracks()) items.add(new Item(Kind.SONG, track.id, track.title, null, null));
                break;
            case SEARCH:
                if (query.isEmpty()) {
                    items.add(new Item(Kind.MESSAGE, null, "Search your server", "Find albums, artists and songs.", null));
                    break;
                }
                MusicCatalog.SearchResults results = catalog.search(query, SEARCH_LIMIT);
                for (MusicCatalog.Artist artist : results.artists) items.add(new Item(Kind.ARTIST, artist.id, artist.name, "Artist", null));
                for (MusicCatalog.Album album : results.albums) items.add(new Item(Kind.ALBUM, album.id, album.title, "Album • " + album.artist, null));
                for (MusicCatalog.Track track : results.tracks) items.add(new Item(Kind.SONG, track.id, track.title, null, null));
                if (items.size() == 1) items.add(new Item(Kind.MESSAGE, null, "No results found for “" + query + "”",
                        "Check the spelling, or search for something else.", null));
                break;
            default:
                for (MusicCatalog.Album album : catalog.allAlbums()) items.add(new Item(Kind.ALBUM, album.id, album.title, "Album • " + album.artist, null));
                break;
        }
    }

    private void renderAlbum() {
        MusicCatalog.Album album = catalog.album(selectedId);
        if (album == null) { show(browsePage, null, SpotifyStyle.surface()); renderBrowse(); return; }
        items.add(new Item(Kind.ALBUM_HEADER, album.id, album.title, album.artist, null));
        int seconds = 0;
        for (MusicCatalog.Track track : album.tracks) {
            items.add(new Item(Kind.TRACK, track.id, track.title, track.artist, null));
            seconds += track.durationSeconds;
        }
        items.add(new Item(Kind.MESSAGE, null, null, songs(album.tracks.size()) + " • " + duration(seconds), null));
    }

    private void renderArtist() {
        MusicCatalog.Artist artist = catalog.artist(selectedId);
        if (artist == null) { show(browsePage, null, SpotifyStyle.surface()); renderBrowse(); return; }
        items.add(new Item(Kind.ARTIST_HEADER, artist.id, artist.name, null, null));
        if (!artist.albumIds.isEmpty()) {
            items.add(new Item(Kind.SECTION, null, "Albums", null, null));
            for (String id : artist.albumIds) {
                MusicCatalog.Album album = catalog.album(id);
                if (album != null) items.add(new Item(Kind.ALBUM, album.id, album.title, "Album • " + songs(album.tracks.size()), null));
            }
        }
        if (!artist.otherTrackIds.isEmpty()) {
            items.add(new Item(Kind.SECTION, null, "Appears on", null, null));
            for (String id : artist.otherTrackIds) {
                MusicCatalog.Track track = catalog.track(id);
                if (track != null) items.add(new Item(Kind.SONG, track.id, track.title, null, null));
            }
        }
    }

    static String songs(int count) {
        return count == 1 ? "1 song" : count + " songs";
    }

    static String duration(int seconds) {
        int minutes = seconds / 60;
        return minutes >= 60 ? (minutes / 60) + " hr " + (minutes % 60) + " min" : minutes + " min " + (seconds % 60) + " sec";
    }

    private void open(Item item) {
        switch (item.kind) {
            case ALBUM: navigate(Page.ALBUM, item.id); break;
            case ARTIST: navigate(Page.ARTIST, item.id); break;
            case TRACK: {
                MusicCatalog.Album album = catalog.album(selectedId);
                if (album != null) play(album.tracks, indexOf(album.tracks, item.id));
                break;
            }
            case SONG: {
                MusicCatalog.Album album = catalog.albumOf(item.id);
                if (album != null) play(album.tracks, indexOf(album.tracks, item.id));
                break;
            }
            default: break;
        }
    }

    private void navigate(Page next, String id) {
        history.push(new NavState(page, selectedId, headerTone));
        show(next, id, SpotifyStyle.surface());
        render();
        list.setSelection(0);
    }

    private boolean backToList() {
        if (history.isEmpty()) return false;
        NavState previous = history.pop();
        show(previous.page, previous.id, previous.tone);
        render();
        return true;
    }

    private void selectTab(Page tab) {
        browsePage = tab;
        history.clear();
        show(tab, null, SpotifyStyle.surface());
        render();
        if (tab == Page.SEARCH) search.requestFocus();
    }

    private static int indexOf(List<MusicCatalog.Track> tracks, String id) {
        for (int i = 0; i < tracks.size(); i++) if (tracks.get(i).id.equals(id)) return i;
        return -1;
    }

    private void play(List<MusicCatalog.Track> tracks, int index) {
        String error = ServerPlayback.play(tracks, index, this::showNotice);
        if (error != null) showNotice(error);
    }

    private void showNotice(String message) {
        snackbar.setText(message);
        snackbar.setVisibility(View.VISIBLE);
        handler.removeCallbacks(hideSnackbar);
        handler.postDelayed(hideSnackbar, 5000);
    }

    /** The bar fills with the header colour and shows the page title once the header scrolls away. */
    private void updateBar() {
        if (bar == null) return;
        boolean detail = page == Page.ALBUM || page == Page.ARTIST;
        View first = list.getChildAt(0);
        float progress = 1;
        if (page != Page.SEARCH && list.getFirstVisiblePosition() == 0 && first != null && first.getHeight() > 0)
            progress = Math.min(1, Math.max(0, -first.getTop() / (float) Math.max(1, first.getHeight() - dp(120))));
        bar.setBackgroundColor(blend(detail ? headerTone : SpotifyStyle.background(), progress));
        String title = page == Page.SEARCH || items.isEmpty() ? "" : items.get(0).title;
        if (!TextUtils.equals(barTitle.getText(), title)) barTitle.setText(title);
        barTitle.setAlpha(progress);
    }

    private static int blend(int color, float alpha) {
        return Color.argb(Math.round(255 * alpha), Color.red(color), Color.green(color), Color.blue(color));
    }

    @SuppressLint("GestureBackNavigation")
    @Override public void onBackPressed() {
        if (!backToList()) super.onBackPressed();
    }

    private int dp(int value) { return SpotifyStyle.dp(this, value); }

    @TargetApi(33)
    private static final class Api33 {
        static Object register(ServerMusicActivity activity) {
            OnBackInvokedCallback callback = () -> { if (!activity.backToList()) activity.finish(); };
            activity.getOnBackInvokedDispatcher().registerOnBackInvokedCallback(OnBackInvokedDispatcher.PRIORITY_DEFAULT, callback);
            return callback;
        }
        static void unregister(ServerMusicActivity activity, Object callback) {
            activity.getOnBackInvokedDispatcher().unregisterOnBackInvokedCallback((OnBackInvokedCallback) callback);
        }
    }

    private final class Adapter extends BaseAdapter {
        @Override public int getCount() { return items.size(); }
        @Override public Object getItem(int position) { return items.get(position); }
        @Override public long getItemId(int position) { return position; }
        @Override public int getViewTypeCount() { return Kind.values().length; }
        @Override public int getItemViewType(int position) { return items.get(position).kind.ordinal(); }
        @Override public boolean isEnabled(int position) {
            Kind kind = items.get(position).kind;
            return kind == Kind.ALBUM || kind == Kind.ARTIST || kind == Kind.SONG || kind == Kind.TRACK;
        }

        @Override public View getView(int position, View reusable, ViewGroup parent) {
            Item item = items.get(position);
            switch (item.kind) {
                case BROWSE_HEADER:
                case ALBUM_HEADER:
                case ARTIST_HEADER: return header(item);
                case SECTION: return section(item);
                case MESSAGE: return message(item);
                default: return row(item, reusable);
            }
        }
    }

    /** The page header, built once per page so scrolling and relayouts reuse it. */
    private View header(Item item) {
        String key = page + "|" + selectedId + "|" + topInset + "|" + catalog.hashCode();
        if (header != null && key.equals(headerKey)) return header;
        headerKey = key;
        header = item.kind == Kind.ALBUM_HEADER ? albumHeader(item) : item.kind == Kind.ARTIST_HEADER ? artistHeader(item) : browseHeader(item);
        return header;
    }

    private View browseHeader(Item item) {
        LinearLayout header = SpotifyStyle.column(this);
        header.setPadding(0, topInset + dp(page == Page.SEARCH ? 64 : 56), 0, dp(8));
        if (page != Page.SEARCH) {
            TextView title = SpotifyStyle.text(this, item.title, 28, Color.WHITE, SpotifyStyle.Font.TITLE);
            SpotifyStyle.heading(title);
            title.setPadding(dp(16), 0, dp(16), dp(12));
            header.addView(title);
        }
        HorizontalScrollView scroller = new HorizontalScrollView(this);
        scroller.setHorizontalScrollBarEnabled(false);
        LinearLayout chips = new LinearLayout(this);
        chips.setPadding(dp(16), 0, dp(16), 0);
        for (Page tab : new Page[] {Page.ALBUMS, Page.ARTISTS, Page.SONGS, Page.SEARCH}) chips.addView(chip(tab), chipParams());
        scroller.addView(chips);
        header.addView(scroller);
        return header;
    }

    private String providerName() {
        return ServerConfig.snapshot().provider() == ServerConfig.Provider.JELLYFIN ? "Jellyfin" : "Server music";
    }

    private TextView chip(Page tab) {
        boolean selected = page == tab;
        String label = tab == Page.ALBUMS ? "Albums" : tab == Page.ARTISTS ? "Artists" : tab == Page.SONGS ? "Songs" : "Search";
        TextView chip = SpotifyStyle.text(this, label, 14, selected ? SpotifyStyle.onColor(SpotifyStyle.accent()) : Color.WHITE, SpotifyStyle.Font.REGULAR);
        chip.setGravity(Gravity.CENTER);
        chip.setPadding(dp(16), 0, dp(16), 0);
        GradientDrawable pill = new GradientDrawable();
        pill.setColor(selected ? SpotifyStyle.accent() : SpotifyStyle.elevated());
        pill.setCornerRadius(dp(16));
        chip.setBackground(pill);
        chip.setClickable(true);
        chip.setFocusable(true);
        chip.setSelected(selected);
        if (Build.VERSION.SDK_INT >= 30) chip.setStateDescription(selected ? "Selected" : "Not selected");
        chip.setOnClickListener(view -> selectTab(tab));
        return chip;
    }

    private LinearLayout.LayoutParams chipParams() {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, dp(32));
        params.setMarginEnd(dp(8));
        return params;
    }

    private View albumHeader(Item item) {
        LinearLayout header = SpotifyStyle.column(this);
        header.setPadding(0, topInset + dp(56), 0, 0);
        header.setBackground(gradient(headerTone));
        int size = Math.round(getResources().getDisplayMetrics().widthPixels * 0.62f);
        ImageView cover = new ImageView(this);
        cover.setScaleType(ImageView.ScaleType.CENTER_CROP);
        cover.setBackgroundColor(SpotifyStyle.elevated());
        cover.setElevation(dp(16));
        cover.setContentDescription(item.title + " cover");
        LinearLayout.LayoutParams coverParams = new LinearLayout.LayoutParams(size, size);
        coverParams.gravity = Gravity.CENTER_HORIZONTAL;
        coverParams.bottomMargin = dp(24);
        header.addView(cover, coverParams);
        MusicCatalog.Album album = catalog.album(item.id);
        loadWithTone(cover, ServerArtwork.album(album, size), size, header);

        TextView title = SpotifyStyle.text(this, item.title, 24, Color.WHITE, SpotifyStyle.Font.TITLE);
        SpotifyStyle.heading(title);
        title.setPadding(dp(16), 0, dp(16), dp(8));
        header.addView(title);

        MusicCatalog.Artist artist = album == null ? null : findArtist(album.artist);
        LinearLayout byline = new LinearLayout(this);
        byline.setGravity(Gravity.CENTER_VERTICAL);
        byline.setPadding(dp(16), dp(4), dp(16), dp(4));
        ImageView avatar = circle(new ImageView(this));
        avatar.setBackgroundColor(SpotifyStyle.elevated());
        avatar.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        byline.addView(avatar, new LinearLayout.LayoutParams(dp(24), dp(24)));
        ArtworkLoader.into(avatar, ServerArtwork.artist(artist, dp(24)), dp(24), placeholder("encore_icon_artist_16"));
        TextView name = SpotifyStyle.text(this, item.subtitle, 14, Color.WHITE, SpotifyStyle.Font.BOLD);
        name.setPadding(dp(8), 0, 0, 0);
        byline.addView(name);
        if (artist != null) {
            byline.setBackground(SpotifyStyle.selectable(this, false));
            byline.setOnClickListener(view -> navigate(Page.ARTIST, artist.id));
        }
        header.addView(byline);
        String kind = album != null && album.year > 0 ? "Album • " + album.year : "Album";
        TextView meta = SpotifyStyle.text(this, kind, 13, SpotifyStyle.SUBDUED, SpotifyStyle.Font.REGULAR);
        meta.setPadding(dp(16), dp(4), dp(16), 0);
        header.addView(meta);
        header.addView(actions(album == null ? Collections.emptyList() : album.tracks));
        return header;
    }

    private View artistHeader(Item item) {
        LinearLayout header = SpotifyStyle.column(this);
        header.setBackground(gradient(headerTone));
        FrameLayout hero = new FrameLayout(this);
        ImageView image = new ImageView(this);
        image.setScaleType(ImageView.ScaleType.CENTER_CROP);
        image.setBackgroundColor(SpotifyStyle.elevated());
        image.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        int height = topInset + dp(280);
        hero.addView(image, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, height));
        View shade = new View(this);
        shade.setBackground(new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[] {0x00000000, 0x99000000}));
        hero.addView(shade, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, height));
        TextView name = SpotifyStyle.text(this, item.title, 40, Color.WHITE, SpotifyStyle.Font.TITLE);
        SpotifyStyle.heading(name);
        name.setMaxLines(2);
        name.setEllipsize(TextUtils.TruncateAt.END);
        FrameLayout.LayoutParams nameParams = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM);
        nameParams.setMargins(dp(16), 0, dp(16), dp(16));
        hero.addView(name, nameParams);
        header.addView(hero);
        int width = getResources().getDisplayMetrics().widthPixels;
        MusicCatalog.Artist artist = catalog.artist(item.id);
        loadWithTone(image, ServerArtwork.artist(artist, width), width, header);
        header.addView(actions(artistTracks(artist)));
        return header;
    }

    /** The artist's albums in order, then the songs they appear on. */
    private List<MusicCatalog.Track> artistTracks(MusicCatalog.Artist artist) {
        List<MusicCatalog.Track> tracks = new ArrayList<>();
        if (artist == null) return tracks;
        for (String id : artist.albumIds) {
            MusicCatalog.Album album = catalog.album(id);
            if (album != null) tracks.addAll(album.tracks);
        }
        for (String id : artist.otherTrackIds) {
            MusicCatalog.Track track = catalog.track(id);
            if (track != null) tracks.add(track);
        }
        return tracks;
    }

    private MusicCatalog.Artist findArtist(String name) {
        for (MusicCatalog.Artist artist : catalog.allArtists()) if (artist.name.equals(name)) return artist;
        return null;
    }

    /** Shuffle and the round play button, right-aligned as on Spotify's album and artist pages. */
    private View actions(List<MusicCatalog.Track> tracks) {
        LinearLayout row = new LinearLayout(this);
        row.setGravity(Gravity.CENTER_VERTICAL | Gravity.END);
        row.setPadding(dp(16), dp(8), dp(16), dp(8));
        ImageView shuffle = iconButton("encore_icon_shuffle_24", "Shuffle play", SpotifyStyle.SUBDUED);
        shuffle.setBackground(SpotifyStyle.selectable(this, true));
        shuffle.setOnClickListener(view -> {
            List<MusicCatalog.Track> shuffled = new ArrayList<>(tracks);
            Collections.shuffle(shuffled);
            if (!shuffled.isEmpty()) play(shuffled, 0);
        });
        LinearLayout.LayoutParams shuffleParams = new LinearLayout.LayoutParams(dp(48), dp(48));
        shuffleParams.setMarginEnd(dp(12));
        row.addView(shuffle, shuffleParams);
        ImageView playButton = iconButton("encore_icon_play_24", "Play", SpotifyStyle.onColor(SpotifyStyle.accent()));
        GradientDrawable circle = new GradientDrawable();
        circle.setShape(GradientDrawable.OVAL);
        circle.setColor(SpotifyStyle.accent());
        playButton.setBackground(circle);
        playButton.setOnClickListener(view -> { if (!tracks.isEmpty()) play(tracks, 0); });
        row.addView(playButton, new LinearLayout.LayoutParams(dp(56), dp(56)));
        return row;
    }

    private ImageView iconButton(String icon, String description, int tint) {
        ImageView button = new ImageView(this);
        Drawable drawable = SpotifyStyle.icon(this, icon);
        if (drawable != null) drawable.setTint(tint);
        button.setImageDrawable(drawable);
        button.setScaleType(ImageView.ScaleType.CENTER);
        button.setContentDescription(description);
        button.setClickable(true);
        button.setFocusable(true);
        return button;
    }

    private View section(Item item) {
        TextView title = SpotifyStyle.text(this, item.title, 20, Color.WHITE, SpotifyStyle.Font.TITLE);
        SpotifyStyle.heading(title);
        title.setPadding(dp(16), dp(24), dp(16), dp(8));
        return title;
    }

    private View message(Item item) {
        LinearLayout column = SpotifyStyle.column(this);
        column.setPadding(dp(16), dp(24), dp(16), dp(24));
        if (item.title != null) {
            TextView title = SpotifyStyle.text(this, item.title, 18, Color.WHITE, SpotifyStyle.Font.BOLD);
            title.setGravity(Gravity.CENTER);
            column.addView(title, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }
        if (item.subtitle != null) {
            TextView detail = SpotifyStyle.text(this, item.subtitle, 14, SpotifyStyle.SUBDUED, SpotifyStyle.Font.REGULAR);
            detail.setGravity(item.title == null ? Gravity.START : Gravity.CENTER);
            detail.setPadding(0, item.title == null ? 0 : dp(8), 0, 0);
            column.addView(detail, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }
        return column;
    }

    /** A list row: artwork (square for albums and songs, round for artists, none for album tracks), title and subtitle. */
    private View row(Item item, View reusable) {
        LinearLayout row;
        if (reusable instanceof LinearLayout && reusable.getTag() == item.kind) {
            row = (LinearLayout) reusable;
        } else {
            row = new LinearLayout(this);
            row.setTag(item.kind);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setMinimumHeight(dp(64));
            row.setPadding(dp(16), dp(8), dp(16), dp(8));
            row.setBackground(SpotifyStyle.selectable(this, false));
            ImageView image = new ImageView(this);
            image.setBackgroundColor(SpotifyStyle.elevated());
            image.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            if (item.kind == Kind.ARTIST) circle(image);
            LinearLayout.LayoutParams imageParams = new LinearLayout.LayoutParams(dp(56), dp(56));
            imageParams.setMarginEnd(dp(12));
            image.setVisibility(item.kind == Kind.TRACK ? View.GONE : View.VISIBLE);
            row.addView(image, imageParams);
            LinearLayout labels = SpotifyStyle.column(this);
            TextView title = SpotifyStyle.text(this, "", 16, Color.WHITE, SpotifyStyle.Font.REGULAR);
            title.setSingleLine(true);
            title.setEllipsize(TextUtils.TruncateAt.END);
            labels.addView(title);
            TextView subtitle = SpotifyStyle.text(this, "", 14, SpotifyStyle.SUBDUED, SpotifyStyle.Font.REGULAR);
            subtitle.setSingleLine(true);
            subtitle.setEllipsize(TextUtils.TruncateAt.END);
            subtitle.setPadding(0, dp(2), 0, 0);
            labels.addView(subtitle);
            row.addView(labels, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        }
        String subtitle = item.subtitle;
        String image = "";
        int size = dp(56);
        switch (item.kind) {
            case ALBUM: image = ServerArtwork.album(catalog.album(item.id), size); break;
            case ARTIST: image = ServerArtwork.artist(catalog.artist(item.id), size); break;
            case SONG: {
                MusicCatalog.Track track = catalog.track(item.id);
                subtitle = track == null ? "" : "Song • " + track.artist;
                image = ServerArtwork.album(catalog.albumOf(item.id), size);
                break;
            }
            default: break;
        }
        LinearLayout labels = (LinearLayout) row.getChildAt(1);
        TextView title = (TextView) labels.getChildAt(0);
        title.setText(item.title);
        title.setTextColor(isPlaying(item) ? SpotifyStyle.accent() : Color.WHITE);
        ((TextView) labels.getChildAt(1)).setText(subtitle);
        if (item.kind != Kind.TRACK) ArtworkLoader.into((ImageView) row.getChildAt(0), image, size,
                placeholder(item.kind == Kind.ARTIST ? "encore_icon_artist_24" : "encore_icon_album_24"));
        return row;
    }

    /** True for the song Spotify is playing, matched by the title and album its media session reports. */
    private boolean isPlaying(Item item) {
        if (playingTitle == null || (item.kind != Kind.TRACK && item.kind != Kind.SONG)) return false;
        MusicCatalog.Track track = catalog.track(item.id);
        return track != null && playingTitle.equals(track.title) && TextUtils.equals(playingAlbum, track.album);
    }

    private Drawable placeholder(String icon) {
        Drawable drawable = SpotifyStyle.icon(this, icon);
        if (drawable != null) drawable.setTint(SpotifyStyle.SUBDUED);
        return drawable;
    }

    private ImageView circle(ImageView image) {
        image.setOutlineProvider(new ViewOutlineProvider() {
            @Override public void getOutline(View view, Outline outline) { outline.setOval(0, 0, view.getWidth(), view.getHeight()); }
        });
        image.setClipToOutline(true);
        return image;
    }

    private GradientDrawable gradient(int tone) {
        return new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[] {tone, SpotifyStyle.background()});
    }

    /** Loads a header image and tints the header and bar with its colour, as Spotify does. */
    private void loadWithTone(ImageView view, String url, int size, View header) {
        view.setTag(url);
        if (url == null || url.isEmpty()) return;
        String owner = selectedId;
        ArtworkLoader.load(url, size, true, (bitmap, tone) -> {
            if (!url.equals(view.getTag())) return;
            view.setImageBitmap(bitmap);
            if (!TextUtils.equals(owner, selectedId) || tone == null) return;
            headerTone = tone;
            header.setBackground(gradient(headerTone));
            updateBar();
        });
    }
}
