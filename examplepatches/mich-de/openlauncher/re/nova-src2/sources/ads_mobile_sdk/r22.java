package ads_mobile_sdk;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class r22 extends c61 {

    /* renamed from: c, reason: collision with root package name */
    public final q22 f8916c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r22(q22 networkConnectivityManager) {
        super(wv0.CUI_NAME_NETWORK_CONNECTIVITY_MANAGER_STATE, 2);
        Intrinsics.g(networkConnectivityManager, "networkConnectivityManager");
        this.f8916c = networkConnectivityManager;
    }

    @Override // ads_mobile_sdk.c61
    public final Object h(Continuation continuation) {
        return this.f8916c.b((ContinuationImpl) continuation);
    }
}
