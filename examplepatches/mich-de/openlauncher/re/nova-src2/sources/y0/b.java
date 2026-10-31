package y0;

import android.os.Handler;
import android.os.Looper;
import android.view.ActionMode;
import android.view.View;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final /* synthetic */ class b implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f96502a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ f f96503b;

    public /* synthetic */ b(f fVar, int i5) {
        this.f96502a = i5;
        this.f96503b = fVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f96502a) {
            case 0:
                Function0 function0 = (Function0) obj;
                View view = this.f96503b.f96512a;
                Handler handler = view.getHandler();
                if ((handler != null ? handler.getLooper() : null) == Looper.myLooper()) {
                    function0.invoke();
                } else {
                    Handler handler2 = view.getHandler();
                    if (handler2 != null) {
                        handler2.post(new b4.b(function0, 7));
                    }
                }
                return Unit.f71706a;
            case 1:
                ActionMode actionMode = this.f96503b.f96519h;
                if (actionMode != null) {
                    actionMode.invalidate();
                }
                return Unit.f71706a;
            case 2:
                ActionMode actionMode2 = this.f96503b.f96519h;
                if (actionMode2 != null) {
                    actionMode2.invalidateContentRect();
                }
                return Unit.f71706a;
            default:
                f fVar = this.f96503b;
                fVar.f96516e.e();
                return new a1.j(fVar, 17);
        }
    }
}
