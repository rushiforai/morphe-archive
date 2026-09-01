package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f95 implements cqc {
    public final jpe a;
    public final wfd b;

    public f95(jpe jpeVar, wfd wfdVar) {
        this.a = jpeVar;
        this.b = wfdVar;
    }

    @Override // defpackage.cqc
    public final boolean a(zj0 zj0Var) {
        if (zj0Var.b == g89.REGISTERED && !this.a.a(zj0Var)) {
            String str = zj0Var.c;
            if (str != null) {
                this.b.b(new qj0(str, zj0Var.e, zj0Var.f));
                return true;
            }
            z72.c("Null token");
        }
        return false;
    }

    @Override // defpackage.cqc
    public final boolean onException(Exception exc) {
        this.b.c(exc);
        return true;
    }
}
