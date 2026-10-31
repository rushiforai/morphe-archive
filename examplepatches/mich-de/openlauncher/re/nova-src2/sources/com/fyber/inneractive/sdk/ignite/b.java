package com.fyber.inneractive.sdk.ignite;

import com.fyber.inneractive.sdk.network.f0;
import com.fyber.inneractive.sdk.network.k1;
import com.fyber.inneractive.sdk.util.IAlog;
import org.json.JSONException;

/* loaded from: classes3.dex */
public final class b implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ h f28470a;

    public b(h hVar) {
        this.f28470a = hVar;
    }

    @Override // com.fyber.inneractive.sdk.network.f0
    public final void a(Object obj, Exception exc, boolean z11) throws JSONException {
        IgniteResponseOuterClass$IgniteResponse igniteResponseOuterClass$IgniteResponse = (IgniteResponseOuterClass$IgniteResponse) obj;
        this.f28470a.getClass();
        if (exc == null && igniteResponseOuterClass$IgniteResponse != null && igniteResponseOuterClass$IgniteResponse.hasClientId() && igniteResponseOuterClass$IgniteResponse.hasClientSecret()) {
            this.f28470a.onCredentialsRequestSuccess(igniteResponseOuterClass$IgniteResponse.getClientId(), igniteResponseOuterClass$IgniteResponse.getClientSecret());
            return;
        }
        String message = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        IAlog.a("Failed to fetch ignite client credentials with error: %s", exc != null ? exc.getMessage() : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        this.f28470a.getClass();
        if (!(exc instanceof k1) || ((k1) exc).f28732a != 204) {
            this.f28470a.a(j.FAILED_TO_RETRIEVE_CREDENTIALS, exc != null ? exc.getMessage() : null);
        }
        if (exc != null && exc.getMessage() != null) {
            message = exc.getMessage();
        }
        this.f28470a.onCredentialsRequestFailed(message);
    }
}
