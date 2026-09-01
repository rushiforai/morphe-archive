package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ugg {
    public Object[] a;
    public int b;
    public boolean c;
    public Object[] d;
    public int e;

    public static int b(int i, int i2) {
        if (i2 < 0) {
            ay0.e("cannot store more than Integer.MAX_VALUE elements");
            return 0;
        }
        if (i2 <= i) {
            return i;
        }
        int i3 = i + (i >> 1) + 1;
        if (i3 < i2) {
            int iHighestOneBit = Integer.highestOneBit(i2 - 1);
            i3 = iHighestOneBit + iHighestOneBit;
        }
        if (i3 < 0) {
            return Integer.MAX_VALUE;
        }
        return i3;
    }

    public final void a(Object obj) {
        int length = this.a.length;
        int iB = b(length, this.b + 1);
        if (iB > length || this.c) {
            this.a = Arrays.copyOf(this.a, iB);
            this.c = false;
        }
        Object[] objArr = this.a;
        int i = this.b;
        this.b = i + 1;
        objArr[i] = obj;
    }
}
