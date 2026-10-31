package gy;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class g0 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58329a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ n0 f58330b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function1 f58331c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function0 f58332d;

    public /* synthetic */ g0(n0 n0Var, Function1 function1, Function0 function0) {
        this.f58330b = n0Var;
        this.f58331c = function1;
        this.f58332d = function0;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f58329a) {
            case 0:
                this.f58331c.invoke(this.f58330b);
                this.f58332d.invoke();
                break;
            default:
                n0 n0Var = this.f58330b;
                if (n0Var != null) {
                    this.f58331c.invoke(n0Var);
                    this.f58332d.invoke();
                }
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ g0(Function1 function1, n0 n0Var, Function0 function0) {
        this.f58331c = function1;
        this.f58330b = n0Var;
        this.f58332d = function0;
    }
}
