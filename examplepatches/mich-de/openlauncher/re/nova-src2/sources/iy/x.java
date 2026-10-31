package iy;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import p1.e1;

/* loaded from: classes4.dex */
public final /* synthetic */ class x implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f68392a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f68393b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f68394c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f68395d;

    public /* synthetic */ x(long j11, Function1 function1, e1 e1Var) {
        this.f68393b = function1;
        this.f68394c = j11;
        this.f68395d = e1Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f68392a;
        Object obj = this.f68395d;
        long j11 = this.f68394c;
        Function1 function1 = this.f68393b;
        switch (i5) {
            case 0:
                function1.invoke(Boolean.FALSE);
                ((Function1) obj).invoke(new tz.n(j11));
                break;
            default:
                s0.g gVar = p0.f68345a;
                ((e1) obj).setValue(Boolean.FALSE);
                function1.invoke(new i2.s(j11));
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ x(Function1 function1, Function1 function12, long j11) {
        this.f68393b = function1;
        this.f68395d = function12;
        this.f68394c = j11;
    }
}
