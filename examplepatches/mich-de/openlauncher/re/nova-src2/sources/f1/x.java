package f1;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class x implements g0.l0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54080a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final w f54081b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f54082c;

    public x(y yVar, byte b11) {
        this.f54082c = yVar;
        this.f54081b = new w(yVar, 5);
    }

    @Override // g0.l0
    public final void a(float f11) {
        switch (this.f54080a) {
            case 0:
                ((y) this.f54082c).f(f11);
                break;
            default:
                ((y) this.f54082c).f(f11);
                break;
        }
    }

    @Override // g0.l0
    public final Object b(e0.f1 f1Var, Function2 function2, ContinuationImpl continuationImpl) throws Throwable {
        switch (this.f54080a) {
            case 0:
                Object objA = ((y) this.f54082c).a(f1Var, new v(this, function2, (Continuation) null), continuationImpl);
                if (objA != CoroutineSingletons.f71806a) {
                    break;
                }
                break;
            default:
                Object objD = ((y) this.f54082c).d(f1Var, new v(this, function2, null, (byte) 0), continuationImpl);
                if (objD != CoroutineSingletons.f71806a) {
                    break;
                }
                break;
        }
        return Unit.f71706a;
    }

    public x(y yVar) {
        this.f54082c = yVar;
        this.f54081b = new w(yVar, 0);
    }
}
