package defpackage;

import androidx.core.widget.nRCC.nGxjfIr;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class w0d implements xx5 {
    public final ew5 a;
    public final rx5 b;
    public final st2 c;
    public final cx7 d;
    public final String e;
    public final boolean f;
    public final boolean g;

    public w0d(ew5 ew5Var, rx5 rx5Var, st2 st2Var, cx7 cx7Var, String str, boolean z, boolean z2) {
        this.a = ew5Var;
        this.b = rx5Var;
        this.c = st2Var;
        this.d = cx7Var;
        this.e = str;
        this.f = z;
        this.g = z2;
    }

    @Override // defpackage.xx5
    public final ew5 a() {
        return this.a;
    }

    @Override // defpackage.xx5
    public final rx5 b() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w0d)) {
            return false;
        }
        w0d w0dVar = (w0d) obj;
        return g76.L(this.a, w0dVar.a) && g76.L(this.b, w0dVar.b) && this.c == w0dVar.c && g76.L(this.d, w0dVar.d) && g76.L(this.e, w0dVar.e) && this.f == w0dVar.f && this.g == w0dVar.g;
    }

    public final int hashCode() {
        int iHashCode = (this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31)) * 31;
        cx7 cx7Var = this.d;
        int iHashCode2 = (iHashCode + (cx7Var == null ? 0 : cx7Var.hashCode())) * 31;
        String str = this.e;
        return ((((iHashCode2 + (str != null ? str.hashCode() : 0)) * 31) + (this.f ? 1231 : 1237)) * 31) + (this.g ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("SuccessResult(image=");
        sb.append(this.a);
        sb.append(", request=");
        sb.append(this.b);
        sb.append(", dataSource=");
        sb.append(this.c);
        sb.append(", memoryCacheKey=");
        sb.append(this.d);
        sb.append(", diskCacheKey=");
        sb.append(this.e);
        sb.append(", isSampled=");
        sb.append(this.f);
        sb.append(nGxjfIr.mOyI);
        return ev6.A(sb, this.g, ')');
    }

    public /* synthetic */ w0d(ew5 ew5Var, rx5 rx5Var, st2 st2Var, int i) {
        this(ew5Var, rx5Var, (i & 4) != 0 ? st2.MEMORY : st2Var, null, null, false, false);
    }
}
