package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fvd implements kud {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ jud c;

    public /* synthetic */ fvd(Object obj, jud judVar, int i) {
        this.a = i;
        this.b = obj;
        this.c = judVar;
    }

    @Override // defpackage.kud
    public final jud a(ch5 ch5Var, kxd kxdVar) {
        int i = this.a;
        jud judVar = this.c;
        Object obj = this.b;
        switch (i) {
            case 0:
                if (kxdVar.c() == ((Class) obj)) {
                    return judVar;
                }
                return null;
            case 1:
                Class<?> clsC = kxdVar.c();
                if (((Class) obj).isAssignableFrom(clsC)) {
                    return new ht1(this, clsC);
                }
                return null;
            default:
                if (kxdVar.equals((kxd) obj)) {
                    return judVar;
                }
                return null;
        }
    }

    public String toString() {
        int i = this.a;
        jud judVar = this.c;
        Object obj = this.b;
        switch (i) {
            case 0:
                return "Factory[type=" + ((Class) obj).getName() + ",adapter=" + judVar + "]";
            case 1:
                return "Factory[typeHierarchy=" + ((Class) obj).getName() + ",adapter=" + judVar + "]";
            default:
                return super.toString();
        }
    }
}
