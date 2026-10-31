package ads_mobile_sdk;

import android.content.Context;
import android.webkit.WebSettings;

/* loaded from: classes2.dex */
public final class qj3 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Object f8705a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f8706b;

    public /* synthetic */ qj3(Object obj, int i5) {
        this.f8706b = i5;
        this.f8705a = obj;
    }

    @Override // java.lang.Runnable
    public final void run() {
        float f11;
        switch (this.f8706b) {
            case 0:
                io.sentry.e3 e3Var = ((tj3) this.f8705a).f9970e;
                ((mg.l) e3Var.f67209c).a(new b.w1(e3Var));
                break;
            case 1:
                si0 si0Var = (si0) this.f8705a;
                int streamVolume = si0Var.f9567c.getStreamVolume(3);
                int streamMaxVolume = si0Var.f9567c.getStreamMaxVolume(3);
                si0Var.f9568d.getClass();
                if (streamMaxVolume <= 0 || streamVolume <= 0) {
                    f11 = 0.0f;
                } else {
                    f11 = streamVolume / streamMaxVolume;
                    if (f11 > 1.0f) {
                        f11 = 1.0f;
                    }
                }
                si0Var.f9571g.set(false);
                if (((Float) si0Var.f9570f.getAndSet(Float.valueOf(f11))).floatValue() != f11) {
                    si0Var.f9565a.post(new qi0(this, f11));
                    break;
                }
                break;
            default:
                try {
                    WebSettings.getDefaultUserAgent((Context) this.f8705a);
                    break;
                } catch (Throwable unused) {
                    return;
                }
        }
    }
}
