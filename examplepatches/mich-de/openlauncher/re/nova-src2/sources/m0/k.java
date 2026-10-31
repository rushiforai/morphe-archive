package m0;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import p1.e1;

/* loaded from: classes.dex */
public final /* synthetic */ class k implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75433a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e1 f75434b;

    public /* synthetic */ k(e1 e1Var, int i5) {
        this.f75433a = i5;
        this.f75434b = e1Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f75433a) {
            case 0:
                return new g((Function1) this.f75434b.getValue());
            case 1:
                return new o0.f((Function1) this.f75434b.getValue());
            default:
                Boolean bool = (Boolean) this.f75434b.getValue();
                bool.booleanValue();
                return bool;
        }
    }
}
