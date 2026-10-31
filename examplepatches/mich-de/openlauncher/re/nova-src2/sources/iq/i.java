package iq;

import com.stripe.android.challenge.confirmation.IntentConfirmationChallengeActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class i extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f67974j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ IntentConfirmationChallengeActivity f67975k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i(IntentConfirmationChallengeActivity intentConfirmationChallengeActivity, int i5) {
        super(0);
        this.f67974j = i5;
        this.f67975k = intentConfirmationChallengeActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f67974j) {
            case 0:
                return this.f67975k.getViewModelStore();
            default:
                return this.f67975k.getDefaultViewModelCreationExtras();
        }
    }
}
