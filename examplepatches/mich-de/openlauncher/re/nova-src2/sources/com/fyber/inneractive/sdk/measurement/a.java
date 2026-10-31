package com.fyber.inneractive.sdk.measurement;

import com.fyber.inneractive.sdk.network.f0;

/* loaded from: classes.dex */
public final class a implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ e f28497a;

    public a(e eVar) {
        this.f28497a = eVar;
    }

    @Override // com.fyber.inneractive.sdk.network.f0
    public final void a(Object obj, Exception exc, boolean z11) {
        String str = (String) obj;
        if (str != null) {
            this.f28497a.f28503b = str;
        }
    }
}
