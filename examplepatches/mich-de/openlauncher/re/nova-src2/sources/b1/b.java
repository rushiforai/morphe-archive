package b1;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import e1.a0;
import g0.u2;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function1;
import v2.l0;
import v2.x;

/* loaded from: classes.dex */
public final class b implements PointerInputEventHandler {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16520a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f16521b;

    public /* synthetic */ b(Object obj, int i5) {
        this.f16520a = i5;
        this.f16521b = obj;
    }

    @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
    public final Object invoke(x xVar, Continuation continuation) {
        switch (this.f16520a) {
            case 0:
                Object objB = u2.b(xVar, new a((c) this.f16521b, null, 0), continuation);
                if (objB != CoroutineSingletons.f71806a) {
                    break;
                }
                break;
            default:
                Object objB2 = ((l0) xVar).B(new a0((Function1) this.f16521b, null, 0), continuation);
                if (objB2 != CoroutineSingletons.f71806a) {
                    break;
                }
                break;
        }
        return Unit.f71706a;
    }
}
