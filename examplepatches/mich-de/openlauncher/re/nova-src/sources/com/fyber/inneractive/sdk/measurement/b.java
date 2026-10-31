package com.fyber.inneractive.sdk.measurement;

import com.fyber.inneractive.sdk.network.f0;

/* loaded from: classes.dex */
public final class b implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ e f28498a;

    public b(e eVar) {
        this.f28498a = eVar;
    }

    @Override // com.fyber.inneractive.sdk.network.f0
    public final void a(Object obj, Exception exc, boolean z11) {
        String str = (String) obj;
        if (str != null) {
            this.f28498a.f28504c = str;
        }
    }
}
