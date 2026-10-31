package pg;

import android.content.pm.PackageManager;
import android.util.Log;

/* loaded from: classes3.dex */
public class o {

    /* renamed from: c, reason: collision with root package name */
    public static final o f82590c = new o(true, null, null);

    /* renamed from: a, reason: collision with root package name */
    public final boolean f82591a;

    /* renamed from: b, reason: collision with root package name */
    public final Throwable f82592b;

    public o(boolean z11, String str, Throwable th2) {
        this.f82591a = z11;
        this.f82592b = th2;
    }

    public static o b(String str) {
        return new o(false, str, null);
    }

    public static o c(String str, Exception exc) {
        return new o(false, str, exc);
    }

    public static o e() {
        return new o(true, null, null);
    }

    public static o f(String str, PackageManager.NameNotFoundException nameNotFoundException) {
        return new o(false, str, nameNotFoundException);
    }

    public void a() {
    }

    public final void d() {
        if (this.f82591a || !Log.isLoggable("GoogleCertificatesRslt", 3)) {
            return;
        }
        if (this.f82592b != null) {
            a();
        } else {
            a();
        }
    }
}
