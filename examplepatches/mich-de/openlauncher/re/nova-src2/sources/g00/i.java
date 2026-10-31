package g00;

import com.teslacoilsw.conditions.rules.ConditionModel;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class i extends FunctionReferenceImpl implements Function1 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ a f56822d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Function1 f56823e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(a aVar, Function1 function1) {
        super(1, Intrinsics.Kotlin.class, "updateCondition", "CardDetailsTopLevelNavHost$updateCondition(Lcom/teslacoilsw/launcher/novasettings/cardsV2/CardDetails;Lkotlin/jvm/functions/Function1;Lcom/teslacoilsw/conditions/rules/ConditionModel;)V", 0);
        this.f56822d = aVar;
        this.f56823e = function1;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        j.d(this.f56822d, this.f56823e, (ConditionModel) obj);
        return Unit.f71706a;
    }
}
