package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class i77 {
    public final r77 a;
    public final String b;
    public final String c;
    public final String d;
    public final String e;
    public final Integer f;
    public final Number g;
    public final Boolean h;

    public i77(r77 r77Var, String str, String str2, String str3, String str4, Integer num, Number number, Boolean bool) {
        this.a = r77Var;
        this.b = str;
        this.c = str2;
        this.d = str3;
        this.e = str4;
        this.f = num;
        this.g = number;
        this.h = bool;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i77)) {
            return false;
        }
        i77 i77Var = (i77) obj;
        return this.a == i77Var.a && g76.L(this.b, i77Var.b) && g76.L(this.c, i77Var.c) && g76.L(this.d, i77Var.d) && g76.L(this.e, i77Var.e) && this.f.equals(i77Var.f) && g76.L(this.g, i77Var.g) && g76.L(this.h, i77Var.h);
    }

    public final int hashCode() {
        r77 r77Var = this.a;
        int iHashCode = (r77Var == null ? 0 : r77Var.hashCode()) * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.d;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.e;
        int iHashCode5 = (this.f.hashCode() + ((iHashCode4 + (str4 == null ? 0 : str4.hashCode())) * 1742810335)) * 31;
        Number number = this.g;
        int iHashCode6 = (iHashCode5 + (number == null ? 0 : number.hashCode())) * 31;
        Boolean bool = this.h;
        return iHashCode6 + (bool != null ? bool.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("LogEventDevice(type=");
        sb.append(this.a);
        sb.append(", name=");
        sb.append(this.b);
        sb.append(", model=");
        ka1.C(sb, this.c, ", brand=", this.d, ", architecture=");
        sb.append(this.e);
        sb.append(", locale=null, locales=null, timeZone=null, batteryLevel=null, powerSavingMode=null, brightnessLevel=null, logicalCpuCount=");
        sb.append(this.f);
        sb.append(", totalRam=");
        sb.append(this.g);
        sb.append(", isLowRam=");
        sb.append(this.h);
        sb.append(")");
        return sb.toString();
    }
}
