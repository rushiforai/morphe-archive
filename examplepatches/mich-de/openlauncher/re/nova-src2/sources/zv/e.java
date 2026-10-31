package zv;

import com.stripe.android.stripe3ds2.transaction.ChallengeAction;
import com.stripe.android.stripe3ds2.views.ChallengeActivity;

/* loaded from: classes4.dex */
public final class e extends g.s {
    public final /* synthetic */ ChallengeActivity Y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(ChallengeActivity challengeActivity) {
        super(true);
        this.Y = challengeActivity;
    }

    @Override // g.s
    public final void handleOnBackPressed() {
        this.Y.b0().e(ChallengeAction.Cancel.f45064a);
    }
}
