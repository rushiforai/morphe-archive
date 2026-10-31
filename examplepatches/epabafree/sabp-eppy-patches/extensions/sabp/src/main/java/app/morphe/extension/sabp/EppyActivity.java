package app.morphe.extension.sabp;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.animation.PathInterpolator;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;

import app.morphe.extension.sabp.read.ReadAlong;
import app.morphe.extension.sabp.ui.EppyIcon;
import app.morphe.extension.sabp.ui.HomePage;
import app.morphe.extension.sabp.ui.Host;
import app.morphe.extension.sabp.ui.LibraryPage;
import app.morphe.extension.sabp.ui.PlayButton;
import app.morphe.extension.sabp.ui.PlayerPane;
import app.morphe.extension.sabp.ui.SettingsPage;
import app.morphe.extension.sabp.ui.Sheet;
import app.morphe.extension.sabp.ui.Ui;

/**
 * The Eppy UI: a Material 3 home, library and player for Smart AudioBook Player.
 *
 * <p>Layout adapts to the window width (not the device model):
 * compact (&lt;600dp) bottom navigation + floating mini-player + full-screen player;
 * medium (600–839dp) navigation rail + mini-player; expanded (≥840dp) navigation rail and a
 * persistent Now Playing pane beside the content (two-pane).
 */
public class EppyActivity extends Activity implements Host, EppyPlayer.Listener {
    public static final int TAB_HOME = 0, TAB_LIBRARY = 1, TAB_BOOKMARKS = 2, TAB_SETTINGS = 3;
    private static final int[] TAB_ICONS = {EppyIcon.HOME, EppyIcon.LIBRARY, EppyIcon.BOOKMARK, EppyIcon.SETTINGS};
    private static final String[] TAB_LABELS = {"Home", "Library", "Bookmarks", "Settings"};

    private final Handler handler = new Handler(Looper.getMainLooper());
    private EppyTheme theme;
    private EppyPlayer player;
    private int coverSeed;
    private Bitmap seedSource;

    private FrameLayout root;
    private FrameLayout pages;
    private HomePage home;
    private LibraryPage library;
    private SettingsPage settings;
    private PlayerPane sidePane;
    private PlayerPane overlayPane;
    private View miniPlayer;
    private PlayButton miniPlay;
    private TextView miniTitle, miniSub;
    private ImageView miniCover;
    private View miniProgress;
    private LinearLayout navContainer;
    private LinearLayout navBar;
    private LinearLayout dock;
    private LinearLayout frame;
    private final java.util.ArrayList<app.morphe.extension.sabp.ui.NavItem> navItems = new java.util.ArrayList<>();
    private boolean imeVisible;
    private int sysBottom, imeBottom;

    private int tab = TAB_HOME;
    private boolean playerOpen;
    private int widthClass;
    private String lastBook;
    private boolean lastHadSession;
    private Bitmap lastCover;
    private boolean visible;
    private Object backCallback;

    private final Runnable ticker = new Runnable() {
        @Override
        public void run() {
            if (!visible) return;
            tick();
            handler.postDelayed(this, playerOpen || sidePane != null ? 500 : 1000);
        }
    };

