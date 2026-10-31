package ads_mobile_sdk;

import b.c0;
import b.k9;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;

/* loaded from: classes.dex */
public final class md1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f7136a;

    /* renamed from: b, reason: collision with root package name */
    public final List f7137b;

    /* renamed from: c, reason: collision with root package name */
    public final int f7138c;

    /* renamed from: d, reason: collision with root package name */
    public final int f7139d;

    /* renamed from: e, reason: collision with root package name */
    public final int f7140e;

    /* renamed from: f, reason: collision with root package name */
    public final long f7141f;

    /* renamed from: g, reason: collision with root package name */
    public final ni.b f7142g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f7143h;

    public md1(String str, List list, int i5, int i11, int i12, long j11, ni.b attributionInfoPlacement, boolean z11) {
        Intrinsics.g(attributionInfoPlacement, "attributionInfoPlacement");
        this.f7136a = str;
        this.f7137b = list;
        this.f7138c = i5;
        this.f7139d = i11;
        this.f7140e = i12;
        this.f7141f = j11;
        this.f7142g = attributionInfoPlacement;
        this.f7143h = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof md1)) {
            return false;
        }
        md1 md1Var = (md1) obj;
        return Intrinsics.b(this.f7136a, md1Var.f7136a) && Intrinsics.b(this.f7137b, md1Var.f7137b) && this.f7138c == md1Var.f7138c && this.f7139d == md1Var.f7139d && this.f7140e == md1Var.f7140e && Duration.d(this.f7141f, md1Var.f7141f) && this.f7142g == md1Var.f7142g && this.f7143h == md1Var.f7143h;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iB = k9.b(this.f7140e, k9.b(this.f7139d, k9.b(this.f7138c, k9.d(this.f7136a.hashCode() * 31, this.f7137b))));
        Duration.Companion companion = Duration.f72038b;
        int iHashCode = (this.f7142g.hashCode() + c0.d(iB, 31, this.f7141f)) * 31;
        boolean z11 = this.f7143h;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return iHashCode + i5;
    }

    public final String toString() {
        String strR = Duration.r(this.f7141f);
        StringBuilder sb2 = new StringBuilder("InternalAttributionInfo(text=");
        sb2.append(this.f7136a);
        sb2.append(", icons=");
        sb2.append(this.f7137b);
        sb2.append(", backgroundColor=");
        c0.A(sb2, this.f7138c, ", textColor=", this.f7139d, ", textSize=");
        sb2.append(this.f7140e);
        sb2.append(", animationInterval=");
        sb2.append(strR);
        sb2.append(", attributionInfoPlacement=");
        sb2.append(this.f7142g);
        sb2.append(", allowPubRendering=");
        sb2.append(this.f7143h);
        sb2.append(")");
        return sb2.toString();
    }
}
