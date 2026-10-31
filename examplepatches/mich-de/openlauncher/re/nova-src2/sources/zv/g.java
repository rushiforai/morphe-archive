package zv;

import com.stripe.android.stripe3ds2.views.ChallengeActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class g extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f98700j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ ChallengeActivity f98701k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ g(ChallengeActivity challengeActivity, int i5) {
        super(0);
        this.f98700j = i5;
        this.f98701k = challengeActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f98700j) {
            case 0:
                return this.f98701k.getViewModelStore();
            default:
                return this.f98701k.getDefaultViewModelCreationExtras();
        }
    }
}
