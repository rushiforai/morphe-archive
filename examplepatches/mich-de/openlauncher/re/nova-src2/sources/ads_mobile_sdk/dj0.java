package ads_mobile_sdk;

import android.app.Activity;
import android.app.KeyguardManager;
import android.content.Context;
import android.graphics.Rect;
import android.os.PowerManager;
import android.view.View;
import android.view.WindowManager;
import b.hb;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class dj0 {

    /* renamed from: a, reason: collision with root package name */
    public final g0 f2540a;

    /* renamed from: b, reason: collision with root package name */
    public final jr0 f2541b;

    /* renamed from: c, reason: collision with root package name */
    public final PowerManager f2542c;

    /* renamed from: d, reason: collision with root package name */
    public final KeyguardManager f2543d;

    public dj0(Context context, g0 activityTracker, jr0 flags) {
        Intrinsics.g(context, "context");
        Intrinsics.g(activityTracker, "activityTracker");
        Intrinsics.g(flags, "flags");
        this.f2540a = activityTracker;
        this.f2541b = flags;
        this.f2542c = (PowerManager) context.getSystemService(PowerManager.class);
        this.f2543d = (KeyguardManager) context.getSystemService(KeyguardManager.class);
    }

    public final boolean a(qw2 requestType, z1 adConfiguration) {
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(adConfiguration, "adConfiguration");
        jr0 jr0Var = this.f2541b;
        jr0Var.getClass();
        hb hbVar = qw2.f8857b;
        if (((List) jr0Var.a("gads:lock_screen_viewable_formats", ul.b.P("native"), jn.a$20)).contains(requestType.f8869a)) {
            return true;
        }
        return ((Boolean) jr0Var.a("gads:lockscreen_display_allowlist", Boolean.TRUE, jn.a$10)).booleanValue() && adConfiguration.B;
    }

    public final WindowManager b(Context context) {
        Intrinsics.g(context, "context");
        Object systemService = c(context).getSystemService((Class<Object>) WindowManager.class);
        Intrinsics.f(systemService, "getSystemService(...)");
        return (WindowManager) systemService;
    }

    public final Context c(Context context) {
        Intrinsics.g(context, "context");
        Activity activity = context instanceof Activity ? (Activity) context : null;
        if (activity != null) {
            return activity;
        }
        Activity activityB = this.f2540a.b();
        return activityB != null ? activityB : context;
    }

    public final boolean a(View view, boolean z11) {
        Intrinsics.g(view, "view");
        if (this.f2542c.isInteractive() && view.getVisibility() == 0 && view.isShown() && view.getLocalVisibleRect(new Rect()) && view.getGlobalVisibleRect(new Rect())) {
            return z11 || !this.f2543d.isKeyguardLocked();
        }
        return false;
    }
}
