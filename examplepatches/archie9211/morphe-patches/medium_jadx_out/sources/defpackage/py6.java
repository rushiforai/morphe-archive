package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class py6 extends que {
    public final k68 b;

    public py6() {
        k68 k68Var = j46.a;
        this.b = new k68();
    }

    @Override // defpackage.que
    public final void d() {
        k68 k68Var = this.b;
        int[] iArr = k68Var.b;
        Object[] objArr = k68Var.c;
        long[] jArr = k68Var.a;
        int length = jArr.length - 2;
        if (length < 0) {
            return;
        }
        int i = 0;
        while (true) {
            long j = jArr[i];
            if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                int i2 = 8 - ((~(i - length)) >>> 31);
                for (int i3 = 0; i3 < i2; i3++) {
                    if ((255 & j) < 128) {
                        int i4 = (i << 3) + i3;
                        int i5 = iArr[i4];
                        x68 x68Var = (x68) objArr[i4];
                        Object[] objArr2 = x68Var.a;
                        int i6 = x68Var.b;
                        for (int i7 = 0; i7 < i6; i7++) {
                            oy6 oy6Var = (oy6) objArr2[i7];
                            y51 y51Var = oy6Var.d;
                            if (y51Var != null) {
                                y51Var.cancel();
                            }
                            oy6Var.d = null;
                            vg7 vg7Var = (vg7) oy6Var.a.a;
                            vg7Var.b = true;
                            vg7Var.a = false;
                            vg7Var.a();
                        }
                    }
                    j >>= 8;
                }
                if (i2 != 8) {
                    return;
                }
            }
            if (i == length) {
                return;
            } else {
                i++;
            }
        }
    }
}
