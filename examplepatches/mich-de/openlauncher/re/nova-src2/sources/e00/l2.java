package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class l2 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50674a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ cw.r3 f50675b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ q00.l f50676c;

    public /* synthetic */ l2(cw.r3 r3Var, q00.l lVar, int i5) {
        this.f50674a = i5;
        this.f50675b = r3Var;
        this.f50676c = lVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f50674a) {
            case 0:
                q00.l lVar = this.f50676c;
                lVar.setValue(tz.g.b((tz.g) lVar.f83363b.getValue(), null, null, null, (tz.u) obj, null, null, null, null, null, null, null, null, null, 32759));
                this.f50675b.invoke();
                break;
            default:
                q00.l lVar2 = this.f50676c;
                lVar2.setValue(tz.g.b((tz.g) lVar2.f83363b.getValue(), null, null, null, null, null, null, null, null, (tz.u) obj, null, null, null, null, 32511));
                this.f50675b.invoke();
                break;
        }
        return Unit.f71706a;
    }
}
