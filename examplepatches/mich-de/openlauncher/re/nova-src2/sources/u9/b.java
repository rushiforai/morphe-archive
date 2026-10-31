package u9;

import java.util.ArrayList;
import o9.g3;
import sg.h0;

/* loaded from: classes.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final ArrayList f90688a = new ArrayList();

    /* renamed from: b, reason: collision with root package name */
    public static final h0 f90689b = a("PROMISE_APPS_IN_ALL_APPS", false);

    /* renamed from: c, reason: collision with root package name */
    public static final h0 f90690c = a("PROMISE_APPS_NEW_INSTALLS", true);

    /* renamed from: d, reason: collision with root package name */
    public static final h0 f90691d = a("ENABLE_LOCAL_COLOR_POPUPS", false);

    /* renamed from: e, reason: collision with root package name */
    public static final h0 f90692e = a("KEYGUARD_ANIMATION", false);

    /* renamed from: f, reason: collision with root package name */
    public static final h0 f90693f = a("ADAPTIVE_ICON_WINDOW_ANIM", true);

    /* renamed from: g, reason: collision with root package name */
    public static final va.a f90694g;

    /* renamed from: h, reason: collision with root package name */
    public static final va.a f90695h;

    /* renamed from: i, reason: collision with root package name */
    public static final h0 f90696i;

    /* renamed from: j, reason: collision with root package name */
    public static final h0 f90697j;

    /* renamed from: k, reason: collision with root package name */
    public static final h0 f90698k;

    /* renamed from: l, reason: collision with root package name */
    public static final h0 f90699l;

    /* renamed from: m, reason: collision with root package name */
    public static final h0 f90700m;
    public static final h0 n;
    public static final h0 o;

    /* renamed from: p, reason: collision with root package name */
    public static final h0 f90701p;

    /* renamed from: q, reason: collision with root package name */
    public static final va.a f90702q;

    /* renamed from: r, reason: collision with root package name */
    public static final va.a f90703r;

    /* renamed from: s, reason: collision with root package name */
    public static final h0 f90704s;

    /* renamed from: t, reason: collision with root package name */
    public static final h0 f90705t;

    /* renamed from: u, reason: collision with root package name */
    public static final h0 f90706u;

    /* renamed from: v, reason: collision with root package name */
    public static final h0 f90707v;

    /* renamed from: w, reason: collision with root package name */
    public static final h0 f90708w;

    static {
        a("ENABLE_QUICKSTEP_LIVE_TILE", true);
        a("ENABLE_QUICKSTEP_WIDGET_APP_START", true);
        f90694g = new va.a("ENABLE_DEVICE_SEARCH", false);
        a("ENABLE_TWOLINE_ALLAPPS", false);
        new va.a("ENABLE_DEVICE_SEARCH_PERFORMANCE_LOGGING", true);
        a("IME_STICKY_SNACKBAR_EDU", true);
        a("ENABLE_PEOPLE_TILE_PREVIEW", false);
        f90695h = new va.a("FOLDER_NAME_SUGGEST", false);
        a("FOLDER_NAME_MAJORITY_RANKING", true);
        f90696i = a("ENABLE_PREDICTION_DISMISS", true);
        a("ASSISTANT_GIVES_LAUNCHER_FOCUS", false);
        a("HOTSEAT_MIGRATE_TO_FOLDER", false);
        f90697j = a("ENABLE_DEEP_SHORTCUT_ICON_CACHE", true);
        f90698k = a("ENABLE_THEMED_ICONS", true);
        f90699l = a("ENABLE_BULK_WORKSPACE_ICON_LOADING", false);
        f90700m = a("ENABLE_BULK_ALL_APPS_ICON_LOADING", false);
        new va.a("ENABLE_OVERVIEW_SELECTIONS", true);
        new va.a("ENABLE_WIDGETS_PICKER_AIAI_SEARCH", true);
        a("ENABLE_OVERVIEW_SHARING_TO_PEOPLE", true);
        n = a("ENABLE_DATABASE_RESTORE", false);
        a("ENABLE_SMARTSPACE_DISMISS", true);
        o = a("ALWAYS_USE_HARDWARE_OPTIMIZATION_FOR_FOLDER_ANIMATIONS", false);
        a("ENABLE_ALL_APPS_EDU", true);
        f90701p = a("SEPARATE_RECENTS_ACTIVITY", false);
        a("ENABLE_MINIMAL_DEVICE", false);
        f90702q = new va.a("EXPANDED_SMARTSPACE", false);
        f90703r = new va.a("ENABLE_LAUNCHER_ACTIVITY_THEME_CROSSFADE", false);
        new va.a("ENABLE_APP_PREDICTIONS_WHILE_VISIBLE", true);
        a("ENABLE_TASKBAR", true);
        a("ENABLE_TASKBAR_EDU", true);
        a("ENABLE_TASKBAR_POPUP_MENU", false);
        f90704s = a("ENABLE_OVERVIEW_GRID", true);
        f90705t = a("ENABLE_TWO_PANEL_HOME", true);
        a("ENABLE_SCRIM_FOR_APP_LAUNCH", false);
        a("ENABLE_SPLIT_SELECT", true);
        new va.a("ENABLE_ENFORCED_ROUNDED_CORNERS", true);
        new va.a("ENABLE_LOCAL_RECOMMENDED_WIDGETS_FILTER", true);
        f90706u = a("NOTIFY_CRASHES", false);
        f90707v = a("ENABLE_WALLPAPER_SCRIM", false);
        a("WIDGETS_IN_LAUNCHER_PREVIEW", true);
        a("QUICK_WALLPAPER_PICKER", true);
        a("ENABLE_BACK_SWIPE_HOME_ANIMATION", true);
        f90708w = a("ENABLE_ICON_LABEL_AUTO_SCALING", true);
    }

    public static h0 a(String str, boolean z11) {
        return g3.f79854i ? new a(str, z11) : new h0(1, str, z11);
    }
}
