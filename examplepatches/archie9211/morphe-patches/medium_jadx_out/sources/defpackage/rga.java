package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rga {
    public final boolean a;
    public final boolean b;
    public final boolean c;

    public rga(boolean z, boolean z2, boolean z3) {
        this.a = z;
        this.b = z2;
        this.c = z3;
    }

    public static rga a(rga rgaVar, boolean z, boolean z2, int i) {
        boolean z3 = rgaVar.a;
        if ((i & 2) != 0) {
            z = rgaVar.b;
        }
        return new rga(z3, z, z2);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof rga)) {
            return false;
        }
        rga rgaVar = (rga) obj;
        return this.a == rgaVar.a && this.b == rgaVar.b && this.c == rgaVar.c;
    }

    public final int hashCode() {
        return ((((this.a ? 1231 : 1237) * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("MeterConfigurationData(showMeter=");
        sb.append(this.a);
        sb.append(", allowCuration=");
        sb.append(this.b);
        sb.append(", canUpdateCuration=");
        return lv8.t(sb, this.c, ")");
    }
}
