package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bq7 {
    public final String a;
    public final boolean b;
    public final Integer c;
    public final String d;

    public bq7(String str, boolean z, Integer num, String str2, int i) {
        z = (i & 2) != 0 ? false : z;
        num = (i & 4) != 0 ? null : num;
        str2 = (i & 8) != 0 ? null : str2;
        str.getClass();
        this.a = str;
        this.b = z;
        this.c = num;
        this.d = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof bq7)) {
            return false;
        }
        bq7 bq7Var = (bq7) obj;
        return g76.L(this.a, bq7Var.a) && this.b == bq7Var.b && g76.L(this.c, bq7Var.c) && g76.L(this.d, bq7Var.d);
    }

    public final int hashCode() {
        int iHashCode = ((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31;
        Integer num = this.c;
        int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
        String str = this.d;
        return ((iHashCode2 + (str != null ? str.hashCode() : 0)) * 31) + 1231;
    }

    public final String toString() {
        StringBuilder sbD = ev6.D("MediumDropdownMenuItemData(text=", this.a, ", isSelected=", ", leadingIconRes=", this.b);
        sbD.append(this.c);
        sbD.append(", secondaryText=");
        sbD.append(this.d);
        sbD.append(", isEnabled=true)");
        return sbD.toString();
    }
}
