package defpackage;

import java.io.File;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t48 implements Runnable {
    public final File a;
    public final File b;
    public final pkf c;
    public final f66 d;
    public final rv8 e;

    public t48(File file, File file2, pkf pkfVar, f66 f66Var, rv8 rv8Var) {
        f66Var.getClass();
        rv8Var.getClass();
        this.a = file;
        this.b = file2;
        this.c = pkfVar;
        this.d = f66Var;
        this.e = rv8Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.a == null) {
            f49.K(this.d, d66.WARN, e66.MAINTAINER, b18.c, null, false, 56);
            return;
        }
        File file = this.b;
        f66 f66Var = this.d;
        if (file == null) {
            f49.K(f66Var, d66.WARN, e66.MAINTAINER, b18.d, null, false, 56);
        } else {
            jq7.u(f66Var, this.e, new ir(26, this));
        }
    }
}
