package com.fyber.inneractive.sdk.player.exoplayer2.source.chunk;

import com.fyber.inneractive.sdk.player.exoplayer2.o;
import com.fyber.inneractive.sdk.player.exoplayer2.upstream.h;
import com.fyber.inneractive.sdk.player.exoplayer2.upstream.k;
import com.fyber.inneractive.sdk.player.exoplayer2.upstream.z;

/* loaded from: classes3.dex */
public abstract class a implements z {

    /* renamed from: a, reason: collision with root package name */
    public final k f30164a;

    /* renamed from: b, reason: collision with root package name */
    public final int f30165b;

    /* renamed from: c, reason: collision with root package name */
    public final o f30166c;

    /* renamed from: d, reason: collision with root package name */
    public final int f30167d;

    /* renamed from: e, reason: collision with root package name */
    public final Object f30168e;

    /* renamed from: f, reason: collision with root package name */
    public final long f30169f;

    /* renamed from: g, reason: collision with root package name */
    public final long f30170g;

    /* renamed from: h, reason: collision with root package name */
    public final h f30171h;

    public a(int i5, int i11, long j11, long j12, o oVar, h hVar, k kVar, Object obj) {
        hVar.getClass();
        this.f30171h = hVar;
        this.f30164a = kVar;
        this.f30165b = i5;
        this.f30166c = oVar;
        this.f30167d = i11;
        this.f30168e = obj;
        this.f30169f = j11;
        this.f30170g = j12;
    }

    public abstract long c();
}
