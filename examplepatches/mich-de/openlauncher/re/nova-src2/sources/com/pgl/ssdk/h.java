package com.pgl.ssdk;

import b.c0;
import b.u4;
import com.pgl.ssdk.d;
import java.nio.BufferUnderflowException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

/* loaded from: classes4.dex */
public class h {

    /* renamed from: a, reason: collision with root package name */
    private static final char[] f42363a = "0123456789abcdef".toCharArray();

    public static i a(q qVar, t tVar, int i5) throws j {
        try {
            d.a aVarA = d.a(qVar, tVar);
            long jB = aVarA.b();
            q qVarA = aVarA.a();
            ByteBuffer byteBufferA = qVarA.a(0L, (int) qVarA.a());
            byteBufferA.order(ByteOrder.LITTLE_ENDIAN);
            return new i(a(byteBufferA, i5), jB, tVar.a(), tVar.e(), tVar.d());
        } catch (b e3) {
            throw new j(e3.getMessage(), e3);
        }
    }

    public static ByteBuffer b(ByteBuffer byteBuffer) throws a {
        if (byteBuffer.remaining() < 4) {
            throw new a("Remaining buffer too short to contain length of length-prefixed field. Remaining: " + byteBuffer.remaining());
        }
        int i5 = byteBuffer.getInt();
        if (i5 < 0) {
            throw new IllegalArgumentException("Negative length");
        }
        if (i5 <= byteBuffer.remaining()) {
            return b(byteBuffer, i5);
        }
        StringBuilder sbJ = u4.j(i5, "Length-prefixed field longer than remaining buffer. Field length: ", ", remaining: ");
        sbJ.append(byteBuffer.remaining());
        throw new a(sbJ.toString());
    }

    public static byte[] c(ByteBuffer byteBuffer) throws a {
        int i5 = byteBuffer.getInt();
        if (i5 < 0) {
            throw new a("Negative length");
        }
        if (i5 <= byteBuffer.remaining()) {
            byte[] bArr = new byte[i5];
            byteBuffer.get(bArr);
            return bArr;
        }
        StringBuilder sbJ = u4.j(i5, "Underflow while reading length-prefixed value. Length: ", ", available: ");
        sbJ.append(byteBuffer.remaining());
        throw new a(sbJ.toString());
    }

    public static ByteBuffer a(ByteBuffer byteBuffer, int i5) throws j {
        a(byteBuffer);
        ByteBuffer byteBufferA = a(byteBuffer, 8, byteBuffer.capacity() - 24);
        int i11 = 0;
        while (byteBufferA.hasRemaining()) {
            i11++;
            if (byteBufferA.remaining() < 8) {
                throw new j("Insufficient data to read size of APK Signing Block entry #".concat(String.valueOf(i11)));
            }
            long j11 = byteBufferA.getLong();
            if (j11 < 4 || j11 > 2147483647L) {
                throw new j("APK Signing Block entry #" + i11 + " size out of range: " + j11);
            }
            int i12 = (int) j11;
            int iPosition = byteBufferA.position() + i12;
            if (i12 > byteBufferA.remaining()) {
                StringBuilder sbT = c0.t(i11, "APK Signing Block entry #", " size out of range: ", i12, ", available: ");
                sbT.append(byteBufferA.remaining());
                throw new j(sbT.toString());
            }
            if (byteBufferA.getInt() == i5) {
                return b(byteBufferA, i12 - 4);
            }
            byteBufferA.position(iPosition);
        }
        throw new j("No APK Signature Scheme block in APK Signing Block with ID: ".concat(String.valueOf(i5)));
    }

    private static ByteBuffer b(ByteBuffer byteBuffer, int i5) {
        if (i5 < 0) {
            throw new IllegalArgumentException("size: ".concat(String.valueOf(i5)));
        }
        int iLimit = byteBuffer.limit();
        int iPosition = byteBuffer.position();
        int i11 = i5 + iPosition;
        if (i11 < iPosition || i11 > iLimit) {
            throw new BufferUnderflowException();
        }
        byteBuffer.limit(i11);
        try {
            ByteBuffer byteBufferSlice = byteBuffer.slice();
            byteBufferSlice.order(byteBuffer.order());
            byteBuffer.position(i11);
            return byteBufferSlice;
        } finally {
            byteBuffer.limit(iLimit);
        }
    }

    private static ByteBuffer a(ByteBuffer byteBuffer, int i5, int i11) {
        if (i5 < 0) {
            throw new IllegalArgumentException("start: ".concat(String.valueOf(i5)));
        }
        if (i11 < i5) {
            throw new IllegalArgumentException(c0.g(i11, i5, "end < start: ", " < "));
        }
        int iCapacity = byteBuffer.capacity();
        if (i11 > byteBuffer.capacity()) {
            throw new IllegalArgumentException(c0.g(i11, iCapacity, "end > capacity: ", " > "));
        }
        int iLimit = byteBuffer.limit();
        int iPosition = byteBuffer.position();
        try {
            byteBuffer.position(0);
            byteBuffer.limit(i11);
            byteBuffer.position(i5);
            ByteBuffer byteBufferSlice = byteBuffer.slice();
            byteBufferSlice.order(byteBuffer.order());
            return byteBufferSlice;
        } finally {
            byteBuffer.position(0);
            byteBuffer.limit(iLimit);
            byteBuffer.position(iPosition);
        }
    }

    public static void a(ByteBuffer byteBuffer) {
        if (byteBuffer.order() != ByteOrder.LITTLE_ENDIAN) {
            throw new IllegalArgumentException("ByteBuffer byte order must be little endian");
        }
    }
}
