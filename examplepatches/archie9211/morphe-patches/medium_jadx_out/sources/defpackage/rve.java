package defpackage;

import androidx.core.widget.nRCC.nGxjfIr;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rve extends tve {
    public final String a;
    public final b24 b;

    public rve(String str, b24 b24Var) {
        this.a = str;
        this.b = b24Var;
    }

    @Override // defpackage.tve
    public final String a() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof rve)) {
            return false;
        }
        rve rveVar = (rve) obj;
        return this.a.equals(rveVar.a) && this.b.equals(rveVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "Error(source=" + this.a + ", errorState=" + this.b + nGxjfIr.KHophbA;
    }
}
