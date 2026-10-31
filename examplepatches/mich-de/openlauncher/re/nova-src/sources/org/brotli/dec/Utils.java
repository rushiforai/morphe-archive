package org.brotli.dec;

import b.c0;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.Buffer;
import java.nio.ByteBuffer;

/* loaded from: classes5.dex */
final class Utils {
    private static final byte[] BYTE_ZEROES = new byte[1024];
    private static final int[] INT_ZEROES = new int[1024];

    public static ByteBuffer asReadOnlyBuffer(ByteBuffer byteBuffer) {
        return byteBuffer.asReadOnlyBuffer();
    }

    public static void closeInput(State state) throws IOException {
        state.input.close();
        state.input = makeEmptyInput();
    }

    public static void copyBytes(byte[] bArr, int i5, byte[] bArr2, int i11, int i12) {
        System.arraycopy(bArr2, i11, bArr, i5, i12 - i11);
    }

    public static void copyBytesWithin(byte[] bArr, int i5, int i11, int i12) {
        System.arraycopy(bArr, i11, bArr, i5, i12 - i11);
    }

    public static void fillBytesWithZeroes(byte[] bArr, int i5, int i11) {
        while (i5 < i11) {
            int iMin = Math.min(i5 + 1024, i11) - i5;
            System.arraycopy(BYTE_ZEROES, 0, bArr, i5, iMin);
            i5 += iMin;
        }
    }

    public static void fillIntsWithZeroes(int[] iArr, int i5, int i11) {
        while (i5 < i11) {
            int iMin = Math.min(i5 + 1024, i11) - i5;
            System.arraycopy(INT_ZEROES, 0, iArr, i5, iMin);
            i5 += iMin;
        }
    }

    public static void flipBuffer(Buffer buffer) {
        buffer.flip();
    }

    public static int getLogBintness() {
        return Boolean.parseBoolean(System.getProperty("BROTLI_32_BIT_CPU")) ? 5 : 6;
    }

    public static int isDebugMode() {
        return Boolean.parseBoolean(System.getProperty("BROTLI_ENABLE_ASSERTS")) ? 1 : 0;
    }

    public static int isDirect(ByteBuffer byteBuffer) {
        return byteBuffer.isDirect() ? 1 : 0;
    }

    public static int isReadOnly(ByteBuffer byteBuffer) {
        return byteBuffer.isReadOnly() ? 1 : 0;
    }

    public static InputStream makeEmptyInput() {
        return new ByteArrayInputStream(new byte[0]);
    }

    public static int makeError(State state, int i5) {
        if (i5 >= 0) {
            return i5;
        }
        if (state.runningState >= 0) {
            state.runningState = i5;
        }
        if (i5 <= -21) {
            throw new IllegalStateException(c0.h(i5, "Brotli error code: "));
        }
        throw new BrotliRuntimeException(c0.h(i5, "Error code: "));
    }

    public static int min(int i5, int i11) {
        return Math.min(i5, i11);
    }

    public static int readInput(State state, byte[] bArr, int i5, int i11) {
        try {
            return state.input.read(bArr, i5, i11);
        } catch (IOException unused) {
            return makeError(state, -14);
        }
    }

    public static int shr32(int i5, int i11) {
        return i5 >>> i11;
    }

    public static long shr64(long j11, int i5) {
        return j11 >>> i5;
    }

    public static byte[] toUsAsciiBytes(String str) {
        try {
            return str.getBytes("US-ASCII");
        } catch (UnsupportedEncodingException e3) {
            throw new RuntimeException(e3);
        }
    }

    public static int[] toUtf8Runes(String str) {
        int[] iArr = new int[str.length()];
        for (int i5 = 0; i5 < str.length(); i5++) {
            iArr[i5] = str.charAt(i5);
        }
        return iArr;
    }
}
