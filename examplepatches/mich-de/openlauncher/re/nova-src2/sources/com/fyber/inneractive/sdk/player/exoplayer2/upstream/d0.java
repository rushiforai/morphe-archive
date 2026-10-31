package com.fyber.inneractive.sdk.player.exoplayer2.upstream;

import android.net.Uri;
import java.io.IOException;

/* loaded from: classes3.dex */
public final class d0 implements z {

    /* renamed from: a, reason: collision with root package name */
    public final k f30343a;

    /* renamed from: b, reason: collision with root package name */
    public final h f30344b;

    /* renamed from: c, reason: collision with root package name */
    public final c0 f30345c;

    /* renamed from: d, reason: collision with root package name */
    public volatile com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.e f30346d;

    /* renamed from: e, reason: collision with root package name */
    public volatile boolean f30347e;

    /* renamed from: f, reason: collision with root package name */
    public volatile long f30348f;

    public d0(h hVar, Uri uri, c0 c0Var) {
        this.f30344b = hVar;
        this.f30343a = new k(uri, 0L, 0L, -1L, null, 1);
        this.f30345c = c0Var;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.z
    public final boolean a() {
        return this.f30347e;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.z
    public final void b() {
        this.f30347e = true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.z
    public final void load() throws IOException {
        j jVar = new j(this.f30344b, this.f30343a);
        try {
            jVar.f30359a.a(jVar.f30360b);
            jVar.f30362d = true;
            this.f30346d = ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.g) this.f30345c).a(this.f30344b.a(), jVar);
        } finally {
            this.f30348f = jVar.f30364f;
            com.fyber.inneractive.sdk.player.exoplayer2.util.z.a(jVar);
        }
    }
}
