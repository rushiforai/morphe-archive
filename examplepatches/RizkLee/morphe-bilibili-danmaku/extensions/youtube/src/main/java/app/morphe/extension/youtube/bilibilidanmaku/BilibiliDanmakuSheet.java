package app.morphe.extension.youtube.bilibilidanmaku;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.text.InputType;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.morphe.extension.shared.theme.ThemeUtils;
import app.morphe.extension.shared.ui.SheetBottomDialog;
import app.morphe.extension.youtube.patches.VideoInformation;

/** One navigation surface for the full danmaku workflow; no nested Android alert dialogs. */
@SuppressWarnings("deprecation")
final class BilibiliDanmakuSheet {
    private static final int BLUE = Color.rgb(0, 174, 236);
    private static final int PINK = Color.rgb(251, 114, 153);
    private static final int GREEN = Color.rgb(46, 190, 104);
    private static final int AMBER = Color.rgb(255, 163, 26);
    private static final int RED = Color.rgb(240, 74, 74);
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor();
    private static final long QR_LIFETIME_MS = 170_000;
    private static final int QR_LOADING = 0, QR_READY = 1, QR_SCANNED = 2, QR_EXPIRED = 3, QR_FAILED = 4, QR_SUCCESS = 5;

    private static WeakReference<BilibiliDanmakuSheet> current = new WeakReference<>(null);

    private final Activity host;
    private final SharedPreferences settings;
    private final SheetBottomDialog.SlideDialog dialog;
    private final FrameLayout contentHolder;
    private final boolean dark;
    private final int background, surface, surfaceStrong, divider, foreground, muted, blueSoft;
    private final Typeface medium = Typeface.create("sans-serif-medium", Typeface.NORMAL);
    private final ArrayDeque<String> history = new ArrayDeque<>();
    private boolean landscape;
    private LinearLayout body;
    private ScrollView scroll;
    private FrameLayout leading;
    private TextView heading, subtitle;
    private View statusDot, headerRule;
    private String page = "home";
    private boolean enableAfterLogin;
    private boolean homeAfterSource;
    private boolean searching;
    private String searchText = "";
    private String findKeyword = "";
    private List<DanmakuComment> findMatches;
    private List<BilibiliDanmakuSource.Candidate> candidates = new ArrayList<>();
    private List<BilibiliDanmakuSource.Page> parts = new ArrayList<>();
    private List<BilibiliDanmakuSource.Episode> episodes = new ArrayList<>();
    private String pageReference = "";

    // QR login state survives re-rendering of the login page.
    private int qrGeneration;
    private boolean qrPolling;
    private int qrState = QR_LOADING;
    private String qrMessage = "";
    private long qrStartedAt;
    private BilibiliDanmakuAuth.QrTicket qrTicket;
    private BilibiliQrCode qrCode;
    private QrView qrView;
    private TextView qrOverlay;
    private TextView qrStatus;
    private View qrStatusDot;
    private Uri savedQrImage;

    private final View.OnLayoutChangeListener rootLayoutListener = (view, left, top, right, bottom,
            oldLeft, oldTop, oldRight, oldBottom) -> {
        if (top != oldTop || bottom != oldBottom || left != oldLeft || right != oldRight) adjustWindow();
    };

    // ------------------------------------------------------------------ public entry points

    static void open(Activity host) {
        BilibiliDanmakuSheet active = current.get();
        if (active != null && active.host == host && active.dialog.isShowing()) {
            active.home();
            return;
        }
        new BilibiliDanmakuSheet(host).show();
    }

    static boolean isShowing() {
        BilibiliDanmakuSheet sheet = current.get();
        return sheet != null && sheet.dialog.isShowing();
    }

    static void showCandidates(Activity host, List<BilibiliDanmakuSource.Candidate> items) {
        BilibiliDanmakuSheet sheet = getOrOpen(host);
        sheet.searching = false;
        sheet.candidates = new ArrayList<>(items);
        sheet.go("candidates");
    }

    static void showParts(Activity host, String reference, List<BilibiliDanmakuSource.Page> items) {
        BilibiliDanmakuSheet sheet = getOrOpen(host);
        sheet.pageReference = reference;
        sheet.parts = new ArrayList<>(items);
        sheet.go("parts");
    }

    static void showEpisodes(Activity host, List<BilibiliDanmakuSource.Episode> items) {
        BilibiliDanmakuSheet sheet = getOrOpen(host);
        sheet.episodes = new ArrayList<>(items);
        sheet.go("episodes");
    }

    private static BilibiliDanmakuSheet getOrOpen(Activity host) {
        BilibiliDanmakuSheet active = current.get();
        if (active != null && active.host == host && active.dialog.isShowing()) return active;
        active = new BilibiliDanmakuSheet(host);
        active.show();
        return active;
    }

    static void updateHeader() {
        BilibiliDanmakuSheet sheet = current.get();
        if (sheet == null || !sheet.dialog.isShowing()) return;
        sheet.refreshHeader();
        if ("search".equals(sheet.page) && sheet.searching
                && BilibiliDanmakuController.statusTone() != BilibiliDanmakuController.TONE_BUSY) {
            sheet.searching = false;
            sheet.render("search", true);
        }
    }

    static void sourceChanged() {
        BilibiliDanmakuSheet sheet = current.get();
        if (sheet == null || !sheet.dialog.isShowing()) return;
        if ("home".equals(sheet.page)) sheet.render("home", true);
        else if (sheet.homeAfterSource && ("candidates".equals(sheet.page) || "parts".equals(sheet.page)
                || "episodes".equals(sheet.page) || "link".equals(sheet.page))) {
            sheet.homeAfterSource = false;
            sheet.home();
        }
    }

    /** A request failed because Bilibili wants a login: surface the login banner. */
    static void loginRequired() {
        BilibiliDanmakuSheet sheet = current.get();
        if (sheet == null || !sheet.dialog.isShowing()) return;
        sheet.searching = false;
        switch (sheet.page) {
            case "home": case "search": case "link": case "candidates": case "parts": case "episodes":
                sheet.home();
                break;
            default:
                sheet.refreshHeader();
        }
    }

    // ------------------------------------------------------------------ window

