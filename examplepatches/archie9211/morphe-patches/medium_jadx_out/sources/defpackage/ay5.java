package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ay5 {
    public final String a;
    public final float b;
    public final float c;
    public final float d;
    public final float e;
    public final long f;
    public final int g;
    public final boolean h;
    public final ArrayList i;
    public final zx5 j;
    public boolean k;

    public ay5(float f, float f2, float f3, float f4, long j, int i, boolean z, int i2) {
        String str = (i2 & 1) != 0 ? "" : "Filled.Close";
        long j2 = (i2 & 32) != 0 ? uu1.h : j;
        int i3 = (i2 & 64) != 0 ? 5 : i;
        boolean z2 = (i2 & 128) != 0 ? false : z;
        this.a = str;
        this.b = f;
        this.c = f2;
        this.d = f3;
        this.e = f4;
        this.f = j2;
        this.g = i3;
        this.h = z2;
        ArrayList arrayList = new ArrayList();
        this.i = arrayList;
        zx5 zx5Var = new zx5(null, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, null, 1023);
        this.j = zx5Var;
        arrayList.add(zx5Var);
    }

    public final by5 a() {
        if (this.k) {
            b26.b("ImageVector.Builder is single use, create a new instance to create a new ImageVector");
        }
        while (true) {
            ArrayList arrayList = this.i;
            if (arrayList.size() <= 1) {
                zx5 zx5Var = this.j;
                by5 by5Var = new by5(this.a, this.b, this.c, this.d, this.e, new ere(zx5Var.a, zx5Var.b, zx5Var.c, zx5Var.d, zx5Var.e, zx5Var.f, zx5Var.g, zx5Var.h, zx5Var.i, zx5Var.j), this.f, this.g, this.h);
                this.k = true;
                return by5Var;
            }
            if (this.k) {
                b26.b("ImageVector.Builder is single use, create a new instance to create a new ImageVector");
            }
            zx5 zx5Var2 = (zx5) arrayList.remove(arrayList.size() - 1);
            ((zx5) y30.m(1, arrayList)).j.add(new ere(zx5Var2.a, zx5Var2.b, zx5Var2.c, zx5Var2.d, zx5Var2.e, zx5Var2.f, zx5Var2.g, zx5Var2.h, zx5Var2.i, zx5Var2.j));
        }
    }
}
