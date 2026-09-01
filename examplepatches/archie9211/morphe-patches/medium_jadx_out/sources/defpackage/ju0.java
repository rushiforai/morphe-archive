package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ju0 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ x45 b;

    public /* synthetic */ ju0(int i, x45 x45Var) {
        this.a = i;
        this.b = x45Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        x45 x45Var = this.b;
        switch (i) {
            case 0:
                ((hp6) obj).getClass();
                x45Var.invoke(Float.valueOf((int) (r5.j() & 4294967295L)));
                return c1e.a;
            case 1:
                return new om3((pm3) obj, x45Var);
            case 2:
                ssd ssdVar = (ssd) obj;
                if (!(ssdVar instanceof i85)) {
                    ygf.f("Node is not a GestureNode instance");
                    return null;
                }
                Boolean bool = (Boolean) x45Var.invoke(((i85) ssdVar).o);
                bool.getClass();
                return bool;
            case 3:
                String str = (String) obj;
                str.getClass();
                x45Var.invoke(str);
                return c1e.a;
            case 4:
                oic oicVar = (oic) x45Var.invoke((sic) obj);
                synchronized (uic.c) {
                    uic.d = uic.d.q(oicVar.g());
                }
                return oicVar;
            case 5:
                Long l = (Long) obj;
                l.getClass();
                return x45Var.invoke(l);
            default:
                qjd qjdVar = (qjd) obj;
                qjdVar.getClass();
                x45Var.invoke(new s46(qjdVar.c));
                return c1e.a;
        }
    }
}
