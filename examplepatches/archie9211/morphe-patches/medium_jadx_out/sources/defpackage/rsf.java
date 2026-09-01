package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rsf extends psf {
    public final byte[] d;

    public rsf(byte[] bArr) {
        bArr.getClass();
        this.d = bArr;
    }

    @Override // defpackage.hsf
    public final byte d(int i) {
        return this.d[i];
    }

    @Override // defpackage.hsf
    public final int e() {
        return this.d.length;
    }

    @Override // defpackage.hsf
    public final psf m(int i, int i2) {
        byte[] bArr = this.d;
        int iF = hsf.f(0, i2, bArr.length);
        return iF == 0 ? hsf.b : new lsf(bArr, 0, iF);
    }

    @Override // defpackage.hsf
    public final void q(int i, byte[] bArr) {
        System.arraycopy(this.d, 0, bArr, 0, i);
    }

    @Override // defpackage.hsf
    public final boolean s(hsf hsfVar) {
        boolean z = hsfVar instanceof rsf;
        byte[] bArr = this.d;
        if (z) {
            return Arrays.equals(bArr, ((rsf) hsfVar).d);
        }
        if (!(hsfVar instanceof lsf)) {
            return hsfVar.s(this);
        }
        int length = bArr.length;
        if (length > hsfVar.e()) {
            ygf.h(length, bArr.length);
            return false;
        }
        if (length > hsfVar.e()) {
            ay0.e(ev6.v("Ran off end of other: 0, ", length, hsfVar.e(), ", "));
            return false;
        }
        if (hsfVar instanceof rsf) {
            return hsf.r(0, 0, length, bArr, ((rsf) hsfVar).d);
        }
        lsf lsfVar = (lsf) hsfVar;
        return hsf.r(0, lsfVar.e, length, bArr, lsfVar.d);
    }

    @Override // defpackage.hsf
    public final void u(htf htfVar) {
        byte[] bArr = this.d;
        htfVar.j(bArr, 0, bArr.length);
    }

    @Override // defpackage.hsf
    public final int v(int i, int i2) {
        return ztf.a(i, 0, i2, this.d);
    }

    @Override // defpackage.hsf
    public final xsf w() {
        byte[] bArr = this.d;
        return up1.O(bArr, 0, bArr.length);
    }
}
