package tw;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.a0;
import g0.t2;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function1;
import p1.e1;
import v2.x;

/* loaded from: classes4.dex */
public final class d implements PointerInputEventHandler {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ e1 f89633a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f89634b;

    public d(e1 e1Var, Function1 function1) {
        this.f89633a = e1Var;
        this.f89634b = function1;
    }

    @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
    public final Object invoke(x xVar, Continuation continuation) {
        Object objE = t2.e(xVar, null, new a0(this.f89633a, this.f89634b, 10), continuation, 7);
        return objE == CoroutineSingletons.f71806a ? objE : Unit.f71706a;
    }
}
