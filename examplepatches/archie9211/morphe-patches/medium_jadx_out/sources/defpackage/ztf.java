package defpackage;

import java.nio.ByteBuffer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ztf {
    public static final byte[] a;

    static {
        byte[] bArr = new byte[0];
        a = bArr;
        ByteBuffer.wrap(bArr);
        up1.O(bArr, 0, 0);
    }

    public static int a(int i, int i2, int i3, byte[] bArr) {
        for (int i4 = i2; i4 < i2 + i3; i4++) {
            i = (i * 31) + bArr[i4];
        }
        return i;
    }

    public static int b(long j) {
        return (int) (j ^ (j >>> 32));
    }

    public static void c() {
        throw new IllegalArgumentException("Can't get the number of an unknown enum value.");
    }
}
