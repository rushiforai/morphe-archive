package p10;

import com.teslacoilsw.launcher.rewards.RewardsActivity;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final /* synthetic */ class e1 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f81751a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ RewardsActivity f81752b;

    public /* synthetic */ e1(RewardsActivity rewardsActivity, int i5) {
        this.f81751a = i5;
        this.f81752b = rewardsActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f81751a;
        RewardsActivity rewardsActivity = this.f81752b;
        switch (i5) {
            case 0:
                int i11 = RewardsActivity.f46163p;
                if (!rewardsActivity.isFinishing() && !rewardsActivity.isDestroyed()) {
                    ox.u.f(rewardsActivity, new e1(rewardsActivity, 1));
                    break;
                } else {
                    break;
                }
                break;
            case 1:
                int i12 = RewardsActivity.f46163p;
                ox.u.a(rewardsActivity);
                break;
            default:
                rewardsActivity.finish();
                break;
        }
        return Unit.f71706a;
    }
}
