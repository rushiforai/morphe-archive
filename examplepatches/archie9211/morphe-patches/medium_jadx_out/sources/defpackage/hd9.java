package defpackage;

import com.drew.metadata.photoshop.PhotoshopDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hd9 {
    public final int a;
    public final boolean b;
    public final boolean c;
    public final boolean d;
    public final boolean e;
    public final boolean f;
    public final int g;

    public hd9(boolean z, boolean z2, boolean z3, ovb ovbVar, boolean z4, boolean z5) {
        sn3 sn3Var = tr.a;
        int i = !z ? 262152 : 262144;
        i = ovbVar == ovb.SecureOn ? i | 8192 : i;
        i = z4 ? i : i | 512;
        boolean z6 = ovbVar == ovb.Inherit;
        this.a = i;
        this.b = z6;
        this.c = z2;
        this.d = z3;
        this.e = true;
        this.f = z5;
        this.g = PhotoshopDirectory.TAG_XML;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof hd9)) {
            return false;
        }
        hd9 hd9Var = (hd9) obj;
        return this.a == hd9Var.a && this.b == hd9Var.b && this.c == hd9Var.c && this.d == hd9Var.d && this.e == hd9Var.e && this.f == hd9Var.f && this.g == hd9Var.g;
    }

    public final int hashCode() {
        return ((((((((((((this.a * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237)) * 31) + (this.f ? 1231 : 1237)) * 31) + this.g) * 31;
    }

    public hd9(int i) {
        this((i & 1) == 0, (i & 2) != 0, (i & 4) != 0, ovb.Inherit, true, (i & 16) == 0);
    }

    public /* synthetic */ hd9(boolean z) {
        this(z, ovb.Inherit, true);
    }

    public hd9(boolean z, ovb ovbVar, boolean z2) {
        this(z, true, true, ovbVar, z2, false);
    }
}
