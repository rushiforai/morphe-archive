package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ohg {
    public Object a;
    public amg b;
    public lpg c;
    public boolean d;

    public final void a(Object obj) {
        this.d = true;
        amg amgVar = this.b;
        if (amgVar != null) {
            mkg mkgVar = amgVar.b;
            mkgVar.getClass();
            if (obj == null) {
                obj = ggg.g;
            }
            if (ggg.f.O(mkgVar, null, obj)) {
                ggg.d(mkgVar);
                this.a = null;
                this.b = null;
                this.c = null;
            }
        }
    }

    public final void finalize() {
        lpg lpgVar;
        amg amgVar = this.b;
        if (amgVar != null) {
            mkg mkgVar = amgVar.b;
            if (!mkgVar.isDone()) {
                if (ggg.f.O(mkgVar, null, new s4g(new d2("The completer object was garbage collected - this future would otherwise never complete. The tag was: ".concat(String.valueOf(this.a)), 3)))) {
                    ggg.d(mkgVar);
                }
            }
        }
        if (this.d || (lpgVar = this.c) == null) {
            return;
        }
        lpgVar.i(null);
    }
}
