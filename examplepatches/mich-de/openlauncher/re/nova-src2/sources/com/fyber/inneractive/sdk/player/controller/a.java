package com.fyber.inneractive.sdk.player.controller;

import android.content.Context;
import android.view.Surface;
import com.fyber.inneractive.sdk.util.IAlog;
import java.io.IOException;

/* loaded from: classes3.dex */
public final class a extends q {

    /* renamed from: p, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.mediaplayer.p f28880p;

    /* renamed from: q, reason: collision with root package name */
    public int f28881q;

    /* renamed from: r, reason: collision with root package name */
    public final int f28882r;

    /* renamed from: s, reason: collision with root package name */
    public int f28883s;

    /* renamed from: t, reason: collision with root package name */
    public boolean f28884t;

    public a(Context context) {
        super(context);
        this.f28881q = 0;
        this.f28882r = 2;
        this.f28883s = 0;
        this.f28884t = false;
        IAlog.a("Creating IAAndroidMediaPlayerController", new Object[0]);
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final void a() {
        com.fyber.inneractive.sdk.player.mediaplayer.p pVar = this.f28880p;
        if (pVar != null) {
            pVar.reset();
            this.f28880p.release();
            this.f28880p = null;
        }
        super.a();
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final void b(boolean z11) {
        if (g() && this.n) {
            return;
        }
        this.n = z11;
        com.fyber.inneractive.sdk.player.mediaplayer.p pVar = this.f28880p;
        if (pVar != null) {
            pVar.d();
        }
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final int c() {
        com.fyber.inneractive.sdk.player.mediaplayer.p pVar = this.f28880p;
        if (pVar != null) {
            return pVar.f30634r;
        }
        return 0;
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final void d(boolean z11) {
        if (g() || !this.n) {
            this.n = z11;
            com.fyber.inneractive.sdk.player.mediaplayer.p pVar = this.f28880p;
            if (pVar != null) {
                IAlog.a("%s unmute", pVar.b());
                pVar.f30622d = false;
                if (pVar.a()) {
                    pVar.a(new com.fyber.inneractive.sdk.player.mediaplayer.m(pVar));
                } else {
                    IAlog.a("%s unmute called when player is not ready!", pVar.b());
                }
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final int e() {
        com.fyber.inneractive.sdk.player.mediaplayer.p pVar = this.f28880p;
        if (pVar != null) {
            return pVar.f30636t;
        }
        return 0;
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final int f() {
        com.fyber.inneractive.sdk.player.mediaplayer.p pVar = this.f28880p;
        if (pVar != null) {
            return pVar.f30635s;
        }
        return 0;
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final boolean g() {
        com.fyber.inneractive.sdk.player.mediaplayer.p pVar = this.f28880p;
        if (pVar != null) {
            return pVar.f30622d;
        }
        return false;
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final void i() {
        com.fyber.inneractive.sdk.player.mediaplayer.p pVar = this.f28880p;
        if (pVar != null) {
            pVar.pause();
        }
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final void j() {
        com.fyber.inneractive.sdk.player.mediaplayer.p pVar = this.f28880p;
        if (pVar != null) {
            pVar.start();
        }
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final int b() {
        com.fyber.inneractive.sdk.player.mediaplayer.p pVar = this.f28880p;
        if (pVar != null) {
            return pVar.getCurrentPosition();
        }
        return 0;
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final void a(int i5, boolean z11) {
        com.fyber.inneractive.sdk.player.mediaplayer.p pVar = this.f28880p;
        if (pVar != null) {
            IAlog.a("%s seek to called with = %d mPlayAfterSeek = %s", pVar.b(), Integer.valueOf(i5), Boolean.valueOf(z11));
            if (!pVar.a()) {
                IAlog.a("%s seek called when player is not ready!", pVar.b());
                return;
            }
            com.fyber.inneractive.sdk.player.enums.b bVar = pVar.f30620b;
            com.fyber.inneractive.sdk.player.enums.b bVar2 = com.fyber.inneractive.sdk.player.enums.b.Seeking;
            if (bVar == bVar2) {
                IAlog.a("%s seek called when player is already seeking!", pVar.b());
                return;
            }
            pVar.a(bVar2);
            pVar.f30621c = z11;
            pVar.a(new com.fyber.inneractive.sdk.player.mediaplayer.j(pVar, i5));
        }
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final String d() {
        return "media";
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final void a(Surface surface) {
        com.fyber.inneractive.sdk.player.mediaplayer.p pVar = this.f28880p;
        if (pVar != null) {
            pVar.setSurface(surface);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final void a(boolean z11) {
        if (this.f28880p == null) {
            IAlog.a("MediaPlayerController: creating media player", new Object[0]);
            this.f28880p = new com.fyber.inneractive.sdk.player.mediaplayer.p(this.f28922a, this, this.f28930i);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final void a(String str, int i5) throws IllegalStateException, IOException, SecurityException, IllegalArgumentException {
        this.f28880p.a(str);
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final void a(int i5) {
        this.f28930i.post(new l(this, i5));
        if (i5 >= c()) {
            a(com.fyber.inneractive.sdk.player.enums.b.Completed);
        } else if (i5 == this.f28881q) {
            IAlog.a("%sVideo is stuck! Progress doesn't change", IAlog.a(this));
            int i11 = this.f28883s + 1;
            this.f28883s = i11;
            if (i11 == this.f28882r) {
                a(com.fyber.inneractive.sdk.player.enums.b.Buffering);
                this.f28884t = true;
            }
        } else if (this.f28884t) {
            IAlog.a("%sVideo progress was stuck! but now it goes forward. Remove buffering state", IAlog.a(this));
            a(com.fyber.inneractive.sdk.player.enums.b.Playing);
            this.f28883s = 0;
            this.f28884t = false;
        }
        this.f28881q = i5;
    }
}
