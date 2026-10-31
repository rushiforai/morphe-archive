package c4;

import android.os.Handler;
import android.os.Looper;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import p1.s2;

/* loaded from: classes2.dex */
public final class l extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f19616j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ d0 f19617k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ l(d0 d0Var, int i5) {
        super(1);
        this.f19616j = i5;
        this.f19617k = d0Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f19616j) {
            case 0:
                z2.y yVarI = ((z2.y) obj).I();
                Intrinsics.d(yVarI);
                d0 d0Var = this.f19617k;
                ((s2) d0Var.f19584j).setValue(yVarI);
                d0Var.f();
                break;
            case 1:
                y3.m mVar = new y3.m(((y3.m) obj).f96611a);
                d0 d0Var2 = this.f19617k;
                ((s2) d0Var2.f19583i).setValue(mVar);
                d0Var2.g();
                break;
            default:
                Function0 function0 = (Function0) obj;
                d0 d0Var3 = this.f19617k;
                Handler handler = d0Var3.getHandler();
                if ((handler != null ? handler.getLooper() : null) == Looper.myLooper()) {
                    function0.invoke();
                } else {
                    Handler handler2 = d0Var3.getHandler();
                    if (handler2 != null) {
                        handler2.post(new b4.b(function0, 2));
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