    private BilibiliDanmakuSheet(Activity activity) {
        host = activity;
        settings = BilibiliDanmakuController.prefs(host);
        landscape = host.getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE;
        background = ThemeUtils.getDialogBackgroundColor();
        foreground = ThemeUtils.getAppForegroundColor();
        dark = Color.luminance(background) < .5;
        surface = blend(background, foreground, dark ? .075f : .045f);
        surfaceStrong = blend(background, foreground, dark ? .13f : .085f);
        divider = blend(background, foreground, dark ? .12f : .09f);
        muted = blend(foreground, background, dark ? .42f : .45f);
        blueSoft = blend(background, BLUE, dark ? .20f : .12f);
        contentHolder = new FrameLayout(host);
        // Use the public three-argument API shipped by official Morphe.  Its
        // top spacer is removed so the sheet stays aligned with the player.
        dialog = SheetBottomDialog.createSlideDialog(host, contentHolder, 260);
        fillDialogHeight();
        dialog.setOnDismissListener(ignored -> {
            ViewGroup player = BilibiliDanmakuController.playerRoot();
            if (player != null) player.removeOnLayoutChangeListener(rootLayoutListener);
            host.getWindow().getDecorView().removeOnLayoutChangeListener(rootLayoutListener);
            stopQr();
            if (current.get() == this) current = new WeakReference<>(null);
        });
        dialog.setOnKeyListener((d, keyCode, event) -> {
            if (keyCode != KeyEvent.KEYCODE_BACK || event.getAction() != KeyEvent.ACTION_UP) return false;
            if ("home".equals(page)) return false;
            back();
            return true;
        });
        if (Build.VERSION.SDK_INT >= 33) {
            dialog.getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                    android.window.OnBackInvokedDispatcher.PRIORITY_DEFAULT, () -> {
                        if ("home".equals(page)) dialog.dismiss();
                        else back();
                    });
        }
        buildShell();
    }

    /**
     * The official slide dialog wraps its content; on short pages the sheet would then end
     * half-way and reveal the video list. Stretch the containers to the window height.
     */
    private void fillDialogHeight() {
        if (!(contentHolder.getParent() instanceof LinearLayout)) return;
        LinearLayout drag = (LinearLayout) contentHolder.getParent();
        for (int i = 0; i < drag.getChildCount(); i++) {
            View child = drag.getChildAt(i);
            if (child != contentHolder) child.setVisibility(View.GONE); // Official top spacer.
        }
        contentHolder.setLayoutParams(new LinearLayout.LayoutParams(-1, 0, 1f));
        ViewGroup.LayoutParams dragParams = drag.getLayoutParams();
        if (dragParams == null) dragParams = new LinearLayout.LayoutParams(-1, -1);
        dragParams.width = -1;
        dragParams.height = -1;
        drag.setLayoutParams(dragParams);
        if (drag.getParent() instanceof View) {
            View wrapper = (View) drag.getParent();
            ViewGroup.LayoutParams wrapperParams = wrapper.getLayoutParams();
            if (wrapperParams != null) {
                wrapperParams.width = -1;
                wrapperParams.height = -1;
                wrapper.setLayoutParams(wrapperParams);
            }
        }
    }

    private void show() {
        current = new WeakReference<>(this);
        dialog.show();
        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawableResource(android.R.color.transparent);
            window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
            window.addFlags(WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN);
            window.setNavigationBarColor(Color.TRANSPARENT);
            if (Build.VERSION.SDK_INT >= 29) window.setNavigationBarContrastEnforced(false);
            window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
            window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            WindowManager.LayoutParams attrs = window.getAttributes();
            attrs.dimAmount = landscape ? .14f : .2f;
            // Extend the sheet behind the navigation bar so nothing shows through below it.
            if (Build.VERSION.SDK_INT >= 30) {
                attrs.setFitInsetsTypes(0);
                attrs.setFitInsetsSides(0);
                attrs.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS;
            } else {
                attrs.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
            }
            window.setAttributes(attrs);
            if (Build.VERSION.SDK_INT >= 30) {
                window.setDecorFitsSystemWindows(false);
                if (window.getInsetsController() != null) {
                    int light = android.view.WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
                    window.getInsetsController().setSystemBarsAppearance(dark ? 0 : light, light);
                }
            } else {
                int flags = View.SYSTEM_UI_FLAG_LAYOUT_STABLE | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION;
                if (!dark) flags |= View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
                window.getDecorView().setSystemUiVisibility(flags);
            }
            adjustWindow();
        }
        ViewGroup player = BilibiliDanmakuController.playerRoot();
        if (player != null) player.addOnLayoutChangeListener(rootLayoutListener);
        host.getWindow().getDecorView().addOnLayoutChangeListener(rootLayoutListener);
        boolean firstRun = !BilibiliDanmakuSession.hasSession() && !settings.getBoolean("account_prompt_seen", false);
        render(firstRun ? "account" : "home", false);
    }

    /** Portrait begins at the actual visible player bottom; landscape leaves the left video area visible. */
    private void adjustWindow() {
        Window window = dialog.getWindow();
        if (window == null || !dialog.isShowing()) return;
        android.util.DisplayMetrics metrics = new android.util.DisplayMetrics();
        host.getWindowManager().getDefaultDisplay().getRealMetrics(metrics);
        int screenW = metrics.widthPixels;
        int screenH = metrics.heightPixels;
        boolean isLandscape = screenW > screenH;
        if (landscape != isLandscape) {
            landscape = isLandscape;
            buildShell();
            render(page, false);
        }
        if (landscape) {
            window.setGravity(Gravity.RIGHT | Gravity.BOTTOM);
            window.setLayout(Math.min(screenW - dp(220), Math.min(dp(410),
                    Math.max(dp(300), Math.round(screenW * .42f)))), screenH);
        } else {
            ViewGroup player = BilibiliDanmakuController.playerRoot();
            Rect rect = new Rect();
            int anchor = Math.round(screenH * .38f);
            if (player != null && player.getGlobalVisibleRect(rect) && rect.height() > dp(100)) {
                anchor = rect.bottom;
            }
            // A very tall player (portrait fullscreen, vertical videos) would leave no room:
            // then the sheet overlaps the lower part of the video instead.
            if (screenH - anchor < screenH * .5f) anchor = Math.round(screenH * .4f);
            anchor = Math.max(0, Math.min(screenH - dp(240), anchor));
            window.setGravity(Gravity.BOTTOM);
            window.setLayout(WindowManager.LayoutParams.MATCH_PARENT, screenH - anchor);
        }
    }

    // ------------------------------------------------------------------ shell

    private void buildShell() {
        LinearLayout shell = column();
        float radius = dp(24);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(background);
        bg.setCornerRadii(landscape ? new float[]{radius, radius, 0, 0, 0, 0, radius, radius}
                : new float[]{radius, radius, radius, radius, 0, 0, 0, 0});
        shell.setBackground(bg);
        shell.setClipToOutline(true);

        if (!landscape) {
            View handle = new View(host);
            handle.setBackground(round(divider, 3));
            LinearLayout.LayoutParams handleLp = new LinearLayout.LayoutParams(dp(36), dp(4));
            handleLp.gravity = Gravity.CENTER_HORIZONTAL;
            handleLp.topMargin = dp(8);
            handleLp.bottomMargin = dp(4);
            handle.setContentDescription("向下滑动关闭弹幕菜单");
            // The native SlideDialog's draggable parent tracks this gesture.
            shell.addView(handle, handleLp);
        }

        LinearLayout header = row();
        header.setGravity(Gravity.CENTER_VERTICAL);
        header.setPadding(dp(16), dp(landscape ? 18 : 8), dp(12), dp(12));
        leading = new FrameLayout(host);
        LinearLayout.LayoutParams leadingLp = new LinearLayout.LayoutParams(dp(40), dp(40));
        leadingLp.rightMargin = dp(12);
        header.addView(leading, leadingLp);
        LinearLayout titles = column();
        heading = text("B 站弹幕", 17, foreground, true);
        heading.setSingleLine(true);
        heading.setEllipsize(TextUtils.TruncateAt.END);
        titles.addView(heading);
        LinearLayout statusRow = row();
        statusRow.setGravity(Gravity.CENTER_VERTICAL);
        statusDot = new View(host);
        LinearLayout.LayoutParams dotLp = new LinearLayout.LayoutParams(dp(6), dp(6));
        dotLp.rightMargin = dp(6);
        statusRow.addView(statusDot, dotLp);
        subtitle = text("", 12, muted, false);
        subtitle.setSingleLine(true);
        subtitle.setEllipsize(TextUtils.TruncateAt.END);
        statusRow.addView(subtitle, new LinearLayout.LayoutParams(0, -2, 1));
        LinearLayout.LayoutParams statusLp = new LinearLayout.LayoutParams(-1, -2);
        statusLp.topMargin = dp(2);
        titles.addView(statusRow, statusLp);
        header.addView(titles, new LinearLayout.LayoutParams(0, -2, 1));
        header.addView(circleButton("close", "关闭菜单", () -> dialog.dismiss()));
        shell.addView(header);

        headerRule = new View(host);
        headerRule.setBackgroundColor(divider);
        headerRule.setAlpha(0f);
        shell.addView(headerRule, new LinearLayout.LayoutParams(-1, Math.max(1, dp(1) / 2 + 1)));

        scroll = new ScrollView(host);
        scroll.setFillViewport(true);
        scroll.setClipToPadding(false);
        scroll.setVerticalScrollBarEnabled(false);
        scroll.setOverScrollMode(View.OVER_SCROLL_NEVER);
        scroll.setOnScrollChangeListener((v, x, y, oldX, oldY) ->
                headerRule.setAlpha(Math.min(1f, y / (float) dp(12))));
        body = column();
        body.setPadding(dp(16), dp(6), dp(16), dp(24));
        scroll.addView(body, new FrameLayout.LayoutParams(-1, -2));
        shell.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1));
        if (Build.VERSION.SDK_INT >= 30) {
            shell.setOnApplyWindowInsetsListener((view, insets) -> {
                android.graphics.Insets nav = insets.getInsets(WindowInsets.Type.navigationBars());
                android.graphics.Insets ime = insets.getInsets(WindowInsets.Type.ime());
                android.graphics.Insets cutout = insets.getInsets(WindowInsets.Type.displayCutout());
                view.setPadding(0, landscape ? cutout.top : 0,
                        landscape ? Math.max(nav.right, cutout.right) : 0,
                        Math.max(dp(4), Math.max(nav.bottom, ime.bottom)));
                return insets;
            });
        } else {
            shell.setOnApplyWindowInsetsListener((view, insets) -> {
                view.setPadding(0, 0, landscape ? insets.getSystemWindowInsetRight() : 0,
                        Math.max(dp(4), insets.getSystemWindowInsetBottom()));
                return insets;
            });
        }
        contentHolder.removeAllViews();
        contentHolder.addView(shell, new FrameLayout.LayoutParams(-1, -1));
    }

    private void refreshHeader() {
        if (subtitle == null) return;
        subtitle.setText(BilibiliDanmakuController.displayStatus());
        int color;
        switch (BilibiliDanmakuController.statusTone()) {
            case BilibiliDanmakuController.TONE_READY: color = GREEN; break;
            case BilibiliDanmakuController.TONE_BUSY: color = BLUE; break;
            case BilibiliDanmakuController.TONE_WARN: color = AMBER; break;
            case BilibiliDanmakuController.TONE_ERROR: color = RED; break;
            default: color = muted;
        }
        statusDot.setBackground(oval(color));
    }

    private void updateLeading() {
        leading.removeAllViews();
        if ("home".equals(page)) {
            FrameLayout brand = new FrameLayout(host);
            GradientDrawable tile = new GradientDrawable(GradientDrawable.Orientation.TL_BR,
                    new int[]{Color.rgb(35, 196, 255), BLUE});
            tile.setCornerRadius(dp(13));
            brand.setBackground(tile);
            brand.addView(new IconView(host, "tv", Color.WHITE, 2.2f),
                    new FrameLayout.LayoutParams(dp(24), dp(24), Gravity.CENTER));
            leading.addView(brand, new FrameLayout.LayoutParams(-1, -1));
            heading.setText("B 站弹幕");
        } else {
            View back = circleButton("back", "返回上一层", this::back);
            leading.addView(back, new FrameLayout.LayoutParams(dp(40), dp(40)));
            heading.setText(titleForPage(page));
        }
    }

    // ------------------------------------------------------------------ navigation

    private void go(String target) {
        if (!target.equals(page)) history.push(page);
        render(target, false);
    }

    private void back() {
        String target = history.isEmpty() ? "home" : history.pop();
        render(target, false);
    }

    private void home() {
        history.clear();
        render("home", false);
    }

    private void render(String target, boolean keepScroll) {
        boolean leavingLogin = isLoginPage() && !"account".equals(target) && !"login".equals(target);
        if (leavingLogin) stopQr();
        int scrollY = keepScroll && scroll != null ? scroll.getScrollY() : 0;
        page = target;
        hideKeyboard();
        body.removeAllViews();
        qrView = null;
        qrOverlay = null;
        qrStatus = null;
        updateLeading();
        refreshHeader();
        switch (target) {
            case "home": renderHome(); break;
            case "search": renderSearch(); break;
            case "link": renderLink(); break;
            case "candidates": renderCandidates(); break;
            case "parts": renderParts(); break;
            case "episodes": renderEpisodes(); break;
            case "sync": renderSync(); break;
            case "display": renderDisplay(); break;
            case "filter": renderFilter(); break;
            case "find": renderFind(); break;
            case "account": renderAccount(); break;
            case "login": renderLogin(false); break;
        }
        if (scroll != null) scroll.post(() -> scroll.scrollTo(0, scrollY));
    }

    private boolean isLoginPage() {
        return "login".equals(page) || ("account".equals(page) && !BilibiliDanmakuSession.hasSession());
    }

    private String titleForPage(String key) {
        switch (key) {
            case "search": return "搜索 B 站视频";
            case "link": return "粘贴视频链接";
            case "candidates": return "选择匹配的视频";
            case "parts": return "选择分 P";
            case "episodes": return "选择剧集";
            case "sync": return "时间轴同步";
            case "display": return "显示样式";
            case "filter": return "弹幕过滤";
            case "find": return "搜索弹幕";
            case "account": return BilibiliDanmakuSession.hasSession() ? "B 站账号" : "登录 B 站";
            case "login": return "扫码登录";
            default: return "B 站弹幕";
        }
    }

    // ------------------------------------------------------------------ home

    private void renderHome() {
        boolean enabled = settings.getBoolean("enabled", false);
        boolean loggedIn = BilibiliDanmakuSession.hasSession();
        boolean expired = BilibiliDanmakuSession.isExpired();
        if (BilibiliDanmakuController.needsLogin() || expired) {
            banner("user", PINK, expired ? "B 站登录已失效" : "当前内容需要登录",
                    expired ? "重新扫码登录后即可继续加载弹幕，登录会自动续期。"
                            : "扫码登录 B 站后会自动重新加载这个视频的弹幕。",
                    "扫码登录", () -> go("login"), null);
        } else if (!loggedIn && !settings.getBoolean("login_banner_dismissed", false)) {
            banner("sparkle", BLUE, "登录 B 站，弹幕更完整",
                    "用 B 站 App 授权即可，无需复制 Cookie，登录会自动续期。",
                    "登录", () -> go("login"),
                    () -> {
                        settings.edit().putBoolean("login_banner_dismissed", true).apply();
                        render("home", true);
                    });
        }

        // Source card with the master switch.
        LinearLayout hero = column();
        hero.setBackground(round(surface, 20));
        hero.setClipToOutline(true);
        String source = BilibiliDanmakuController.displaySource();
        String sourceTitle = BilibiliDanmakuController.displaySourceTitle();
        String cover = BilibiliDanmakuController.displaySourceCover();
        boolean hasSource = !source.isEmpty();
        boolean openable = hasSource && !"本地 XML".equals(source);
        int count = BilibiliDanmakuController.loadedCount();
        String title = hasSource ? (sourceTitle.isEmpty() ? source : sourceTitle) : "尚未匹配 B 站视频";
        String meta;
        if (!hasSource) meta = enabled ? "正在按标题自动匹配，也可以手动搜索" : "开启弹幕后会按标题自动匹配";
        else if (count > 0) meta = formatCount(count) + " 条弹幕" + (openable ? " · 点按在 B 站打开" : "");
        else meta = "本地 XML".equals(source) ? "本地 XML 文件" : "正在加载弹幕…";
        LinearLayout sourceRow = row();
        sourceRow.setGravity(Gravity.CENTER_VERTICAL);
        sourceRow.setPadding(dp(12), dp(12), dp(12), dp(12));
        sourceRow.setBackground(rippleMask());
        sourceRow.setContentDescription(title + "，" + meta);
        sourceRow.setOnClickListener(v -> {
            if (openable) BilibiliDanmakuController.openCurrentSource(host);
            else go("search");
        });
        sourceRow.addView(poster(cover, 116), posterParams(116));
        LinearLayout texts = column();
        TextView name = text(title, 15, foreground, true);
        name.setMaxLines(2);
        name.setEllipsize(TextUtils.TruncateAt.END);
        name.setLineSpacing(dp(1), 1f);
        texts.addView(name);
        TextView detail = text(meta, 12, muted, false);
        detail.setMaxLines(2);
        detail.setPadding(0, dp(4), 0, 0);
        texts.addView(detail);
        sourceRow.addView(texts, new LinearLayout.LayoutParams(0, -2, 1));
        IconView trailing = new IconView(host, openable ? "open" : "next", muted, 2f);
        LinearLayout.LayoutParams trailingLp = new LinearLayout.LayoutParams(dp(18), dp(18));
        trailingLp.leftMargin = dp(8);
        sourceRow.addView(trailing, trailingLp);
        hero.addView(sourceRow);
        hero.addView(rule(dp(12)));
        LinearLayout toggleRow = row();
        toggleRow.setGravity(Gravity.CENTER_VERTICAL);
        toggleRow.setPadding(dp(16), dp(10), dp(12), dp(12));
        LinearLayout toggleText = column();
        toggleText.addView(text("显示弹幕", 15, foreground, true));
        toggleText.addView(text(enabled ? "已开启 · 随时可以暂停" : "已关闭", 12, muted, false));
        toggleRow.addView(toggleText, new LinearLayout.LayoutParams(0, -2, 1));
        Switch master = toggle(enabled, checked -> {
            if (checked) {
                if (!BilibiliDanmakuSession.hasSession() && !settings.getBoolean("account_prompt_seen", false)) {
                    enableAfterLogin = true;
                    go("account");
                    return;
                }
                BilibiliDanmakuController.enableDanmaku(host);
            } else BilibiliDanmakuController.disableDanmaku(host);
            render("home", true);
        });
        toggleRow.addView(master);
        toggleRow.setOnClickListener(v -> master.setChecked(!master.isChecked()));
        hero.addView(toggleRow);
        addBlock(hero, 12);

        // Quick source actions.
        LinearLayout actions = row();
        actions.addView(actionTile("refresh", "重新匹配", () -> {
            BilibiliDanmakuController.restartAutoSearch(host);
            render("home", true);
        }), tileParams(false));
        actions.addView(actionTile("search", "搜索视频", () -> go("search")), tileParams(true));
        actions.addView(actionTile("link", "粘贴链接", () -> go("link")), tileParams(true));
        actions.addView(actionTile("file", "导入 XML", () -> {
            dialog.dismiss();
            BilibiliDanmakuController.openXmlPicker(host);
        }), tileParams(true));
        addBlock(actions, 6);

        section("播放与外观");
        LinearLayout tuning = group();
        listRow(tuning, "sync", BLUE, "时间轴同步", syncSummary(), null, () -> go("sync"));
        listRow(tuning, "tune", Color.rgb(124, 92, 255), "显示样式", "字号、透明度、行距与显示区域", null, () -> go("display"));
        listRow(tuning, "filter", Color.rgb(255, 128, 64), "弹幕过滤", filterSummary(), null, () -> go("filter"));
        listRow(tuning, "find", GREEN, "搜索弹幕", "查找弹幕并跳转到对应时间", null, () -> go("find"));

        section("账号");
        LinearLayout account = group();
        BilibiliDanmakuSession.State state = BilibiliDanmakuSession.state();
        String accountTitle = !loggedIn ? "登录 B 站账号"
                : (state != null && !state.name.isEmpty() ? state.name : "已登录 B 站");
        String accountDetail = !loggedIn ? "扫码授权，弹幕更完整"
                : expired ? "登录已失效，点按重新登录"
                : state != null && state.canRenew() ? "扫码登录 · 自动续期已开启" : "旧版凭证 · 建议改用扫码登录";
        View avatar = loggedIn && state != null && !state.face.isEmpty() ? avatar(state.face, 36) : null;
        listRow(account, avatar == null ? "user" : null, PINK, accountTitle, accountDetail, null,
                () -> go("account"), avatar);
    }

    private String syncSummary() {
        float rate = settings.getFloat("rate", 1f);
        long offset = settings.getLong("offset_ms", 0);
        if (Math.abs(rate - 1f) < .001f && offset == 0) return "未调整 · 偏移与播放倍率";
        return String.format(Locale.ROOT, "倍率 %.2f× · 偏移 %+.1f s", rate, offset / 1000f);
    }

    private String filterSummary() {
        List<String> parts = new ArrayList<>();
        if (settings.getBoolean("hide_color", false)) parts.add("屏蔽彩色");
        if (settings.getBoolean("hide_fixed", false)) parts.add("屏蔽固定");
        String words = settings.getString("keywords", "");
        if (words != null && !words.trim().isEmpty()) parts.add("关键词");
        return parts.isEmpty() ? "颜色、固定弹幕与关键词" : "已启用：" + TextUtils.join("、", parts);
    }

    // ------------------------------------------------------------------ source pages

    private void renderSearch() {
        hint("按关键词搜索 B 站稿件，结果会显示封面、时长和弹幕数量。");
        EditText query = input("视频名称或关键词",
                searchText.isEmpty() ? VideoInformation.getVideoTitle() : searchText, false);
        query.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
        addBlock(query, 12);
        Runnable submit = () -> {
            searchText = query.getText().toString().trim();
            if (searchText.isEmpty()) { message("请输入搜索关键词"); return; }
            hideKeyboard();
            searching = true;
            BilibiliDanmakuController.search(host, searchText, false);
            render("search", true);
        };
        query.setOnEditorActionListener((v, actionId, event) -> {
            if (actionId == EditorInfo.IME_ACTION_SEARCH) { submit.run(); return true; }
            return false;
        });
        if (searching) progressLine("正在搜索 B 站…");
        else primary("搜索", submit);
        if (!candidates.isEmpty() && !searching) tonal("查看上次结果（" + candidates.size() + "）", () -> go("candidates"));
    }

    private void renderLink() {
        hint("粘贴 B 站分享文本、视频或番剧链接，也可以直接填写编号。");
        EditText link = input("粘贴链接或 BV / av / ep / ss 编号", "", true);
        link.setImeOptions(EditorInfo.IME_ACTION_GO);
        addBlock(link, 10);
        LinearLayout chips = row();
        for (String label : new String[]{"BV 号", "av 号", "ep / ss", "b23.tv 短链"}) {
            TextView chip = chip(label, surfaceStrong, muted);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-2, -2);
            lp.rightMargin = dp(6);
            chips.addView(chip, lp);
        }
        addBlock(chips, 14);
        Runnable submit = () -> {
            String reference = link.getText().toString().trim();
            if (reference.isEmpty()) { message("请输入 B 站视频链接或编号"); return; }
            hideKeyboard();
            homeAfterSource = true;
            BilibiliDanmakuController.manual(host, reference);
            refreshHeader();
        };
        link.setOnEditorActionListener((v, actionId, event) -> {
            if (actionId == EditorInfo.IME_ACTION_GO) { submit.run(); return true; }
            return false;
        });
        primary("解析并加载弹幕", submit);
    }

    private void renderCandidates() {
        hint("找到 " + candidates.size() + " 个稿件，请核对标题、时长与弹幕数量。");
        for (BilibiliDanmakuSource.Candidate entry : candidates) {
            LinearLayout card = row();
            card.setGravity(Gravity.CENTER_VERTICAL);
            card.setPadding(dp(10), dp(10), dp(12), dp(10));
            card.setBackground(ripple(surface, 18));
            card.setClickable(true);
            card.setContentDescription(entry.title);
            card.setOnClickListener(v -> {
                homeAfterSource = true;
                BilibiliDanmakuController.choosePage(host, entry.bvid);
                refreshHeader();
            });
            card.addView(poster(entry.cover, 120), posterParams(120));
            LinearLayout texts = column();
            TextView name = text(entry.title, 14, foreground, true);
            name.setMaxLines(2);
            name.setEllipsize(TextUtils.TruncateAt.END);
            texts.addView(name);
            LinearLayout chips = row();
            chips.setGravity(Gravity.CENTER_VERTICAL);
            chips.addView(chip(duration(entry.durationSeconds), blueSoft, BLUE));
            TextView count = text(formatCount(entry.danmakuCount) + " 弹幕", 11, muted, false);
            count.setPadding(dp(8), 0, 0, 0);
            chips.addView(count);
            LinearLayout.LayoutParams chipsLp = new LinearLayout.LayoutParams(-1, -2);
            chipsLp.topMargin = dp(7);
            texts.addView(chips, chipsLp);
            card.addView(texts, new LinearLayout.LayoutParams(0, -2, 1));
            addBlock(card, 8);
        }
    }

    private void renderParts() {
        hint("这个稿件包含 " + parts.size() + " 个分 P，请选择与当前 YouTube 视频对应的一段。");
        LinearLayout list = group();
        for (BilibiliDanmakuSource.Page entry : parts) {
            TextView badge = chip("P" + entry.number, blueSoft, BLUE);
            listRow(list, null, BLUE, entry.title, "", null, () -> {
                String url = pageReference.contains("://") ? pageReference
                        : "https://www.bilibili.com/video/" + pageReference;
                BilibiliDanmakuController.loadVideoSource(host,
                        url + (url.contains("?") ? "&" : "?") + "p=" + entry.number);
                home();
            }, badge);
        }
    }

    private void renderEpisodes() {
        hint("选择当前 YouTube 视频对应的剧集。");
        LinearLayout list = group();
        for (BilibiliDanmakuSource.Episode entry : episodes) {
            listRow(list, "video", BLUE, entry.title.trim(), "ep" + entry.id, null, () -> {
                BilibiliDanmakuController.loadVideoSource(host, "ep" + entry.id);
                home();
            });
        }
    }

    // ------------------------------------------------------------------ settings pages

    private void renderSync() {
        note("info", BLUE, "B 站弹幕时间 = YouTube 时间 × 倍率 + 偏移。拖动或直接输入数字，设置立即生效。");
        LinearLayout list = group();
        float rate = settings.getFloat("rate", 1f);
        editableSlider(list, "播放倍率", "两站视频速度不同时微调", 25, 400, Math.round(rate * 100), true, "×",
                rate, .25, 4, value -> {
                    settings.edit().putFloat("rate", (float) value).apply();
                    BilibiliDanmakuController.updateView();
                });
        long milliseconds = settings.getLong("offset_ms", 0);
        editableSlider(list, "时间偏移", "正数让弹幕延后出现，单位：秒", -120, 120,
                (int) Math.max(-120, Math.min(120, Math.round(milliseconds / 1000f))), false, "s",
                milliseconds / 1000d, -36000, 36000, value -> {
                    settings.edit().putLong("offset_ms", Math.round(value * 1000d)).apply();
                    BilibiliDanmakuController.updateView();
                });
        tonal("恢复默认", () -> {
            settings.edit().putFloat("rate", 1f).putLong("offset_ms", 0).apply();
            BilibiliDanmakuController.updateView();
            render("sync", true);
        });
    }

    private void renderDisplay() {
        StylePreview preview = new StylePreview(host);
        LinearLayout.LayoutParams previewLp = new LinearLayout.LayoutParams(-1, dp(128));
        previewLp.bottomMargin = dp(12);
        body.addView(preview, previewLp);
        LinearLayout list = group();
        settingSlider(list, preview, "弹幕字号", "font", 10, 40, 19, v -> v + " sp");
        settingSlider(list, preview, "不透明度", "opacity", 5, 100, 85, v -> v + "%");
        settingSlider(list, preview, "行距", "line_spacing", 80, 200,
                BilibiliDanmakuOverlayView.DEFAULT_LINE_SPACING, v -> v + "%");
        settingSlider(list, preview, "滚动时长", "travel", 3, 25, 8, v -> v + " s");
        settingSlider(list, preview, "显示区域", "area", 20, 100, 75, v -> v + "%");
        settingSlider(list, preview, "最大文字长度", "max_len", 1, 500, 120, v -> v + " 字");
        hint("滚动时长越短，弹幕移动越快；显示区域按视频高度计算，竖屏全屏时会自动避开标题和进度条。");
        tonal("恢复显示默认值", () -> {
            settings.edit().putInt("font", 19).putInt("opacity", 85).putInt("travel", 8)
                    .putInt("area", 75).putInt("max_len", 120)
                    .putInt("line_spacing", BilibiliDanmakuOverlayView.DEFAULT_LINE_SPACING).apply();
            BilibiliDanmakuController.updateView();
            render("display", true);
        });
    }

    private void renderFilter() {
        LinearLayout list = group();
        switchRow(list, "palette", Color.rgb(255, 128, 64), "屏蔽彩色弹幕", "只显示白色弹幕", "hide_color");
        switchRow(list, "pin", Color.rgb(124, 92, 255), "屏蔽固定弹幕", "隐藏顶部与底部的固定弹幕", "hide_fixed");
        section("关键词屏蔽");
        EditText words = input("例如：剧透, 刷屏, 关键词", settings.getString("keywords", ""), true);
        addBlock(words, 6);
        hint("使用逗号、分号或换行分隔多个关键词，不区分大小写。");
        primary("保存关键词", () -> {
            settings.edit().putString("keywords", words.getText().toString()).apply();
            BilibiliDanmakuController.updateView();
            hideKeyboard();
            message("屏蔽关键词已保存");
        });
    }

    private void renderFind() {
        if (!BilibiliDanmakuController.hasComments()) {
            empty("find", "还没有弹幕", "先为当前视频匹配 B 站来源，再来搜索弹幕。");
            tonal("去选择来源", this::home);
            return;
        }
        EditText query = input("输入弹幕中的文字", findKeyword, false);
        query.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
        addBlock(query, 12);
        Runnable submit = () -> {
            String keyword = query.getText().toString().trim();
            if (keyword.isEmpty()) { message("请输入关键词"); return; }
            findKeyword = keyword;
            findMatches = BilibiliDanmakuController.findComments(keyword);
            render("find", false);
        };
        query.setOnEditorActionListener((v, actionId, event) -> {
            if (actionId == EditorInfo.IME_ACTION_SEARCH) { submit.run(); return true; }
            return false;
        });
        primary("查找", submit);
        if (findMatches == null) return;
        section("“" + findKeyword + "” · " + findMatches.size() + " 条结果");
        if (findMatches.isEmpty()) {
            hint("没有找到包含该文字的弹幕，换个关键词试试。");
            return;
        }
        LinearLayout list = group();
        for (DanmakuComment comment : findMatches) {
            TextView time = chip(duration((int) (comment.timeMs / 1000)), blueSoft, BLUE);
            View row = listRow(list, null, BLUE, comment.text, "", null, () -> {
                BilibiliDanmakuController.seekToComment(host, comment);
                dialog.dismiss();
            }, time);
            row.setMinimumHeight(dp(52));
        }
    }

    // ------------------------------------------------------------------ account

    private void renderAccount() {
        if (!BilibiliDanmakuSession.hasSession()) {
            renderLogin(!settings.getBoolean("account_prompt_seen", false));
            return;
        }
        BilibiliDanmakuSession.State state = BilibiliDanmakuSession.state();
        if (state == null) return;
        boolean expired = BilibiliDanmakuSession.isExpired();

        LinearLayout profile = row();
        profile.setGravity(Gravity.CENTER_VERTICAL);
        profile.setPadding(dp(16), dp(16), dp(16), dp(16));
        profile.setBackground(round(surface, 20));
        View face = state.face.isEmpty() ? iconTile("user", PINK, 56) : avatar(state.face, 56);
        LinearLayout.LayoutParams faceLp = new LinearLayout.LayoutParams(dp(56), dp(56));
        faceLp.rightMargin = dp(14);
        profile.addView(face, faceLp);
        LinearLayout info = column();
        String uid = state.cookie("DedeUserID");
        info.addView(text(state.name.isEmpty() ? (uid.isEmpty() ? "B 站用户" : "UID " + uid) : state.name,
                18, foreground, true));
        LinearLayout chips = row();
        if (state.level >= 0) {
            chips.addView(chip("LV" + state.level, blend(background, PINK, dark ? .22f : .14f), PINK));
            chips.addView(new View(host), new LinearLayout.LayoutParams(dp(6), 1));
        }
        chips.addView(state.canRenew() ? chip("扫码登录", blueSoft, BLUE)
                : chip("旧版凭证", blend(background, AMBER, dark ? .22f : .14f), AMBER));
        LinearLayout.LayoutParams chipsLp = new LinearLayout.LayoutParams(-2, -2);
        chipsLp.topMargin = dp(6);
        info.addView(chips, chipsLp);
        profile.addView(info, new LinearLayout.LayoutParams(0, -2, 1));
        addBlock(profile, 12);
        if (state.name.isEmpty() && !expired) refreshProfileInBackground(false);

        LinearLayout status = group();
        long checked = BilibiliDanmakuSession.lastChecked();
        listRow(status, "shield", expired ? RED : GREEN, "登录状态",
                expired ? "已失效，请重新扫码登录" : "有效" + (checked > 0 ? " · " + relativeTime(checked) + "检查" : ""),
                null, null);
        listRow(status, "sync", state.canRenew() ? BLUE : AMBER, "自动续期",
                state.canRenew() ? "已开启 · B 站要求时在后台自动更新凭证" : "不可用 · 旧版导入的凭证无法续期",
                null, null);
        listRow(status, "lock", Color.rgb(124, 92, 255), "仅保存在本机",
                "凭证经 Android Keystore 加密，只发送给 B 站官方接口", null, null);

        if (expired || !state.canRenew()) {
            note("warning", AMBER, "旧版导入的 SESSDATA 与电脑浏览器共用同一会话，浏览器刷新登录后它会失效。"
                    + "改用扫码登录可获得独立会话，并自动续期。");
            primary("改用扫码登录", () -> go("login"));
        }
        LinearLayout buttons = row();
        TextView check = pill("检查状态", blueSoft, BLUE, null, 46);
        check.setOnClickListener(v -> {
            check.setText("检查中…");
            refreshProfileInBackground(true);
        });
        buttons.addView(check, new LinearLayout.LayoutParams(0, dp(46), 1));
        View gap = new View(host);
        buttons.addView(gap, new LinearLayout.LayoutParams(dp(10), 1));
        buttons.addView(pill("切换账号", blueSoft, BLUE, () -> go("login"), 46),
                new LinearLayout.LayoutParams(0, dp(46), 1));
        LinearLayout.LayoutParams buttonsLp = new LinearLayout.LayoutParams(-1, -2);
        buttonsLp.topMargin = dp(4);
        body.addView(buttons, buttonsLp);
        TextView logout = textButton("退出登录", RED, null);
        logout.setOnClickListener(v -> {
            if (!"confirm".equals(logout.getTag())) {
                logout.setTag("confirm");
                logout.setText("再次点按确认退出");
                logout.postDelayed(() -> {
                    logout.setTag(null);
                    logout.setText("退出登录");
                }, 3500);
                return;
            }
            logout.setEnabled(false);
            WORKER.execute(() -> {
                BilibiliDanmakuAuth.logout();
                MAIN.post(() -> {
                    message("已退出 B 站登录");
                    if (dialog.isShowing()) home();
                });
            });
        });
    }

    private void refreshProfileInBackground(boolean announce) {
        WORKER.execute(() -> {
            String result;
            try {
                BilibiliDanmakuSession.State state = BilibiliDanmakuSession.state();
                if (state != null && state.canRenew() && announce) BilibiliDanmakuAuth.renew(false);
                BilibiliDanmakuAuth.Profile profile = BilibiliDanmakuAuth.fetchProfile();
                if (profile.loggedIn) {
                    BilibiliDanmakuSession.markChecked();
                    result = "登录有效";
                } else if (state != null && state.canRenew() && BilibiliDanmakuAuth.recoverSignedOut()) {
                    BilibiliDanmakuAuth.fetchProfile();
                    result = "已自动续期登录";
                } else {
                    BilibiliDanmakuSession.setExpired(true);
                    result = "登录已失效，请重新扫码登录";
                }
            } catch (Exception error) {
                result = "检查失败：" + error.getMessage();
            }
            final String text = result;
            MAIN.post(() -> {
                if (announce) message(text);
                if (dialog.isShowing() && "account".equals(page)) render("account", true);
            });
        });
    }

    private void renderLogin(boolean welcome) {
        LinearLayout intro = column();
        intro.setGravity(Gravity.CENTER_HORIZONTAL);
        intro.setPadding(dp(8), dp(4), dp(8), dp(14));
        TextView title = text(welcome ? "开始使用 B 站弹幕" : "用 B 站 App 授权登录", 20, foreground, true);
        title.setGravity(Gravity.CENTER);
        intro.addView(title);
        TextView description = text(welcome
                ? "登录后可获取更完整的弹幕，未登录也能直接使用。登录凭证只加密保存在本机，并会自动续期。"
                : "登录后可获取更完整的弹幕。凭证只加密保存在本机，并按 B 站规则自动续期，无需反复复制 Cookie。",
                13, muted, false);
        description.setGravity(Gravity.CENTER);
        description.setLineSpacing(dp(3), 1f);
        description.setPadding(0, dp(6), 0, 0);
        intro.addView(description);
        body.addView(intro);

        // QR card.
        LinearLayout card = column();
        card.setGravity(Gravity.CENTER_HORIZONTAL);
        card.setPadding(dp(16), dp(18), dp(16), dp(14));
        card.setBackground(round(surface, 22));
        FrameLayout frame = new FrameLayout(host);
        frame.setBackground(round(Color.WHITE, 18));
        frame.setPadding(dp(10), dp(10), dp(10), dp(10));
        qrView = new QrView(host);
        frame.addView(qrView, new FrameLayout.LayoutParams(-1, -1));
        qrOverlay = text("", 14, Color.rgb(24, 25, 28), true);
        qrOverlay.setGravity(Gravity.CENTER);
        qrOverlay.setBackground(round(Color.argb(238, 255, 255, 255), 12));
        qrOverlay.setOnClickListener(v -> {
            if (qrState == QR_EXPIRED || qrState == QR_FAILED) startQr();
        });
        frame.addView(qrOverlay, new FrameLayout.LayoutParams(-1, -1));
        card.addView(frame, new LinearLayout.LayoutParams(dp(196), dp(196)));
        LinearLayout statusRow = row();
        statusRow.setGravity(Gravity.CENTER);
        qrStatusDot = new View(host);
        LinearLayout.LayoutParams dotLp = new LinearLayout.LayoutParams(dp(7), dp(7));
        dotLp.rightMargin = dp(7);
        statusRow.addView(qrStatusDot, dotLp);
        qrStatus = text("", 13, foreground, false);
        statusRow.addView(qrStatus);
        LinearLayout.LayoutParams statusLp = new LinearLayout.LayoutParams(-2, -2);
        statusLp.topMargin = dp(12);
        card.addView(statusRow, statusLp);
        addBlock(card, 12);

        primary("打开哔哩哔哩 App 确认登录", this::openBilibiliApp);
        LinearLayout buttons = row();
        buttons.addView(pill("保存二维码", blueSoft, BLUE, this::saveQrImage, 44),
                new LinearLayout.LayoutParams(0, dp(44), 1));
        buttons.addView(new View(host), new LinearLayout.LayoutParams(dp(10), 1));
        buttons.addView(pill("刷新二维码", blueSoft, BLUE, this::startQr, 44),
                new LinearLayout.LayoutParams(0, dp(44), 1));
        addBlock(buttons, 14);

        LinearLayout steps = group();
        stepRow(steps, 1, "同一台手机", "点按上方按钮跳转到 B 站 App，确认登录后返回这里，会自动完成。");
        stepRow(steps, 2, "无法跳转时", "保存二维码，在 B 站 App 首页「扫一扫」中从相册选择它。");
        stepRow(steps, 3, "另一台设备", "直接用另一台手机上的 B 站 App 扫描屏幕上的二维码。");

        if (!BilibiliDanmakuSession.hasSession()) {
            textButton(welcome ? "暂不登录，直接使用" : "暂不登录", muted, () -> {
                settings.edit().putBoolean("account_prompt_seen", true).apply();
                if (enableAfterLogin) {
                    enableAfterLogin = false;
                    BilibiliDanmakuController.enableDanmaku(host);
                }
                home();
            });
        }

        bindQr();
        boolean fresh = qrCode != null && System.currentTimeMillis() - qrStartedAt < QR_LIFETIME_MS;
        if (!(qrPolling && fresh) && qrState != QR_SUCCESS) startQr();
    }

    private void stepRow(LinearLayout group, int number, String title, String detail) {
        TextView badge = text(String.valueOf(number), 13, BLUE, true);
        badge.setGravity(Gravity.CENTER);
        badge.setBackground(oval(blueSoft));
        badge.setLayoutParams(new LinearLayout.LayoutParams(dp(28), dp(28)));
        listRow(group, null, BLUE, title, detail, null, null, badge);
    }

    // ------------------------------------------------------------------ QR login flow

    private void startQr() {
        int ticket = ++qrGeneration;
        qrPolling = false;
        qrTicket = null;
        qrCode = null;
        setQrState(QR_LOADING, "正在生成二维码…");
        WORKER.execute(() -> {
            BilibiliDanmakuAuth.QrTicket created = null;
            BilibiliQrCode code = null;
            Exception failure = null;
            try {
                created = BilibiliDanmakuAuth.createQr();
                code = BilibiliQrCode.encode(created.url);
            } catch (Exception error) { failure = error; }
            final BilibiliDanmakuAuth.QrTicket result = created;
            final BilibiliQrCode matrix = code;
            final Exception error = failure;
            MAIN.post(() -> {
                if (ticket != qrGeneration) return;
                if (error != null || result == null) {
                    setQrState(QR_FAILED, "二维码获取失败，点按重试");
                    return;
                }
                qrTicket = result;
                qrCode = matrix;
                qrStartedAt = System.currentTimeMillis();
                qrPolling = true;
                setQrState(QR_READY, "等待在 B 站 App 中确认");
                schedulePoll(ticket);
            });
        });
    }

    private void stopQr() {
        qrGeneration++;
        qrPolling = false;
        if (qrState != QR_SUCCESS) qrState = QR_LOADING;
    }

    private void schedulePoll(int ticket) {
        MAIN.postDelayed(() -> pollOnce(ticket), 1500);
    }

    private void pollOnce(int ticket) {
        if (ticket != qrGeneration || !dialog.isShowing() || qrTicket == null) return;
        if (System.currentTimeMillis() - qrStartedAt > QR_LIFETIME_MS) {
            qrPolling = false;
            setQrState(QR_EXPIRED, "二维码已过期，点按刷新");
            return;
        }
        String key = qrTicket.key;
        WORKER.execute(() -> {
            int code;
            try { code = BilibiliDanmakuAuth.pollQr(key); }
            catch (Exception transientError) { code = -1; }
            final int result = code;
            MAIN.post(() -> {
                if (ticket != qrGeneration) return;
                switch (result) {
                    case BilibiliDanmakuAuth.QR_DONE:
                        qrPolling = false;
                        setQrState(QR_SUCCESS, "登录成功");
                        loginCompleted();
                        return;
                    case BilibiliDanmakuAuth.QR_EXPIRED:
                        qrPolling = false;
                        setQrState(QR_EXPIRED, "二维码已过期，点按刷新");
                        return;
                    case BilibiliDanmakuAuth.QR_SCANNED:
                        if (qrState != QR_SCANNED) setQrState(QR_SCANNED, "已扫码，请在 App 中点按确认");
                        break;
                    case BilibiliDanmakuAuth.QR_WAITING:
                        if (qrState != QR_READY) setQrState(QR_READY, "等待在 B 站 App 中确认");
                        break;
                    default:
                        break; // Network hiccup: keep polling until the code expires.
                }
                schedulePoll(ticket);
            });
        });
    }

    private void setQrState(int state, String message) {
        qrState = state;
        qrMessage = message;
        bindQr();
    }

    private void bindQr() {
        if (qrView == null) return;
        qrView.setCode(qrCode);
        String overlay;
        switch (qrState) {
            case QR_LOADING: overlay = "正在生成…"; break;
            case QR_SCANNED: overlay = "✓ 已扫码\n请在手机上确认"; break;
            case QR_EXPIRED: overlay = "二维码已过期\n点按刷新"; break;
            case QR_FAILED: overlay = "获取失败\n点按重试"; break;
            case QR_SUCCESS: overlay = "✓ 登录成功"; break;
            default: overlay = null;
        }
        qrOverlay.setVisibility(overlay == null ? View.GONE : View.VISIBLE);
        if (overlay != null) qrOverlay.setText(overlay);
        qrOverlay.setTextColor(qrState == QR_SUCCESS || qrState == QR_SCANNED ? GREEN : Color.rgb(24, 25, 28));
        qrStatus.setText(qrMessage);
        int color;
        switch (qrState) {
            case QR_SUCCESS: case QR_SCANNED: color = GREEN; break;
            case QR_EXPIRED: color = AMBER; break;
            case QR_FAILED: color = RED; break;
            default: color = BLUE;
        }
        qrStatusDot.setBackground(oval(color));
    }

    private void openBilibiliApp() {
        if (qrTicket == null || qrState == QR_EXPIRED) {
            message("二维码尚未就绪，请稍候");
            if (qrState == QR_EXPIRED || qrState == QR_FAILED) startQr();
            return;
        }
        Intent intent = new Intent(Intent.ACTION_VIEW,
                Uri.parse(BilibiliDanmakuAuth.appAuthorisationLink(qrTicket.url)));
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            host.startActivity(intent);
            setQrState(qrState, "在 B 站 App 中确认后返回这里");
        } catch (ActivityNotFoundException missing) {
            message("未检测到哔哩哔哩 App，请保存二维码或用另一台设备扫码");
        } catch (Exception error) {
            message("无法打开 B 站 App：" + error.getMessage());
        }
    }

    private void saveQrImage() {
        BilibiliQrCode code = qrCode;
        if (code == null) { message("二维码尚未就绪，请稍候"); return; }
        ContentResolver resolver = host.getContentResolver();
        WORKER.execute(() -> {
            String result;
            try {
                int quiet = 4;
                int scale = Math.max(8, 760 / (code.size + quiet * 2));
                int sizePx = (code.size + quiet * 2) * scale;
                Bitmap bitmap = Bitmap.createBitmap(sizePx, sizePx, Bitmap.Config.ARGB_8888);
                Canvas canvas = new Canvas(bitmap);
                canvas.drawColor(Color.WHITE);
                Paint paint = new Paint();
                paint.setColor(Color.BLACK);
                for (int y = 0; y < code.size; y++)
                    for (int x = 0; x < code.size; x++)
                        if (code.get(x, y)) canvas.drawRect((x + quiet) * scale, (y + quiet) * scale,
                                (x + quiet + 1) * scale, (y + quiet + 1) * scale, paint);
                ContentValues values = new ContentValues();
                values.put(MediaStore.Images.Media.DISPLAY_NAME, "bilibili-login-" + System.currentTimeMillis() + ".png");
                values.put(MediaStore.Images.Media.MIME_TYPE, "image/png");
                values.put(MediaStore.Images.Media.RELATIVE_PATH, Environment.DIRECTORY_PICTURES + "/Morphe");
                values.put(MediaStore.Images.Media.IS_PENDING, 1);
                Uri uri = resolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, values);
                if (uri == null) throw new IllegalStateException("相册不可用");
                try (OutputStream out = resolver.openOutputStream(uri)) {
                    if (out == null || !bitmap.compress(Bitmap.CompressFormat.PNG, 100, out))
                        throw new IllegalStateException("写入失败");
                }
                values.clear();
                values.put(MediaStore.Images.Media.IS_PENDING, 0);
                resolver.update(uri, values, null, null);
                deleteSavedQr();
                savedQrImage = uri;
                result = "已保存到相册 Pictures/Morphe，登录成功后会自动删除";
            } catch (Exception error) {
                result = "保存失败：" + error.getMessage();
            }
            final String text = result;
            MAIN.post(() -> message(text));
        });
    }

    private void deleteSavedQr() {
        Uri uri = savedQrImage;
        savedQrImage = null;
        if (uri == null) return;
        try { host.getContentResolver().delete(uri, null, null); } catch (Exception ignored) { }
    }

    /** Called once the QR login has been saved. */
    private void loginCompleted() {
        settings.edit().putBoolean("account_prompt_seen", true).apply();
        WORKER.execute(this::deleteSavedQr);
        BilibiliDanmakuController.reloadAfterLogin();
        if (enableAfterLogin) {
            enableAfterLogin = false;
            BilibiliDanmakuController.enableDanmaku(host);
        }
        BilibiliDanmakuSession.State state = BilibiliDanmakuSession.state();
        message(state != null && !state.name.isEmpty() ? "已登录 B 站：" + state.name : "B 站登录成功");
        MAIN.postDelayed(() -> {
            if (dialog.isShowing() && ("login".equals(page) || "account".equals(page)))
                home();
        }, 900);
    }

    // ------------------------------------------------------------------ building blocks

    private interface IntegerChange { void apply(int value); }
    private interface DecimalChange { void apply(double value); }
    private interface BooleanChange { void apply(boolean value); }
    private interface Format { String of(int value); }

    private void addBlock(View view, int bottomMarginDp) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, -2);
        lp.bottomMargin = dp(bottomMarginDp);
        body.addView(view, lp);
    }

    private LinearLayout group() {
        LinearLayout list = column();
        list.setBackground(round(surface, 18));
        list.setClipToOutline(true);
        addBlock(list, 10);
        return list;
    }

    private View listRow(LinearLayout group, String icon, int tint, String title, String detail,
                         View trailing, Runnable click) {
        return listRow(group, icon, tint, title, detail, trailing, click, null);
    }

    /** A row inside a grouped card; {@code leadingView} replaces the icon tile if given. */
    private View listRow(LinearLayout group, String icon, int tint, String title, String detail,
                         View trailing, Runnable click, View leadingView) {
        if (group.getChildCount() > 0) {
            View line = new View(host);
            line.setBackgroundColor(divider);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, Math.max(1, dp(1) / 2 + 1));
            lp.leftMargin = icon != null || leadingView != null ? dp(64) : dp(16);
            group.addView(line, lp);
        }
        LinearLayout line = row();
        line.setGravity(Gravity.CENTER_VERTICAL);
        line.setPadding(dp(14), dp(12), dp(12), dp(12));
        line.setMinimumHeight(dp(60));
        if (click != null) {
            line.setBackground(rippleMask());
            line.setClickable(true);
            line.setFocusable(true);
            line.setOnClickListener(v -> click.run());
        }
        line.setContentDescription(detail == null || detail.isEmpty() ? title : title + "，" + detail);
        View lead = leadingView != null ? leadingView : icon != null ? iconTile(icon, tint, 36) : null;
        if (lead != null) {
            LinearLayout.LayoutParams lp;
            if (lead.getLayoutParams() instanceof LinearLayout.LayoutParams)
                lp = new LinearLayout.LayoutParams((LinearLayout.LayoutParams) lead.getLayoutParams());
            else if (lead instanceof TextView) lp = new LinearLayout.LayoutParams(-2, -2);
            else lp = new LinearLayout.LayoutParams(dp(36), dp(36));
            lp.rightMargin = dp(14);
            line.addView(lead, lp);
        }
        LinearLayout copy = column();
        TextView titleView = text(title, 15, foreground, true);
        titleView.setMaxLines(3);
        titleView.setEllipsize(TextUtils.TruncateAt.END);
        copy.addView(titleView);
        if (detail != null && !detail.isEmpty()) {
            TextView details = text(detail, 12, muted, false);
            details.setPadding(0, dp(2), 0, 0);
            details.setMaxLines(3);
            details.setLineSpacing(dp(1), 1f);
            copy.addView(details);
        }
        line.addView(copy, new LinearLayout.LayoutParams(0, -2, 1));
        if (trailing != null) {
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-2, -2);
            lp.leftMargin = dp(8);
            line.addView(trailing, lp);
        } else if (click != null) {
            IconView arrow = new IconView(host, "next", muted, 2f);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(18), dp(18));
            lp.leftMargin = dp(8);
            line.addView(arrow, lp);
        }
        group.addView(line);
        return line;
    }

    private void switchRow(LinearLayout group, String icon, int tint, String title, String detail, String key) {
        Switch control = toggle(settings.getBoolean(key, false), value -> {
            settings.edit().putBoolean(key, value).apply();
            BilibiliDanmakuController.updateView();
        });
        listRow(group, icon, tint, title, detail, control, () -> control.setChecked(!control.isChecked()));
    }

    private void settingSlider(LinearLayout group, StylePreview preview, String label, String key,
                               int min, int max, int fallback, Format format) {
        slider(group, label, null, min, max, settings.getInt(key, fallback), format, value -> {
            settings.edit().putInt(key, value).apply();
            BilibiliDanmakuController.updateView();
            preview.invalidate();
        });
    }

    private void slider(LinearLayout group, String label, String detail, int min, int max, int initial,
                        Format format, IntegerChange action) {
        LinearLayout outer = sliderShell(group);
        LinearLayout top = row();
        top.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout copy = column();
        copy.addView(text(label, 15, foreground, true));
        if (detail != null) copy.addView(text(detail, 12, muted, false));
        top.addView(copy, new LinearLayout.LayoutParams(0, -2, 1));
        TextView value = chip(format.of(initial), blueSoft, BLUE);
        value.setTextSize(13);
        top.addView(value);
        outer.addView(top);
        SeekBar seek = seekBar(max - min, initial - min);
        seek.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                value.setText(format.of(min + progress));
                if (fromUser) action.apply(min + progress);
            }
            @Override public void onStartTrackingTouch(SeekBar bar) {}
            @Override public void onStopTrackingTouch(SeekBar bar) {}
        });
        outer.addView(seek, seekParams());
    }

    /** Slider whose value can also be typed precisely (sync rate and offset). */
    private void editableSlider(LinearLayout group, String label, String detail, int min, int max, int initial,
                                boolean hundredths, String unit, double preciseInitial, double preciseMin,
                                double preciseMax, DecimalChange action) {
        LinearLayout outer = sliderShell(group);
        LinearLayout top = row();
        top.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout copy = column();
        copy.addView(text(label, 15, foreground, true));
        copy.addView(text(detail, 12, muted, false));
        top.addView(copy, new LinearLayout.LayoutParams(0, -2, 1));
        EditText number = new EditText(host);
        number.setText(String.format(Locale.ROOT, "%.2f", preciseInitial));
        number.setTextSize(14);
        number.setTypeface(medium);
        number.setTextColor(BLUE);
        number.setSelectAllOnFocus(true);
        number.setSingleLine(true);
        number.setGravity(Gravity.CENTER);
        number.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_FLAG_DECIMAL
                | InputType.TYPE_NUMBER_FLAG_SIGNED);
        number.setImeOptions(EditorInfo.IME_ACTION_DONE);
        number.setBackground(round(blueSoft, 10));
        number.setPadding(dp(10), dp(6), dp(10), dp(6));
        number.setMinWidth(dp(72));
        number.setContentDescription(label + "（可直接输入数字）");
        top.addView(number);
        TextView suffix = text(unit, 14, BLUE, true);
        suffix.setPadding(dp(6), 0, 0, 0);
        top.addView(suffix);
        outer.addView(top);
        SeekBar seek = seekBar(max - min, Math.min(max - min, Math.max(0, initial - min)));
        final double[] last = {preciseInitial};
        seek.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                if (!fromUser) return;
                double next = hundredths ? (min + progress) / 100.0 : min + progress;
                last[0] = next;
                if (!number.hasFocus()) number.setText(String.format(Locale.ROOT, "%.2f", next));
                action.apply(next);
            }
            @Override public void onStartTrackingTouch(SeekBar bar) {}
            @Override public void onStopTrackingTouch(SeekBar bar) {}
        });
        Runnable commit = () -> {
            try {
                double entered = Double.parseDouble(number.getText().toString().trim());
                if (!Double.isFinite(entered) || entered < preciseMin || entered > preciseMax)
                    throw new NumberFormatException();
                action.apply(entered);
                last[0] = entered;
                seek.setProgress(Math.max(0, Math.min(max - min,
                        (int) Math.round(hundredths ? entered * 100 - min : entered - min))));
                number.setText(String.format(Locale.ROOT, "%.2f", entered));
            } catch (NumberFormatException ex) {
                message(String.format(Locale.ROOT, "请输入 %s～%s 之间的数字",
                        trim(preciseMin), trim(preciseMax)));
                number.setText(String.format(Locale.ROOT, "%.2f", last[0]));
            }
        };
        number.setOnEditorActionListener((v, actionId, event) -> {
            if (actionId == EditorInfo.IME_ACTION_DONE) {
                number.clearFocus();
                hideKeyboard();
                return true;
            }
            return false;
        });
        number.setOnFocusChangeListener((v, hasFocus) -> { if (!hasFocus) commit.run(); });
        outer.addView(seek, seekParams());
    }

    private LinearLayout sliderShell(LinearLayout group) {
        if (group.getChildCount() > 0) {
            View line = new View(host);
            line.setBackgroundColor(divider);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, Math.max(1, dp(1) / 2 + 1));
            lp.leftMargin = dp(16);
            group.addView(line, lp);
        }
        LinearLayout outer = column();
        outer.setPadding(dp(16), dp(12), dp(14), dp(6));
        group.addView(outer);
        return outer;
    }

    private SeekBar seekBar(int max, int progress) {
        SeekBar seek = new SeekBar(host);
        seek.setMax(max);
        seek.setProgress(progress);
        seek.setSplitTrack(false);
        seek.setProgressTintList(ColorStateList.valueOf(BLUE));
        seek.setProgressBackgroundTintList(ColorStateList.valueOf(dark ? Color.WHITE : Color.BLACK));
        GradientDrawable thumb = new GradientDrawable();
        thumb.setShape(GradientDrawable.OVAL);
        thumb.setColor(Color.WHITE);
        thumb.setStroke(dp(5), BLUE);
        thumb.setSize(dp(20), dp(20));
        seek.setThumb(thumb);
        seek.setPadding(dp(10), dp(4), dp(10), dp(4));
        return seek;
    }

    private LinearLayout.LayoutParams seekParams() {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, dp(36));
        lp.leftMargin = -dp(10);
        lp.rightMargin = -dp(8);
        return lp;
    }

    private Switch toggle(boolean checked, BooleanChange action) {
        Switch control = new Switch(host);
        control.setChecked(checked);
        control.setShowText(false);
        control.setThumbTintList(new ColorStateList(new int[][]{new int[]{android.R.attr.state_checked}, new int[]{}},
                new int[]{Color.WHITE, dark ? Color.rgb(200, 204, 210) : Color.WHITE}));
        control.setTrackTintList(new ColorStateList(new int[][]{new int[]{android.R.attr.state_checked}, new int[]{}},
                new int[]{BLUE, dark ? Color.rgb(90, 94, 102) : Color.rgb(200, 205, 212)}));
        control.setOnCheckedChangeListener((button, value) -> action.apply(value));
        return control;
    }

    private void banner(String icon, int tint, String title, String detail, String action,
                        Runnable click, Runnable dismiss) {
        LinearLayout card = row();
        card.setGravity(Gravity.CENTER_VERTICAL);
        card.setPadding(dp(14), dp(14), dp(dismiss == null ? 14 : 6), dp(14));
        card.setBackground(round(blend(background, tint, dark ? .18f : .10f), 18));
        FrameLayout badge = new FrameLayout(host);
        badge.setBackground(oval(tint));
        badge.addView(new IconView(host, icon, Color.WHITE, 2.2f),
                new FrameLayout.LayoutParams(dp(20), dp(20), Gravity.CENTER));
        LinearLayout.LayoutParams badgeLp = new LinearLayout.LayoutParams(dp(38), dp(38));
        badgeLp.rightMargin = dp(12);
        card.addView(badge, badgeLp);
        LinearLayout copy = column();
        copy.addView(text(title, 15, foreground, true));
        TextView details = text(detail, 12, blend(foreground, background, .3f), false);
        details.setPadding(0, dp(2), 0, 0);
        details.setLineSpacing(dp(1), 1f);
        copy.addView(details);
        card.addView(copy, new LinearLayout.LayoutParams(0, -2, 1));
        TextView button = pill(action, tint, Color.WHITE, click, 34);
        button.setPadding(dp(14), 0, dp(14), 0);
        LinearLayout.LayoutParams buttonLp = new LinearLayout.LayoutParams(-2, dp(34));
        buttonLp.leftMargin = dp(10);
        card.addView(button, buttonLp);
        if (dismiss != null) {
            FrameLayout close = new FrameLayout(host);
            close.setBackground(rippleMask());
            close.setClickable(true);
            close.setContentDescription("不再提示");
            close.setOnClickListener(v -> dismiss.run());
            close.addView(new IconView(host, "close", muted, 2f),
                    new FrameLayout.LayoutParams(dp(16), dp(16), Gravity.CENTER));
            card.addView(close, new LinearLayout.LayoutParams(dp(32), dp(32)));
        }
        addBlock(card, 12);
    }

    private void note(String icon, int tint, String copy) {
        LinearLayout card = row();
        card.setPadding(dp(14), dp(12), dp(14), dp(12));
        card.setBackground(round(blend(background, tint, dark ? .16f : .09f), 16));
        IconView glyph = new IconView(host, icon, tint, 2f);
        LinearLayout.LayoutParams glyphLp = new LinearLayout.LayoutParams(dp(18), dp(18));
        glyphLp.rightMargin = dp(10);
        glyphLp.topMargin = dp(1);
        card.addView(glyph, glyphLp);
        TextView label = text(copy, 13, blend(foreground, background, .18f), false);
        label.setLineSpacing(dp(2), 1f);
        card.addView(label, new LinearLayout.LayoutParams(0, -2, 1));
        addBlock(card, 12);
    }

    private void empty(String icon, String title, String detail) {
        LinearLayout box = column();
        box.setGravity(Gravity.CENTER_HORIZONTAL);
        box.setPadding(dp(16), dp(28), dp(16), dp(20));
        box.addView(iconTile(icon, BLUE, 56), new LinearLayout.LayoutParams(dp(56), dp(56)));
        TextView name = text(title, 16, foreground, true);
        name.setPadding(0, dp(12), 0, dp(4));
        box.addView(name);
        TextView copy = text(detail, 13, muted, false);
        copy.setGravity(Gravity.CENTER);
        box.addView(copy);
        addBlock(box, 8);
    }

    private View actionTile(String icon, String label, Runnable click) {
        LinearLayout tile = column();
        tile.setGravity(Gravity.CENTER_HORIZONTAL);
        tile.setPadding(dp(4), dp(12), dp(4), dp(11));
        tile.setBackground(ripple(surface, 16));
        tile.setClickable(true);
        tile.setFocusable(true);
        tile.setContentDescription(label);
        tile.setOnClickListener(v -> click.run());
        FrameLayout circle = new FrameLayout(host);
        circle.setBackground(oval(blueSoft));
        circle.addView(new IconView(host, icon, BLUE, 2f), new FrameLayout.LayoutParams(dp(20), dp(20), Gravity.CENTER));
        tile.addView(circle, new LinearLayout.LayoutParams(dp(38), dp(38)));
        TextView name = text(label, 12, foreground, true);
        name.setSingleLine(true);
        name.setEllipsize(TextUtils.TruncateAt.END);
        name.setGravity(Gravity.CENTER);
        name.setPadding(0, dp(7), 0, 0);
        tile.addView(name, new LinearLayout.LayoutParams(-1, -2));
        return tile;
    }

    private LinearLayout.LayoutParams tileParams(boolean gap) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, -2, 1);
        if (gap) lp.leftMargin = dp(8);
        return lp;
    }

    private View iconTile(String icon, int tint, int sizeDp) {
        FrameLayout tile = new FrameLayout(host);
        tile.setBackground(round(blend(background, tint, dark ? .22f : .13f), Math.round(sizeDp * .3f)));
        int glyph = Math.round(sizeDp * .55f);
        tile.addView(new IconView(host, icon, tint, 2f), new FrameLayout.LayoutParams(dp(glyph), dp(glyph), Gravity.CENTER));
        return tile;
    }

    private View poster(String cover, int widthDp) {
        FrameLayout frame = new FrameLayout(host);
        frame.setBackground(round(surfaceStrong, 10));
        frame.setClipToOutline(true);
        IconView placeholder = new IconView(host, "video", muted, 1.8f);
        frame.addView(placeholder, new FrameLayout.LayoutParams(dp(24), dp(24), Gravity.CENTER));
        ImageView image = new ImageView(host);
        image.setScaleType(ImageView.ScaleType.CENTER_CROP);
        frame.addView(image, new FrameLayout.LayoutParams(-1, -1));
        BilibiliDanmakuThumbnailLoader.load(image, cover);
        return frame;
    }

    private LinearLayout.LayoutParams posterParams(int widthDp) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(widthDp), Math.round(dp(widthDp) * 9 / 16f));
        lp.rightMargin = dp(12);
        return lp;
    }

    private View avatar(String url, int sizeDp) {
        ImageView image = new ImageView(host);
        image.setScaleType(ImageView.ScaleType.CENTER_CROP);
        image.setBackground(oval(surfaceStrong));
        image.setClipToOutline(true);
        image.setLayoutParams(new LinearLayout.LayoutParams(dp(sizeDp), dp(sizeDp)));
        BilibiliDanmakuThumbnailLoader.load(image, url);
        return image;
    }

    private void section(String title) {
        TextView label = text(title, 13, muted, true);
        label.setPadding(dp(6), dp(12), 0, dp(8));
        body.addView(label);
    }

    private void hint(String copy) {
        TextView label = text(copy, 13, muted, false);
        label.setLineSpacing(dp(3), 1f);
        label.setPadding(dp(4), dp(2), dp(4), dp(12));
        body.addView(label);
    }

    private void progressLine(String copy) {
        LinearLayout line = row();
        line.setGravity(Gravity.CENTER);
        line.setMinimumHeight(dp(48));
        line.setBackground(round(blueSoft, 24));
        ProgressBar spinner = new ProgressBar(host);
        spinner.setIndeterminateTintList(ColorStateList.valueOf(BLUE));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(18), dp(18));
        lp.rightMargin = dp(10);
        line.addView(spinner, lp);
        line.addView(text(copy, 14, BLUE, true));
        addBlock(line, 10);
    }

    private EditText input(String hint, String value, boolean multiline) {
        EditText edit = new EditText(host);
        edit.setText(value == null ? "" : value);
        edit.setHint(hint);
        edit.setTextSize(15);
        edit.setTextColor(foreground);
        edit.setHintTextColor(muted);
        edit.setSingleLine(!multiline);
        if (multiline) {
            edit.setMinLines(2);
            edit.setMaxLines(5);
            edit.setGravity(Gravity.TOP | Gravity.START);
        }
        edit.setMinHeight(dp(50));
        edit.setPadding(dp(16), dp(13), dp(16), dp(13));
        StateListDrawable states = new StateListDrawable();
        states.addState(new int[]{android.R.attr.state_focused}, roundStroke(surface, BLUE, 14));
        states.addState(new int[]{}, round(surface, 14));
        edit.setBackground(states);
        if (Build.VERSION.SDK_INT >= 29) edit.setTextCursorDrawable(cursor());
        return edit;
    }

    private Drawable cursor() {
        GradientDrawable caret = new GradientDrawable();
        caret.setColor(BLUE);
        caret.setSize(dp(2), dp(20));
        return caret;
    }

    private void primary(String label, Runnable click) {
        TextView button = pill(label, BLUE, Color.WHITE, click, 48);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, dp(48));
        lp.bottomMargin = dp(10);
        body.addView(button, lp);
    }

    private void tonal(String label, Runnable click) {
        TextView button = pill(label, blueSoft, BLUE, click, 46);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, dp(46));
        lp.topMargin = dp(2);
        lp.bottomMargin = dp(10);
        body.addView(button, lp);
    }

    private TextView textButton(String label, int color, Runnable click) {
        TextView button = text(label, 14, color, true);
        button.setGravity(Gravity.CENTER);
        button.setBackground(rippleMask());
        button.setClickable(true);
        button.setFocusable(true);
        if (click != null) button.setOnClickListener(v -> click.run());
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, dp(44));
        lp.topMargin = dp(4);
        body.addView(button, lp);
        return button;
    }

    private TextView pill(String label, int bg, int fg, Runnable click, int heightDp) {
        TextView button = text(label, 14, fg, true);
        button.setGravity(Gravity.CENTER);
        button.setSingleLine(true);
        button.setMinHeight(dp(heightDp));
        button.setBackground(ripple(bg, heightDp / 2));
        button.setClickable(true);
        button.setFocusable(true);
        if (click != null) button.setOnClickListener(v -> click.run());
        return button;
    }

    private TextView chip(String label, int bg, int fg) {
        TextView chip = text(label, 11, fg, true);
        chip.setSingleLine(true);
        chip.setGravity(Gravity.CENTER);
        chip.setPadding(dp(8), dp(3), dp(8), dp(3));
        chip.setBackground(round(bg, 8));
        return chip;
    }

    private View circleButton(String icon, String description, Runnable click) {
        FrameLayout button = new FrameLayout(host);
        button.setBackground(new RippleDrawable(ColorStateList.valueOf(Color.argb(40, 0, 174, 236)),
                oval(surface), null));
        button.setContentDescription(description);
        button.setClickable(true);
        button.setFocusable(true);
        button.addView(new IconView(host, icon, foreground, 2f),
                new FrameLayout.LayoutParams(dp(20), dp(20), Gravity.CENTER));
        button.setOnClickListener(view -> click.run());
        button.setLayoutParams(new LinearLayout.LayoutParams(dp(36), dp(36)));
        return button;
    }

    private View rule(int insetPx) {
        View line = new View(host);
        line.setBackgroundColor(divider);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, Math.max(1, dp(1) / 2 + 1));
        lp.leftMargin = insetPx;
        lp.rightMargin = insetPx;
        line.setLayoutParams(lp);
        return line;
    }

    private TextView text(String value, float size, int color, boolean strong) {
        TextView view = new TextView(host);
        view.setText(value);
        view.setTextSize(size);
        view.setTextColor(color);
        view.setIncludeFontPadding(true);
        if (strong) view.setTypeface(medium);
        return view;
    }

    private LinearLayout row() { LinearLayout view = new LinearLayout(host); view.setOrientation(LinearLayout.HORIZONTAL); return view; }
    private LinearLayout column() { LinearLayout view = new LinearLayout(host); view.setOrientation(LinearLayout.VERTICAL); return view; }

    private GradientDrawable round(int color, int radius) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(dp(radius));
        return drawable;
    }

    private GradientDrawable roundStroke(int color, int line, int radius) {
        GradientDrawable drawable = round(color, radius);
        drawable.setStroke(Math.max(2, dp(1) * 3 / 2), line);
        return drawable;
    }

    private GradientDrawable oval(int color) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setShape(GradientDrawable.OVAL);
        drawable.setColor(color);
        return drawable;
    }

    private RippleDrawable ripple(int color, int radius) {
        return new RippleDrawable(ColorStateList.valueOf(Color.argb(36, 0, 174, 236)),
                round(color, radius), round(Color.WHITE, radius));
    }

    private RippleDrawable rippleMask() {
        return new RippleDrawable(ColorStateList.valueOf(Color.argb(30, 0, 174, 236)), null,
                new ColorDrawable(Color.WHITE));
    }

    private static int blend(int from, int to, float amount) {
        float keep = 1 - amount;
        return Color.rgb(Math.round(Color.red(from) * keep + Color.red(to) * amount),
                Math.round(Color.green(from) * keep + Color.green(to) * amount),
                Math.round(Color.blue(from) * keep + Color.blue(to) * amount));
    }

    private int dp(int value) { return Math.round(value * host.getResources().getDisplayMetrics().density); }

    private static String trim(double value) {
        return value == Math.rint(value) ? String.valueOf((long) value) : String.valueOf(value);
    }

    private static String duration(int seconds) {
        if (seconds <= 0) return "时长未知";
        return seconds >= 3600
                ? String.format(Locale.ROOT, "%d:%02d:%02d", seconds / 3600, seconds / 60 % 60, seconds % 60)
                : String.format(Locale.ROOT, "%02d:%02d", seconds / 60, seconds % 60);
    }

    private static String formatCount(int count) {
        if (count >= 100_000_000) return String.format(Locale.ROOT, "%.1f亿", count / 100_000_000f);
        if (count >= 10_000) return String.format(Locale.ROOT, "%.1f万", count / 10_000f);
        return String.format(Locale.ROOT, "%,d", count);
    }

    private static String relativeTime(long timestamp) {
        long minutes = Math.max(0, (System.currentTimeMillis() - timestamp) / 60_000);
        if (minutes < 1) return "刚刚";
        if (minutes < 60) return minutes + " 分钟前";
        if (minutes < 60 * 24) return minutes / 60 + " 小时前";
        return minutes / (60 * 24) + " 天前";
    }

    private void message(String text) { Toast.makeText(host, text, Toast.LENGTH_SHORT).show(); }

    private void hideKeyboard() {
        View focus = dialog.getCurrentFocus();
        if (focus != null) {
            InputMethodManager manager = (InputMethodManager) host.getSystemService(Context.INPUT_METHOD_SERVICE);
            if (manager != null) manager.hideSoftInputFromWindow(focus.getWindowToken(), 0);
            focus.clearFocus();
        }
    }

    // ------------------------------------------------------------------ custom views

    /** Live preview of the danmaku style on a video-like backdrop. */
    private final class StylePreview extends View {
        private final BilibiliDanmakuOverlayView.DanmakuPainter painter;
        private final Paint backdrop = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path clip = new Path();
        private final String[] samples = {"前方高能预警！", "哈哈哈哈哈哈哈", "名场面打卡", "这个转场太丝滑了", "awsl", "来了来了"};
        private final int[] colors = {0xffffff, 0xffd93d, 0x6ad6ff, 0xffffff, 0xfe7fa7, 0xffffff};
        private final float[] positions = {.05f, .52f, .18f, .48f, .08f, .62f};

        StylePreview(Context context) {
            super(context);
            painter = new BilibiliDanmakuOverlayView.DanmakuPainter(context);
            setContentDescription("弹幕样式预览");
        }

        @Override protected void onSizeChanged(int w, int h, int oldw, int oldh) {
            super.onSizeChanged(w, h, oldw, oldh);
            backdrop.setShader(new LinearGradient(0, 0, w, h, new int[]{Color.rgb(58, 92, 126),
                    Color.rgb(136, 170, 196), Color.rgb(222, 236, 242)}, null, Shader.TileMode.CLAMP));
            clip.reset();
            clip.addRoundRect(new RectF(0, 0, w, h), dp(18), dp(18), Path.Direction.CW);
        }

        @Override protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            canvas.save();
            canvas.clipPath(clip);
            canvas.drawRect(0, 0, getWidth(), getHeight(), backdrop);
            float font = painter.fontSizePx(settings.getInt("font", 19), getWidth());
            float line = painter.lineHeightPx(font, settings.getInt("line_spacing",
                    BilibiliDanmakuOverlayView.DEFAULT_LINE_SPACING));
            painter.prepare(font);
            float offset = painter.baselineOffset(line);
            int alpha = Math.round(255 * settings.getInt("opacity", 85) / 100f);
            canvas.saveLayerAlpha(0, 0, getWidth(), getHeight(), alpha);
            float top = dp(8);
            for (int i = 0; i < samples.length; i++) {
                int lane = i / 2;
                float rowTop = top + lane * line;
                if (rowTop + line > getHeight()) break;
                painter.draw(canvas, samples[i], getWidth() * positions[i], rowTop + offset, colors[i]);
            }
            canvas.restore();
            canvas.restore();
        }
    }

    /** Draws the login QR code; module colours are fixed for reliable scanning in dark mode. */
    private static final class QrView extends View {
        private final Paint paint = new Paint();
        private BilibiliQrCode code;

        QrView(Context context) {
            super(context);
            paint.setColor(Color.rgb(17, 17, 17));
            setContentDescription("B 站登录二维码");
        }

        void setCode(BilibiliQrCode value) {
            code = value;
            invalidate();
        }

        @Override protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            if (code == null) return;
            float cell = Math.min(getWidth(), getHeight()) / (float) code.size;
            float left = (getWidth() - cell * code.size) / 2f;
            float top = (getHeight() - cell * code.size) / 2f;
            for (int y = 0; y < code.size; y++) {
                for (int x = 0; x < code.size; x++) {
                    if (!code.get(x, y)) continue;
                    float l = left + x * cell, t = top + y * cell;
                    // Slight overlap avoids hairline gaps between modules on fractional scales.
                    canvas.drawRect(l, t, l + cell + .5f, t + cell + .5f, paint);
                }
            }
        }
    }

    /** Material-style 24dp outlined glyphs, painted at vector resolution for any density. */
    private static final class IconView extends View {
        final String name;
        final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        final Path path = new Path();

        IconView(Context context, String icon, int color, float stroke) {
            super(context);
            name = icon;
            paint.setColor(color);
            paint.setStrokeWidth(stroke);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            paint.setStyle(Paint.Style.STROKE);
            setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        }

        @Override protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            int save = canvas.save();
            float scale = Math.min(getWidth(), getHeight()) / 24f;
            canvas.translate((getWidth() - 24 * scale) / 2f, (getHeight() - 24 * scale) / 2f);
            canvas.scale(scale, scale);
            path.reset();
            switch (name) {
                case "close": line(canvas, 6, 6, 18, 18); line(canvas, 18, 6, 6, 18); break;
                case "back": line(canvas, 19, 12, 5, 12); line(canvas, 5, 12, 11, 6); line(canvas, 5, 12, 11, 18); break;
                case "next": line(canvas, 9, 5, 16, 12); line(canvas, 16, 12, 9, 19); break;
                case "search": case "find":
                    canvas.drawCircle(10.5f, 10.5f, 6.5f, paint); line(canvas, 15.5f, 15.5f, 20.5f, 20.5f); break;
                case "refresh":
                    canvas.drawArc(new RectF(4, 4, 20, 20), 40, 280, false, paint);
                    line(canvas, 20, 4.5f, 20, 9.5f); line(canvas, 20, 9.5f, 15, 9.5f); break;
                case "link":
                    canvas.drawRoundRect(new RectF(2.5f, 8, 13.5f, 16), 4, 4, paint);
                    canvas.drawRoundRect(new RectF(10.5f, 8, 21.5f, 16), 4, 4, paint); break;
                case "file":
                    path.moveTo(14, 3); path.lineTo(6, 3); path.lineTo(6, 21); path.lineTo(18, 21);
                    path.lineTo(18, 7); path.close(); canvas.drawPath(path, paint);
                    line(canvas, 12, 10, 12, 17); line(canvas, 9, 14, 12, 17); line(canvas, 15, 14, 12, 17); break;
                case "sync":
                    canvas.drawCircle(12, 12, 8.5f, paint); line(canvas, 12, 7, 12, 12); line(canvas, 12, 12, 15.5f, 14); break;
                case "tune":
                    line(canvas, 4, 7, 20, 7); line(canvas, 4, 17, 20, 17);
                    fill(); canvas.drawCircle(9, 7, 2.6f, paint); canvas.drawCircle(15, 17, 2.6f, paint); stroke(); break;
                case "filter":
                    path.moveTo(4, 5); path.lineTo(20, 5); path.lineTo(14, 12.5f); path.lineTo(14, 19);
                    path.lineTo(10, 20.5f); path.lineTo(10, 12.5f); path.close(); canvas.drawPath(path, paint); break;
                case "lock":
                    canvas.drawRoundRect(new RectF(5, 10.5f, 19, 21), 2.5f, 2.5f, paint);
                    canvas.drawArc(new RectF(8, 3.5f, 16, 13.5f), 180, 180, false, paint);
                    line(canvas, 8, 8.5f, 8, 10.5f); line(canvas, 16, 8.5f, 16, 10.5f);
                    fill(); canvas.drawCircle(12, 15.5f, 1.4f, paint); stroke(); break;
                case "video":
                    canvas.drawRoundRect(new RectF(3, 5, 21, 19), 3, 3, paint);
                    path.moveTo(10, 9); path.lineTo(15.5f, 12); path.lineTo(10, 15); path.close();
                    fill(); canvas.drawPath(path, paint); stroke(); break;
                case "tv":
                    canvas.drawRoundRect(new RectF(3, 7.5f, 21, 20), 3.5f, 3.5f, paint);
                    line(canvas, 8, 3.5f, 10.5f, 7); line(canvas, 16, 3.5f, 13.5f, 7);
                    line(canvas, 8.5f, 12.5f, 8.5f, 14.5f); line(canvas, 15.5f, 12.5f, 15.5f, 14.5f); break;
                case "user":
                    canvas.drawCircle(12, 8.5f, 4, paint);
                    canvas.drawArc(new RectF(5, 14.5f, 19, 27), 200, 140, false, paint); break;
                case "open":
                    path.moveTo(11, 5); path.lineTo(5, 5); path.lineTo(5, 19); path.lineTo(19, 19); path.lineTo(19, 13);
                    canvas.drawPath(path, paint);
                    line(canvas, 12, 12, 20, 4); line(canvas, 14.5f, 4, 20, 4); line(canvas, 20, 4, 20, 9.5f); break;
                case "shield":
                    path.moveTo(12, 3); path.lineTo(19, 6); path.lineTo(19, 11.5f);
                    path.cubicTo(19, 16, 16, 19.5f, 12, 21); path.cubicTo(8, 19.5f, 5, 16, 5, 11.5f);
                    path.lineTo(5, 6); path.close(); canvas.drawPath(path, paint);
                    line(canvas, 9, 12, 11.2f, 14.2f); line(canvas, 11.2f, 14.2f, 15.5f, 9.8f); break;
                case "warning":
                    path.moveTo(12, 3.5f); path.lineTo(21.5f, 20); path.lineTo(2.5f, 20); path.close();
                    canvas.drawPath(path, paint); line(canvas, 12, 10, 12, 14);
                    fill(); canvas.drawCircle(12, 17, 1.2f, paint); stroke(); break;
                case "info":
                    canvas.drawCircle(12, 12, 9, paint); line(canvas, 12, 11, 12, 16.5f);
                    fill(); canvas.drawCircle(12, 7.8f, 1.2f, paint); stroke(); break;
                case "key":
                    canvas.drawCircle(8, 12, 4, paint); line(canvas, 12, 12, 21, 12);
                    line(canvas, 18, 12, 18, 15.5f); line(canvas, 21, 12, 21, 14.5f); break;
                case "sparkle":
                    path.moveTo(12, 3); path.quadTo(13, 11, 21, 12); path.quadTo(13, 13, 12, 21);
                    path.quadTo(11, 13, 3, 12); path.quadTo(11, 11, 12, 3); path.close();
                    fill(); canvas.drawPath(path, paint); stroke(); break;
                case "palette":
                    canvas.drawCircle(12, 12, 8.5f, paint);
                    fill(); canvas.drawCircle(8.5f, 10, 1.4f, paint); canvas.drawCircle(12, 7.5f, 1.4f, paint);
                    canvas.drawCircle(15.5f, 10, 1.4f, paint); stroke();
                    line(canvas, 9.5f, 15.5f, 14.5f, 15.5f); break;
                case "pin":
                    canvas.drawRoundRect(new RectF(4, 4, 20, 20), 3, 3, paint);
                    line(canvas, 8, 8.5f, 16, 8.5f); line(canvas, 8, 15.5f, 16, 15.5f); break;
                default: canvas.drawCircle(12, 12, 8, paint);
            }
            canvas.restoreToCount(save);
        }

        private void fill() { paint.setStyle(Paint.Style.FILL); }
        private void stroke() { paint.setStyle(Paint.Style.STROKE); }
        private void line(Canvas c, float x1, float y1, float x2, float y2) { c.drawLine(x1, y1, x2, y2, paint); }
    }
}
