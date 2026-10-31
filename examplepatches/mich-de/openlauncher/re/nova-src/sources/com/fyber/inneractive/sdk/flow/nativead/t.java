package com.fyber.inneractive.sdk.flow.nativead;

import android.net.Uri;
import com.fyber.inneractive.sdk.network.f0;

/* loaded from: classes3.dex */
public final class t implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.response.nativead.f f28248a;

    /* renamed from: b, reason: collision with root package name */
    public final s f28249b;

    public t(com.fyber.inneractive.sdk.response.nativead.f fVar, s sVar) {
        this.f28248a = fVar;
        this.f28249b = sVar;
    }

    @Override // com.fyber.inneractive.sdk.network.f0
    public final void a(Object obj, Exception exc, boolean z11) {
        Uri uri = (Uri) obj;
        if (exc instanceof com.fyber.inneractive.sdk.network.g) {
            return;
        }
        if (exc != null || uri == null) {
            this.f28249b.a(null, exc, this.f28248a);
            return;
        }
        s sVar = this.f28249b;
        com.fyber.inneractive.sdk.response.nativead.f fVar = this.f28248a;
        sVar.a(new g(fVar.f31074a, uri), null, fVar);
    }
}
