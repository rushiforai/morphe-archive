package e10;

import android.app.Activity;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class b4 extends FunctionReferenceImpl implements Function0 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ p6.l0 f51448d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Activity f51449e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b4(p6.l0 l0Var, Activity activity) {
        super(0, Intrinsics.Kotlin.class, "onDismissRequest", "invoke$onDismissRequest(Landroidx/navigation/NavHostController;Landroid/app/Activity;)V", 0);
        this.f51448d = l0Var;
        this.f51449e = activity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        p6.l0 l0Var = this.f51448d;
        if (l0Var.j() == null) {
            this.f51449e.finish();
        } else {
            l0Var.o();
        }
        return Unit.f71706a;
    }
}
