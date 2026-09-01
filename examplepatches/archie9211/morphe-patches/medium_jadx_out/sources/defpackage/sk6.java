package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sk6 {
    public static final sk6 f = new sk6(0, (Boolean) null, 0, 0, 127);
    public final int a;
    public final Boolean b;
    public final int c;
    public final int d;
    public final Boolean e;

    public sk6(int i, Boolean bool, int i2, int i3, int i4) {
        this((i4 & 1) != 0 ? -1 : i, (i4 & 2) != 0 ? null : bool, (i4 & 4) != 0 ? 0 : i2, (i4 & 8) != 0 ? -1 : i3, (i4 & 32) != 0 ? null : Boolean.TRUE);
    }

    public static sk6 a(int i, int i2, int i3, int i4) {
        Boolean bool = Boolean.FALSE;
        int i5 = i4 & 1;
        sk6 sk6Var = f;
        if (i5 != 0) {
            i = sk6Var.a;
        }
        int i6 = i;
        if ((i4 & 2) != 0) {
            bool = sk6Var.b;
        }
        Boolean bool2 = bool;
        if ((i4 & 4) != 0) {
            i2 = sk6Var.c;
        }
        int i7 = i2;
        if ((i4 & 8) != 0) {
            i3 = sk6Var.d;
        }
        return new sk6(i6, bool2, i7, i3, (Boolean) null);
    }

    public final ry5 b(boolean z) {
        int i = this.a;
        qk6 qk6Var = new qk6(i);
        if (i == -1) {
            qk6Var = null;
        }
        int i2 = qk6Var != null ? qk6Var.a : 0;
        Boolean bool = this.b;
        boolean zBooleanValue = bool != null ? bool.booleanValue() : true;
        int i3 = this.c;
        tk6 tk6Var = new tk6(i3);
        if (i3 == 0) {
            tk6Var = null;
        }
        int i4 = tk6Var != null ? tk6Var.a : 1;
        int i5 = this.d;
        qy5 qy5Var = i5 != -1 ? new qy5(i5) : null;
        return new ry5(z, i2, zBooleanValue, i4, qy5Var != null ? qy5Var.a : 1, h67.c);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sk6)) {
            return false;
        }
        sk6 sk6Var = (sk6) obj;
        return this.a == sk6Var.a && g76.L(this.b, sk6Var.b) && this.c == sk6Var.c && this.d == sk6Var.d && g76.L(this.e, sk6Var.e);
    }

    public final int hashCode() {
        int i = this.a * 31;
        Boolean bool = this.b;
        int iHashCode = (((((i + (bool != null ? bool.hashCode() : 0)) * 31) + this.c) * 31) + this.d) * 961;
        Boolean bool2 = this.e;
        return (iHashCode + (bool2 != null ? bool2.hashCode() : 0)) * 31;
    }

    public final String toString() {
        return "KeyboardOptions(capitalization=" + ((Object) qk6.a(this.a)) + ", autoCorrectEnabled=" + this.b + ", keyboardType=" + ((Object) tk6.a(this.c)) + ", imeAction=" + ((Object) qy5.a(this.d)) + ", platformImeOptions=nullshowKeyboardOnFocus=" + this.e + ", hintLocales=null)";
    }

    public sk6(int i, Boolean bool, int i2, int i3, Boolean bool2) {
        this.a = i;
        this.b = bool;
        this.c = i2;
        this.d = i3;
        this.e = bool2;
    }
}
