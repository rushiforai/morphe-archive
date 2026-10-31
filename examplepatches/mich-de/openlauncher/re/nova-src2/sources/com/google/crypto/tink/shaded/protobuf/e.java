package com.google.crypto.tink.shaded.protobuf;

/* loaded from: classes3.dex */
public final class e extends g {

    /* renamed from: e, reason: collision with root package name */
    public final int f34592e;

    /* renamed from: f, reason: collision with root package name */
    public final int f34593f;

    public e(byte[] bArr, int i5, int i11) {
        super(bArr);
        i.d(i5, i5 + i11, bArr.length);
        this.f34592e = i5;
        this.f34593f = i11;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.g, com.google.crypto.tink.shaded.protobuf.i
    public final byte c(int i5) {
        int i11 = this.f34593f;
        if (((i11 - (i5 + 1)) | i5) >= 0) {
            return this.f34597d[this.f34592e + i5];
        }
        if (i5 < 0) {
            throw new ArrayIndexOutOfBoundsException(b.c0.h(i5, "Index < 0: "));
        }
        throw new ArrayIndexOutOfBoundsException(b.c0.g(i5, i11, "Index > length: ", ", "));
    }

    @Override // com.google.crypto.tink.shaded.protobuf.g, com.google.crypto.tink.shaded.protobuf.i
    public final void f(int i5, byte[] bArr) {
        System.arraycopy(this.f34597d, this.f34592e, bArr, 0, i5);
    }

    @Override // com.google.crypto.tink.shaded.protobuf.g, com.google.crypto.tink.shaded.protobuf.i
    public final byte g(int i5) {
        return this.f34597d[this.f34592e + i5];
    }

    @Override // com.google.crypto.tink.shaded.protobuf.g
    public final int j() {
        return this.f34592e;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.g, com.google.crypto.tink.shaded.protobuf.i
    public final int size() {
        return this.f34593f;
    }
}
