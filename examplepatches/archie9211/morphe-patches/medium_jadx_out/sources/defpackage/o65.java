package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o65 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ o65(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    public final void a() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                p65 p65Var = (p65) obj;
                p65Var.A--;
                break;
            default:
                fjc fjcVar = (fjc) obj;
                fjcVar.k--;
                break;
        }
    }

    public final void b() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                ((p65) obj).A++;
                break;
            default:
                ((fjc) obj).k++;
                break;
        }
    }
}
