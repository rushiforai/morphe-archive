package m1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class g extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ p f75683j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Ref.FloatRef f75684k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(p pVar, Ref.FloatRef floatRef) {
        super(2);
        this.f75683j = pVar;
        this.f75684k = floatRef;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        float fFloatValue = ((Number) obj).floatValue();
        float fFloatValue2 = ((Number) obj2).floatValue();
        f1.y yVar = this.f75683j.f75738a;
        yVar.f54117g.p(fFloatValue);
        yVar.f54118h.p(fFloatValue2);
        this.f75684k.f71860a = fFloatValue;
        return Unit.f71706a;
    }
}
