package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y5g extends a6g {
    public final int d;
    public final int e;

    public y5g(byte[] bArr, int i, int i2) {
        super(bArr);
        a6g.r(i, i + i2, bArr.length);
        this.d = i;
        this.e = i2;
    }

    @Override // defpackage.a6g
    public final byte d(int i) {
        int i2 = this.e;
        if (((i2 - (i + 1)) | i) >= 0) {
            return this.b[this.d + i];
        }
        if (i < 0) {
            throw new ArrayIndexOutOfBoundsException(b09.w(i, "Index < 0: "));
        }
        throw new ArrayIndexOutOfBoundsException(ev6.v("Index > length: ", i, i2, ", "));
    }

    @Override // defpackage.a6g
    public final byte e(int i) {
        return this.b[this.d + i];
    }

    @Override // defpackage.a6g
    public final int f() {
        return this.d;
    }

    @Override // defpackage.a6g
    public final int m() {
        return this.e;
    }

    @Override // defpackage.a6g
    public final void p(int i, byte[] bArr) {
        System.arraycopy(this.b, this.d, bArr, 0, i);
    }
}
