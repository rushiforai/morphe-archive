package com.google.android.gms.internal.measurement;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.security.GeneralSecurityException;
import java.security.InvalidKeyException;

/* loaded from: classes3.dex */
public abstract class a0 {

    /* renamed from: a, reason: collision with root package name */
    public int f32362a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f32363b;

    public a0(ei eiVar, int i5) {
        if (eiVar == null) {
            throw new IllegalArgumentException("format options cannot be null");
        }
        if (i5 < 0) {
            throw new IllegalArgumentException(b.c0.p(new StringBuilder(String.valueOf(i5).length() + 15), "invalid index: ", i5));
        }
        this.f32362a = i5;
        this.f32363b = eiVar;
    }

    public ByteBuffer a(int i5, byte[] bArr) {
        int[] iArrB = b(gl.i.c(bArr), i5);
        int[] iArr = (int[]) iArrB.clone();
        gl.i.b(iArr);
        for (int i11 = 0; i11 < iArrB.length; i11++) {
            iArrB[i11] = iArrB[i11] + iArr[i11];
        }
        ByteBuffer byteBufferOrder = ByteBuffer.allocate(64).order(ByteOrder.LITTLE_ENDIAN);
        byteBufferOrder.asIntBuffer().put(iArrB, 0, 16);
        return byteBufferOrder;
    }

    public abstract int[] b(int[] iArr, int i5);

    public abstract void c(int i5);

    public abstract int d();

    public void e(byte[] bArr, ByteBuffer byteBuffer, ByteBuffer byteBuffer2) throws GeneralSecurityException {
        if (bArr.length != d()) {
            throw new GeneralSecurityException("The nonce length (in bytes) must be " + d());
        }
        int iRemaining = byteBuffer2.remaining();
        int i5 = iRemaining / 64;
        int i11 = i5 + 1;
        for (int i12 = 0; i12 < i11; i12++) {
            ByteBuffer byteBufferA = a(this.f32362a + i12, bArr);
            if (i12 == i5) {
                sl.d.h(byteBuffer, byteBuffer2, byteBufferA, iRemaining % 64);
            } else {
                sl.d.h(byteBuffer, byteBuffer2, byteBufferA, 64);
            }
        }
    }

    public abstract void f(xg xgVar, Object obj);

    public a0(byte[] bArr, int i5) throws InvalidKeyException {
        if (bArr.length == 32) {
            this.f32363b = gl.i.c(bArr);
            this.f32362a = i5;
            return;
        }
        throw new InvalidKeyException("The key length in bytes must be 32.");
    }

    public a0(String str) {
        this.f32363b = str;
    }
}
