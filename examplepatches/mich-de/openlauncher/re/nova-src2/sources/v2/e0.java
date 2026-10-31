package v2;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import kotlin.Function;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.FunctionAdapter;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final /* synthetic */ class e0 implements PointerInputEventHandler, FunctionAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Function2 f91927a;

    public e0(Function2 function2) {
        this.f91927a = function2;
    }

    @Override // kotlin.jvm.internal.FunctionAdapter
    public final Function b() {
        return this.f91927a;
    }

    public final boolean equals(Object obj) {
        if ((obj instanceof PointerInputEventHandler) && (obj instanceof FunctionAdapter)) {
            return Intrinsics.b(this.f91927a, ((FunctionAdapter) obj).b());
        }
        return false;
    }

    public final int hashCode() {
        return this.f91927a.hashCode();
    }

    @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
    public final /* synthetic */ Object invoke(x xVar, Continuation continuation) {
        return this.f91927a.invoke(xVar, continuation);
    }
}
