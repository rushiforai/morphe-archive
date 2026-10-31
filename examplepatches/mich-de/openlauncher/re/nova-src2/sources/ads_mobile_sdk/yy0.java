package ads_mobile_sdk;

import android.content.Context;
import android.content.SharedPreferences;

/* loaded from: classes.dex */
public final class yy0 {

    /* renamed from: b, reason: collision with root package name */
    public static yy0 f12345b;

    /* renamed from: a, reason: collision with root package name */
    public final x7.c f12346a;

    public yy0(Context context) {
        if (x7.c.f95125c == null) {
            x7.c.f95125c = new x7.c(context);
        }
        this.f12346a = x7.c.f95125c;
    }

    public final boolean a() {
        boolean z11;
        synchronized (yy0.class) {
            z11 = ((SharedPreferences) this.f12346a.f95127b).getBoolean("paidv2_publisher_option", true);
        }
        return z11;
    }

    public static final yy0 a(Context context) {
        yy0 yy0Var;
        synchronized (yy0.class) {
            try {
                if (f12345b == null) {
                    f12345b = new yy0(context);
                }
                yy0Var = f12345b;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return yy0Var;
    }
}
