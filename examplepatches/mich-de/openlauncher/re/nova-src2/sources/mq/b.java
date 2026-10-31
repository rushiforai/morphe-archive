package mq;

import com.stripe.android.challenge.passive.warmer.activity.PassiveChallengeWarmerActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class b extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f76603j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ PassiveChallengeWarmerActivity f76604k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b(PassiveChallengeWarmerActivity passiveChallengeWarmerActivity, int i5) {
        super(0);
        this.f76603j = i5;
        this.f76604k = passiveChallengeWarmerActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f76603j) {
            case 0:
                return this.f76604k.getViewModelStore();
            default:
                return this.f76604k.getDefaultViewModelCreationExtras();
        }
    }
}
