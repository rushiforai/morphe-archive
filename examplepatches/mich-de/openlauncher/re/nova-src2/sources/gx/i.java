package gx;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58083a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b0 f58084b;

    public /* synthetic */ i(b0 b0Var, int i5) {
        this.f58083a = i5;
        this.f58084b = b0Var;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        switch (this.f58083a) {
            case 0:
                Object objA = b0.a(this.f58084b, (dx.g0) obj, continuation);
                if (objA != CoroutineSingletons.f71806a) {
                    break;
                }
                break;
            case 1:
                dx.j0 j0Var = (dx.j0) obj;
                d dVar = this.f58084b.f58031f;
                dVar.getClass();
                Intrinsics.g(j0Var, "<set-?>");
                dVar.f58058a = j0Var;
                break;
            default:
                dx.h hVar = (dx.h) obj;
                if (this.f58084b.f58041r) {
                    this.f58084b.f58036k.b(hVar);
                }
                break;
        }
        return Unit.f71706a;
    }
}
