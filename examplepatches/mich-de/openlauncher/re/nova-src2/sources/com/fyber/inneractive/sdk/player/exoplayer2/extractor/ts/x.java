package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
public final class x {

    /* renamed from: a, reason: collision with root package name */
    public final List f29963a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.extractor.r[] f29964b;

    public x(List list) {
        this.f29963a = list;
        this.f29964b = new com.fyber.inneractive.sdk.player.exoplayer2.extractor.r[list.size()];
    }

    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar, e0 e0Var) {
        for (int i5 = 0; i5 < this.f29964b.length; i5++) {
            e0Var.a();
            e0Var.b();
            com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA = jVar.a(e0Var.f29803d, 3);
            com.fyber.inneractive.sdk.player.exoplayer2.o oVar = (com.fyber.inneractive.sdk.player.exoplayer2.o) this.f29963a.get(i5);
            String str = oVar.f30128f;
            com.fyber.inneractive.sdk.player.exoplayer2.util.a.a("application/cea-608".equals(str) || "application/cea-708".equals(str), "Invalid closed caption mime type provided: " + str);
            String str2 = oVar.f30123a;
            if (str2 == null) {
                e0Var.b();
                str2 = e0Var.f29804e;
            }
            gVarA.a(com.fyber.inneractive.sdk.player.exoplayer2.o.a(str2, str, oVar.f30144x, oVar.f30145y, oVar.f30146z, null, Long.MAX_VALUE, Collections.EMPTY_LIST));
            this.f29964b[i5] = gVarA;
        }
    }
}
