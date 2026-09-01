package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class el7 {
    public final int a;
    public final List b;
    public final long c;
    public final Object d;
    public final zq0 e;
    public final ip6 f;
    public final boolean g;
    public final int h;
    public final int[] i;
    public int j;
    public int k;

    public el7(int i, int i2, List list, long j, Object obj, hw8 hw8Var, zq0 zq0Var, ip6 ip6Var) {
        this.a = i;
        this.b = list;
        this.c = j;
        this.d = obj;
        this.e = zq0Var;
        this.f = ip6Var;
        this.g = hw8Var == hw8.Vertical;
        int size = list.size();
        int iMax = 0;
        for (int i3 = 0; i3 < size; i3++) {
            t99 t99Var = (t99) list.get(i3);
            iMax = Math.max(iMax, !this.g ? t99Var.b : t99Var.a);
        }
        this.h = iMax;
        this.i = new int[this.b.size() * 2];
        this.k = Integer.MIN_VALUE;
    }

    public final void a(int i) {
        this.j += i;
        int[] iArr = this.i;
        int length = iArr.length;
        for (int i2 = 0; i2 < length; i2++) {
            boolean z = this.g;
            if ((z && i2 % 2 == 1) || (!z && i2 % 2 == 0)) {
                iArr[i2] = iArr[i2] + i;
            }
        }
    }

    public final void b(int i, int i2, int i3) {
        int i4;
        this.j = i;
        boolean z = this.g;
        this.k = z ? i3 : i2;
        List list = this.b;
        int size = list.size();
        for (int i5 = 0; i5 < size; i5++) {
            t99 t99Var = (t99) list.get(i5);
            int i6 = i5 * 2;
            int[] iArr = this.i;
            if (z) {
                iArr[i6] = Math.round((1.0f + (this.f != ip6.Ltr ? 0.0f * (-1.0f) : 0.0f)) * ((i2 - t99Var.a) / 2.0f));
                iArr[i6 + 1] = i;
                i4 = t99Var.b;
            } else {
                iArr[i6] = i;
                int i7 = i6 + 1;
                zq0 zq0Var = this.e;
                if (zq0Var == null) {
                    e26.b("null verticalAlignment");
                    z72.b();
                    return;
                } else {
                    iArr[i7] = zq0Var.a(t99Var.b, i3);
                    i4 = t99Var.a;
                }
            }
            i += i4;
        }
    }
}
