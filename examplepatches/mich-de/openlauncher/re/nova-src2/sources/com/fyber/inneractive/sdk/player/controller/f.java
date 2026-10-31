package com.fyber.inneractive.sdk.player.controller;

import android.content.Context;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.view.Surface;
import b.u4;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.player.exoplayer2.audio.MediaCodecAudioRenderer;
import com.fyber.inneractive.sdk.player.exoplayer2.video.MediaCodecVideoRenderer;
import com.fyber.inneractive.sdk.util.IAlog;
import java.io.File;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes3.dex */
public final class f extends q {
    public final boolean A;
    public final CopyOnWriteArrayList B;
    public com.fyber.inneractive.sdk.player.exoplayer2.source.u C;
    public boolean D;
    public int E;

    /* renamed from: p, reason: collision with root package name */
    public final int f28897p;

    /* renamed from: q, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.config.global.r f28898q;

    /* renamed from: r, reason: collision with root package name */
    public final int f28899r;

    /* renamed from: s, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.g f28900s;

    /* renamed from: t, reason: collision with root package name */
    public int f28901t;

    /* renamed from: u, reason: collision with root package name */
    public int f28902u;

    /* renamed from: v, reason: collision with root package name */
    public boolean f28903v;

    /* renamed from: w, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.a[] f28904w;

    /* renamed from: x, reason: collision with root package name */
    public Handler f28905x;

    /* renamed from: y, reason: collision with root package name */
    public b0 f28906y;

    /* renamed from: z, reason: collision with root package name */
    public boolean f28907z;

