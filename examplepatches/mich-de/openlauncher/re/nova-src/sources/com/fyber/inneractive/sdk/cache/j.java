package com.fyber.inneractive.sdk.cache;

import com.fyber.inneractive.sdk.network.f0;

/* loaded from: classes.dex */
public final class j implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ l f27666a;

    public j(l lVar) {
        this.f27666a = lVar;
    }

    @Override // com.fyber.inneractive.sdk.network.f0
    public final void a(Object obj, Exception exc, boolean z11) {
        String str = (String) obj;
        if (str != null) {
            this.f27666a.f27671d = str;
        }
    }
}
