package ads_mobile_sdk;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class m52 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ b.v3 f7013a;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f7014j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ m52(b.v3 v3Var, int i5) {
        super(0);
        this.f7014j = i5;
        this.f7013a = v3Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f7014j) {
            case 0:
                this.f7013a.a();
                break;
            default:
                this.f7013a.b();
                break;
        }
        return Unit.f71706a;
    }
}
