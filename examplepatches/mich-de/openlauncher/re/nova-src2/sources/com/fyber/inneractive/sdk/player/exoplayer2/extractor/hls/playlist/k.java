package com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist;

import android.net.Uri;
import android.os.Handler;
import android.os.SystemClock;
import com.fyber.inneractive.sdk.player.exoplayer2.o;
import com.fyber.inneractive.sdk.player.exoplayer2.r;
import com.fyber.inneractive.sdk.player.exoplayer2.upstream.b0;
import com.fyber.inneractive.sdk.player.exoplayer2.upstream.d0;
import com.fyber.inneractive.sdk.player.exoplayer2.upstream.x;
import com.fyber.inneractive.sdk.player.exoplayer2.upstream.z;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;

/* loaded from: classes3.dex */
public final class k implements x {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.b f29355a;

    /* renamed from: f, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.j f29360f;

    /* renamed from: i, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.source.f f29363i;

    /* renamed from: j, reason: collision with root package name */
    public b f29364j;

    /* renamed from: k, reason: collision with root package name */
    public a f29365k;

    /* renamed from: l, reason: collision with root package name */
    public d f29366l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f29367m;

    /* renamed from: c, reason: collision with root package name */
    public final int f29357c = 3;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f29361g = new ArrayList();

    /* renamed from: h, reason: collision with root package name */
    public final b0 f29362h = new b0("HlsPlaylistTracker:MasterPlaylist");

    /* renamed from: b, reason: collision with root package name */
    public final g f29356b = new g();

    /* renamed from: d, reason: collision with root package name */
    public final IdentityHashMap f29358d = new IdentityHashMap();

    /* renamed from: e, reason: collision with root package name */
    public final Handler f29359e = new Handler();

    public k(Uri uri, com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.b bVar, com.fyber.inneractive.sdk.player.exoplayer2.source.f fVar, com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.j jVar) {
        this.f29355a = bVar;
        this.f29363i = fVar;
        this.f29360f = jVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.x
    public final void a(z zVar, long j11, long j12, boolean z11) {
        d0 d0Var = (d0) zVar;
        com.fyber.inneractive.sdk.player.exoplayer2.source.f fVar = this.f29363i;
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.k kVar = d0Var.f30343a;
        long j13 = d0Var.f30348f;
        if (fVar.f30182b != null) {
            fVar.f30181a.post(new com.fyber.inneractive.sdk.player.exoplayer2.source.c(fVar, kVar, 4, -1, null, 0, null, -9223372036854775807L, -9223372036854775807L, j11, j12, j13));
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.x
    public final void a(z zVar, long j11, long j12) {
        b bVar;
        d0 d0Var = (d0) zVar;
        e eVar = d0Var.f30346d;
        boolean z11 = eVar instanceof d;
        if (z11) {
            List listSingletonList = Collections.singletonList(new a(eVar.f29320a, new o("0", "application/x-mpegURL", null, null, -1, -1, -1, -1, -1.0f, -1, -1.0f, null, -1, null, -1, -1, -1, -1, -1, 0, null, -1, Long.MAX_VALUE, null, null, null)));
            List list = Collections.EMPTY_LIST;
            bVar = new b(null, listSingletonList, list, list, null, null);
        } else {
            bVar = (b) eVar;
        }
        this.f29364j = bVar;
        this.f29365k = (a) bVar.f29294b.get(0);
        ArrayList arrayList = new ArrayList();
        arrayList.addAll(bVar.f29294b);
        arrayList.addAll(bVar.f29295c);
        arrayList.addAll(bVar.f29296d);
        int size = arrayList.size();
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        for (int i5 = 0; i5 < size; i5++) {
            a aVar = (a) arrayList.get(i5);
            this.f29358d.put(aVar, new h(this, aVar, jElapsedRealtime));
        }
        h hVar = (h) this.f29358d.get(this.f29365k);
        if (z11) {
            hVar.a((d) eVar);
        } else {
            hVar.b();
        }
        com.fyber.inneractive.sdk.player.exoplayer2.source.f fVar = this.f29363i;
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.k kVar = d0Var.f30343a;
        long j13 = d0Var.f30348f;
        if (fVar.f30182b != null) {
            fVar.f30181a.post(new com.fyber.inneractive.sdk.player.exoplayer2.source.b(fVar, kVar, 4, -1, null, 0, null, -9223372036854775807L, -9223372036854775807L, j11, j12, j13));
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.x
    public final int a(z zVar, long j11, long j12, IOException iOException) {
        d0 d0Var = (d0) zVar;
        boolean z11 = iOException instanceof r;
        com.fyber.inneractive.sdk.player.exoplayer2.source.f fVar = this.f29363i;
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.k kVar = d0Var.f30343a;
        long j13 = d0Var.f30348f;
        if (fVar.f30182b != null) {
            fVar.f30181a.post(new com.fyber.inneractive.sdk.player.exoplayer2.source.d(fVar, kVar, 4, -1, null, 0, null, -9223372036854775807L, -9223372036854775807L, j11, j12, j13, iOException, z11));
        }
        return z11 ? 3 : 0;
    }

    public final d a(a aVar) {
        d dVar;
        h hVar = (h) this.f29358d.get(aVar);
        hVar.getClass();
        hVar.f29350g = SystemClock.elapsedRealtime();
        d dVar2 = hVar.f29347d;
        if (dVar2 != null && this.f29364j.f29294b.contains(aVar) && (((dVar = this.f29366l) == null || !dVar.f29316j) && ((h) this.f29358d.get(this.f29365k)).f29350g - SystemClock.elapsedRealtime() > 15000)) {
            this.f29365k = aVar;
            ((h) this.f29358d.get(aVar)).b();
        }
        return dVar2;
    }
}
