package defpackage;

import com.drew.metadata.photoshop.PhotoshopDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z75 {
    public static final z75 g = new z75(4201, 4096, 1);
    public static final z75 h = new z75(PhotoshopDirectory.TAG_THUMBNAIL_OLD, 1024, 1);
    public static final z75 i = new z75(67, 64, 1);
    public static final z75 j = new z75(19, 16, 1);
    public static final z75 k = new z75(285, 256, 0);
    public static final z75 l = new z75(301, 256, 1);
    public final int[] a;
    public final int[] b;
    public final a85 c;
    public final int d;
    public final int e;
    public final int f;

    public z75(int i2, int i3, int i4) {
        this.e = i2;
        this.d = i3;
        this.f = i4;
        this.a = new int[i3];
        this.b = new int[i3];
        int i5 = 1;
        for (int i6 = 0; i6 < i3; i6++) {
            this.a[i6] = i5;
            i5 <<= 1;
            if (i5 >= i3) {
                i5 = (i5 ^ i2) & (i3 - 1);
            }
        }
        for (int i7 = 0; i7 < i3 - 1; i7++) {
            this.b[this.a[i7]] = i7;
        }
        this.c = new a85(this, new int[]{0});
    }

    public final int a(int i2, int i3) {
        if (i2 == 0 || i3 == 0) {
            return 0;
        }
        int[] iArr = this.b;
        return this.a[(iArr[i2] + iArr[i3]) % (this.d - 1)];
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("GF(0x");
        sb.append(Integer.toHexString(this.e));
        sb.append(',');
        return km4.A(sb, this.d, ')');
    }
}
