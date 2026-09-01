package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class b3d implements gnb {
    public final z25 a;
    public final String b;
    public boolean c;

    public b3d(z25 z25Var, String str) {
        this.a = z25Var;
        this.b = str;
    }

    @Override // defpackage.gnb
    public boolean P() {
        return getLong(0) != 0;
    }

    public final void f() {
        if (this.c) {
            qk7.z(21, "statement is closed");
            throw null;
        }
    }

    @Override // defpackage.gnb
    public void l() {
        f();
    }

    @Override // defpackage.gnb
    public void reset() {
        f();
    }
}
