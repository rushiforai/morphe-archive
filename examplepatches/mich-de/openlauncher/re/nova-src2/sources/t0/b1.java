package t0;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/* loaded from: classes2.dex */
public final /* synthetic */ class b1 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f87927a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ g1 f87928b;

    public /* synthetic */ b1(g1 g1Var, int i5) {
        this.f87927a = i5;
        this.f87928b = g1Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f87927a) {
            case 0:
                this.f87928b.onStop();
                break;
            default:
                this.f87928b.onCancel();
                break;
        }
        return Unit.f71706a;
    }
}
