package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ue extends xe {
    public final List a;
    public final boolean b;
    public final boolean c;
    public final int d;

    public ue(List list, boolean z, boolean z2, int i) {
        list.getClass();
        this.a = list;
        this.b = z;
        this.c = z2;
        this.d = i;
    }

    @Override // defpackage.xe
    public final int a() {
        return this.d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ue)) {
            return false;
        }
        ue ueVar = (ue) obj;
        return g76.L(this.a, ueVar.a) && this.b == ueVar.b && this.c == ueVar.c && this.d == ueVar.d;
    }

    public final int hashCode() {
        return (((((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237)) * 31) + this.d;
    }

    public final String toString() {
        StringBuilder sbX = ka1.x("Data(items=", this.a, ", isRefreshing=", this.b, ", isLoadingMore=");
        sbX.append(this.c);
        sbX.append(", total=");
        sbX.append(this.d);
        sbX.append(")");
        return sbX.toString();
    }
}