    // ---- lifecycle ------------------------------------------------------------------------

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        EppyDiag.ensure(this);
        EppySettings.migrate(this);
        // "Player interface: Classic SABP" was chosen: hand over to the classic player.
        if (EppyRoute.redirectToClassicIfChosen(this)) return;
        player = EppyPlayer.get(this);
        if (state == null) EppyRoute.handleSearch(this, getIntent());
        if (state != null) pendingSheetTab = state.getInt("sheetTab", -1);
        if (state != null) pendingSheetState = state.getInt("sheetState", 2);
        else pendingSheetTab = getIntent() != null ? getIntent().getIntExtra(EppyRoute.EXTRA_SHEET_TAB, -1) : -1;
        if (state != null) {
            tab = state.getInt("tab", TAB_HOME);
            playerOpen = state.getBoolean("playerOpen", false);
            java.util.ArrayList<String> keys = state.getStringArrayList("pages");
            if (keys != null) for (String k : keys) {
                int sep = k.indexOf('\u0001');
                String arg = sep >= 0 ? k.substring(sep + 1) : "";
                pageKeys.add(new String[]{sep >= 0 ? k.substring(0, sep) : k, arg.isEmpty() ? null : arg});
            }
        } else if (getIntent() != null && getIntent().getBooleanExtra("openPlayer", false)) {
            playerOpen = true;
        }
        Window w = getWindow();
        w.setDecorFitsSystemWindows(false);
        w.setStatusBarColor(Color.TRANSPARENT);
        w.setNavigationBarColor(Color.TRANSPARENT);
        w.setNavigationBarContrastEnforced(false);
        build();
        registerBack();
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
        if (intent == null) return;
        EppyDiag.log("route", "eppy reopened (openPlayer=" + intent.getBooleanExtra(EppyRoute.EXTRA_OPEN_PLAYER, false) + ")");
        EppyRoute.handleSearch(this, intent);
        if (intent.getBooleanExtra(EppyRoute.EXTRA_OPEN_PLAYER, false)) openPlayer();
        int tabExtra = intent.getIntExtra(EppyRoute.EXTRA_SHEET_TAB, -1);
        if (tabExtra >= 0) showPlayerSheet(tabExtra);
    }

    private int pendingSheetTab = -1;
    private int pendingSheetState = 2;

    // ---- page back stack ----------------------------------------------------------------------
    private final java.util.ArrayList<String[]> pageKeys = new java.util.ArrayList<>();
    private final java.util.ArrayList<app.morphe.extension.sabp.ui.Page> pageStack = new java.util.ArrayList<>();

    @Override
    public void pushPage(String key, String arg) {
        app.morphe.extension.sabp.ui.Page p = app.morphe.extension.sabp.ui.Pages.create(this, key, arg);
        if (p == null) return;
        if (playerOpen) closePlayer();
        pageKeys.add(new String[]{key, arg});
        attachPage(p, true);
        EppyDiag.log("nav", "open page " + key);
    }

    private void attachPage(app.morphe.extension.sabp.ui.Page p, boolean animate) {
        pageStack.add(p);
        pages.addView(p.root, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        p.setBottomInset(contentBottomInset());
        if (animate && !theme.reduceMotion) {
            p.root.setTranslationX(Ui.dp(this, 48));
            p.root.setAlpha(0f);
            p.root.animate().translationX(0).alpha(1f).setDuration(220).setInterpolator(new PathInterpolator(0.2f, 0f, 0f, 1f)).start();
        }
        p.root.requestFocus();
    }

    @Override
    public void popPage() {
        if (pageStack.isEmpty()) return;
        app.morphe.extension.sabp.ui.Page p = pageStack.remove(pageStack.size() - 1);
        pageKeys.remove(pageKeys.size() - 1);
        p.onRemoved();
        if (pageStack.isEmpty()) for (int i = 0; i < navItems.size(); i++) navItems.get(i).setSelected(i % TAB_LABELS.length == tab);
        final View v = p.root;
        if (theme.reduceMotion) pages.removeView(v);
        else v.animate().translationX(Ui.dp(this, 48)).alpha(0f).setDuration(160).withEndAction(() -> pages.removeView(v)).start();
    }

    private void clearPages() {
        for (app.morphe.extension.sabp.ui.Page p : pageStack) {
            p.onRemoved();
            pages.removeView(p.root);
        }
        pageStack.clear();
        pageKeys.clear();
        for (int i = 0; i < navItems.size(); i++) navItems.get(i).setSelected(i % TAB_LABELS.length == tab);
    }

    private int contentBottomInset() {
        return contentInset + Ui.dp(this, 16);
    }


    private void showPlayerSheet(int tabIndex) {
        if (sidePane != null) sidePane.showSheet(tabIndex);
        else {
            openPlayer();
            if (overlayPane != null) overlayPane.showSheet(tabIndex);
        }
    }

    @Override
    protected void onSaveInstanceState(Bundle out) {
        super.onSaveInstanceState(out);
        out.putInt("tab", tab);
        out.putBoolean("playerOpen", playerOpen);
        int sheetTab = overlayPane != null ? overlayPane.openSheetTab() : sidePane != null ? sidePane.openSheetTab() : -1;
        out.putInt("sheetTab", sheetTab);
        PlayerPane sp = overlayPane != null ? overlayPane : sidePane;
        out.putInt("sheetState", sp != null ? sp.sheetState() : 0);
        java.util.ArrayList<String> keys = new java.util.ArrayList<>();
        for (String[] k : pageKeys) keys.add(k[0] + "\u0001" + (k[1] != null ? k[1] : ""));
        out.putStringArrayList("pages", keys);
    }

    @Override
    protected void onStart() {
        super.onStart();
        visible = true;
        player.addListener(this);
        player.start();
        refreshAll(true);
        handler.removeCallbacks(ticker);
        handler.post(ticker);
    }

    @Override
    protected void onStop() {
        super.onStop();
        visible = false;
        handler.removeCallbacks(ticker);
        player.removeListener(this);
        player.stop();
    }

    @Override
    public void onConfigurationChanged(Configuration c) {
        super.onConfigurationChanged(c);
        build();
    }

    private void registerBack() {
        if (Build.VERSION.SDK_INT >= 34) {
            // Predictive back: while the gesture is in progress an open player sheet previews
            // its collapse; cancelling puts it back.
            android.window.OnBackAnimationCallback cb = new android.window.OnBackAnimationCallback() {
                @Override
                public void onBackInvoked() {
                    handleBack();
                }

                @Override
                public void onBackProgressed(android.window.BackEvent e) {
                    PlayerPane p = overlayPane != null ? overlayPane : sidePane;
                    if (p != null && p.sheetState() != app.morphe.extension.sabp.ui.PlayerSheet.COLLAPSED && Sheet.current == null) {
                        p.backProgress(e.getProgress());
                    }
                }

                @Override
                public void onBackCancelled() {
                    PlayerPane p = overlayPane != null ? overlayPane : sidePane;
                    if (p != null) p.backCancelled();
                }
            };
            getOnBackInvokedDispatcher().registerOnBackInvokedCallback(OnBackInvokedDispatcher.PRIORITY_DEFAULT, cb);
            backCallback = cb;
        } else if (Build.VERSION.SDK_INT >= 33) {
            OnBackInvokedCallback cb = this::handleBack;
            getOnBackInvokedDispatcher().registerOnBackInvokedCallback(OnBackInvokedDispatcher.PRIORITY_DEFAULT, cb);
            backCallback = cb;
        }
    }

    @Override
    @SuppressWarnings("deprecation")
    public void onBackPressed() {
        handleBack();
    }

    private void handleBack() {
        if (Sheet.current != null) {
            Sheet.current.dismiss();
            return;
        }
        if (overlayPane != null && overlayPane.onBack()) return;
        if (sidePane != null && sidePane.onBack()) return;
        if (playerOpen && overlayPane != null) {
            closePlayer();
            return;
        }
        if (!pageStack.isEmpty()) {
            if (!pageStack.get(pageStack.size() - 1).onBack()) popPage();
            return;
        }
        if (tab == TAB_HOME && home != null && home.onBack()) return;
        if (tab != TAB_HOME) {
            selectTab(TAB_HOME);
            return;
        }
        finish();
    }

    // ---- building -------------------------------------------------------------------------

    private int widthClass() {
        int w = getResources().getConfiguration().screenWidthDp;
        if (w >= 840) return 2;
        if (w >= 600) return 1;
        return 0;
    }

    private void build() {
        theme = EppyTheme.resolve(this, coverSeed);
        theme.activateFont();
        widthClass = widthClass();
        Sheet.current = null;

        root = new FrameLayout(this);
        root.setBackground(theme.background());
        getWindow().getDecorView().setBackgroundColor(theme.surface);

        LinearLayout frame = new LinearLayout(this);
        frame.setOrientation(LinearLayout.HORIZONTAL);
        root.addView(frame, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        this.frame = frame;

        navItems.clear();
        navBar = null;
        if (widthClass >= 1) {
            navContainer = navRail();
            frame.addView(navContainer, new LinearLayout.LayoutParams(Ui.dp(this, 88), ViewGroup.LayoutParams.MATCH_PARENT));
        }

        // Content area: the pages fill it; the dock (mini-player slot + bottom navigation) sits at
        // its bottom edge. Scrollable content gets a bottom inset equal to the dock's measured
        // height, so the last item always clears the mini-player and the navigation.
        FrameLayout contentArea = new FrameLayout(this);
        pages = new FrameLayout(this);
        contentArea.addView(pages, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        frame.addView(contentArea, Ui.lp(0, ViewGroup.LayoutParams.MATCH_PARENT, 1));

        home = new HomePage(this);
        library = new LibraryPage(this, home);
        settings = new SettingsPage(this);
        pages.addView(home.root);
        pages.addView(library.root);
        pages.addView(settings.root);

        sidePane = null;
        overlayPane = null;
        miniPlayer = null;
        dock = null;
        boolean floatingNav = widthClass == 0 && theme.navStyle != EppyTheme.NAV_BAR;
        if (widthClass == 2) {
            // Two-pane: persistent Now Playing on the right, no mini-player.
            sidePane = new PlayerPane(this, true);
            FrameLayout paneWrap = new FrameLayout(this);
            paneWrap.setBackground(Ui.rounded(theme.surfaceContainerLow, Ui.dp(this, 28)));
            Ui.clip(paneWrap, Ui.dp(this, 28));
            paneWrap.addView(sidePane.root);
            int paneW = Math.min(Ui.dp(this, 440), getResources().getDisplayMetrics().widthPixels * 42 / 100);
            LinearLayout.LayoutParams pl = new LinearLayout.LayoutParams(paneW, ViewGroup.LayoutParams.MATCH_PARENT);
            pl.setMargins(0, Ui.dp(this, 12), Ui.dp(this, 12), Ui.dp(this, 12));
            frame.addView(paneWrap, pl);
            sidePane.layoutCover(paneW);
            playerOpen = false;
        } else {
            dock = Ui.column(this);
            dock.setClipChildren(false);
            dock.setClipToPadding(false);
            miniPlayer = buildMiniPlayer();
            LinearLayout.LayoutParams ml = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Ui.dp(this, 64));
            int side = Ui.dp(this, 12);
            ml.setMargins(side, 0, side, Ui.dp(this, widthClass == 0 && !floatingNav ? 8 : 12));
            if (widthClass == 1) {
                ml.width = Math.min(Ui.dp(this, 560), getResources().getDisplayMetrics().widthPixels - Ui.dp(this, 112));
                ml.gravity = Gravity.END;
            }
            dock.addView(miniPlayer, ml);
            if (widthClass == 0) {
                if (floatingNav) {
                    navContainer = floatingNav();
                    LinearLayout.LayoutParams nl = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                    nl.gravity = Gravity.CENTER_HORIZONTAL;
                    nl.bottomMargin = Ui.dp(this, 14);
                    dock.addView(navContainer, nl);
                } else {
                    navContainer = bottomNav();
                    navBar = navContainer;
                    dock.addView(navContainer, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
                }
            }
            contentArea.addView(dock, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM));
            dock.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
                if (b - t != ob - ot) applyContentInset();
            });
        }

        root.setOnApplyWindowInsetsListener((v, insets) -> {
            android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
            android.graphics.Insets ime = insets.getInsets(WindowInsets.Type.ime());
            imeVisible = insets.isVisible(WindowInsets.Type.ime());
            sysBottom = bars.bottom;
            imeBottom = imeVisible ? ime.bottom : 0;
            v.setPadding(bars.left, bars.top, bars.right, 0);
            if (dock != null) {
                // The keyboard never covers a text field: the dock steps aside while it's open.
                dock.setVisibility(imeVisible ? View.GONE : View.VISIBLE);
                if (navBar != null) {
                    // The bar's colour runs under the gesture/3-button area; its items stay above it.
                    navBar.setPadding(0, 0, 0, bars.bottom);
                    dock.setPadding(0, 0, 0, 0);
                } else {
                    dock.setPadding(0, 0, 0, bars.bottom);
                }
            } else {
                frame.setPadding(0, 0, 0, Math.max(bars.bottom, imeBottom));
            }
            if (overlayPane != null) overlayPane.root.setPadding(0, 0, 0, Math.max(bars.bottom, imeBottom));
            applyContentInset();
            return WindowInsets.CONSUMED;
        });

        setContentView(root);
        applySystemBars();
        showTab(tab == TAB_BOOKMARKS ? TAB_HOME : tab);
        pageStack.clear();
        java.util.ArrayList<String[]> keys = new java.util.ArrayList<>(pageKeys);
        pageKeys.clear();
        for (String[] k : keys) {
            app.morphe.extension.sabp.ui.Page p = app.morphe.extension.sabp.ui.Pages.create(this, k[0], k[1]);
            if (p == null) continue;
            pageKeys.add(k);
            attachPage(p, false);
        }
        root.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
            int contentW = pages.getWidth();
            if (contentW > 0) library.setWidth(contentW);
        });
        if (playerOpen && widthClass < 2) {
            playerOpen = false;
            openPlayer(false);
        }
        refreshAll(true);
        if (pendingSheetTab >= 0) {
            final int tabToOpen = pendingSheetTab;
            final int stateToOpen = pendingSheetState;
            pendingSheetTab = -1;
            pendingSheetState = 2;
            root.post(() -> {
                showPlayerSheet(tabToOpen);
                PlayerPane p = overlayPane != null ? overlayPane : sidePane;
                if (p != null && stateToOpen == app.morphe.extension.sabp.ui.PlayerSheet.HALF) p.restoreSheet(tabToOpen, stateToOpen);
            });
        }
    }

    private void applySystemBars() {
        WindowInsetsController c = getWindow().getInsetsController();
        if (c == null) return;
        int light = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
        c.setSystemBarsAppearance(theme.dark ? 0 : light, light);
    }

    /** Material 3 navigation bar: indicator behind the selected icon, labels always shown. */
    private LinearLayout bottomNav() {
        LinearLayout bar = Ui.row(this);
        bar.setBackgroundColor(theme.surfaceContainer);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        for (int i = 0; i < TAB_LABELS.length; i++) {
            app.morphe.extension.sabp.ui.NavItem item = navItem(i, app.morphe.extension.sabp.ui.NavItem.STYLE_BAR);
            bar.addView(item, Ui.lp(0, Ui.dp(this, 80), 1));
        }
        return bar;
    }

    /** Material 3 navigation rail for medium and expanded windows. */
    private LinearLayout navRail() {
        LinearLayout rail = Ui.column(this);
        rail.setGravity(Gravity.CENTER_HORIZONTAL);
        rail.setBackgroundColor(theme.surface);
        rail.setPadding(0, Ui.dp(this, 16), 0, Ui.dp(this, 16));
        // Rail FAB: jump to the player.
        android.widget.FrameLayout fab = Ui.iconButton(this, theme, EppyIcon.HEADPHONES, theme.onPrimaryContainer, theme.primaryContainer,
                "Now playing", v -> openPlayer());
        fab.setBackground(Ui.ripple(theme, Ui.rounded(theme.primaryContainer, Ui.dp(this, 16)), Ui.dp(this, 16)));
        LinearLayout.LayoutParams fl = new LinearLayout.LayoutParams(Ui.dp(this, 56), Ui.dp(this, 56));
        fl.bottomMargin = Ui.dp(this, 28);
        rail.addView(fab, fl);
        for (int i = 0; i < TAB_LABELS.length; i++) {
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(Ui.dp(this, 80), ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.bottomMargin = Ui.dp(this, 12);
            rail.addView(navItem(i, app.morphe.extension.sabp.ui.NavItem.STYLE_RAIL), lp);
        }
        return rail;
    }

    private app.morphe.extension.sabp.ui.NavItem navItem(int index, int style) {
        app.morphe.extension.sabp.ui.NavItem item = new app.morphe.extension.sabp.ui.NavItem(this, theme, TAB_ICONS[index], TAB_LABELS[index], style);
        item.setSelected(index == tab);
        item.setOnClickListener(v -> {
            Ui.haptic(v, theme);
            selectTab(index);
        });
        navItems.add(item);
        return item;
    }

    /** Floating capsule navigation (Ember, Lavender, Mono reference designs). */
    private LinearLayout floatingNav() {
        LinearLayout bar = Ui.row(this);
        bar.setGravity(Gravity.CENTER);
        bar.setPadding(Ui.dp(this, 8), Ui.dp(this, 8), Ui.dp(this, 8), Ui.dp(this, 8));
        float r = Ui.dp(this, theme.navStyle == EppyTheme.NAV_PILL_DARK ? 34 : 24);
        bar.setBackground(Ui.rounded(theme.navBg, r));
        bar.setElevation(Ui.dp(this, 10));
        for (int i = 0; i < TAB_LABELS.length; i++) {
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(Ui.dp(this, 56), Ui.dp(this, 52));
            lp.leftMargin = Ui.dp(this, 2);
            lp.rightMargin = Ui.dp(this, 2);
            bar.addView(navItem(i, app.morphe.extension.sabp.ui.NavItem.STYLE_PILL), lp);
        }
        return bar;
    }

    /** Bottom inset for scrollable content: the dock's real height, or the keyboard's. */
    private void applyContentInset() {
        if (home == null) return;
        int inset;
        if (imeVisible) inset = imeBottom;
        else if (dock != null && dock.getVisibility() == View.VISIBLE) {
            int h = 0;
            for (int i = 0; i < dock.getChildCount(); i++) {
                View ch = dock.getChildAt(i);
                if (ch.getVisibility() == View.GONE) continue;
                ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) ch.getLayoutParams();
                h += ch.getHeight() + lp.topMargin + lp.bottomMargin;
            }
            inset = h + dock.getPaddingBottom();
        } else inset = 0;
        int pad = inset + Ui.dp(this, 16);
        setScrollInset(home.root, pad);
        setScrollInset(library.scroll, pad);
        setScrollInset(settings.root, pad);
        for (app.morphe.extension.sabp.ui.Page p : pageStack) p.setBottomInset(pad);
        contentInset = inset;
    }

    private int contentInset;

    private static void setScrollInset(ViewGroup scroll, int px) {
        if (scroll.getPaddingBottom() == px) return;
        scroll.setClipToPadding(false);
        scroll.setPadding(scroll.getPaddingLeft(), scroll.getPaddingTop(), scroll.getPaddingRight(), px);
    }

    @Override
    public void bookmarkAction(int kind) {
        EppyBook b = player.book();
        if (b == null) {
            Toast.makeText(this, "Start a book first", Toast.LENGTH_SHORT).show();
            return;
        }
        String file;
        int pos;
        String title;
        double fp = player.filePositionSeconds();
        if (kind == 1) {
            int idx = b.chapterIndexAt((int) player.bookPositionSeconds(), (int) fp);
            if (idx < 0) return;
            EppyBook.ChapterItem ch = b.chapters.get(idx);
            file = ch.fileName;
            pos = ch.positionInFile;
            title = "Chapter: " + ch.title;
        } else {
            if (fp < 0) {
                Toast.makeText(this, "Position not available yet", Toast.LENGTH_SHORT).show();
                return;
            }
            file = b.currentFile;
            pos = (int) fp;
            String ch = player.chapterTitle();
            title = ch != null ? ch : "";
        }
        EppyBookmarks bm = EppyBookmarks.get(this);
        bm.sync(b.folderUri, false);
        boolean added = bm.toggle(b.folderUri, file, pos, title, null);
        String msg = added ? (kind == 1 ? "Chapter bookmarked" : "Bookmark added at " + Ui.time(pos * 1000L)) : "Bookmark removed";
        root.announceForAccessibility(msg);
        Toast.makeText(this, msg, Toast.LENGTH_SHORT).show();
    }

    private View undoBar;

    @Override
    public void showUndo(String message, Runnable undo) {
        if (undoBar != null) root.removeView(undoBar);
        LinearLayout bar = Ui.row(this);
        bar.setPadding(Ui.dp(this, 16), 0, Ui.dp(this, 8), 0);
        int inverse = theme.dark ? 0xFFE6E1E5 : 0xFF313033;
        int onInverse = theme.dark ? 0xFF313033 : 0xFFF4EFF4;
        bar.setBackground(Ui.rounded(inverse, Ui.dp(this, 8)));
        bar.setElevation(Ui.dp(this, 12));
        bar.addView(Ui.text(this, theme, message, 14, 500, onInverse), Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        // Inverse surface: the action uses the opposite scheme's primary so it stays readable.
        int actionColor = theme.dark ? EppyTheme.blend(theme.primary, 0xFF000000, 0.45f) : EppyTheme.blend(theme.primary, 0xFFFFFFFF, 0.55f);
        TextView action = Ui.text(this, theme, "Undo", 14, 650, actionColor);
        action.setPadding(Ui.dp(this, 12), Ui.dp(this, 12), Ui.dp(this, 12), Ui.dp(this, 12));
        bar.addView(action);
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Ui.dp(this, 52), Gravity.BOTTOM);
        lp.setMargins(Ui.dp(this, 12), 0, Ui.dp(this, 12), contentInset + Ui.dp(this, 12));
        root.addView(bar, lp);
        undoBar = bar;
        root.announceForAccessibility(message);
        Runnable hide = () -> {
            if (undoBar == bar) {
                root.removeView(bar);
                undoBar = null;
            }
        };
        action.setOnClickListener(v -> {
            undo.run();
            hide.run();
        });
        handler.postDelayed(hide, 6000);
    }

    private static final int REQ_DOC = 4711;

    @Override
    public void pickDocument() {
        if (player.book() == null) {
            Toast.makeText(this, "Start the audiobook first, then pair its EPUB or PDF", Toast.LENGTH_LONG).show();
            return;
        }
        Intent i = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        i.addCategory(Intent.CATEGORY_OPENABLE);
        i.setType("*/*");
        i.putExtra(Intent.EXTRA_MIME_TYPES, new String[]{"application/epub+zip", "application/pdf", "application/octet-stream"});
        i.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        try {
            startActivityForResult(i, REQ_DOC);
        } catch (ActivityNotFoundException e) {
            Toast.makeText(this, "No file picker available", Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    @SuppressWarnings("deprecation")
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQ_IO) {
            java.util.function.Consumer<android.net.Uri> cb = pendingDocument;
            pendingDocument = null;
            if (resultCode == RESULT_OK && data != null && data.getData() != null && cb != null) cb.accept(data.getData());
            return;
        }
        if (requestCode == REQ_DOC && resultCode == RESULT_OK && data != null && data.getData() != null) {
            EppyBook b = player.book();
            if (b != null) {
                ReadAlong ra = ReadAlong.get(this);
                ra.openBook(b.folderUri);
                ra.pair(data.getData());
                if (overlayPane != null) overlayPane.showSheet(app.morphe.extension.sabp.ui.PlayerSheet.TAB_READ);
                else if (sidePane != null) sidePane.showSheet(app.morphe.extension.sabp.ui.PlayerSheet.TAB_READ);
            }
        }
    }

    private static final int REQ_IO = 4713;
    private java.util.function.Consumer<android.net.Uri> pendingDocument;

    @Override
    public void requestDocument(boolean create, String mime, String suggestedName, java.util.function.Consumer<android.net.Uri> result) {
        Intent i = new Intent(create ? Intent.ACTION_CREATE_DOCUMENT : Intent.ACTION_OPEN_DOCUMENT);
        i.addCategory(Intent.CATEGORY_OPENABLE);
        i.setType(mime);
        if (create && suggestedName != null) i.putExtra(Intent.EXTRA_TITLE, suggestedName);
        pendingDocument = result;
        try {
            startActivityForResult(i, REQ_IO);
        } catch (ActivityNotFoundException e) {
            pendingDocument = null;
            Toast.makeText(this, "No file picker available", Toast.LENGTH_SHORT).show();
        }
    }

    private Runnable pendingSpeechAction;
    private static final int REQ_MIC = 4712;

    @Override
    public void ensureSpeechPermission(Runnable action) {
        ReadAlong ra = ReadAlong.get(this);
        if (!ra.speechSupported() || ra.speechPermitted()) {
            action.run();
            return;
        }
        new Sheet(root, theme, "Match narration to text")
                .item(EppyIcon.HEADPHONES, "Allow speech matching",
                        "Read along feeds short clips of the audiobook file to Android's offline speech recogniser. Android requires the microphone permission for that service, but your microphone is never used and nothing leaves your phone.",
                        () -> {
                            pendingSpeechAction = action;
                            requestPermissions(new String[]{android.Manifest.permission.RECORD_AUDIO}, REQ_MIC);
                        })
                .item(EppyIcon.CLOSE, "Not now", "You can still sync by long-pressing the paragraph you hear", null)
                .show();
    }

    @Override
    public void onRequestPermissionsResult(int code, String[] perms, int[] results) {
        super.onRequestPermissionsResult(code, perms, results);
        if (code == REQ_MIC) {
            Runnable a = pendingSpeechAction;
            pendingSpeechAction = null;
            if (results.length > 0 && results[0] == android.content.pm.PackageManager.PERMISSION_GRANTED && a != null) a.run();
        }
    }

    private View buildMiniPlayer() {
        FrameLayout wrap = new FrameLayout(this);
        float r = Ui.dp(this, 20);
        wrap.setBackground(Ui.ripple(theme, Ui.rounded(theme.cardShadow ? theme.surfaceContainerLow : theme.surfaceContainerHighest, r), r));
        wrap.setElevation(Ui.dp(this, 6));
        Ui.clip(wrap, r);
        LinearLayout row = Ui.row(this);
        row.setPadding(Ui.dp(this, 8), 0, Ui.dp(this, 8), 0);
        miniCover = Ui.cover(this, theme, null, 12);
        row.addView(miniCover, new LinearLayout.LayoutParams(Ui.dp(this, 48), Ui.dp(this, 48)));
        LinearLayout texts = Ui.column(this);
        texts.setPadding(Ui.dp(this, 12), 0, Ui.dp(this, 8), 0);
        miniTitle = Ui.singleLine(Ui.text(this, theme, "", 15, 600, theme.onSurface));
        miniSub = Ui.singleLine(Ui.text(this, theme, "", 13, 400, theme.onSurfaceVariant));
        miniSub.setPadding(0, Ui.dp(this, 3), 0, 0);
        texts.addView(miniTitle);
        texts.addView(miniSub);
        row.addView(texts, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        row.addView(Ui.iconButton(this, theme, EppyIcon.REWIND, theme.onSurface, 0, "Rewind",
                v -> player.command(EppyBridge.ACTION_REWIND_SMALL)));
        miniPlay = new PlayButton(this);
        miniPlay.apply(theme);
        miniPlay.setOnClickListener(v -> {
            Ui.haptic(v, theme);
            player.playPause();
        });
        LinearLayout.LayoutParams pl = new LinearLayout.LayoutParams(Ui.dp(this, 44), Ui.dp(this, 44));
        pl.leftMargin = Ui.dp(this, 4);
        row.addView(miniPlay, pl);
        wrap.addView(row, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        miniProgress = new View(this);
        miniProgress.setBackgroundColor(theme.primary);
        miniProgress.setPivotX(0);
        wrap.addView(miniProgress, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Ui.dp(this, 3), Gravity.BOTTOM));
        wrap.setClickable(true);
        wrap.setFocusable(true);
        wrap.setContentDescription("Mini-player. Double-tap to open the player");
        wrap.setOnClickListener(v -> openPlayer());
        wrap.setOnTouchListener(new MiniSwipe());
        wrap.setAccessibilityDelegate(new View.AccessibilityDelegate() {
            @Override
            public void onInitializeAccessibilityNodeInfo(View host, android.view.accessibility.AccessibilityNodeInfo info) {
                super.onInitializeAccessibilityNodeInfo(host, info);
                info.addAction(new android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction(R_EXPAND, "Expand player"));
                info.addAction(new android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction(R_NEXT, "Next chapter"));
                info.addAction(new android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction(R_PREV, "Previous chapter"));
                info.addAction(new android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction(R_DISMISS, "Pause and hide"));
            }

            @Override
            public boolean performAccessibilityAction(View host, int action, Bundle args) {
                if (action == R_EXPAND) openPlayer();
                else if (action == R_NEXT) player.skipChapter(1);
                else if (action == R_PREV) player.skipChapter(-1);
                else if (action == R_DISMISS) dismissMini();
                else return super.performAccessibilityAction(host, action, args);
                return true;
            }
        });
        wrap.setVisibility(View.GONE);
        return wrap;
    }

    private static final int R_EXPAND = 0x7e010001, R_NEXT = 0x7e010002, R_PREV = 0x7e010003, R_DISMISS = 0x7e010004;
    private boolean miniDismissed;

    /** Pause and hide the mini-player until playback starts again. */
    private void dismissMini() {
        if (player.isPlaying()) player.playPause();
        miniDismissed = true;
        updateMini();
        showUndo("Playback paused", () -> {
            miniDismissed = false;
            if (!player.isPlaying()) player.playPause();
            updateMini();
        });
    }

    /**
     * Mini-player gestures: tap opens the player, swipe up opens it, swipe down pauses and hides
     * it, and a sideways swipe skips chapters or dismisses (Settings → Mini-player). The card
     * follows the finger and springs back when the gesture is too short.
     */
    private final class MiniSwipe implements View.OnTouchListener {
        private float downX, downY;
        private int axis; // 0 undecided, 1 horizontal, 2 vertical
        private android.view.VelocityTracker vt;

        @Override
        public boolean onTouch(View v, android.view.MotionEvent e) {
            int slop = android.view.ViewConfiguration.get(v.getContext()).getScaledTouchSlop();
            switch (e.getActionMasked()) {
                case android.view.MotionEvent.ACTION_DOWN:
                    downX = e.getRawX();
                    downY = e.getRawY();
                    axis = 0;
                    vt = android.view.VelocityTracker.obtain();
                    vt.addMovement(e);
                    return false; // let the click/ripple start
                case android.view.MotionEvent.ACTION_MOVE: {
                    if (vt != null) vt.addMovement(e);
                    float dx = e.getRawX() - downX, dy = e.getRawY() - downY;
                    if (axis == 0) {
                        if (Math.abs(dx) > slop && Math.abs(dx) > Math.abs(dy)) axis = 1;
                        else if (Math.abs(dy) > slop) axis = 2;
                        if (axis != 0) {
                            v.setPressed(false);
                            v.cancelLongPress();
                            v.getParent().requestDisallowInterceptTouchEvent(true);
                        }
                    }
                    if (axis == 1 && !"off".equals(miniSwipeMode())) {
                        v.setTranslationX(dx);
                        v.setAlpha(1f - Math.min(0.5f, Math.abs(dx) / v.getWidth()));
                    } else if (axis == 2) {
                        v.setTranslationY(dy < 0 ? dy * 0.4f : dy);
                    }
                    return axis != 0;
                }
                case android.view.MotionEvent.ACTION_UP:
                case android.view.MotionEvent.ACTION_CANCEL: {
                    boolean up = e.getActionMasked() == android.view.MotionEvent.ACTION_UP;
                    float dx = e.getRawX() - downX, dy = e.getRawY() - downY;
                    float vx = 0, vy = 0;
                    if (vt != null) {
                        vt.addMovement(e);
                        vt.computeCurrentVelocity(1000);
                        vx = vt.getXVelocity();
                        vy = vt.getYVelocity();
                        vt.recycle();
                        vt = null;
                    }
                    int far = Ui.dp(v.getContext(), 56), fling = Ui.dp(v.getContext(), 600);
                    int decided = axis;
                    axis = 0;
                    if (up && decided == 2 && (dy < -far / 2f || vy < -fling)) {
                        spring(v);
                        openPlayer();
                    } else if (up && decided == 2 && (dy > far || vy > fling)) {
                        spring(v);
                        dismissMini();
                    } else if (up && decided == 1 && (Math.abs(dx) > far * 1.5f || Math.abs(vx) > fling)) {
                        String mode = miniSwipeMode();
                        spring(v);
                        if ("dismiss".equals(mode)) dismissMini();
                        else if ("chapters".equals(mode)) {
                            Ui.haptic(v, theme);
                            boolean next = dx < 0;
                            if (!player.skipChapter(next ? 1 : -1)) {
                                Toast.makeText(EppyActivity.this, next ? "No next chapter" : "No previous chapter", Toast.LENGTH_SHORT).show();
                            }
                        }
                    } else {
                        spring(v);
                    }
                    return decided != 0;
                }
                default:
                    return false;
            }
        }

        private void spring(View v) {
            if (theme.reduceMotion) {
                v.setTranslationX(0);
                v.setTranslationY(0);
                v.setAlpha(1f);
            } else {
                v.animate().translationX(0).translationY(0).alpha(1f).setDuration(180)
                        .setInterpolator(new PathInterpolator(0.2f, 0f, 0f, 1f)).start();
            }
        }
    }

    private String miniSwipeMode() {
        return EppyTheme.prefs(this).getString("miniSwipe", "chapters");
    }

    // ---- navigation ------------------------------------------------------------------------

    private void showTab(int t) {
        home.root.setVisibility(t == TAB_HOME ? View.VISIBLE : View.GONE);
        library.root.setVisibility(t == TAB_LIBRARY ? View.VISIBLE : View.GONE);
        settings.root.setVisibility(t == TAB_SETTINGS ? View.VISIBLE : View.GONE);
    }

    @Override
    public void selectTab(int t) {
        if (t == TAB_BOOKMARKS) {
            if (!pageStack.isEmpty() && app.morphe.extension.sabp.ui.BookmarksPage.KEY.equals(pageStack.get(pageStack.size() - 1).key)) return;
            clearPages();
            pushPage(app.morphe.extension.sabp.ui.BookmarksPage.KEY, null);
            for (int i = 0; i < navItems.size(); i++) navItems.get(i).setSelected(i % TAB_LABELS.length == TAB_BOOKMARKS);
            return;
        }
        if (!pageStack.isEmpty()) clearPages();
        if (t == tab) return;
        tab = t;
        // Only colours change: the items keep their geometry, so nothing reflows.
        for (int i = 0; i < navItems.size(); i++) navItems.get(i).setSelected(i % TAB_LABELS.length == t);
        View page = t == TAB_HOME ? home.root : t == TAB_LIBRARY ? library.root : settings.root;
        showTab(t);
        if (!theme.reduceMotion) {
            page.setAlpha(0f);
            page.setTranslationY(Ui.dp(this, 12));
            page.animate().alpha(1f).translationY(0).setDuration(200).setInterpolator(new PathInterpolator(0.2f, 0f, 0f, 1f)).start();
        }
    }

    @Override
    public void openPlayer() {
        openPlayer(true);
    }

    private void openPlayer(boolean animate) {
        if (sidePane != null) {
            sidePane.root.requestFocus();
            return;
        }
        if (playerOpen) return;
        playerOpen = true;
        overlayPane = new PlayerPane(this, false);
        root.addView(overlayPane.root, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        overlayPane.root.setPadding(0, 0, 0, Math.max(sysBottom, imeBottom));
        overlayPane.layoutCover(getResources().getDisplayMetrics().widthPixels);
        overlayPane.update(true);
        if (miniPlayer != null) miniPlayer.setVisibility(View.GONE);
        if (animate && !theme.reduceMotion) {
            overlayPane.root.setTranslationY(getResources().getDisplayMetrics().heightPixels * 0.3f);
            overlayPane.root.setAlpha(0f);
            overlayPane.root.animate().translationY(0).alpha(1f).setDuration(300)
                    .setInterpolator(new PathInterpolator(0.05f, 0.7f, 0.1f, 1f)).start();
        }
        handler.removeCallbacks(ticker);
        handler.post(ticker);
    }

    @Override
    public void closePlayer() {
        if (!playerOpen || overlayPane == null) return;
        playerOpen = false;
        final View v = overlayPane.root;
        overlayPane = null;
        Runnable remove = () -> root.removeView(v);
        if (theme.reduceMotion) remove.run();
        else v.animate().translationY(v.getHeight() * 0.3f).alpha(0f).setDuration(200).withEndAction(remove).start();
        updateMini();
    }

    @Override
    public void openSabp(String activityClass) {
        try {
            // The classic player only ever opens on purpose, marked so the router lets it through.
            Intent i = EppyBridge.PLAYER_ACTIVITY.equals(activityClass) ? EppyRoute.classicIntent(this)
                    : EppyBridge.activityIntent(this, activityClass);
            EppyDiag.log("route", "opening " + activityClass.substring(activityClass.lastIndexOf('.') + 1));
            startActivity(i);
        } catch (ActivityNotFoundException | SecurityException e) {
            Toast.makeText(this, "Not available in this version", Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    public void showMoreSheet() {
        Host h = this;
        Runnable refresh = () -> refreshAll(true);
        boolean id3 = BookControls.id3Titles();
        boolean rotate = BookControls.rotateActive(this);
        int[] se = BookControls.skipStartEnd();
        new Sheet(root, theme, "More")
                .item(EppyIcon.FILE, "Files", "Every file of this book; tap to play from its start", () -> app.morphe.extension.sabp.ui.ControlsPanels.showFiles(h))
                .item(EppyIcon.SUBTITLES, "Subtitles", "The book's .srt lines; tap one to jump there", () -> app.morphe.extension.sabp.ui.ControlsPanels.showSubtitles(h))
                .item(EppyIcon.CUT, "Skip start and end", se[0] > 0 || se[1] > 0 ? "Start " + se[0] + " s · end " + se[1] + " s" : "Off",
                        () -> app.morphe.extension.sabp.ui.ControlsPanels.showSkipStartEnd(h, refresh))
                .item(EppyIcon.EQUALIZER, "Equalizer", "Bands, balance, mono, pitch, noise reduction", () -> app.morphe.extension.sabp.ui.ControlsPanels.showEqualizer(h, refresh))
                .item(EppyIcon.VOLUME, "Volume boost", app.morphe.extension.sabp.ui.ControlsPanels.boostLabel(BookControls.boost()),
                        () -> app.morphe.extension.sabp.ui.ControlsPanels.showBoost(h, refresh))
                .item(EppyIcon.REPEAT, "Repeat", BookControls.repeatLabel(BookControls.repeatMode()), () -> app.morphe.extension.sabp.ui.ControlsPanels.showRepeat(h, refresh))
                .item(EppyIcon.TITLE, id3 ? "Show file names" : "Show ID3 titles", id3 ? "Now showing titles from the files' tags" : "Now showing file names", () -> {
                    if (!BookControls.canId3()) {
                        Toast.makeText(this, "Not available (see Diagnostics)", Toast.LENGTH_SHORT).show();
                        return;
                    }
                    BookControls.setId3Titles(!id3);
                    player.invalidateBook();
                    refresh.run();
                })
                .item(EppyIcon.ROTATE, rotate ? "Turn off rotate to control" : "Rotate to control",
                        "Tilt the phone left or right to rewind or skip (set the actions in SABP's Full version settings)", () -> {
                            BookControls.setRotateActive(this, !rotate);
                            Toast.makeText(this, rotate ? "Rotate to control off" : "Rotate to control on", Toast.LENGTH_SHORT).show();
                        })
                .item(EppyIcon.BOOKMARK, "Bookmarks", "Jump to or edit saved moments", () -> showPlayerSheet(app.morphe.extension.sabp.ui.PlayerSheet.TAB_BOOKMARKS))
                .item(EppyIcon.PERSON, "Characters", "Who's who in this book", () -> pushPage(app.morphe.extension.sabp.ui.CharactersPage.KEY, null))
                .item(EppyIcon.HISTORY, "History", "Undo an accidental jump", () -> pushPage(app.morphe.extension.sabp.ui.HistoryPage.KEY, null))
                .item(EppyIcon.CHART, "Statistics", "Listening time for this book", () -> pushPage(app.morphe.extension.sabp.ui.StatisticsPage.KEY, null))
                .item(EppyIcon.BOOK, "Open a text or PDF file", "Files next to the audio, in another app", () -> app.morphe.extension.sabp.ui.ControlsPanels.showTextFiles(h))
                .item(EppyIcon.CAST, "Audio output and cast", "Bluetooth, speakers and cast devices Android offers", () -> app.morphe.extension.sabp.ui.ControlsPanels.showOutputSwitcher(h))
                .item(EppyIcon.TUNE, "Player settings", null, () -> pushPage(app.morphe.extension.sabp.ui.PlayerSettingsPage.KEY, null))
                .item(EppyIcon.IMAGE, "Change cover", "Classic player: ⋮ → More → Select cover / Search cover",
                        () -> app.morphe.extension.sabp.ui.ControlsPanels.openClassicFor(h, "⋮ → More → Select cover or Search cover"))
                .item(EppyIcon.DELETE_FOREVER, "Delete files", "Classic player: ⋮ → More → Delete files",
                        () -> app.morphe.extension.sabp.ui.ControlsPanels.openClassicFor(h, "⋮ → More → Delete current or finished files"))
                .item(EppyIcon.CLASSIC, "Classic player", "Chromecast button, MP3 → Opus, help", () -> openSabp(EppyBridge.PLAYER_ACTIVITY))
                .item(EppyIcon.POWER, "Exit", "Stop playback and close, like the notification's close button",
                        () -> app.morphe.extension.sabp.ui.ControlsPanels.exit(h))
                .show();
    }

    @Override
    public void playBook(EppyPlayer.Book book, boolean open) {
        if (book == null) return;
        player.playBook(book);
        if (open) openPlayer();
    }

    @Override
    public void rebuild() {
        build();
    }

    // ---- updates ---------------------------------------------------------------------------

    private void refreshAll(boolean full) {
        if (home == null) return;
        boolean hasSession = player.hasSession();
        String book = player.bookTitle();
        boolean bookChanged = hasSession != lastHadSession || (book != null && !book.equals(lastBook));
        lastHadSession = hasSession;
        lastBook = book;
        if (bookChanged || full) home.rebuild();
        if (sidePane != null) sidePane.update(true);
        if (overlayPane != null) overlayPane.update(true);
        updateMini();
        maybeUpdateCoverAccent();
    }

    private void updateMini() {
        if (miniPlayer == null) return;
        if (player.isPlaying()) miniDismissed = false;
        boolean show = player.hasSession() && !playerOpen && !miniDismissed;
        miniPlayer.setVisibility(show ? View.VISIBLE : View.GONE);
        if (!show) return;
        miniTitle.setText(player.bookTitle());
        String ch = player.chapterTitle();
        miniSub.setText(ch != null && !ch.equals(player.bookTitle()) ? ch : "");
        Bitmap c = player.cover();
        if (c != lastCover) {
            Ui.setCover(miniCover, theme, c);
            lastCover = c;
        }
        miniPlay.setPlaying(player.isPlaying(), true);
        tickMini();
    }

    private void tickMini() {
        if (miniPlayer == null || miniPlayer.getVisibility() != View.VISIBLE) return;
        long[] ch = player.chapterProgressMs();
        long d = ch != null ? ch[1] : player.durationMs();
        long pos = ch != null ? ch[0] : player.positionMs();
        miniProgress.setScaleX(d > 0 ? pos / (float) d : 0f);
    }

    private void tick() {
        EppyBook b = player.book();
        if (b != null) {
            ReadAlong ra = ReadAlong.get(this);
            ra.openBook(b.folderUri);
            ra.tick(player.bookPositionSeconds(), player.isPlaying());
        }
        if (overlayPane != null) overlayPane.update(false);
        if (sidePane != null) sidePane.update(false);
        if (home != null && tab == TAB_HOME && pageStack.isEmpty()) home.tick();
        if (!pageStack.isEmpty()) pageStack.get(pageStack.size() - 1).tick();
        tickMini();
    }

    /** Per-book accent: derive the theme seed from the cover when that option is chosen. */
    private void maybeUpdateCoverAccent() {
        if (theme == null || !EppyTheme.ACCENT_COVER.equals(theme.accentSource)) return;
        final Bitmap c = player.cover();
        if (c == seedSource) return;
        seedSource = c;
        new Thread(() -> {
            int seed = EppyTheme.seedFromCover(c);
            handler.post(() -> {
                if (seed != coverSeed) {
                    coverSeed = seed;
                    if (visible) build();
                }
            });
        }).start();
    }

    @Override
    public void onPlaybackChanged() {
        if (!visible) return;
        refreshAll(false);
    }

    @Override
    public void onLibraryChanged() {
        if (!visible || home == null) return;
        home.rebuild();
        library.rebuild();
    }

    // ---- keyboard ----------------------------------------------------------------------------

    @Override
    public boolean dispatchKeyEvent(KeyEvent e) {
        if (e.getAction() != KeyEvent.ACTION_DOWN) return super.dispatchKeyEvent(e);
        boolean typing = getCurrentFocus() instanceof EditText;
        int k = e.getKeyCode();
        if (k == KeyEvent.KEYCODE_ESCAPE) {
            handleBack();
            return true;
        }
        if (e.isCtrlPressed() && k == KeyEvent.KEYCODE_F) {
            selectTab(TAB_HOME);
            home.focusSearch();
            return true;
        }
        if (typing) return super.dispatchKeyEvent(e);
        switch (k) {
            case KeyEvent.KEYCODE_SPACE:
            case KeyEvent.KEYCODE_K:
                player.playPause();
                return true;
            case KeyEvent.KEYCODE_J:
                player.command(EppyBridge.ACTION_REWIND_SMALL);
                return true;
            case KeyEvent.KEYCODE_L:
                player.command(EppyBridge.ACTION_FWD_SMALL);
                return true;
            case KeyEvent.KEYCODE_N:
                player.command(EppyBridge.ACTION_NEXT_FILE);
                return true;
            case KeyEvent.KEYCODE_P:
                player.command(EppyBridge.ACTION_PREV_FILE);
                return true;
            case KeyEvent.KEYCODE_B:
                player.command(EppyBridge.ACTION_ADD_BOOKMARK);
                Toast.makeText(this, "Bookmark added", Toast.LENGTH_SHORT).show();
                return true;
            case KeyEvent.KEYCODE_S:
                boolean wasOn = player.sleepActive();
                if (wasOn) player.stopSleep();
                else player.startSleep(SabpPrefs.sleepMinutes(this));
                Toast.makeText(this, wasOn ? "Sleep timer off" : "Sleep timer on", Toast.LENGTH_SHORT).show();
                return true;
            case KeyEvent.KEYCODE_LEFT_BRACKET:
            case KeyEvent.KEYCODE_RIGHT_BRACKET:
                if (player.canSetSpeed()) {
                    float sp = player.bookSpeed() + (k == KeyEvent.KEYCODE_RIGHT_BRACKET ? 0.05f : -0.05f);
                    player.setSpeed(sp, player.skipSilence());
                    Toast.makeText(this, app.morphe.extension.sabp.ui.PlaybackPanels.formatSpeed(
                            Math.round(Math.max(EppyPlayer.MIN_SPEED, Math.min(EppyPlayer.MAX_SPEED, sp)) * 20f) / 20f), Toast.LENGTH_SHORT).show();
                }
                return true;
            case KeyEvent.KEYCODE_1:
                selectTab(TAB_HOME);
                return true;
            case KeyEvent.KEYCODE_2:
                selectTab(TAB_LIBRARY);
                return true;
            case KeyEvent.KEYCODE_3:
                selectTab(TAB_BOOKMARKS);
                return true;
            case KeyEvent.KEYCODE_4:
                selectTab(TAB_SETTINGS);
                return true;
            case KeyEvent.KEYCODE_DPAD_LEFT:
                if (!(getCurrentFocus() instanceof app.morphe.extension.sabp.ui.EppySlider) && e.isAltPressed()) {
                    player.command(EppyBridge.ACTION_REWIND_SMALL);
                    return true;
                }
                break;
            case KeyEvent.KEYCODE_DPAD_RIGHT:
                if (!(getCurrentFocus() instanceof app.morphe.extension.sabp.ui.EppySlider) && e.isAltPressed()) {
                    player.command(EppyBridge.ACTION_FWD_SMALL);
                    return true;
                }
                break;
            default:
                break;
        }
        return super.dispatchKeyEvent(e);
    }

    // ---- Host --------------------------------------------------------------------------------

    @Override
    public Activity activity() {
        return this;
    }

    @Override
    public EppyTheme theme() {
        return theme;
    }

    @Override
    public EppyPlayer player() {
        return player;
    }

    @Override
    public ViewGroup overlayRoot() {
        return root;
    }
}
