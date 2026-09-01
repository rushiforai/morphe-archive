package com.drew.lang;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ByteUtil {
    public static int getInt16(byte[] bArr, int i, boolean z) {
        int i2;
        int i3;
        if (z) {
            i2 = (bArr[i] & 255) << 8;
            i3 = bArr[i + 1] & 255;
        } else {
            i2 = bArr[i] & 255;
            i3 = (bArr[i + 1] & 255) << 8;
        }
        return i3 | i2;
    }

    public static int getInt32(byte[] bArr, int i, boolean z) {
        int i2;
        int i3;
        if (z) {
            i2 = ((bArr[i] & 255) << 24) | ((bArr[i + 1] & 255) << 16) | ((bArr[i + 2] & 255) << 8);
            i3 = bArr[i + 3] & 255;
        } else {
            i2 = (bArr[i] & 255) | ((bArr[i + 1] & 255) << 8) | ((bArr[i + 2] & 255) << 16);
            i3 = (bArr[i + 3] & 255) << 24;
        }
        return i3 | i2;
    }

    public static long getLong64(byte[] bArr, int i, boolean z) {
        long j;
        long j2;
        if (z) {
            j = (((long) (bArr[i + 4] & 255)) << 24) | (((long) (bArr[i + 2] & 255)) << 40) | (((long) (bArr[i] & 255)) << 56) | (((long) (bArr[i + 1] & 255)) << 48) | (((long) (bArr[i + 3] & 255)) << 32) | ((long) ((bArr[i + 5] & 255) << 16)) | ((long) ((bArr[i + 6] & 255) << 8));
            j2 = bArr[i + 7] & 255;
        } else {
            j = (((long) (bArr[i + 4] & 255)) << 32) | ((long) ((bArr[i] & 255) | ((bArr[i + 1] & 255) << 8) | ((bArr[i + 2] & 255) << 16))) | (((long) (bArr[i + 3] & 255)) << 24) | (((long) (bArr[i + 5] & 255)) << 40) | (((long) (bArr[i + 6] & 255)) << 48);
            j2 = ((long) (bArr[i + 7] & 255)) << 56;
        }
        return j2 | j;
    }
}
