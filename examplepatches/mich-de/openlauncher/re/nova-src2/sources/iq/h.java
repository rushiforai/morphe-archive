package iq;

import com.stripe.android.challenge.confirmation.IntentConfirmationChallengeActivity;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final /* synthetic */ class h implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f67972a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ IntentConfirmationChallengeActivity f67973b;

    public /* synthetic */ h(IntentConfirmationChallengeActivity intentConfirmationChallengeActivity, int i5) {
        this.f67972a = i5;
        this.f67973b = intentConfirmationChallengeActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f67972a) {
            case 0:
                return this.f67973b.o;
            default:
                return new p(new f10.o(this.f67973b, 26));
        }
    }
}
