package gl;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.IntBuffer;

/* loaded from: classes3.dex */
public abstract class i {

    /* renamed from: a, reason: collision with root package name */
    public static final int[] f57735a = c(new byte[]{101, 120, 112, 97, 110, 100, 32, 51, 50, 45, 98, 121, 116, 101, 32, 107});

    public static void a(int i5, int i11, int i12, int i13, int[] iArr) {
        int i14 = iArr[i5] + iArr[i11];
        iArr[i5] = i14;
        int i15 = i14 ^ iArr[i13];
        int i16 = (i15 >>> (-16)) | (i15 << 16);
        iArr[i13] = i16;
        int i17 = iArr[i12] + i16;
        iArr[i12] = i17;
        int i18 = iArr[i11] ^ i17;
        int i19 = (i18 >>> (-12)) | (i18 << 12);
        iArr[i11] = i19;
        int i21 = iArr[i5] + i19;
        iArr[i5] = i21;
        int i22 = iArr[i13] ^ i21;
        int i23 = (i22 >>> (-8)) | (i22 << 8);
        iArr[i13] = i23;
        int i24 = iArr[i12] + i23;
        iArr[i12] = i24;
        int i25 = iArr[i11] ^ i24;
        iArr[i11] = (i25 >>> (-7)) | (i25 << 7);
    }

    public static void b(int[] iArr) {
        for (int i5 = 0; i5 < 10; i5++) {
            a(0, 4, 8, 12, iArr);
            a(1, 5, 9, 13, iArr);
            a(2, 6, 10, 14, iArr);
            a(3, 7, 11, 15, iArr);
            a(0, 5, 10, 15, iArr);
            a(1, 6, 11, 12, iArr);
            a(2, 7, 8, 13, iArr);
            a(3, 4, 9, 14, iArr);
        }
    }

    public static int[] c(byte[] bArr) {
        if (bArr.length % 4 != 0) {
            throw new IllegalArgumentException("invalid input length");
        }
        IntBuffer intBufferAsIntBuffer = ByteBuffer.wrap(bArr).order(ByteOrder.LITTLE_ENDIAN).asIntBuffer();
        int[] iArr = new int[intBufferAsIntBuffer.remaining()];
        intBufferAsIntBuffer.get(iArr);
        return iArr;
    }
}
