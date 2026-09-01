package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class b4a implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ float b;
    public final /* synthetic */ Object c;

    public /* synthetic */ b4a(float f, hp1 hp1Var) {
        this.a = 0;
        this.b = f;
        this.c = hp1Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        float f = this.b;
        Object obj2 = this.c;
        switch (i) {
            case 0:
                hp1 hp1Var = (hp1) obj2;
                gyb.f((jyb) obj, new k3a(((Number) iq7.y(Float.valueOf(f), hp1Var)).floatValue(), hp1Var));
                break;
            case 1:
                tjb tjbVar = (tjb) obj;
                tjbVar.getClass();
                tjbVar.j((((Number) ((ou) obj2).d()).floatValue() / f) * 12.0f);
                break;
            default:
                dsd dsdVar = (dsd) obj2;
                long jLongValue = ((Long) obj).longValue();
                boolean zG = dsdVar.g();
                i49 i49Var = dsdVar.g;
                if (!zG) {
                    if (i49Var.g() == Long.MIN_VALUE) {
                        i49Var.h(jLongValue);
                        ((k49) dsdVar.a.b).setValue(Boolean.TRUE);
                    }
                    long jG = jLongValue - i49Var.g();
                    if (f != 0.0f) {
                        jG = nk7.x0(jG / ((double) f));
                    }
                    dsdVar.n(jG);
                    dsdVar.h(jG, f == 0.0f);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ b4a(float f, int i, Object obj) {
        this.a = i;
        this.c = obj;
        this.b = f;
    }
}
