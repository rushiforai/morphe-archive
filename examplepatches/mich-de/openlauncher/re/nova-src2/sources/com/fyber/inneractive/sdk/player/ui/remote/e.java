package com.fyber.inneractive.sdk.player.ui.remote;

import com.fyber.inneractive.sdk.player.controller.z;
import com.fyber.inneractive.sdk.player.ui.n;
import com.fyber.inneractive.sdk.util.g1;
import java.util.concurrent.ConcurrentHashMap;
import org.json.JSONException;

/* loaded from: classes3.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public d f30715a;

    /* renamed from: c, reason: collision with root package name */
    public boolean f30717c = false;

    /* renamed from: b, reason: collision with root package name */
    public final ConcurrentHashMap f30716b = new ConcurrentHashMap();

    public e(d dVar) {
        this.f30715a = dVar;
    }

    public final void a(String str, String str2, boolean z11) {
        if (!z11) {
            this.f30716b.put(str, str2);
            return;
        }
        d dVar = this.f30715a;
        if (dVar != null) {
            dVar.f30703b.a(str2);
        }
    }

    public final void a(int i5, g1 g1Var) throws JSONException {
        n nVar;
        d dVar = this.f30715a;
        if (dVar == null || (nVar = dVar.f30706e) == null) {
            return;
        }
        ((z) nVar).a(i5, g1Var);
    }
}
