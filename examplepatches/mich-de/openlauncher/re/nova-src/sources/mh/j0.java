package mh;

/* loaded from: classes3.dex */
public final class j0 extends k0 {

    /* renamed from: d, reason: collision with root package name */
    public final int f76347d;

    /* renamed from: e, reason: collision with root package name */
    public final int f76348e;

    public j0(byte[] bArr, int i5, int i11) {
        super(bArr);
        k0.j(i5, i5 + i11, bArr.length);
        this.f76347d = i5;
        this.f76348e = i11;
    }

    @Override // mh.k0
    public final byte c(int i5) {
        int i11 = this.f76348e;
        if (((i11 - (i5 + 1)) | i5) >= 0) {
            return this.f76353b[this.f76347d + i5];
        }
        if (i5 < 0) {
            throw new ArrayIndexOutOfBoundsException(b.c0.h(i5, "Index < 0: "));
        }
        throw new ArrayIndexOutOfBoundsException(b.c0.g(i5, i11, "Index > length: ", ", "));
    }

    @Override // mh.k0
    public final byte d(int i5) {
        return this.f76353b[this.f76347d + i5];
    }

    @Override // mh.k0
    public final int e() {
        return this.f76347d;
    }

    @Override // mh.k0
    public final int f() {
        return this.f76348e;
    }

    @Override // mh.k0
    public final void g(int i5, byte[] bArr) {
        System.arraycopy(this.f76353b, this.f76347d, bArr, 0, i5);
    }
}
