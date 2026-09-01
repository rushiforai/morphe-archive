package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t6d {
    public final boolean a;
    public final int b;
    public final boolean c;
    public final boolean d;

    public t6d(int i, boolean z, boolean z2, boolean z3) {
        this.a = z;
        this.b = i;
        this.c = z2;
        this.d = z3;
    }

    public static t6d a(t6d t6dVar, boolean z, int i, boolean z2, boolean z3, int i2) {
        if ((i2 & 1) != 0) {
            z = t6dVar.a;
        }
        if ((i2 & 2) != 0) {
            i = t6dVar.b;
        }
        if ((i2 & 4) != 0) {
            z2 = t6dVar.c;
        }
        if ((i2 & 8) != 0) {
            z3 = t6dVar.d;
        }
        return new t6d(i, z, z2, z3);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t6d)) {
            return false;
        }
        t6d t6dVar = (t6d) obj;
        return this.a == t6dVar.a && this.b == t6dVar.b && this.c == t6dVar.c && this.d == t6dVar.d;
    }

    public final int hashCode() {
        return ((((((this.a ? 1231 : 1237) * 31) + this.b) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("SystemInfo(batteryFullOrCharging=");
        sb.append(this.a);
        sb.append(", batteryLevel=");
        sb.append(this.b);
        sb.append(", powerSaveMode=");
        return b09.C(sb, this.c, ", onExternalPowerSource=", this.d, ")");
    }

    public /* synthetic */ t6d() {
        this(-1, false, false, false);
    }
}
