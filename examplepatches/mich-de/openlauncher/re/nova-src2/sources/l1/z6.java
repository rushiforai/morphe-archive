package l1;

import kotlin.Result;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class z6 extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f74369j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ y6 f74370k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ z6(y6 y6Var, int i5) {
        super(0);
        this.f74369j = i5;
        this.f74370k = y6Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f74369j;
        p7 p7Var = p7.f73791a;
        y6 y6Var = this.f74370k;
        switch (i5) {
            case 0:
                t70.m mVar = ((d7) y6Var).f73193b;
                if (mVar.b()) {
                    int i11 = Result.f71687b;
                    mVar.resumeWith(p7Var);
                }
                break;
            case 1:
                t70.m mVar2 = ((d7) y6Var).f73193b;
                if (mVar2.b()) {
                    int i12 = Result.f71687b;
                    mVar2.resumeWith(p7.f73792b);
                }
                break;
            default:
                t70.m mVar3 = ((d7) y6Var).f73193b;
                if (mVar3.b()) {
                    int i13 = Result.f71687b;
                    mVar3.resumeWith(p7Var);
                }
                break;
        }
        return Unit.f71706a;
    }
}
