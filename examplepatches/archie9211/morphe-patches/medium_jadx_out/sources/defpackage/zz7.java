package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zz7 extends mr0 {
    public static final zz7 g;
    public static final zz7 h;
    public final boolean f;

    static {
        zz7 zz7Var = new zz7(new int[]{2, 2, 0}, false);
        g = zz7Var;
        int i = zz7Var.c;
        int i2 = zz7Var.b;
        h = (i2 == 1 && i == 9) ? new zz7(new int[]{2, 0, 0}, false) : new zz7(new int[]{i2, i + 1, 0}, false);
        new zz7(new int[0], false);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zz7(int[] iArr, boolean z) {
        super(Arrays.copyOf(iArr, iArr.length));
        iArr.getClass();
        this.f = z;
    }

    public final boolean b(zz7 zz7Var) {
        zz7Var.getClass();
        zz7 zz7Var2 = this.f ? g : h;
        int i = zz7Var2.b;
        int i2 = zz7Var.b;
        if (i > i2 || (i >= i2 && zz7Var2.c > zz7Var.c)) {
            zz7Var = zz7Var2;
        }
        int i3 = this.c;
        boolean z = false;
        int i4 = this.b;
        if ((i4 == 1 && i3 == 0) || i4 == 0) {
            return false;
        }
        int i5 = zz7Var.b;
        if (i4 > i5 || (i4 >= i5 && i3 > zz7Var.c)) {
            z = true;
        }
        return !z;
    }
}