    public f(Context context, boolean z11, com.fyber.inneractive.sdk.config.global.r rVar) {
        Integer numA;
        super(context);
        this.f28901t = 0;
        this.f28902u = 0;
        this.f28903v = false;
        this.f28907z = false;
        this.B = new CopyOnWriteArrayList();
        this.C = null;
        this.E = 0;
        this.A = z11;
        this.f28898q = rVar;
        this.f28899r = IAConfigManager.Q.f27761u.f27936b.a("extractor_source_retry_count", 6, 3);
        com.fyber.inneractive.sdk.config.global.features.v vVar = rVar != null ? (com.fyber.inneractive.sdk.config.global.features.v) rVar.a(com.fyber.inneractive.sdk.config.global.features.v.class) : null;
        this.f28897p = (vVar == null || (numA = vVar.a("max_tries")) == null) ? 0 : numA.intValue();
        IAlog.a("Creating IAExoPlayer2Controller", new Object[0]);
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final void a() {
        if (this.f28900s != null) {
            if (!this.f28907z) {
                this.f28907z = true;
                com.fyber.inneractive.sdk.util.r.f31215a.execute(new e(this));
            }
            b0 b0Var = this.f28906y;
            if (b0Var != null) {
                b0Var.f28885a.clear();
            }
            this.f28906y = null;
        }
        Iterator it = this.B.iterator();
        if (it.hasNext()) {
            throw u4.e(it);
        }
        this.B.clear();
        super.a();
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final void b(boolean z11) {
        com.fyber.inneractive.sdk.player.exoplayer2.g gVar;
        this.n = z11;
        com.fyber.inneractive.sdk.player.exoplayer2.a[] aVarArr = this.f28904w;
        if (aVarArr == null || (gVar = this.f28900s) == null || this.f28907z || aVarArr.length < 2) {
            return;
        }
        gVar.a(new com.fyber.inneractive.sdk.player.exoplayer2.e(aVarArr[1], 2, Float.valueOf(0.0f)));
        this.f28903v = true;
        c(true);
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final int c() {
        com.fyber.inneractive.sdk.player.exoplayer2.g gVar = this.f28900s;
        if (gVar == null || this.f28907z) {
            return 0;
        }
        return (int) (gVar.f29998m.c() ? -9223372036854775807L : com.fyber.inneractive.sdk.player.exoplayer2.b.a(gVar.f29998m.a(gVar.a(), gVar.f29991f).f30576f));
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final void d(boolean z11) {
        this.n = z11;
        if (this.f28900s == null || this.f28907z) {
            return;
        }
        AudioManager audioManager = (AudioManager) this.f28922a.getSystemService("audio");
        int streamVolume = audioManager.getStreamVolume(3);
        int streamMaxVolume = audioManager.getStreamMaxVolume(3);
        float f11 = streamVolume / streamMaxVolume;
        IAlog.a(" unmute maxVolume = %d currentVolume = %d targetVolume = %s", Integer.valueOf(streamMaxVolume), Integer.valueOf(streamVolume), Float.valueOf(f11));
        if (streamVolume == 0) {
            IAlog.a("Avoided unmute - Device is muted", new Object[0]);
            return;
        }
        com.fyber.inneractive.sdk.player.exoplayer2.a[] aVarArr = this.f28904w;
        if (aVarArr != null && aVarArr.length >= 2) {
            this.f28900s.a(new com.fyber.inneractive.sdk.player.exoplayer2.e(aVarArr[1], 2, Float.valueOf(f11)));
        }
        this.f28903v = false;
        c(false);
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final int e() {
        return this.f28902u;
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final int f() {
        return this.f28901t;
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final boolean g() {
        return this.f28903v;
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final boolean h() {
        return (this.f28900s == null || this.f28907z || this.f28926e != com.fyber.inneractive.sdk.player.enums.b.Playing) ? false : true;
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final void i() {
        com.fyber.inneractive.sdk.player.enums.b bVar;
        com.fyber.inneractive.sdk.player.enums.b bVar2 = this.f28926e;
        if (bVar2 == com.fyber.inneractive.sdk.player.enums.b.Idle || bVar2 == com.fyber.inneractive.sdk.player.enums.b.Completed || bVar2 == (bVar = com.fyber.inneractive.sdk.player.enums.b.Paused) || bVar2 == com.fyber.inneractive.sdk.player.enums.b.Prepared) {
            IAlog.a("%s paused called when player is in mState: %s ignoring", IAlog.a(this), bVar2);
            return;
        }
        com.fyber.inneractive.sdk.player.exoplayer2.g gVar = this.f28900s;
        if (gVar != null && !this.f28907z) {
            gVar.a(false);
        }
        k();
        a(bVar);
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final void j() {
        IAlog.a("%sstart called", IAlog.a(this));
        if (h()) {
            return;
        }
        a(com.fyber.inneractive.sdk.player.enums.b.Start_in_progress);
        this.f28900s.a(true);
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final int b() {
        long jA;
        com.fyber.inneractive.sdk.player.exoplayer2.g gVar = this.f28900s;
        if (gVar == null || this.f28907z) {
            return 0;
        }
        if (!gVar.f29998m.c() && gVar.f29996k <= 0) {
            gVar.f29998m.a(gVar.f30000q.f30020a, gVar.f29992g, false);
            jA = com.fyber.inneractive.sdk.player.exoplayer2.b.a(gVar.f30000q.f30022c) + com.fyber.inneractive.sdk.player.exoplayer2.b.a(gVar.f29992g.f30501e);
        } else {
            jA = gVar.f30002s;
        }
        return (int) jA;
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final String d() {
        return this.A ? "exo_c" : "exo";
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final void a(int i5, boolean z11) {
        IAlog.a("%sseekTo called with %d playAfterSeek = %s", IAlog.a(this), Integer.valueOf(i5), Boolean.valueOf(z11));
        com.fyber.inneractive.sdk.player.exoplayer2.g gVar = this.f28900s;
        if (gVar == null || this.f28907z) {
            return;
        }
        gVar.a(z11);
        com.fyber.inneractive.sdk.player.exoplayer2.g gVar2 = this.f28900s;
        gVar2.a(gVar2.a(), i5);
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final void a(Surface surface) {
        com.fyber.inneractive.sdk.player.exoplayer2.g gVar;
        IAlog.a("%ssetSurface called with %s", IAlog.a(this), surface);
        com.fyber.inneractive.sdk.player.exoplayer2.a[] aVarArr = this.f28904w;
        if (aVarArr == null || (gVar = this.f28900s) == null || this.f28907z) {
            return;
        }
        gVar.a(new com.fyber.inneractive.sdk.player.exoplayer2.e(aVarArr[0], 1, surface));
    }

    @Override // com.fyber.inneractive.sdk.player.controller.q
    public final void a(boolean z11) {
        if (this.f28900s != null || this.f28907z) {
            return;
        }
        this.D = z11;
        IAlog.a("%sMediaPlayerController: creating media player", IAlog.a(this));
        b0 b0Var = this.f28906y;
        if (b0Var != null) {
            b0Var.f28885a.clear();
        }
        this.f28906y = new b0(this);
        this.f28905x = new Handler(Looper.getMainLooper());
        com.fyber.inneractive.sdk.player.exoplayer2.a[] aVarArr = new com.fyber.inneractive.sdk.player.exoplayer2.a[z11 ? 2 : 1];
        this.f28904w = aVarArr;
        aVarArr[0] = new MediaCodecVideoRenderer(this.f28905x, this.f28906y);
        if (z11) {
            this.f28904w[1] = new MediaCodecAudioRenderer();
        }
        com.fyber.inneractive.sdk.player.exoplayer2.g gVar = new com.fyber.inneractive.sdk.player.exoplayer2.g(this.f28904w, new com.fyber.inneractive.sdk.player.exoplayer2.trackselection.d(), new com.fyber.inneractive.sdk.player.exoplayer2.c());
        this.f28900s = gVar;
        gVar.f29990e.add(this.f28906y);
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x005c  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00c1  */
    @Override // com.fyber.inneractive.sdk.player.controller.q
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(String str, int i5) {
        char c11;
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.g gVar;
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.g fVar;
        com.fyber.inneractive.sdk.player.exoplayer2.source.u jVar;
        if (this.f28900s == null || this.f28907z) {
            return;
        }
        IAlog.a("%sloadMediaPlayerUri called with %s", IAlog.a(this), str);
        Uri uri = Uri.parse(str);
        int i11 = com.fyber.inneractive.sdk.player.exoplayer2.util.z.f30489a;
        String path = uri.getPath();
        if (path == null) {
            c11 = 3;
        } else {
            String lowerCase = path.toLowerCase();
            if (lowerCase.endsWith(".mpd")) {
                c11 = 0;
            } else if (lowerCase.endsWith(".m3u8")) {
                c11 = 2;
            } else if (lowerCase.endsWith(".ism") || lowerCase.endsWith(".isml") || lowerCase.endsWith(".ism/manifest") || lowerCase.endsWith(".isml/manifest")) {
                c11 = 1;
            }
        }
        if (this.A && com.fyber.inneractive.sdk.player.cache.n.f28874f.f28877c && com.fyber.inneractive.sdk.util.s.a() && c11 != 2) {
            fVar = new com.fyber.inneractive.sdk.player.cache.i(this, i5, this.f28898q);
        } else {
            com.fyber.inneractive.sdk.player.exoplayer2.upstream.m mVar = new com.fyber.inneractive.sdk.player.exoplayer2.upstream.m();
            com.fyber.inneractive.sdk.player.exoplayer2.upstream.o oVar = new com.fyber.inneractive.sdk.player.exoplayer2.upstream.o(this.f28922a, mVar, new com.fyber.inneractive.sdk.player.exoplayer2.upstream.q(IAConfigManager.Q.f27765y.a(), mVar));
            File fileA = com.fyber.inneractive.sdk.player.cache.n.a(this.f28922a, "ia-vid-cache-ex2");
            if (fileA != null) {
                fVar = new com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache.f(new com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache.l(fileA, new com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache.j()), oVar);
            } else {
                gVar = oVar;
                if (c11 == 2) {
                    jVar = new com.fyber.inneractive.sdk.player.exoplayer2.source.q(uri, gVar, new com.fyber.inneractive.sdk.player.exoplayer2.extractor.c(), this.f28899r, this.f28905x, this.f28906y);
                } else {
                    jVar = new com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.j(uri, gVar, this.f28905x, this.f28906y);
                }
                this.C = jVar;
                a(jVar);
            }
        }
        gVar = fVar;
        if (c11 == 2) {
        }
        this.C = jVar;
        a(jVar);
    }

    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.source.u uVar) {
        com.fyber.inneractive.sdk.player.exoplayer2.g gVar = this.f28900s;
        if (gVar == null || uVar == null) {
            return;
        }
        if (!gVar.f29998m.c() || gVar.n != null) {
            gVar.f29998m = com.fyber.inneractive.sdk.player.exoplayer2.x.f30578a;
            gVar.n = null;
            Iterator it = gVar.f29990e.iterator();
            while (it.hasNext()) {
                ((b0) it.next()).getClass();
            }
        }
        if (gVar.f29993h) {
            gVar.f29993h = false;
            int i5 = com.fyber.inneractive.sdk.player.exoplayer2.source.z.f30247d;
            gVar.o = gVar.f29987b;
            ((com.fyber.inneractive.sdk.player.exoplayer2.trackselection.g) gVar.f29986a).getClass();
            Iterator it2 = gVar.f29990e.iterator();
            while (it2.hasNext()) {
                ((b0) it2.next()).getClass();
            }
        }
        gVar.f29997l++;
        gVar.f29989d.f30035f.obtainMessage(0, 1, 0, uVar).sendToTarget();
        a(com.fyber.inneractive.sdk.player.enums.b.Preparing);
    }
}
