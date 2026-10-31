package bn;

import android.os.Build;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f18116a;

    /* renamed from: b, reason: collision with root package name */
    public final String f18117b;

    /* renamed from: c, reason: collision with root package name */
    public final String f18118c;

    /* renamed from: d, reason: collision with root package name */
    public final d0 f18119d;

    /* renamed from: e, reason: collision with root package name */
    public final ArrayList f18120e;

    public a(String str, String versionName, String appBuildVersion, d0 d0Var, ArrayList arrayList) {
        String deviceManufacturer = Build.MANUFACTURER;
        Intrinsics.g(versionName, "versionName");
        Intrinsics.g(appBuildVersion, "appBuildVersion");
        Intrinsics.g(deviceManufacturer, "deviceManufacturer");
        this.f18116a = str;
        this.f18117b = versionName;
        this.f18118c = appBuildVersion;
        this.f18119d = d0Var;
        this.f18120e = arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        if (!this.f18116a.equals(aVar.f18116a) || !Intrinsics.b(this.f18117b, aVar.f18117b) || !Intrinsics.b(this.f18118c, aVar.f18118c)) {
            return false;
        }
        String str = Build.MANUFACTURER;
        return Intrinsics.b(str, str) && this.f18119d.equals(aVar.f18119d) && this.f18120e.equals(aVar.f18120e);
    }

    public final int hashCode() {
        return this.f18120e.hashCode() + ((this.f18119d.hashCode() + b.c0.e(b.c0.e(b.c0.e(this.f18116a.hashCode() * 31, 31, this.f18117b), 31, this.f18118c), 31, Build.MANUFACTURER)) * 31);
    }

    public final String toString() {
        return "AndroidApplicationInfo(packageName=" + this.f18116a + ", versionName=" + this.f18117b + ", appBuildVersion=" + this.f18118c + ", deviceManufacturer=" + Build.MANUFACTURER + ", currentProcessDetails=" + this.f18119d + ", appProcessDetails=" + this.f18120e + ')';
    }
}
