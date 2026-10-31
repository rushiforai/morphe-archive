package d20;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import g0.u2;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class n implements PointerInputEventHandler {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f48915a;

    public n(Ref.ObjectRef objectRef) {
        this.f48915a = objectRef;
    }

    @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
    public final Object invoke(v2.x xVar, Continuation continuation) {
        Object objB = u2.b(xVar, new m(this.f48915a, null), continuation);
        return objB == CoroutineSingletons.f71806a ? objB : Unit.f71706a;
    }
}
