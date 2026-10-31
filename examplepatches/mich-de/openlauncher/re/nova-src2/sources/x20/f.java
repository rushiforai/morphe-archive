package x20;

import android.content.Context;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import com.teslacoilsw.launcher.NovaAccessibilityService;
import d9.j;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import mx.i1;

/* loaded from: classes.dex */
public final class f {

    /* renamed from: e, reason: collision with root package name */
    public static final Class f94993e;

    /* renamed from: f, reason: collision with root package name */
    public static final Method f94994f;

    /* renamed from: g, reason: collision with root package name */
    public static final Method f94995g;

    /* renamed from: h, reason: collision with root package name */
    public static final Method f94996h;

    /* renamed from: a, reason: collision with root package name */
    public final Object f94997a;

    /* renamed from: b, reason: collision with root package name */
    public final o2.f f94998b;

    /* renamed from: c, reason: collision with root package name */
    public final Context f94999c;

    /* renamed from: d, reason: collision with root package name */
    public j f95000d = null;

    /* JADX WARN: Removed duplicated region for block: B:16:0x0058 A[Catch: Exception -> 0x005b, TRY_ENTER, TRY_LEAVE, TryCatch #2 {Exception -> 0x005b, blocks: (B:12:0x004d, B:16:0x0058), top: B:33:0x004d }] */
    static {
        Field field;
        Class clsF = v30.e.f("android.app.StatusBarManager");
        f94993e = v30.e.f("com.android.internal.statusbar.IStatusBarService");
        boolean z11 = v30.a.f92038b;
        Method methodG = z11 ? v30.e.g(clsF, "expandNotificationsPanel", new Class[0]) : v30.e.g(clsF, n.f39151e, new Class[0]);
        f94994f = methodG;
        if (z11) {
            methodG = v30.e.g(clsF, "expandSettingsPanel", new Class[0]);
        }
        f94995g = methodG;
        Class cls = Integer.TYPE;
        f94996h = v30.e.g(clsF, "disable", cls);
        Class clsF2 = v30.e.f("android.view.MiuiWindowManager$LayoutParams");
        Field field2 = null;
        if (clsF2 == null) {
            field = null;
            if (field != null) {
                field.getInt(clsF2);
            }
        } else {
            try {
                try {
                    field = clsF2.getField("EXTRA_FLAG_STATUS_BAR_DARK_MODE");
                    field.setAccessible(true);
                } catch (Exception unused) {
                }
            } catch (NoSuchFieldException | SecurityException unused2) {
            }
            if (field != null) {
            }
        }
        if (clsF2 != null) {
            try {
                try {
                    Field field3 = clsF2.getField("EXTRA_FLAG_NAVIGATION_BAR_DARK_MODE");
                    field3.setAccessible(true);
                    field2 = field3;
                } catch (NoSuchFieldException | SecurityException unused3) {
                }
            } catch (Exception unused4) {
            }
        }
        if (field2 != null) {
            field2.getInt(clsF2);
        }
        v30.e.h("com.android.internal.policy.MiuiPhoneWindow", "setExtraFlags", cls, cls);
    }

    public f(Context context) throws NoSuchMethodException, SecurityException {
        this.f94999c = context;
        try {
            Object systemService = context.getSystemService("statusbar");
            this.f94997a = systemService;
            Method declaredMethod = systemService.getClass().getDeclaredMethod("getService", null);
            if (declaredMethod != null) {
                declaredMethod.setAccessible(true);
            }
            v30.e.g(f94993e, "toggleRecentApps", new Class[0]);
        } catch (Exception e3) {
            e3.printStackTrace();
        }
        context.getPackageManager();
        this.f94998b = new o2.f(17);
    }

    public final void a() {
        NovaAccessibilityService novaAccessibilityServiceA = NovaAccessibilityService.a();
        if (novaAccessibilityServiceA != null) {
            novaAccessibilityServiceA.performGlobalAction(4);
            return;
        }
        try {
            f94994f.invoke(this.f94997a, null);
        } catch (IllegalAccessException e3) {
            e3.printStackTrace();
            c();
        } catch (InvocationTargetException e11) {
            e11.getCause().printStackTrace();
            c();
        }
    }

    public final void b() {
        NovaAccessibilityService novaAccessibilityServiceA = NovaAccessibilityService.a();
        if (novaAccessibilityServiceA != null) {
            novaAccessibilityServiceA.performGlobalAction(5);
            return;
        }
        try {
            f94995g.invoke(this.f94997a, null);
        } catch (IllegalAccessException e3) {
            e3.printStackTrace();
            c();
        } catch (InvocationTargetException e11) {
            e11.getCause().printStackTrace();
            c();
        }
    }

    public final void c() {
        if (this.f95000d == null) {
            Context context = this.f94999c;
            d9.f fVar = new d9.f(context);
            fVar.s(context.getString(2132017202));
            fVar.e(context.getString(2132017203));
            fVar.i(2132017603);
            fVar.o(2132017197);
            fVar.c(new d9.a(this, 1));
            fVar.h(new i1(this, 1));
            j jVarB = fVar.b();
            this.f95000d = jVarB;
            jVarB.show();
        }
    }
}
