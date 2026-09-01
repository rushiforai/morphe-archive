package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class myf {
    public static final myf c = new myf();
    public final nwf a;
    public final sv0 b;

    public myf() {
        nwf nwfVar = nwf.d;
        sv0 sv0Var = sv0.d;
        if (sv0Var == null) {
            sv0Var = new sv0(8);
            sv0Var.b = false;
            sv0.d = sv0Var;
        }
        this.a = nwfVar;
        this.b = sv0Var;
    }

    public final void a(m15 m15Var) {
        nwf nwfVar = this.a;
        nwfVar.getClass();
        nwf.b(m15Var.getSharedPreferences("com.google.firebase.auth.internal.ProcessDeathHelper", 0));
        nwfVar.a = null;
        nwfVar.b = 0L;
    }
}
