package e00;

import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class u5 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51059a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f51060b;

    public /* synthetic */ u5(p1.e1 e1Var, int i5) {
        this.f51059a = i5;
        this.f51060b = e1Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f51059a;
        p1.e1 e1Var = this.f51060b;
        switch (i5) {
            case 0:
                e1Var.setValue(Boolean.FALSE);
                break;
            case 1:
                e1Var.setValue(Boolean.FALSE);
                break;
            case 2:
                e1Var.setValue(Boolean.TRUE);
                break;
            case 3:
                e1Var.setValue(Boolean.TRUE);
                break;
            case 4:
                e1Var.setValue(Boolean.TRUE);
                break;
            case 5:
                e1Var.setValue(Boolean.FALSE);
                break;
            case 6:
                mc0.d.f76206a.m("BackHandler", new Object[0]);
                h6.b(e1Var, 0);
                break;
            case 7:
                com.google.android.gms.internal.consent_sdk.w wVar = h6.f50482a;
                e1Var.setValue(Boolean.FALSE);
                break;
            case 8:
                h6.b(e1Var, 1);
                break;
            case 9:
                h6.b(e1Var, 2);
                break;
            case 10:
                h6.b(e1Var, 0);
                break;
            case 11:
                h6.b(e1Var, 0);
                break;
            case 12:
                com.google.android.gms.internal.consent_sdk.w wVar2 = h6.f50482a;
                e1Var.setValue(Boolean.TRUE);
                break;
            case 13:
                e1Var.setValue(Boolean.TRUE);
                break;
            case 14:
                e1Var.setValue(Boolean.FALSE);
                break;
            case 15:
                tz.n.Companion.getClass();
                e1Var.setValue(new tz.u(0, tz.m.a(-15592942), tz.n.f90140b, tz.m.c(5, -4376282, 0), 113));
                break;
            case 16:
                e1Var.setValue(Boolean.FALSE);
                break;
            case 17:
                e1Var.setValue(Boolean.TRUE);
                break;
            case 18:
                e1Var.setValue(Boolean.FALSE);
                break;
            case 19:
                List list = f00.b0.f53235a;
                e1Var.setValue(Boolean.TRUE);
                break;
            case 20:
                e1Var.setValue(Boolean.TRUE);
                break;
            case 21:
                e1Var.setValue(Boolean.FALSE);
                break;
            case 22:
                ((Function1) e1Var.getValue()).invoke(Float.valueOf(0.0f));
                break;
            case 23:
                e1Var.setValue(Boolean.FALSE);
                break;
            case 24:
                e1Var.setValue(Boolean.TRUE);
                break;
            case 25:
                if (((Boolean) e1Var.getValue()).booleanValue()) {
                    e1Var.setValue(Boolean.FALSE);
                } else {
                    e1Var.setValue(Boolean.TRUE);
                }
                break;
            case 26:
                e1Var.setValue(Boolean.FALSE);
                break;
            case 27:
                e1Var.setValue(Boolean.TRUE);
                break;
            case 28:
                e1Var.setValue(Boolean.FALSE);
                break;
            default:
                ((Function1) e1Var.getValue()).invoke(Float.valueOf(0.0f));
                break;
        }
        return Unit.f71706a;
    }
}
