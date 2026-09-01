package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eh3 {
    public final pu7 a;

    static {
        ku7 ku7Var = pu7.j;
    }

    public eh3(pu7 pu7Var) {
        pu7Var.getClass();
        this.a = pu7Var;
    }

    public final zy4 a() {
        zy4 zy4VarValueOf;
        pu7 pu7Var = this.a;
        pu7Var.getClass();
        try {
            String strO = p2.o(pu7Var, ek6.SETTINGS_FONT_FAMILY, null, 2, null);
            if (strO != null && (zy4VarValueOf = zy4.valueOf(strO)) != null) {
                return zy4VarValueOf;
            }
            return zy4.DEFAULT;
        } catch (Exception unused) {
            return zy4.DEFAULT;
        }
    }
}
