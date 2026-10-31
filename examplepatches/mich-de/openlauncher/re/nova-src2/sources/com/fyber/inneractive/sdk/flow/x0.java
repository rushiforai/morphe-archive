package com.fyber.inneractive.sdk.flow;

/* loaded from: classes3.dex */
public final class x0 {

    /* renamed from: c, reason: collision with root package name */
    public static final x0 f28443c = new x0(null);

    /* renamed from: a, reason: collision with root package name */
    public final int f28444a;

    /* renamed from: b, reason: collision with root package name */
    public final int f28445b;

    public x0(com.fyber.inneractive.sdk.response.e eVar) {
        this.f28444a = -1;
        this.f28445b = -1;
        if (eVar != null) {
            this.f28444a = eVar.L;
            this.f28445b = eVar.K;
        }
    }

    public final boolean a() {
        return this.f28444a >= 0;
    }

    public static x0 a(com.fyber.inneractive.sdk.player.f fVar) {
        return fVar != null ? fVar.n : f28443c;
    }
}
