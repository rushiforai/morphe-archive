package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dd7 {
    public int[] a;
    public int b;
    public float[] c;

    public dd7(int[] iArr) {
        int i;
        this.a = iArr;
        if (iArr.length == 0) {
            ik4.k("Empty array can't be reduced.");
            throw null;
        }
        int i2 = iArr[0];
        n46 n46Var = new n46(1, iArr.length - 1, 1);
        int i3 = n46Var.b;
        int i4 = n46Var.c;
        boolean z = i4 <= 0 ? 1 >= i3 : 1 <= i3;
        int i5 = z ? 1 : i3;
        while (z) {
            if (i5 != i3) {
                i = i5 + i4;
            } else {
                if (!z) {
                    ywb.n();
                    throw null;
                }
                z = false;
                i = i5;
            }
            i2 *= iArr[i5];
            i5 = i;
        }
        this.b = i2;
        this.c = new float[i2];
    }
}
