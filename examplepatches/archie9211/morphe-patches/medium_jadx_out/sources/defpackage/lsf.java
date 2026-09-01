package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lsf extends psf {
    public final byte[] d;
    public final int e;
    public final int f;

    public lsf(byte[] bArr, int i, int i2) {
        hsf.f(i, i + i2, bArr.length);
        this.d = bArr;
        this.e = i;
        this.f = i2;
    }

    @Override // defpackage.hsf
    public final byte d(int i) {
        return this.d[this.e + i];
    }

    @Override // defpackage.hsf
    public final int e() {
        return this.f;
    }

    @Override // defpackage.hsf
    public final psf m(int i, int i2) {
        int iF = hsf.f(i, i2, this.f);
        if (iF == 0) {
            return hsf.b;
        }
        return new lsf(this.d, this.e + i, iF);
    }

    @Override // defpackage.hsf
    public final void q(int i, byte[] bArr) {
        System.arraycopy(this.d, this.e, bArr, 0, i);
    }

    @Override // defpackage.hsf
    public final boolean s(hsf hsfVar) {
        boolean z = hsfVar instanceof rsf;
        if (!z && !(hsfVar instanceof lsf)) {
            return hsfVar.s(this);
        }
        int iE = hsfVar.e();
        int i = this.f;
        if (i > iE) {
            throw new IllegalArgumentException("Length too large: " + i + i);
        }
        if (i > hsfVar.e()) {
            ay0.e(ev6.v("Ran off end of other: 0, ", i, hsfVar.e(), ", "));
            return false;
        }
        byte[] bArr = this.d;
        int i2 = this.e;
        if (z) {
            return hsf.r(i2, 0, i, bArr, ((rsf) hsfVar).d);
        }
        if (!(hsfVar instanceof lsf)) {
            return hsfVar.m(0, i).equals(m(i2, i + i2));
        }
        lsf lsfVar = (lsf) hsfVar;
        return hsf.r(i2, lsfVar.e, i, bArr, lsfVar.d);
    }

    @Override // defpackage.hsf
    public final void u(htf htfVar) {
        htfVar.j(this.d, this.e, this.f);
    }

    @Override // defpackage.hsf
    public final int v(int i, int i2) {
        return ztf.a(i, this.e, i2, this.d);
    }

    @Override // defpackage.hsf
    public final xsf w() {
        return up1.O(this.d, this.e, this.f);
    }
}
