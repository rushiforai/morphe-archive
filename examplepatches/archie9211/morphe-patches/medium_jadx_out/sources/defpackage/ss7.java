package defpackage;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ss7 implements x45 {
    public final /* synthetic */ int a;

    public /* synthetic */ ss7(int i) {
        this.a = i;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((String) obj).getClass();
                return c1eVar;
            case 1:
                ((String) obj).getClass();
                return c1eVar;
            case 2:
                ((String) obj).getClass();
                return c1eVar;
            case 3:
                ((String) obj).getClass();
                return c1eVar;
            case 4:
                ((String) obj).getClass();
                return c1eVar;
            case 5:
                ((String) obj).getClass();
                return c1eVar;
            case 6:
                ((String) obj).getClass();
                return c1eVar;
            case 7:
                ((String) obj).getClass();
                return c1eVar;
            case 8:
                ((String) obj).getClass();
                return c1eVar;
            case 9:
                jyb jybVar = (jyb) obj;
                jybVar.getClass();
                hyb.a(jybVar);
                return c1eVar;
            case 10:
                jyb jybVar2 = (jyb) obj;
                jybVar2.getClass();
                hyb.a(jybVar2);
                return c1eVar;
            case 11:
                gyb.i((jyb) obj);
                return c1eVar;
            case 12:
                fj6[] fj6VarArr = gyb.a;
                ((jyb) obj).d(eyb.y, c1eVar);
                return c1eVar;
            case 13:
                y19 y19Var = (y19) obj;
                StringBuilder sb = new StringBuilder("[");
                sb.append(y19Var.b);
                sb.append(", ");
                return km4.A(sb, y19Var.c, ')');
            case 14:
                lt1 lt1Var = (lt1) obj;
                lt1Var.getClass();
                return ka1.r("refine_recommendation_muted_publication_", lt1Var.j);
            case 15:
                hne hneVar = (hne) obj;
                hneVar.getClass();
                return ka1.r("refine_recommendation_muted_user_", hneVar.j);
            case 16:
                jyb jybVar3 = (jyb) obj;
                jybVar3.getClass();
                hyb.a(jybVar3);
                return c1eVar;
            case 17:
                qg2 qg2Var = (qg2) obj;
                qg2Var.getClass();
                return new ca8(kyd.Q(qg2Var));
            case 18:
                return new jm0(kyd.Q((qg2) obj));
            case 19:
                Context context = (Context) obj;
                context.getClass();
                if (context instanceof ContextWrapper) {
                    return ((ContextWrapper) context).getBaseContext();
                }
                return null;
            case 20:
                va8 va8Var = (va8) obj;
                va8Var.getClass();
                ya8 ya8Var = va8Var.c;
                if (ya8Var == null || ya8Var.g.c != va8Var.b.c) {
                    return null;
                }
                return ya8Var;
            case 21:
                va8 va8Var2 = (va8) obj;
                va8Var2.getClass();
                ya8 ya8Var2 = va8Var2.c;
                if (ya8Var2 == null || ya8Var2.g.c != va8Var2.b.c) {
                    return null;
                }
                return ya8Var2;
            case 22:
                va8 va8Var3 = (va8) obj;
                va8Var3.getClass();
                return Integer.valueOf(va8Var3.b.c);
            case 23:
                ((qg2) obj).getClass();
                return new la8();
            case 24:
                Context context2 = (Context) obj;
                context2.getClass();
                ContextWrapper contextWrapper = context2 instanceof ContextWrapper ? (ContextWrapper) context2 : null;
                if (contextWrapper != null) {
                    return contextWrapper.getBaseContext();
                }
                return null;
            case 25:
                Context context3 = (Context) obj;
                context3.getClass();
                if (context3 instanceof Activity) {
                    return (Activity) context3;
                }
                return null;
            case 26:
                va8 va8Var4 = (va8) obj;
                va8Var4.getClass();
                return va8Var4.c;
            case 27:
                va8 va8Var5 = (va8) obj;
                va8Var5.getClass();
                if (!(va8Var5 instanceof ya8)) {
                    return null;
                }
                jl1 jl1Var = ((ya8) va8Var5).g;
                return jl1Var.s(jl1Var.c);
            case 28:
                return sz3.c(f76.Q(700, 0, null, 6), 2);
            default:
                va8 va8Var6 = ((ba8) ((ov) obj).c()).b;
                va8Var6.getClass();
                int i2 = va8.f;
                for (va8 va8Var7 : vo7.x((c12) va8Var6)) {
                }
                return null;
        }
    }
}
