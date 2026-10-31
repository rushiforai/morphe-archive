package zv;

import androidx.fragment.app.h0;
import androidx.fragment.app.r0;
import com.stripe.android.stripe3ds2.transaction.SdkTransactionId;
import com.stripe.android.stripe3ds2.views.ChallengeProgressFragment;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class s extends r0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f98743a;

    /* renamed from: b, reason: collision with root package name */
    public final SdkTransactionId f98744b;

    /* renamed from: c, reason: collision with root package name */
    public final Integer f98745c;

    public s(String directoryServerName, SdkTransactionId sdkTransactionId, Integer num) {
        Intrinsics.g(directoryServerName, "directoryServerName");
        Intrinsics.g(sdkTransactionId, "sdkTransactionId");
        this.f98743a = directoryServerName;
        this.f98744b = sdkTransactionId;
        this.f98745c = num;
    }

    @Override // androidx.fragment.app.r0
    public final h0 instantiate(ClassLoader classLoader, String className) {
        Intrinsics.g(classLoader, "classLoader");
        Intrinsics.g(className, "className");
        if (className.equals(ChallengeProgressFragment.class.getName())) {
            return new ChallengeProgressFragment(this.f98743a, this.f98744b, this.f98745c);
        }
        h0 h0VarInstantiate = super.instantiate(classLoader, className);
        Intrinsics.d(h0VarInstantiate);
        return h0VarInstantiate;
    }
}
