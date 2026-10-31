package com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls;

import android.net.Uri;
import com.fyber.inneractive.sdk.player.exoplayer2.source.y;
import java.math.BigInteger;
import java.util.List;
import java.util.Locale;

/* loaded from: classes3.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.upstream.h f29209a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.upstream.h f29210b;

    /* renamed from: c, reason: collision with root package name */
    public final o f29211c;

    /* renamed from: d, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.a[] f29212d;

    /* renamed from: e, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.k f29213e;

    /* renamed from: f, reason: collision with root package name */
    public final y f29214f;

    /* renamed from: g, reason: collision with root package name */
    public final List f29215g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f29216h;

    /* renamed from: i, reason: collision with root package name */
    public byte[] f29217i;

    /* renamed from: j, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.source.g f29218j;

    /* renamed from: k, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.a f29219k;

    /* renamed from: l, reason: collision with root package name */
    public Uri f29220l;

    /* renamed from: m, reason: collision with root package name */
    public byte[] f29221m;
    public String n;
    public byte[] o;

    /* renamed from: p, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.trackselection.b f29222p;

    public f(com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.k kVar, com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.playlist.a[] aVarArr, b bVar, o oVar, List list) {
        this.f29213e = kVar;
        this.f29212d = aVarArr;
        this.f29211c = oVar;
        this.f29215g = list;
        com.fyber.inneractive.sdk.player.exoplayer2.o[] oVarArr = new com.fyber.inneractive.sdk.player.exoplayer2.o[aVarArr.length];
        int[] iArr = new int[aVarArr.length];
        for (int i5 = 0; i5 < aVarArr.length; i5++) {
            oVarArr[i5] = aVarArr[i5].f29293b;
            iArr[i5] = i5;
        }
        this.f29209a = bVar.f29199a.a();
        this.f29210b = bVar.f29199a.a();
        y yVar = new y(oVarArr);
        this.f29214f = yVar;
        this.f29222p = new e(yVar, iArr);
    }

    public final void a(Uri uri, String str, byte[] bArr) {
        byte[] byteArray = new BigInteger(str.toLowerCase(Locale.getDefault()).startsWith("0x") ? str.substring(2) : str, 16).toByteArray();
        byte[] bArr2 = new byte[16];
        int length = byteArray.length > 16 ? byteArray.length - 16 : 0;
        System.arraycopy(byteArray, length, bArr2, (16 - byteArray.length) + length, byteArray.length - length);
        this.f29220l = uri;
        this.f29221m = bArr;
        this.n = str;
        this.o = bArr2;
    }
}
