package f1;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function0;

/* loaded from: classes2.dex */
public final class a3 implements PointerInputEventHandler {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53385a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function0 f53386b;

    public /* synthetic */ a3(Function0 function0, int i5) {
        this.f53385a = i5;
        this.f53386b = function0;
    }

    @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
    public final Object invoke(v2.x xVar, Continuation continuation) {
        switch (this.f53385a) {
            case 0:
                Object objE = g0.t2.e(xVar, null, new dv.z(this.f53386b, 4), continuation, 7);
                if (objE != CoroutineSingletons.f71806a) {
                    break;
                }
                break;
            case 1:
                Object objB = g0.u2.b(xVar, new e0.i(this.f53386b, null, 1), continuation);
                if (objB != CoroutineSingletons.f71806a) {
                    break;
                }
                break;
            case 2:
                Object objE2 = g0.t2.e(xVar, null, new dv.z(this.f53386b, 11), continuation, 7);
                if (objE2 != CoroutineSingletons.f71806a) {
                    break;
                }
                break;
            default:
                Object objE3 = g0.t2.e(xVar, null, new dv.z(this.f53386b, 12), continuation, 7);
                if (objE3 != CoroutineSingletons.f71806a) {
                    break;
                }
                break;
        }
        return Unit.f71706a;
    }
}
