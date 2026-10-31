package uw;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import w70.g2;

/* loaded from: classes4.dex */
public final /* synthetic */ class d implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f91587a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f91588b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ g2 f91589c;

    public /* synthetic */ d(Function1 function1, g2 g2Var, int i5) {
        this.f91587a = i5;
        this.f91588b = function1;
        this.f91589c = g2Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f91587a) {
            case 0:
                return this.f91588b.invoke(this.f91589c.getValue());
            default:
                return ((g2) this.f91588b.invoke(this.f91589c.getValue())).getValue();
        }
    }
}
