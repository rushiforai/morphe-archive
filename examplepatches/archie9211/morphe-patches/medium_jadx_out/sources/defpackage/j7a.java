package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class j7a {
    public final p98 a;
    public final wjc b;
    public final jkc c;

    public j7a(p98 p98Var, wjc wjcVar, jkc jkcVar) {
        this.a = p98Var;
        this.b = wjcVar;
        this.c = jkcVar;
    }

    public abstract y05 a();

    public final String toString() {
        return getClass().getSimpleName() + ": " + a();
    }
}
