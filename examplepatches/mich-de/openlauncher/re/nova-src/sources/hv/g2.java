package hv;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final /* synthetic */ class g2 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f60273a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function0 f60274b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ c3.c3 f60275c;

    public /* synthetic */ g2(c3.c3 c3Var, Function0 function0) {
        this.f60275c = c3Var;
        this.f60274b = function0;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f60273a) {
            case 0:
                c3.c3 c3Var = this.f60275c;
                if (c3Var != null) {
                    ((c3.b2) c3Var).a();
                }
                this.f60274b.invoke();
                break;
            default:
                this.f60274b.invoke();
                c3.c3 c3Var2 = this.f60275c;
                if (c3Var2 != null) {
                    ((c3.b2) c3Var2).a();
                }
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ g2(Function0 function0, c3.c3 c3Var) {
        this.f60274b = function0;
        this.f60275c = c3Var;
    }
}
