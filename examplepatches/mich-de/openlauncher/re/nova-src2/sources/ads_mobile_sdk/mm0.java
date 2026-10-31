package ads_mobile_sdk;

import android.content.Context;
import android.os.Build;

/* loaded from: classes.dex */
public final class mm0 {

    /* renamed from: d, reason: collision with root package name */
    public static volatile mm0 f7273d;

    /* renamed from: a, reason: collision with root package name */
    public volatile Boolean f7274a;

    /* renamed from: b, reason: collision with root package name */
    public volatile Boolean f7275b;

    /* renamed from: c, reason: collision with root package name */
    public final Context f7276c;

    public mm0(Context context) {
        this.f7276c = context;
        a();
    }

    public final boolean a() {
        if (this.f7274a != null) {
            return this.f7274a.booleanValue();
        }
        synchronized (this) {
            try {
                if (this.f7274a != null) {
                    return this.f7274a.booleanValue();
                }
                boolean z11 = this.f7276c != null && Build.MANUFACTURER.equalsIgnoreCase("Amazon") && Build.MODEL.toLowerCase().startsWith("aft") && Build.VERSION.SDK_INT <= 30;
                this.f7274a = Boolean.valueOf(z11);
                return z11;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public static mm0 a(Context context) {
        if (f7273d == null) {
            synchronized (mm0.class) {
                try {
                    if (f7273d == null) {
                        f7273d = new mm0(context);
                    }
                } finally {
                }
            }
        }
        return f7273d;
    }
}
