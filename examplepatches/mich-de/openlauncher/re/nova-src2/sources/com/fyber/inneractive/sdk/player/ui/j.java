package com.fyber.inneractive.sdk.player.ui;

import com.fyber.inneractive.sdk.player.controller.z;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.v1;
import org.json.JSONException;

/* loaded from: classes3.dex */
public final class j implements v1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f30691a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ l f30692b;

    public j(l lVar, int i5) {
        this.f30692b = lVar;
        this.f30691a = i5;
    }

    @Override // com.fyber.inneractive.sdk.util.v1
    public final void a() throws JSONException {
        if (this.f30692b.f30687h) {
            IAlog.a("Autoclick is aborted - app in background", new Object[0]);
        } else {
            IAlog.a("Autoclick is triggered", new Object[0]);
            ((z) this.f30692b.f30686g).a(this.f30691a, l.J);
        }
        this.f30692b.p();
    }
}
