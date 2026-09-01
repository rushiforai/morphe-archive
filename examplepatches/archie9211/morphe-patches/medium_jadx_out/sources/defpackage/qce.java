package defpackage;

import com.medium.android.core.membership.UpsellInfo;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qce implements sce {
    public final String a;
    public final UpsellInfo b;

    public qce(UpsellInfo upsellInfo, String str) {
        this.a = str;
        this.b = upsellInfo;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qce)) {
            return false;
        }
        qce qceVar = (qce) obj;
        return this.a.equals(qceVar.a) && this.b.equals(qceVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "GoToSubscriptionScreen(source=" + this.a + ", upsellInfo=" + this.b + ")";
    }
}
