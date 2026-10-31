package r00;

import e10.k0;
import e10.n0;
import e10.p0;
import e10.t0;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class i implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f84991a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p f84992b;

    public /* synthetic */ i(p pVar, int i5) {
        this.f84991a = i5;
        this.f84992b = pVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f84991a) {
            case 0:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                q00.l lVar = this.f84992b.f85021e;
                lVar.setValue(n0.a((n0) lVar.f83363b.getValue(), null, 0, false, false, 0, 0, null, false, zBooleanValue, 1023));
                break;
            case 1:
                int iIntValue = ((Integer) obj).intValue();
                q00.l lVar2 = this.f84992b.f85021e;
                lVar2.setValue(n0.a((n0) lVar2.f83363b.getValue(), null, iIntValue, false, false, 0, 0, null, false, false, 2039));
                break;
            case 2:
                boolean zBooleanValue2 = ((Boolean) obj).booleanValue();
                q00.l lVar3 = this.f84992b.f85021e;
                lVar3.setValue(n0.a((n0) lVar3.f83363b.getValue(), null, 0, false, zBooleanValue2, 0, 0, null, false, false, 2015));
                break;
            case 3:
                t0 t0Var = (t0) obj;
                q00.l lVar4 = this.f84992b.f85021e;
                lVar4.setValue(n0.a((n0) lVar4.f83363b.getValue(), null, 0, false, false, t0Var.f51821a, t0Var.f51822b, null, false, false, 1855));
                break;
            case 4:
                q00.l lVar5 = this.f84992b.f85021e;
                lVar5.setValue(n0.a((n0) lVar5.f83363b.getValue(), null, 0, false, false, 0, 0, (k0) obj, false, false, 1791));
                break;
            case 5:
                this.f84992b.f85022f.setValue((mx.j) obj);
                break;
            case 6:
                this.f84992b.f85022f.setValue((mx.j) obj);
                break;
            case 7:
                p pVar = this.f84992b;
                q00.l lVar6 = pVar.f85020d;
                lVar6.setValue(tz.g.b((tz.g) lVar6.f83363b.getValue(), null, null, null, null, (tz.u) obj, null, null, null, null, null, null, null, null, 32751));
                pVar.f88425b.invoke();
                break;
            case 8:
                q00.l lVar7 = this.f84992b.f85021e;
                lVar7.setValue(n0.a((n0) lVar7.f83363b.getValue(), (p0) obj, 0, false, false, 0, 0, null, false, false, 2046));
                break;
            case 9:
                boolean zBooleanValue3 = ((Boolean) obj).booleanValue();
                q00.l lVar8 = this.f84992b.f85021e;
                lVar8.setValue(n0.a((n0) lVar8.f83363b.getValue(), null, 0, zBooleanValue3, false, 0, 0, null, false, false, 2031));
                break;
            default:
                boolean zBooleanValue4 = ((Boolean) obj).booleanValue();
                q00.l lVar9 = this.f84992b.f85021e;
                lVar9.setValue(n0.a((n0) lVar9.f83363b.getValue(), null, 0, false, false, 0, 0, null, zBooleanValue4, false, 1535));
                break;
        }
        return Unit.f71706a;
    }
}
