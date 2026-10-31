package com.fyber.inneractive.sdk.player.controller;

import android.graphics.SurfaceTexture;
import android.view.Surface;
import android.view.TextureView;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class i implements TextureView.SurfaceTextureListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ q f28912a;

    public i(q qVar) {
        this.f28912a = qVar;
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final void onSurfaceTextureAvailable(SurfaceTexture surfaceTexture, int i5, int i11) {
        q qVar = this.f28912a;
        qVar.getClass();
        IAlog.a("%s onSurfaceTextureAvailable", IAlog.a(qVar));
        q.a(this.f28912a, surfaceTexture);
        x xVar = this.f28912a.f28925d;
        if (xVar != null) {
            z zVar = xVar.f28942a;
            zVar.getClass();
            IAlog.a("%s onTextureViewAvailable", IAlog.a(zVar));
        }
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final boolean onSurfaceTextureDestroyed(SurfaceTexture surfaceTexture) {
        q qVar = this.f28912a;
        qVar.getClass();
        IAlog.a("%s onSurfaceTextureDestroyed", IAlog.a(qVar));
        this.f28912a.i();
        this.f28912a.a((Surface) null);
        q qVar2 = this.f28912a;
        qVar2.o = true;
        com.fyber.inneractive.sdk.player.enums.b bVar = qVar2.f28926e;
        if (bVar == com.fyber.inneractive.sdk.player.enums.b.Error || bVar == com.fyber.inneractive.sdk.player.enums.b.Idle) {
            IAlog.a("%sReleasing surface texture", IAlog.a(qVar2));
            this.f28912a.f28932k = null;
            return true;
        }
        IAlog.a("%s caching surface texture", IAlog.a(qVar2));
        q qVar3 = this.f28912a;
        qVar3.f28932k = surfaceTexture;
        qVar3.f28930i.post(new h(this));
        return false;
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final void onSurfaceTextureSizeChanged(SurfaceTexture surfaceTexture, int i5, int i11) {
        q qVar = this.f28912a;
        if (qVar.f28926e == com.fyber.inneractive.sdk.player.enums.b.Paused) {
            int iB = qVar.b();
            int iC = qVar.c();
            if (iB <= 0 || iB > iC) {
                return;
            }
            qVar.a(iB - 1, false);
            qVar.a(iB, false);
        }
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public final void onSurfaceTextureUpdated(SurfaceTexture surfaceTexture) {
        Surface surface;
        com.fyber.inneractive.sdk.player.f fVar;
        q qVar;
        x xVar = this.f28912a.f28925d;
        if (xVar != null && (fVar = xVar.f28942a.f28945a) != null && (qVar = fVar.f30579a) != null) {
            qVar.f28930i.post(new n(qVar));
        }
        q qVar2 = this.f28912a;
        if (!qVar2.o || (surface = qVar2.f28933l) == null) {
            return;
        }
        qVar2.a(surface);
        this.f28912a.o = false;
    }
}
