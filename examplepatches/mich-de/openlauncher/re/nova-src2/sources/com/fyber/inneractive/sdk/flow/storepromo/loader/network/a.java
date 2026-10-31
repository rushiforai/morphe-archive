package com.fyber.inneractive.sdk.flow.storepromo.loader.network;

import b.c0;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.network.c1;
import com.fyber.inneractive.sdk.network.l;
import com.fyber.inneractive.sdk.network.o0;
import com.fyber.inneractive.sdk.network.t0;
import java.util.Map;

/* loaded from: classes3.dex */
public final class a extends c1 {

    /* renamed from: r, reason: collision with root package name */
    public int f28350r;

    public a(String str, com.fyber.inneractive.sdk.flow.storepromo.loader.network.callbacks.b bVar) {
        super(bVar, str, null);
    }

    @Override // com.fyber.inneractive.sdk.network.c1, com.fyber.inneractive.sdk.network.t0
    public final o0 a(l lVar, Map map, int i5) throws com.fyber.inneractive.sdk.flow.storepromo.loader.network.exception.a {
        int iA;
        int iA2 = IAConfigManager.Q.f27761u.f27936b.a("sp_max_size", 307200, 0);
        this.f28350r = iA2;
        int i11 = iA2 + 10;
        if (lVar != null && (iA = t0.a(lVar.f28736d)) >= 0) {
            i11 = iA;
        }
        long j11 = i11;
        int i12 = this.f28350r;
        if (j11 <= i12) {
            return super.a(lVar, map, i5);
        }
        throw new com.fyber.inneractive.sdk.flow.storepromo.loader.network.exception.a(c0.g(i12, i11, "The image exceeds the maximal size: ", ", actual size: "));
    }
}
