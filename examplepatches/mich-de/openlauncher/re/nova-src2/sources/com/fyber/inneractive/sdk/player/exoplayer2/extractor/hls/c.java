package com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls;

import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.util.Arrays;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes3.dex */
public final class c extends com.fyber.inneractive.sdk.player.exoplayer2.source.chunk.a {

    /* renamed from: i, reason: collision with root package name */
    public byte[] f29200i;

    /* renamed from: j, reason: collision with root package name */
    public int f29201j;

    /* renamed from: k, reason: collision with root package name */
    public volatile boolean f29202k;

    /* renamed from: l, reason: collision with root package name */
    public final String f29203l;

    /* renamed from: m, reason: collision with root package name */
    public byte[] f29204m;

    public c(com.fyber.inneractive.sdk.player.exoplayer2.upstream.h hVar, com.fyber.inneractive.sdk.player.exoplayer2.upstream.k kVar, com.fyber.inneractive.sdk.player.exoplayer2.o oVar, int i5, Object obj, byte[] bArr, String str) {
        super(3, i5, -9223372036854775807L, -9223372036854775807L, oVar, hVar, kVar, obj);
        this.f29200i = bArr;
        this.f29203l = str;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.z
    public final boolean a() {
        return this.f29202k;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.z
    public final void b() {
        this.f29202k = true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.chunk.a
    public final long c() {
        return this.f29201j;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.z
    public final void load() {
        try {
            this.f30171h.a(this.f30164a);
            int i5 = 0;
            this.f29201j = 0;
            while (i5 != -1 && !this.f29202k) {
                byte[] bArr = this.f29200i;
                if (bArr == null) {
                    this.f29200i = new byte[ReaderJsonLexerKt.BATCH_SIZE];
                } else if (bArr.length < this.f29201j + ReaderJsonLexerKt.BATCH_SIZE) {
                    this.f29200i = Arrays.copyOf(bArr, bArr.length + ReaderJsonLexerKt.BATCH_SIZE);
                }
                i5 = this.f30171h.read(this.f29200i, this.f29201j, ReaderJsonLexerKt.BATCH_SIZE);
                if (i5 != -1) {
                    this.f29201j += i5;
                }
            }
            if (!this.f29202k) {
                this.f29204m = Arrays.copyOf(this.f29200i, this.f29201j);
            }
            z.a(this.f30171h);
        } catch (Throwable th2) {
            z.a(this.f30171h);
            throw th2;
        }
    }
}
