package androidx.datastore.preferences.protobuf;

/* loaded from: classes2.dex */
public final class f extends h {

    /* renamed from: e, reason: collision with root package name */
    public final int f14314e;

    /* renamed from: f, reason: collision with root package name */
    public final int f14315f;

    public f(byte[] bArr, int i5, int i11) {
        super(bArr);
        h.d(i5, i5 + i11, bArr.length);
        this.f14314e = i5;
        this.f14315f = i11;
    }

    @Override // androidx.datastore.preferences.protobuf.h
    public final byte c(int i5) {
        int i11 = this.f14315f;
        if (((i11 - (i5 + 1)) | i5) >= 0) {
            return this.f14327b[this.f14314e + i5];
        }
        if (i5 < 0) {
            throw new ArrayIndexOutOfBoundsException(b.c0.h(i5, "Index < 0: "));
        }
        throw new ArrayIndexOutOfBoundsException(b.c0.g(i5, i11, "Index > length: ", ", "));
    }

    @Override // androidx.datastore.preferences.protobuf.h
    public final void f(int i5, byte[] bArr) {
        System.arraycopy(this.f14327b, this.f14314e, bArr, 0, i5);
    }

    @Override // androidx.datastore.preferences.protobuf.h
    public final int g() {
        return this.f14314e;
    }

    @Override // androidx.datastore.preferences.protobuf.h
    public final byte h(int i5) {
        return this.f14327b[this.f14314e + i5];
    }

    @Override // androidx.datastore.preferences.protobuf.h
    public final int size() {
        return this.f14315f;
    }
}
