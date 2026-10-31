package c0;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;
import p1.s2;
import p1.y2;

/* loaded from: classes2.dex */
public final class u1 implements y2 {

    /* renamed from: a, reason: collision with root package name */
    public final y1 f18981a;

    /* renamed from: b, reason: collision with root package name */
    public Function1 f18982b;

    /* renamed from: c, reason: collision with root package name */
    public Lambda f18983c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ v1 f18984d;

    /* JADX WARN: Multi-variable type inference failed */
    public u1(v1 v1Var, y1 y1Var, Function1 function1, Function1 function12) {
        this.f18984d = v1Var;
        this.f18981a = y1Var;
        this.f18982b = function1;
        this.f18983c = (Lambda) function12;
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [kotlin.jvm.functions.Function1, kotlin.jvm.internal.Lambda] */
    /* JADX WARN: Type inference failed for: r1v5, types: [kotlin.jvm.functions.Function1, kotlin.jvm.internal.Lambda] */
    public final void a(w1 w1Var) {
        Object objInvoke = this.f18983c.invoke(w1Var.a());
        boolean zH = this.f18984d.f18990c.h();
        y1 y1Var = this.f18981a;
        if (zH) {
            y1Var.p(this.f18983c.invoke(w1Var.b()), objInvoke, (c0) this.f18982b.invoke(w1Var));
        } else {
            y1Var.r(objInvoke, (c0) this.f18982b.invoke(w1Var));
        }
    }

    @Override // p1.y2
    public final Object getValue() {
        a(this.f18984d.f18990c.f());
        return ((s2) this.f18981a.f19023j).getValue();
    }
}
