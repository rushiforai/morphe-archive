package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r3g extends t3g {
    public final byte[] c;
    public final int d;
    public final int e;

    public r3g(byte[] bArr, int i, int i2) {
        t3g.s(i, i + i2, bArr.length);
        this.c = bArr;
        this.d = i;
        this.e = i2;
    }

    @Override // defpackage.t3g
    public final byte d(int i) {
        return this.c[this.d + i];
    }

    @Override // defpackage.t3g
    public final int e(int i, int i2) {
        return s5g.a(i, this.d, i2, this.c);
    }

    @Override // defpackage.t3g
    public final int f() {
        return this.e;
    }

    @Override // defpackage.t3g
    public final t3g m(int i, int i2) {
        int iS = t3g.s(i, i2, this.e);
        if (iS == 0) {
            return t3g.b;
        }
        return new r3g(this.c, this.d + i, iS);
    }

    @Override // defpackage.t3g
    public final void p(int i, byte[] bArr) {
        System.arraycopy(this.c, this.d, bArr, 0, i);
    }

    @Override // defpackage.t3g
    public final void q(c4g c4gVar) {
        c4gVar.c(this.c, this.d, this.e);
    }

    @Override // defpackage.t3g
    public final boolean r(t3g t3gVar) {
        boolean z = t3gVar instanceof u3g;
        if (!z && !(t3gVar instanceof r3g)) {
            return t3gVar.r(this);
        }
        int iF = t3gVar.f();
        int i = this.e;
        if (i > iF) {
            throw new IllegalArgumentException("Length too large: " + i + i);
        }
        if (i > t3gVar.f()) {
            ay0.e(ev6.v("Ran off end of other: 0, ", i, t3gVar.f(), ", "));
            return false;
        }
        byte[] bArr = this.c;
        int i2 = this.d;
        if (z) {
            return t3g.u(i2, 0, i, bArr, ((u3g) t3gVar).c);
        }
        if (!(t3gVar instanceof r3g)) {
            return t3gVar.m(0, i).equals(m(i2, i + i2));
        }
        r3g r3gVar = (r3g) t3gVar;
        return t3g.u(i2, r3gVar.d, i, bArr, r3gVar.c);
    }
}
