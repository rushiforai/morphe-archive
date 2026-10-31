package bn;

import android.os.Build;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final String f18126a;

    /* renamed from: b, reason: collision with root package name */
    public final a f18127b;

    public b(String appId, a aVar) {
        String deviceModel = Build.MODEL;
        String osVersion = Build.VERSION.RELEASE;
        w wVar = w.f18303b;
        Intrinsics.g(appId, "appId");
        Intrinsics.g(deviceModel, "deviceModel");
        Intrinsics.g(osVersion, "osVersion");
        this.f18126a = appId;
        this.f18127b = aVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        if (!Intrinsics.b(this.f18126a, bVar.f18126a)) {
            return false;
        }
        String str = Build.MODEL;
        if (!Intrinsics.b(str, str)) {
            return false;
        }
        String str2 = Build.VERSION.RELEASE;
        if (!Intrinsics.b(str2, str2)) {
            return false;
        }
        w wVar = w.f18303b;
        return this.f18127b.equals(bVar.f18127b);
    }

    public final int hashCode() {
        return this.f18127b.hashCode() + ((w.f18303b.hashCode() + b.c0.e((((Build.MODEL.hashCode() + (this.f18126a.hashCode() * 31)) * 31) + 48517566) * 31, 31, Build.VERSION.RELEASE)) * 31);
    }

    public final String toString() {
        return "ApplicationInfo(appId=" + this.f18126a + ", deviceModel=" + Build.MODEL + ", sessionSdkVersion=3.0.7, osVersion=" + Build.VERSION.RELEASE + ", logEnvironment=" + w.f18303b + ", androidAppInfo=" + this.f18127b + ')';
    }
}
