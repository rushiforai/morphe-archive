package b00;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import w70.i2;

/* loaded from: classes.dex */
public final /* synthetic */ class o1 extends FunctionReferenceImpl implements Function0 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ p1 f16428d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o1(p1 p1Var) {
        super(0, Intrinsics.Kotlin.class, "onDismissRequested", "invoke$lambda$5$onDismissRequested(Lcom/teslacoilsw/launcher/minusone/TitleAndIconWithDropDownMenu;)V", 0);
        this.f16428d = p1Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        Object value;
        i2 i2Var = this.f16428d.f16440g;
        do {
            value = i2Var.getValue();
            ((Boolean) value).getClass();
        } while (!i2Var.i(value, Boolean.FALSE));
        return Unit.f71706a;
    }
}
