package k1;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import p1.e1;

/* loaded from: classes2.dex */
public final class j extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f70840j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ e1 f70841k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ j(e1 e1Var, int i5) {
        super(0);
        this.f70840j = i5;
        this.f70841k = e1Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f70840j) {
            case 0:
                return (e) this.f70841k.getValue();
            default:
                Unit unit = Unit.f71706a;
                this.f70841k.setValue(unit);
                return unit;
        }
    }
}
