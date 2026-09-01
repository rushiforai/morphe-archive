package defpackage;

import androidx.compose.ui.platform.ComposeView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w0 extends co6 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ w0(int i, Object obj) {
        super(2);
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        boolean z = false;
        c1e c1eVar = c1e.a;
        Object obj3 = this.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Number) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    ((x0) obj3).a(p65Var, 0);
                }
                break;
            case 1:
                ((mo) obj3).j(((Number) obj).intValue(), (zxb) obj2);
                break;
            case 2:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Number) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    Object objM = p65Var2.M();
                    if (objM == w12.a) {
                        objM = fn.f;
                        p65Var2.j0(objM);
                    }
                    m40.i(new l60((x45) objM, false), (b55) ((l78) obj3).getValue(), p65Var2, 0);
                }
                break;
            case 3:
                jz3 jz3Var = (jz3) obj;
                jz3 jz3Var2 = (jz3) obj2;
                jz3 jz3Var3 = jz3.PostExit;
                if (jz3Var == jz3Var3 && jz3Var2 == jz3Var3 && !((k54) obj3).a.d) {
                    z = true;
                }
                break;
            case 4:
                ((Number) obj2).intValue();
                ((ComposeView) obj3).a((x12) obj, tr7.y(1));
                break;
            case 5:
                r28 r28Var = (r28) obj;
                r28 r28VarQ = (p28) obj2;
                x12 x12Var3 = (x12) obj3;
                if (r28VarQ instanceof v12) {
                    c55 c55Var = ((v12) r28VarQ).r;
                    pwd.B(3, c55Var);
                    r28VarQ = gx1.Q(x12Var3, (r28) c55Var.f(o28.b, x12Var3, 0));
                }
                break;
            case 6:
                ((Number) obj2).intValue();
                ((mb3) obj3).a((x12) obj, tr7.y(1));
                break;
            default:
                ((Number) obj2).intValue();
                ((dd9) obj3).a((x12) obj, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ w0(x0 x0Var, int i, int i2) {
        super(2);
        this.a = i2;
        this.b = x0Var;
    }
}
