package b3;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class w0 extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ y0 f17386j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ long f17387k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ long f17388l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ k2 f17389m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w0(y0 y0Var, long j11, long j12, k2 k2Var) {
        super(0);
        this.f17386j = y0Var;
        this.f17387k = j11;
        this.f17388l = j12;
        this.f17389m = k2Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        y0 y0Var = this.f17386j;
        y0Var.h0().f17378a = false;
        y0Var.h0().f17379b = this.f17387k;
        y0Var.h0().f17380c = this.f17388l;
        Function1 function1C = this.f17389m.f17279a.c();
        if (function1C != null) {
            function1C.invoke(y0Var.h0());
        }
        return Unit.f71706a;
    }
}
