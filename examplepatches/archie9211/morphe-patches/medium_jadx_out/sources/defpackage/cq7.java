package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cq7 {
    public final String a;
    public final String b;
    public final boolean c;

    public cq7(String str, String str2, boolean z) {
        this.a = str;
        this.b = str2;
        this.c = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof cq7)) {
            return false;
        }
        cq7 cq7Var = (cq7) obj;
        return this.a.equals(cq7Var.a) && g76.L(this.b, cq7Var.b) && this.c == cq7Var.c;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        return ((iHashCode + (str == null ? 0 : str.hashCode())) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        return lv8.t(y30.u("MediumDropdownMenuItemData(text=", this.a, ", secondaryText=", this.b, ", isSelected="), this.c, ")");
    }
}
