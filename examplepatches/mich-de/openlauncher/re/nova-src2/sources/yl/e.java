package yl;

import android.os.Bundle;
import com.google.android.gms.measurement.api.AppMeasurementSdk;
import java.util.concurrent.ConcurrentHashMap;
import o2.f;
import sg.w;

/* loaded from: classes.dex */
public final class e implements d {

    /* renamed from: c, reason: collision with root package name */
    public static volatile e f97387c;

    /* renamed from: a, reason: collision with root package name */
    public final AppMeasurementSdk f97388a;

    /* renamed from: b, reason: collision with root package name */
    public final ConcurrentHashMap f97389b;

    public e(AppMeasurementSdk appMeasurementSdk) {
        w.h(appMeasurementSdk);
        this.f97388a = appMeasurementSdk;
        this.f97389b = new ConcurrentHashMap();
    }

    public final void a(String str, String str2, Bundle bundle) {
        if (bundle == null) {
            bundle = new Bundle();
        }
        if (zl.a.a(str) && zl.a.b(str2, bundle) && zl.a.d(str, str2, bundle)) {
            if ("clx".equals(str) && "_ae".equals(str2)) {
                bundle.putLong("_r", 1L);
            }
            this.f97388a.logEvent(str, str2, bundle);
        }
    }

    public final f b(String str, b bVar) {
        w.h(bVar);
        if (zl.a.a(str)) {
            boolean zIsEmpty = str.isEmpty();
            ConcurrentHashMap concurrentHashMap = this.f97389b;
            if (zIsEmpty || !concurrentHashMap.containsKey(str) || concurrentHashMap.get(str) == null) {
                boolean zEquals = "fiam".equals(str);
                AppMeasurementSdk appMeasurementSdk = this.f97388a;
                Object wVar = zEquals ? new m.w(appMeasurementSdk, bVar) : "clx".equals(str) ? new zl.d(appMeasurementSdk, bVar) : null;
                if (wVar != null) {
                    concurrentHashMap.put(str, wVar);
                    return new f(18);
                }
            }
        }
        return null;
    }
}
