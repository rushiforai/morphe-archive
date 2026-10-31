package org.brotli.dec;

import java.nio.ByteBuffer;

/* loaded from: classes5.dex */
public final class Dictionary {
    static final int MAX_DICTIONARY_WORD_LENGTH = 31;
    static final int MIN_DICTIONARY_WORD_LENGTH = 4;
    private static ByteBuffer data = ByteBuffer.allocateDirect(0);
    static final int[] offsets = new int[32];
    static final int[] sizeBits = new int[32];
    private static final int DICTIONARY_DEBUG = Utils.isDebugMode();

    public static class DataLoader {
        static final boolean OK;

        static {
            boolean z11;
            try {
                Class.forName(Dictionary.class.getPackage().getName() + ".DictionaryData");
                z11 = true;
            } catch (Throwable unused) {
                z11 = false;
            }
            OK = z11;
        }

        private DataLoader() {
        }
    }

    private Dictionary() {
    }

    public static ByteBuffer getData() {
        if (data.capacity() == 0 && !DataLoader.OK) {
            throw new BrotliRuntimeException("brotli dictionary is not set");
        }
        return data;
    }

    public static void setData(ByteBuffer byteBuffer, int[] iArr) {
        if (DICTIONARY_DEBUG != 0) {
            if (Utils.isDirect(byteBuffer) == 0 || Utils.isReadOnly(byteBuffer) == 0) {
                throw new BrotliRuntimeException("newData must be a direct read-only byte buffer");
            }
            if (iArr.length > 31) {
                throw new BrotliRuntimeException("sizeBits length must be at most " + String.valueOf(31));
            }
            for (int i5 = 0; i5 < 4; i5++) {
                if (iArr[i5] != 0) {
                    throw new BrotliRuntimeException("first " + String.valueOf(4) + " must be 0");
                }
            }
        }
        int[] iArr2 = offsets;
        int[] iArr3 = sizeBits;
        for (int i11 = 0; i11 < iArr.length; i11++) {
            iArr3[i11] = iArr[i11];
        }
        int i12 = 0;
        for (int i13 = 0; i13 < iArr.length; i13++) {
            iArr2[i13] = i12;
            int i14 = iArr3[i13];
            if (i14 != 0) {
                i12 += i13 << (i14 & 31);
                if (DICTIONARY_DEBUG == 0) {
                    continue;
                } else {
                    if (i14 >= 31) {
                        throw new BrotliRuntimeException("newSizeBits values must be less than 31");
                    }
                    if (i12 <= 0 || i12 > byteBuffer.capacity()) {
                        throw new BrotliRuntimeException("newSizeBits is inconsistent: overflow");
                    }
                }
            }
        }
        for (int length = iArr.length; length < 32; length++) {
            iArr2[length] = i12;
        }
        if (DICTIONARY_DEBUG != 0 && i12 != byteBuffer.capacity()) {
            throw new BrotliRuntimeException("newSizeBits is inconsistent: underflow");
        }
        data = byteBuffer;
    }
}
