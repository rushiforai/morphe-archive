package e00;

import kotlin.Pair;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class c6 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50263a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f50264b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f50265c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f50266d;

    public /* synthetic */ c6(p1.e1 e1Var, p1.e1 e1Var2, p1.e1 e1Var3, int i5) {
        this.f50263a = i5;
        this.f50264b = e1Var;
        this.f50265c = e1Var2;
        this.f50266d = e1Var3;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f50263a;
        p1.e1 e1Var = this.f50266d;
        p1.e1 e1Var2 = this.f50265c;
        p1.e1 e1Var3 = this.f50264b;
        switch (i5) {
            case 0:
                Integer num = (Integer) obj;
                int iIntValue = num.intValue();
                tz.n nVar = (tz.n) obj2;
                com.google.android.gms.internal.consent_sdk.w wVar = h6.f50482a;
                if (iIntValue < ((Number) e1Var3.getValue()).intValue()) {
                    e1Var3.setValue(num);
                }
                e1Var2.setValue(new tz.n(nVar.f90163a));
                e1Var.setValue(new tz.n(((tz.n) e1Var2.getValue()).f90163a));
                break;
            case 1:
                Integer num2 = (Integer) obj;
                int iIntValue2 = num2.intValue();
                tz.n nVar2 = (tz.n) obj2;
                com.google.android.gms.internal.consent_sdk.w wVar2 = h6.f50482a;
                if (iIntValue2 < ((Number) e1Var3.getValue()).intValue()) {
                    e1Var3.setValue(num2);
                }
                e1Var2.setValue(new tz.n(nVar2.f90163a));
                e1Var.setValue(new tz.n(((tz.n) e1Var2.getValue()).f90163a));
                break;
            default:
                String str = (String) obj;
                String str2 = (String) obj2;
                if (((Boolean) e1Var3.getValue()).booleanValue()) {
                    e1Var2.setValue(new Pair(str, str2));
                } else {
                    e1Var.setValue(new Pair(str, str2));
                }
                break;
        }
        return Unit.f71706a;
    }
}
