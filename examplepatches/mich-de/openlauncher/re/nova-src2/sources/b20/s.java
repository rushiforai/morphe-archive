package b20;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import p1.e1;

/* loaded from: classes4.dex */
public final /* synthetic */ class s extends FunctionReferenceImpl implements Function0 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ e1 f17109d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s(e1 e1Var) {
        super(0, Intrinsics.Kotlin.class, "onDismissRequested", "invoke$onDismissRequested(Landroidx/compose/runtime/MutableState;)V", 0);
        this.f17109d = e1Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        this.f17109d.setValue(Boolean.FALSE);
        return Unit.f71706a;
    }
}
