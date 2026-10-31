package v2;

import android.view.MotionEvent;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class z extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f92026j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ a0 f92027k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ z(a0 a0Var, int i5) {
        super(1);
        this.f92026j = i5;
        this.f92027k = a0Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f92026j) {
            case 0:
                MotionEvent motionEvent = (MotionEvent) obj;
                Function1 function1 = this.f92027k.f91909a;
                if (function1 != null) {
                    function1.invoke(motionEvent);
                    return Unit.f71706a;
                }
                Intrinsics.m("onTouchEvent");
                throw null;
            default:
                MotionEvent motionEvent2 = (MotionEvent) obj;
                Function1 function12 = this.f92027k.f91909a;
                if (function12 != null) {
                    function12.invoke(motionEvent2);
                    return Unit.f71706a;
                }
                Intrinsics.m("onTouchEvent");
                throw null;
        }
    }
}
