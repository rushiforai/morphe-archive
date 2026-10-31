package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class p0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50861a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ n f50862b;

    public /* synthetic */ p0(n nVar, int i5) {
        this.f50861a = i5;
        this.f50862b = nVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f50861a) {
            case 0:
                n nVar = this.f50862b;
                q00.l lVar = nVar.f50751h;
                lVar.setValue(tz.g.b((tz.g) lVar.f83363b.getValue(), null, null, null, null, null, null, null, null, null, null, (tz.u) obj, null, null, 28671));
                nVar.f88425b.invoke();
                break;
            case 1:
                int iIntValue = ((Integer) obj).intValue();
                q00.l lVar2 = this.f50862b.f50750g;
                lVar2.setValue(mz.o.a((mz.o) lVar2.f83363b.getValue(), 0, 0, iIntValue, 15));
                break;
            default:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                q00.l lVar3 = this.f50862b.f50750g;
                lVar3.setValue(mz.o.a((mz.o) lVar3.f83363b.getValue(), zBooleanValue ? -1 : 0, 0, 0, 30));
                break;
        }
        return Unit.f71706a;
    }
}
