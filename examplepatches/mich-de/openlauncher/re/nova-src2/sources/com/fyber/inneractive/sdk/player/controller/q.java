package com.fyber.inneractive.sdk.player.controller;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.os.Handler;
import android.view.Surface;
import android.view.TextureView;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public abstract class q implements com.fyber.inneractive.sdk.player.mediaplayer.n {

    /* renamed from: a, reason: collision with root package name */
    public final Context f28922a;

    /* renamed from: d, reason: collision with root package name */
    public x f28925d;

    /* renamed from: f, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.c f28927f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f28928g;

    /* renamed from: i, reason: collision with root package name */
    public final Handler f28930i;

    /* renamed from: j, reason: collision with root package name */
    public TextureView f28931j;

    /* renamed from: k, reason: collision with root package name */
    public SurfaceTexture f28932k;

    /* renamed from: l, reason: collision with root package name */
    public Surface f28933l;

    /* renamed from: m, reason: collision with root package name */
    public i f28934m;
    public boolean o;

    /* renamed from: e, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.enums.b f28926e = com.fyber.inneractive.sdk.player.enums.b.Idle;
    public boolean n = false;

    /* renamed from: b, reason: collision with root package name */
    public final CopyOnWriteArrayList f28923b = new CopyOnWriteArrayList();

    /* renamed from: c, reason: collision with root package name */
    public final CopyOnWriteArrayList f28924c = new CopyOnWriteArrayList();

    /* renamed from: h, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.h f28929h = new com.fyber.inneractive.sdk.player.h(this);

    public q(Context context) {
        this.f28922a = context.getApplicationContext();
        this.f28930i = new Handler(context.getMainLooper());
        a(true);
    }

    public void a() {
        IAlog.a("%sdestroy started", IAlog.a(this));
        k();
        this.f28929h = null;
        com.fyber.inneractive.sdk.util.v.a(this.f28931j);
        this.f28931j = null;
        SurfaceTexture surfaceTexture = this.f28932k;
        if (surfaceTexture != null) {
            surfaceTexture.release();
            this.f28932k = null;
        }
        Surface surface = this.f28933l;
        if (surface != null) {
            surface.release();
            this.f28933l = null;
        }
        this.f28930i.removeCallbacksAndMessages(null);
        this.f28923b.clear();
        this.f28927f = null;
        this.f28928g = true;
        IAlog.a("%sdestroy finished", IAlog.a(this));
    }

    public abstract void a(int i5, boolean z11);

    public abstract void a(Surface surface);

    public abstract void a(String str, int i5);

    public abstract void a(boolean z11);

    public abstract int b();

    public abstract void b(boolean z11);

    public abstract int c();

    public final void c(boolean z11) {
        com.fyber.inneractive.sdk.measurement.f fVar;
        com.fyber.inneractive.sdk.player.c cVar = this.f28927f;
        if (cVar == null || (fVar = cVar.f28838a.f30583e) == null) {
            return;
        }
        if (z11) {
            if (fVar.f28513c == null || !fVar.f28514d) {
                return;
            }
            IAlog.a("%s mute", "OMVideo");
            try {
                fVar.f28513c.c(0.0f);
                return;
            } catch (Throwable th2) {
                fVar.a(th2);
                return;
            }
        }
        if (fVar.f28513c == null || !fVar.f28514d) {
            return;
        }
        IAlog.a("%s unMute", "OMVideo");
        try {
            fVar.f28513c.c(1.0f);
        } catch (Throwable th3) {
            fVar.a(th3);
        }
    }

    public abstract String d();

    public abstract void d(boolean z11);

    public abstract int e();

    public abstract int f();

    public abstract boolean g();

    public boolean h() {
        return this.f28926e == com.fyber.inneractive.sdk.player.enums.b.Playing;
    }

    public abstract void i();

    public abstract void j();

    public final void k() {
        ScheduledThreadPoolExecutor scheduledThreadPoolExecutor;
        com.fyber.inneractive.sdk.player.h hVar = this.f28929h;
        if (hVar == null || (scheduledThreadPoolExecutor = hVar.f30595b) == null) {
            return;
        }
        scheduledThreadPoolExecutor.shutdownNow();
        hVar.f30595b = null;
    }

    public final void a(TextureView textureView) {
        TextureView textureView2 = this.f28931j;
        if (textureView2 != textureView) {
            if (textureView2 != null) {
                textureView2.setSurfaceTextureListener(null);
            }
            this.f28931j = textureView;
            if (textureView != null) {
                i iVar = this.f28934m;
                if (iVar == null) {
                    iVar = new i(this);
                    this.f28934m = iVar;
                }
                textureView.setSurfaceTextureListener(iVar);
            }
            if (this.f28932k != null) {
                IAlog.a("%scalling setSurfaceTexture with cached texture", IAlog.a(this));
                if (this.f28931j.getSurfaceTexture() != null && this.f28931j.getSurfaceTexture().equals(this.f28932k)) {
                    IAlog.a("%scalling setSurfaceTexture with cached texture failed", IAlog.a(this));
                } else {
                    IAlog.a("%scalling setSurfaceTexture with cached texture success", IAlog.a(this));
                    this.f28931j.setSurfaceTexture(this.f28932k);
                }
            }
        }
    }

    public static void a(q qVar, SurfaceTexture surfaceTexture) {
        boolean zEquals = surfaceTexture.equals(qVar.f28932k);
        SurfaceTexture surfaceTexture2 = qVar.f28932k;
        if (surfaceTexture2 != null) {
            surfaceTexture2.release();
        }
        qVar.f28932k = surfaceTexture;
        Surface surface = qVar.f28933l;
        if (surface == null || !zEquals) {
            if (surface != null) {
                surface.release();
            }
            qVar.f28933l = new Surface(qVar.f28932k);
        }
        qVar.a(qVar.f28933l);
    }

    public void a(int i5) {
        this.f28930i.post(new l(this, i5));
    }

    public final void a(com.fyber.inneractive.sdk.player.enums.b bVar) {
        if (bVar == this.f28926e) {
            return;
        }
        this.f28926e = bVar;
        if (bVar == com.fyber.inneractive.sdk.player.enums.b.Playing) {
            com.fyber.inneractive.sdk.player.h hVar = this.f28929h;
            if (hVar != null && hVar.f30595b == null) {
                ScheduledThreadPoolExecutor scheduledThreadPoolExecutor = new ScheduledThreadPoolExecutor(1);
                hVar.f30595b = scheduledThreadPoolExecutor;
                scheduledThreadPoolExecutor.scheduleAtFixedRate(hVar.f30596c, 100, 1000, TimeUnit.MILLISECONDS);
            }
        } else if (bVar == com.fyber.inneractive.sdk.player.enums.b.Paused || bVar == com.fyber.inneractive.sdk.player.enums.b.Idle || bVar == com.fyber.inneractive.sdk.player.enums.b.Completed) {
            k();
        }
        this.f28930i.post(new m(this, bVar));
    }
}
