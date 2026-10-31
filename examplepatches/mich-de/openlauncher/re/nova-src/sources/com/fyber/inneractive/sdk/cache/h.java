package com.fyber.inneractive.sdk.cache;

import com.fyber.inneractive.sdk.network.f0;

/* loaded from: classes.dex */
public final class h implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ l f27664a;

    public h(l lVar) {
        this.f27664a = lVar;
    }

    @Override // com.fyber.inneractive.sdk.network.f0
    public final void a(Object obj, Exception exc, boolean z11) {
        String str = (String) obj;
        if (str != null) {
            this.f27664a.f27669b = str;
        }
    }
}
