package b0;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class f0 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f16123j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ z2.i1 f16124k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ f0(z2.i1 i1Var, int i5) {
        super(1);
        this.f16123j = i5;
        this.f16124k = i1Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f16123j) {
            case 0:
                ((z2.h1) obj).i(this.f16124k, 0, 0, 0.0f);
                break;
            case 1:
                z2.h1.m((z2.h1) obj, this.f16124k, 0, 0);
                break;
            case 2:
                ((z2.h1) obj).i(this.f16124k, 0, 0, 0.0f);
                break;
            case 3:
                z2.h1.m((z2.h1) obj, this.f16124k, 0, 0);
                break;
            default:
                z2.h1.n((z2.h1) obj, this.f16124k, 0, 0);
                break;
        }
        return Unit.f71706a;
    }
}
