package defpackage;

import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class e3e implements h3e {
    public final az5 a;
    public final atb b;
    public final boolean c;
    public final boolean d;

    public e3e(az5 az5Var, atb atbVar, boolean z, boolean z2) {
        az5Var.getClass();
        atbVar.getClass();
        this.a = az5Var;
        this.b = atbVar;
        this.c = z;
        this.d = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e3e)) {
            return false;
        }
        e3e e3eVar = (e3e) obj;
        return g76.L(this.a, e3eVar.a) && g76.L(this.b, e3eVar.b) && this.c == e3eVar.c && this.d == e3eVar.d;
    }

    public final int hashCode() {
        return ((((this.b.hashCode() + (this.a.hashCode() * 31)) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Content(uiModels=");
        sb.append(this.a);
        sb.append(", searchBarState=");
        sb.append(this.b);
        sb.append(", isLoadingMore=");
        return b09.C(sb, this.c, eoLmc.kEueicJau, this.d, ")");
    }
}
