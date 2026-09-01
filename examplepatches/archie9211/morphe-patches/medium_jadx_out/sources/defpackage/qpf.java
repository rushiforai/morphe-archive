package defpackage;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class qpf {
    public static final /* synthetic */ int a = 0;

    static {
        Charset charset = StandardCharsets.UTF_16;
    }

    public static int a(int i, int i2) {
        if (i % 2 != 0) {
            return (i | i2) - (i & i2);
        }
        return ((~i) & i2) | ((~i2) & i);
    }

    public static final void b(int i, int i2, int i3, int i4, int[] iArr) {
        int i5 = iArr[i] + iArr[i2];
        iArr[i] = i5;
        int iA = a(iArr[i3], i5);
        iArr[i3] = (iA << i4) | (iA >>> (32 - i4));
    }

    public static final void c(int i, int i2, int i3, int i4, int[] iArr) {
        b(i, i2, i4, 16, iArr);
        b(i3, i4, i2, 12, iArr);
        b(i, i2, i4, 8, iArr);
        b(i3, i4, i2, 7, iArr);
    }

    public static final int d(int i, byte[] bArr) {
        int i2 = bArr[i] & 255;
        int i3 = bArr[i + 1] & 255;
        int i4 = bArr[i + 2] & 255;
        return ((bArr[i + 3] & 255) << 24) | (i3 << 8) | i2 | (i4 << 16);
    }
}
