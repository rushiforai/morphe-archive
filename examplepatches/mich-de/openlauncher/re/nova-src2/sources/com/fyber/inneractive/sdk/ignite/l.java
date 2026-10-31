package com.fyber.inneractive.sdk.ignite;

import android.content.Context;

/* loaded from: classes3.dex */
public final class l extends jc.a {
    public l(Context context, k kVar, com.fyber.inneractive.sdk.ignite.events.wrappers.a aVar, boolean z11, boolean z12, boolean z13, h hVar) {
        l lVar;
        lc.c dVar;
        rc.a.f85792b.f85793a = kVar;
        nc.a.f78183b.f78184a = aVar;
        lc.b bVar = new lc.b(context);
        if (z11 && z12) {
            lVar = this;
            dVar = new lc.e(new lc.d(bVar, hVar, 0), true, z13, hVar, lVar);
        } else if (z11) {
            lc.e eVar = new lc.e(bVar, false, z13, hVar, this);
            lVar = this;
            dVar = eVar;
        } else {
            lVar = this;
            dVar = z12 ? new lc.d(bVar, hVar, 0) : new lc.d(bVar, hVar, 1);
        }
        lVar.f69429a = dVar;
    }
}
