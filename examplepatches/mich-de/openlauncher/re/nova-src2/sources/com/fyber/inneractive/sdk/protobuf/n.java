package com.fyber.inneractive.sdk.protobuf;

import java.io.IOException;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;

/* loaded from: classes3.dex */
public final class n extends q {
    private static final long serialVersionUID = 1;

    /* renamed from: e, reason: collision with root package name */
    public final int f30853e;

    /* renamed from: f, reason: collision with root package name */
    public final int f30854f;

    public n(byte[] bArr, int i5, int i11) {
        super(bArr);
        s.a(i5, i5 + i11, bArr.length);
        this.f30853e = i5;
        this.f30854f = i11;
    }

    private void readObject(ObjectInputStream objectInputStream) throws IOException {
        throw new InvalidObjectException("BoundedByteStream instances are not to be serialized directly");
    }

    @Override // com.fyber.inneractive.sdk.protobuf.q, com.fyber.inneractive.sdk.protobuf.s
    public final void a(int i5, byte[] bArr) {
        System.arraycopy(this.f30874d, this.f30853e, bArr, 0, i5);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.q, com.fyber.inneractive.sdk.protobuf.s
    public final byte c(int i5) {
        int i11 = this.f30854f;
        if (((i11 - (i5 + 1)) | i5) >= 0) {
            return this.f30874d[this.f30853e + i5];
        }
        if (i5 < 0) {
            throw new ArrayIndexOutOfBoundsException(com.fyber.inneractive.sdk.player.exoplayer2.m.a("Index < 0: ", i5));
        }
        throw new ArrayIndexOutOfBoundsException(b.c0.g(i5, i11, "Index > length: ", ", "));
    }

    @Override // com.fyber.inneractive.sdk.protobuf.q, com.fyber.inneractive.sdk.protobuf.s
    public final byte d(int i5) {
        return this.f30874d[this.f30853e + i5];
    }

    @Override // com.fyber.inneractive.sdk.protobuf.q
    public final int g() {
        return this.f30853e;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.q, com.fyber.inneractive.sdk.protobuf.s
    public final int size() {
        return this.f30854f;
    }

    public Object writeReplace() {
        byte[] bArr;
        int size = size();
        if (size == 0) {
            bArr = l1.f30848b;
        } else {
            byte[] bArr2 = new byte[size];
            a(size, bArr2);
            bArr = bArr2;
        }
        return new q(bArr);
    }
}
