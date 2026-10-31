package com.google.protobuf;

/* loaded from: classes3.dex */
public final class i extends j {

    /* renamed from: e, reason: collision with root package name */
    public final int f34872e;

    /* renamed from: f, reason: collision with root package name */
    public final int f34873f;

    public i(byte[] bArr, int i5, int i11) {
        super(bArr);
        l.d(i5, i5 + i11, bArr.length);
        this.f34872e = i5;
        this.f34873f = i11;
    }

    @Override // com.google.protobuf.j, com.google.protobuf.l
    public final byte c(int i5) {
        int i11 = this.f34873f;
        if (((i11 - (i5 + 1)) | i5) >= 0) {
            return this.f34876d[this.f34872e + i5];
        }
        if (i5 < 0) {
            throw new ArrayIndexOutOfBoundsException(b.c0.h(i5, "Index < 0: "));
        }
        throw new ArrayIndexOutOfBoundsException(b.c0.g(i5, i11, "Index > length: ", ", "));
    }

    @Override // com.google.protobuf.j, com.google.protobuf.l
    public final byte g(int i5) {
        return this.f34876d[this.f34872e + i5];
    }

    @Override // com.google.protobuf.j
    public final int q() {
        return this.f34872e;
    }

    @Override // com.google.protobuf.j, com.google.protobuf.l
    public final int size() {
        return this.f34873f;
    }
}
