package com.fyber.inneractive.sdk.player.exoplayer2;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.fyber.inneractive.sdk.player.controller.b0;
import com.fyber.inneractive.sdk.player.exoplayer2.source.z;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class f extends Handler {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ g f29985a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(g gVar, Looper looper) {
        super(looper);
        this.f29985a = gVar;
    }

    @Override // android.os.Handler
    public final void handleMessage(Message message) {
        g gVar = this.f29985a;
        gVar.getClass();
        switch (message.what) {
            case 0:
                gVar.f29997l--;
                return;
            case 1:
                gVar.f29995j = message.arg1;
                Iterator it = gVar.f29990e.iterator();
                while (it.hasNext()) {
                    ((b0) it.next()).a(gVar.f29995j, gVar.f29994i);
                }
                return;
            case 2:
                Iterator it2 = gVar.f29990e.iterator();
                while (it2.hasNext()) {
                    ((b0) it2.next()).getClass();
                }
                return;
            case 3:
                if (gVar.f29997l == 0) {
                    com.fyber.inneractive.sdk.player.exoplayer2.trackselection.j jVar = (com.fyber.inneractive.sdk.player.exoplayer2.trackselection.j) message.obj;
                    gVar.f29993h = true;
                    z zVar = jVar.f30268a;
                    gVar.o = jVar.f30269b;
                    com.fyber.inneractive.sdk.player.exoplayer2.trackselection.i iVar = gVar.f29986a;
                    Object obj = jVar.f30270c;
                    ((com.fyber.inneractive.sdk.player.exoplayer2.trackselection.g) iVar).getClass();
                    Iterator it3 = gVar.f29990e.iterator();
                    while (it3.hasNext()) {
                        ((b0) it3.next()).getClass();
                    }
                    return;
                }
                return;
            case 4:
                int i5 = gVar.f29996k - 1;
                gVar.f29996k = i5;
                if (i5 == 0) {
                    gVar.f30000q = (i) message.obj;
                    if (message.arg1 != 0) {
                        Iterator it4 = gVar.f29990e.iterator();
                        while (it4.hasNext()) {
                            ((b0) it4.next()).getClass();
                        }
                        return;
                    }
                    return;
                }
                return;
            case 5:
                if (gVar.f29996k == 0) {
                    gVar.f30000q = (i) message.obj;
                    Iterator it5 = gVar.f29990e.iterator();
                    while (it5.hasNext()) {
                        ((b0) it5.next()).getClass();
                    }
                    return;
                }
                return;
            case 6:
                k kVar = (k) message.obj;
                gVar.f29996k -= kVar.f30029d;
                if (gVar.f29997l == 0) {
                    gVar.f29998m = kVar.f30026a;
                    gVar.n = kVar.f30027b;
                    gVar.f30000q = kVar.f30028c;
                    Iterator it6 = gVar.f29990e.iterator();
                    while (it6.hasNext()) {
                        ((b0) it6.next()).getClass();
                    }
                    return;
                }
                return;
            case 7:
                s sVar = (s) message.obj;
                if (gVar.f29999p.equals(sVar)) {
                    return;
                }
                gVar.f29999p = sVar;
                Iterator it7 = gVar.f29990e.iterator();
                while (it7.hasNext()) {
                    ((b0) it7.next()).getClass();
                }
                return;
            case 8:
                d dVar = (d) message.obj;
                Iterator it8 = gVar.f29990e.iterator();
                while (it8.hasNext()) {
                    b0 b0Var = (b0) it8.next();
                    com.fyber.inneractive.sdk.player.controller.f fVar = (com.fyber.inneractive.sdk.player.controller.f) b0Var.f28885a.get();
                    if (fVar != null && (dVar.getCause() instanceof com.fyber.inneractive.sdk.player.exoplayer2.audio.n) && (b0Var.f28886b || (fVar.D && fVar.A))) {
                        fVar.f28903v = true;
                        g gVar2 = fVar.f28900s;
                        if (gVar2 != null) {
                            gVar2.f29989d.d();
                            gVar2.f29988c.removeCallbacksAndMessages(null);
                            fVar.f28900s = null;
                        }
                        fVar.a(false);
                        fVar.a(fVar.C);
                        fVar.f28930i.post(new com.fyber.inneractive.sdk.player.controller.k(fVar, false));
                    } else if (fVar == null || !fVar.A || b0Var.f28886b || !com.fyber.inneractive.sdk.player.cache.n.f28874f.f28877c || !com.fyber.inneractive.sdk.util.s.a() || fVar.E >= fVar.f28897p) {
                        com.fyber.inneractive.sdk.player.mediaplayer.o oVar = new com.fyber.inneractive.sdk.player.mediaplayer.o(dVar, dVar.getCause() == null ? "empty" : dVar.getCause().getMessage());
                        IAlog.a("%sonPlayerError called with %s for sendErrorState", b0Var.a(), oVar);
                        com.fyber.inneractive.sdk.player.controller.f fVar2 = (com.fyber.inneractive.sdk.player.controller.f) com.fyber.inneractive.sdk.util.v.a(b0Var.f28885a);
                        if (fVar2 != null) {
                            fVar2.a(com.fyber.inneractive.sdk.player.enums.b.Error);
                            IAlog.a("%sonPlayerError called with: %s for onPlayerError", IAlog.a(fVar2), oVar);
                            fVar2.f28930i.post(new com.fyber.inneractive.sdk.player.controller.j(fVar2, oVar));
                            fVar2.k();
                        }
                    } else {
                        g gVar3 = fVar.f28900s;
                        if (gVar3 != null) {
                            gVar3.f29989d.d();
                            gVar3.f29988c.removeCallbacksAndMessages(null);
                            fVar.f28900s = null;
                        }
                        fVar.a(true);
                        fVar.a(fVar.C);
                        fVar.E++;
                        fVar.f28930i.post(new com.fyber.inneractive.sdk.player.controller.k(fVar, true));
                    }
                }
                return;
            default:
                throw new IllegalStateException();
        }
    }
}
