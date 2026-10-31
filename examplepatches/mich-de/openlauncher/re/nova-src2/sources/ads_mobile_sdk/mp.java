package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class mp {

    /* renamed from: a, reason: collision with root package name */
    public final int f7298a;

    /* renamed from: b, reason: collision with root package name */
    public final String f7299b;

    public mp(String str, int i5) {
        this.f7298a = i5;
        this.f7299b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof mp)) {
            return false;
        }
        mp mpVar = (mp) obj;
        return this.f7298a == mpVar.f7298a && Intrinsics.b(this.f7299b, mpVar.f7299b);
    }

    public final int hashCode() {
        return this.f7299b.hashCode() + (Integer.hashCode(this.f7298a) * 31);
    }

    public final String toString() {
        return "BowResponseError(code=" + this.f7298a + ", description=" + this.f7299b + ")";
    }
}
