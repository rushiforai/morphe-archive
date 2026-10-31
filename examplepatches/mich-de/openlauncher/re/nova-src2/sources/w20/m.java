package w20;

import android.Manifest;
import android.content.ComponentName;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Build;
import android.provider.Settings;
import android.view.WindowManager;
import java.lang.reflect.Method;
import nova.branch.engage.sesame_lite.internal.Pkgs;

/* loaded from: classes.dex */
public abstract class m {

    /* renamed from: a, reason: collision with root package name */
    public static final boolean f93691a;

    /* renamed from: b, reason: collision with root package name */
    public static final boolean f93692b;

    /* renamed from: c, reason: collision with root package name */
    public static final boolean f93693c;

    /* renamed from: d, reason: collision with root package name */
    public static final boolean f93694d;

    /* renamed from: e, reason: collision with root package name */
    public static final boolean f93695e;

    /* renamed from: f, reason: collision with root package name */
    public static final boolean f93696f;

    /* renamed from: g, reason: collision with root package name */
    public static final boolean f93697g;

    /* renamed from: h, reason: collision with root package name */
    public static final boolean f93698h;

    /* renamed from: i, reason: collision with root package name */
    public static final boolean f93699i;

    /* renamed from: j, reason: collision with root package name */
    public static final boolean f93700j;

    /* renamed from: k, reason: collision with root package name */
    public static final String f93701k;

    /* renamed from: l, reason: collision with root package name */
    public static final String f93702l;

    /* renamed from: m, reason: collision with root package name */
    public static final Method f93703m;
    public static final boolean n;

    static {
        Resources system;
        int identifier;
        int i5 = Build.VERSION.SDK_INT;
        boolean z11 = false;
        f93691a = v30.e.f("android.hwtheme.HwThemeManager") != null;
        boolean z12 = i5 < 33 && v30.e.q(Manifest.permission.class, "SAMSUNG_OVERLAY_THEME", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b) != com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        f93692b = z12;
        String str = Build.MANUFACTURER;
        f93693c = "samsung".equalsIgnoreCase(str) || z12;
        f93694d = v30.e.q(Manifest.permission.class, "RAZER_DEVICE_POWER", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b).equals("razer.permission.RAZER_DEVICE_POWER");
        boolean z13 = v30.e.f("miui.content.res.IconCustomizer") != null;
        f93695e = z13;
        f93696f = v30.e.f("com.lge.constants.ThemeConstants") != null;
        f93697g = v30.e.f("com.oneplus.embryo.EmbryoApp") != null;
        f93698h = v30.e.f("oplus.R") != null;
        f93699i = v30.e.f("vivo.R") != null;
        f93700j = z13;
        f93701k = v30.e.q(Settings.System.class, "SEM_ULTRA_POWERSAVING_MODE", null);
        f93702l = v30.e.q(Settings.System.class, "SEM_EMERGENCY_MODE", null);
        new ComponentName("com.sec.android.gallery3d", "com.sec.android.gallery3d.app.GalleryActivity");
        new ComponentName("com.sec.android.gallery3d", "com.sec.android.gallery3d.app.GalleryOpaqueActivity");
        new ComponentName("com.android.settings", "com.android.settings.Settings");
        if ("lge".equalsIgnoreCase(str)) {
            v30.e.f("android.widget.BubblePopupHelper");
        }
        f93703m = v30.e.g(WindowManager.LayoutParams.class, "semSetNavigationBarIconColor", Integer.TYPE);
        if (v30.e.q(Settings.Global.class, "NAVIGATIONBAR_HIDE_BAR", null) != null && (identifier = (system = Resources.getSystem()).getIdentifier("config_showNavigationBar", "bool", "android")) != 0) {
            try {
                z11 = system.getBoolean(identifier);
            } catch (Exception unused) {
            }
        }
        n = z11;
        Class clsF = v30.e.f("android.os.SystemProperties");
        v30.e.g(clsF, "get", String.class, String.class);
        v30.e.g(clsF, "getBoolean", String.class, Boolean.TYPE);
    }

    public static String a() {
        if ("samsung".equalsIgnoreCase(Build.MANUFACTURER)) {
            return "com.samsung.android.calendar";
        }
        if (f93691a) {
            return "com.android.calendar";
        }
        if (f93695e) {
            return "com.xiaomi.calendar";
        }
        return null;
    }

    public static boolean b(Intent intent) {
        if (intent == null) {
            return false;
        }
        String action = intent.getAction();
        ComponentName component = intent.getComponent();
        if ("android.intent.action.CALL_PRIVILEGED".equals(action)) {
            return true;
        }
        return (component != null && Pkgs.CONTACTS_DEFAULT.equals(component.getPackageName()) && "com.android.contacts.action.CHOOSE_SUB".equals(action)) || "com.android.contacts.action.CHOOSE_SUB_HUAWEI".equals(action);
    }
}
