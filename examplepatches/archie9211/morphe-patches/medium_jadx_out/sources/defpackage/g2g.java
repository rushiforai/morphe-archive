package defpackage;

import com.medium.android.common.ui.Ezz.Plbho;
import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class g2g extends t0g {
    public final int a;
    public final int b;
    public final int c;
    public final d2g d;

    public g2g(int i, int i2, int i3, d2g d2gVar) {
        this.a = i;
        this.b = i2;
        this.c = i3;
        this.d = d2gVar;
    }

    public static o2b b() {
        o2b o2bVar = new o2b(26, false);
        o2bVar.b = null;
        o2bVar.c = null;
        o2bVar.d = null;
        o2bVar.e = d2g.e;
        return o2bVar;
    }

    @Override // defpackage.bzf
    public final boolean a() {
        return this.d != d2g.e;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof g2g)) {
            return false;
        }
        g2g g2gVar = (g2g) obj;
        return g2gVar.a == this.a && g2gVar.b == this.b && g2gVar.c == this.c && g2gVar.d == this.d;
    }

    public final int hashCode() {
        return Objects.hash(g2g.class, Integer.valueOf(this.a), Integer.valueOf(this.b), Integer.valueOf(this.c), this.d);
    }

    public final String toString() {
        StringBuilder sbT = y30.t(this.b, "AesGcm Parameters (variant: ", String.valueOf(this.d), ", ", "-byte IV, ");
        sbT.append(this.c);
        sbT.append(Plbho.rsVOnSbAN);
        sbT.append(this.a);
        sbT.append("-byte key)");
        return sbT.toString();
    }
}
