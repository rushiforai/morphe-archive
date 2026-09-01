package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s21 extends m21 {
    public static s21 u(String str) {
        s21 s21Var = new s21(str.toCharArray());
        s21Var.b = 0L;
        s21Var.t(str.length() - 1);
        return s21Var;
    }

    @Override // defpackage.m21
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if ((obj instanceof s21) && e().equals(((s21) obj).e())) {
            return true;
        }
        return super.equals(obj);
    }
}
