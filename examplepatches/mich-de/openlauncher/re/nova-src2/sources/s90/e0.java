package s90;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.os.Bundle;
import android.os.Trace;
import org.chromium.net.ApiVersion;

/* loaded from: classes5.dex */
public abstract class e0 {

    /* renamed from: b, reason: collision with root package name */
    public static Context f86906b;

    /* renamed from: c, reason: collision with root package name */
    public static Bundle f86907c;

    /* renamed from: e, reason: collision with root package name */
    public static int f86909e;

    /* renamed from: a, reason: collision with root package name */
    public static final Object f86905a = new Object();

    /* renamed from: d, reason: collision with root package name */
    public static final Object f86908d = new Object();

    public static int b() {
        return Integer.parseInt(ApiVersion.getCronetVersion().split("\\.")[0]) < 59 ? ApiVersion.getApiLevel() : ApiVersion.getMaximumAvailableApiLevel();
    }

    public static Bundle c(Context context) {
        Bundle bundle;
        ServiceInfo serviceInfo;
        Bundle bundle2;
        Context applicationContext = context.getApplicationContext();
        synchronized (f86905a) {
            if (applicationContext != f86906b) {
                p90.a.a("CronetManifest#getMetaData fetching info");
                try {
                    try {
                        serviceInfo = applicationContext.getPackageManager().getServiceInfo(new ComponentName(applicationContext, "android.net.http.MetaDataHolder"), 787072);
                    } finally {
                    }
                } catch (PackageManager.NameNotFoundException | NullPointerException unused) {
                    serviceInfo = null;
                }
                if (serviceInfo == null || (bundle2 = serviceInfo.metaData) == null) {
                    bundle2 = new Bundle();
                }
                f86907c = bundle2;
                f86906b = applicationContext;
                Trace.endSection();
            }
            bundle = f86907c;
        }
        return bundle;
    }

    public abstract long a();

    public abstract void d(z zVar);

    public abstract void e(long j11, y yVar, c0 c0Var);

    public abstract void f(long j11, b0 b0Var);
}
