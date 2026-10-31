package f00;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class k implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53296a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ c0 f53297b;

    public /* synthetic */ k(c0 c0Var, int i5) {
        this.f53296a = i5;
        this.f53297b = c0Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f53296a) {
            case 0:
                this.f53297b.f88425b.invoke();
                break;
            default:
                ((Boolean) obj).booleanValue();
                ((Boolean) obj2).booleanValue();
                this.f53297b.f88425b.invoke();
                break;
        }
        return Unit.f71706a;
    }
}
