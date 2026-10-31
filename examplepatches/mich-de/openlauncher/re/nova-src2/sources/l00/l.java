package l00;

import android.view.View;
import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import g0.u2;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import v2.x;

/* loaded from: classes4.dex */
public final class l implements PointerInputEventHandler {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72958a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ View f72959b;

    public /* synthetic */ l(View view, int i5) {
        this.f72958a = i5;
        this.f72959b = view;
    }

    @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
    public final Object invoke(x xVar, Continuation continuation) {
        switch (this.f72958a) {
            case 0:
                Object objB = u2.b(xVar, new k(this.f72959b, null, 0), continuation);
                if (objB != CoroutineSingletons.f71806a) {
                    break;
                }
                break;
            case 1:
                Object objB2 = u2.b(xVar, new k(this.f72959b, null, 1), continuation);
                if (objB2 != CoroutineSingletons.f71806a) {
                    break;
                }
                break;
            default:
                Object objB3 = u2.b(xVar, new k(this.f72959b, null, 2), continuation);
                if (objB3 != CoroutineSingletons.f71806a) {
                    break;
                }
                break;
        }
        return Unit.f71706a;
    }
}
