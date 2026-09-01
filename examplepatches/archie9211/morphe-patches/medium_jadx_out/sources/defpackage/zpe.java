package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class zpe {
    public ce a;

    public abstract void a(zl3 zl3Var);

    public x45 b() {
        return this.a;
    }

    public final void c() {
        x45 x45VarB = b();
        if (x45VarB != null) {
            x45VarB.invoke(this);
        }
    }

    public void d(ce ceVar) {
        this.a = ceVar;
    }
}
