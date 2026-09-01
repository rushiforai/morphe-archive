package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class og5 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ dr9 b;
    public final /* synthetic */ Context c;

    public /* synthetic */ og5(dr9 dr9Var, Context context, int i) {
        this.a = i;
        this.b = dr9Var;
        this.c = context;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Context context = this.c;
        dr9 dr9Var = this.b;
        jyb jybVar = (jyb) obj;
        switch (i) {
            case 0:
                jybVar.getClass();
                gyb.b(jybVar, ep7.p(dr9Var, context));
                break;
            default:
                jybVar.getClass();
                gyb.b(jybVar, ep7.p(dr9Var, context));
                hyb.a(jybVar);
                break;
        }
        return c1eVar;
    }
}
