package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class c1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50249a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f50250b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f50251c;

    public /* synthetic */ c1(p1.e1 e1Var, p1.e1 e1Var2, int i5) {
        this.f50249a = i5;
        this.f50250b = e1Var;
        this.f50251c = e1Var2;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f50249a) {
            case 0:
                this.f50250b.setValue((e10.s1) obj);
                this.f50251c.setValue((e10.s1) obj2);
                break;
            default:
                this.f50250b.setValue((String) obj);
                this.f50251c.setValue((String) obj2);
                break;
        }
        return Unit.f71706a;
    }
}
