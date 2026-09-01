package defpackage;

import com.drew.metadata.exif.makernotes.LeicaMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d05 implements Comparable {
    public static final d05 b;
    public static final d05 c;
    public static final d05 d;
    public static final d05 e;
    public static final d05 f;
    public static final d05 g;
    public static final d05 h;
    public final int a;

    static {
        d05 d05Var = new d05(100);
        d05 d05Var2 = new d05(200);
        d05 d05Var3 = new d05(300);
        d05 d05Var4 = new d05(400);
        b = d05Var4;
        d05 d05Var5 = new d05(500);
        c = d05Var5;
        d05 d05Var6 = new d05(600);
        d = d05Var6;
        d05 d05Var7 = new d05(700);
        d05 d05Var8 = new d05(LeicaMakernoteDirectory.TAG_CAMERA_TEMPERATURE);
        d05 d05Var9 = new d05(900);
        e = d05Var3;
        f = d05Var4;
        g = d05Var5;
        h = d05Var7;
        d46.R(d05Var, d05Var2, d05Var3, d05Var4, d05Var5, d05Var6, d05Var7, d05Var8, d05Var9);
    }

    public d05(int i) {
        this.a = i;
        boolean z = false;
        if (1 <= i && i < 1001) {
            z = true;
        }
        if (z) {
            return;
        }
        c26.a("Font weight can be in range [1, 1000]. Current value: " + i);
    }

    @Override // java.lang.Comparable
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public final int compareTo(d05 d05Var) {
        return g76.Q(this.a, d05Var.a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof d05) {
            return this.a == ((d05) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        return km4.A(new StringBuilder("FontWeight(weight="), this.a, ')');
    }
}
