package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u3g extends t3g {
    public final byte[] c;

    public u3g(byte[] bArr) {
        this.c = bArr;
    }

    @Override // defpackage.t3g
    public final byte d(int i) {
        return this.c[i];
    }

    @Override // defpackage.t3g
    public final int e(int i, int i2) {
        return s5g.a(i, 0, i2, this.c);
    }

    @Override // defpackage.t3g
    public final int f() {
        return this.c.length;
    }

    @Override // defpackage.t3g
    public final t3g m(int i, int i2) {
        byte[] bArr = this.c;
        int iS = t3g.s(0, i2, bArr.length);
        return iS == 0 ? t3g.b : new r3g(bArr, 0, iS);
    }

    @Override // defpackage.t3g
    public final void p(int i, byte[] bArr) {
        System.arraycopy(this.c, 0, bArr, 0, i);
    }

    @Override // defpackage.t3g
    public final void q(c4g c4gVar) {
        byte[] bArr = this.c;
        c4gVar.c(bArr, 0, bArr.length);
    }

    @Override // defpackage.t3g
    public final boolean r(t3g t3gVar) {
        boolean z = t3gVar instanceof u3g;
        byte[] bArr = this.c;
        if (z) {
            return Arrays.equals(bArr, ((u3g) t3gVar).c);
        }
        boolean z2 = t3gVar instanceof r3g;
        if (!z2) {
            return t3gVar.r(this);
        }
        r3g r3gVar = (r3g) t3gVar;
        int i = r3gVar.e;
        int length = bArr.length;
        if (length > i) {
            throw new IllegalArgumentException("Length too large: " + length + length);
        }
        if (length > i) {
            ay0.e(ev6.v("Ran off end of other: 0, ", length, i, ", "));
            return false;
        }
        if (z) {
            return t3g.u(0, 0, length, bArr, ((u3g) t3gVar).c);
        }
        if (!z2) {
            return t3gVar.m(0, length).equals(m(0, length));
        }
        return t3g.u(0, r3gVar.d, length, bArr, r3gVar.c);
    }
}
