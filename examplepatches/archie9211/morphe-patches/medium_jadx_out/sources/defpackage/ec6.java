package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class ec6 {
    public static final x16 a = g01.q(juc.a, "kotlinx.serialization.json.JsonUnquotedLiteral");

    public static final yc6 a(cc6 cc6Var) {
        yc6 yc6Var = cc6Var instanceof yc6 ? (yc6) cc6Var : null;
        if (yc6Var != null) {
            return yc6Var;
        }
        ik4.i("Element ", n1b.a.b(cc6Var.getClass()), " is not a JsonPrimitive");
        return null;
    }
}
