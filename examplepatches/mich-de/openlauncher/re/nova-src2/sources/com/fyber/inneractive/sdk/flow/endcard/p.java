package com.fyber.inneractive.sdk.flow.endcard;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class p extends u {

    /* renamed from: j, reason: collision with root package name */
    public final String f28119j;

    /* renamed from: k, reason: collision with root package name */
    public String f28120k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f28121l;

    public p(o oVar) {
        super(oVar);
        com.fyber.inneractive.sdk.model.vast.o oVar2 = oVar.f28057c.f28457e.f28573f;
        this.f28119j = oVar2 != null ? oVar2.f28622a : null;
    }

    public final void b(com.fyber.inneractive.sdk.flow.endcard.loaders.listeners.a aVar) {
        if (TextUtils.isEmpty(this.f28131e) || TextUtils.isEmpty(this.f28120k)) {
            return;
        }
        if (this.f28132f || !this.f28134h.compareAndSet(false, true)) {
            IAlog.a("%sisWebLoaded: %s, mFmpEndCardPrepareInProgress: %s", this.f28053a, Boolean.valueOf(this.f28132f), Boolean.valueOf(this.f28134h.get()));
        } else {
            a(aVar);
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.u
    public final q d() {
        b bVar = this.f28054b;
        return new q(bVar.f28057c.f28457e, (o) bVar);
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.u
    public final boolean f() {
        return false;
    }
}
