package defpackage;

import com.medium.proto.event.AppIconName;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ml2 {
    public final String a;
    public final int b;
    public final int c;
    public final AppIconName d;
    public final boolean e;

    public ml2(String str, int i, int i2, AppIconName appIconName, boolean z) {
        this.a = str;
        this.b = i;
        this.c = i2;
        this.d = appIconName;
        this.e = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ml2)) {
            return false;
        }
        ml2 ml2Var = (ml2) obj;
        return g76.L(this.a, ml2Var.a) && this.b == ml2Var.b && this.c == ml2Var.c && this.d == ml2Var.d && this.e == ml2Var.e;
    }

    public final int hashCode() {
        return ((this.d.hashCode() + (((((this.a.hashCode() * 31) + this.b) * 31) + this.c) * 31)) * 31) + (this.e ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sbT = y30.t(this.b, "Icon(activityAliasName=", this.a, ", drawableResId=", ", nameResId=");
        sbT.append(this.c);
        sbT.append(", iconName=");
        sbT.append(this.d);
        sbT.append(", defaultIcon=");
        return lv8.t(sbT, this.e, ")");
    }
}
