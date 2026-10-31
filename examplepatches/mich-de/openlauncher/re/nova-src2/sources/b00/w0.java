package b00;

import c3.q2;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final /* synthetic */ class w0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16483a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f16484b;

    public /* synthetic */ w0(Function1 function1, int i5) {
        this.f16483a = i5;
        this.f16484b = function1;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f16483a) {
            case 0:
                this.f16484b.invoke((String) obj);
                return Unit.f71706a;
            case 1:
                Function1 function1 = this.f16484b;
                Long l9 = (Long) obj;
                l9.longValue();
                return function1.invoke(l9);
            case 2:
                Function1 function12 = this.f16484b;
                q2 q2Var = (q2) obj;
                q2Var.d("offset");
                q2Var.b().b("offset", function12);
                return Unit.f71706a;
            default:
                z1.f fVar = (z1.f) this.f16484b.invoke((z1.j) obj);
                synchronized (z1.k.f97943c) {
                    z1.k.f97944d = z1.k.f97944d.f(fVar.g());
                    Unit unit = Unit.f71706a;
                }
                return fVar;
        }
    }
}
