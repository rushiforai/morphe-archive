package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ta6 extends l6 {
    public static final ta6 d = new ta6("protected_and_package", true);

    @Override // defpackage.l6
    public final Integer a(l6 l6Var) {
        l6Var.getClass();
        if (this == l6Var) {
            return 0;
        }
        if (l6Var == fwe.d) {
            return null;
        }
        dh7 dh7Var = nwe.a;
        return (l6Var == iwe.d || l6Var == jwe.d) ? 1 : -1;
    }

    @Override // defpackage.l6
    public final String e() {
        return "protected/*protected and package*/";
    }

    @Override // defpackage.l6
    public final l6 l() {
        return kwe.d;
    }
}
