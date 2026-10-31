package kq;

import com.stripe.android.challenge.passive.PassiveChallengeActivity;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class b extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f72115j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ PassiveChallengeActivity f72116k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b(PassiveChallengeActivity passiveChallengeActivity, int i5) {
        super(0);
        this.f72115j = i5;
        this.f72116k = passiveChallengeActivity;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f72115j) {
            case 0:
                return this.f72116k.getViewModelStore();
            default:
                return this.f72116k.getDefaultViewModelCreationExtras();
        }
    }
}
