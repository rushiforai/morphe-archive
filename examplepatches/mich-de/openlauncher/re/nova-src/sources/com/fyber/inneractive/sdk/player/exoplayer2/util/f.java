package com.fyber.inneractive.sdk.player.exoplayer2.util;

import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes3.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final int f30435a;

    /* renamed from: b, reason: collision with root package name */
    public final int f30436b;

    /* renamed from: c, reason: collision with root package name */
    public final int f30437c;

    /* renamed from: d, reason: collision with root package name */
    public final long f30438d;

    public f(byte[] bArr) {
        m mVar = new m(bArr);
        mVar.b(Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE);
        mVar.a(16);
        mVar.a(16);
        mVar.a(24);
        mVar.a(24);
        this.f30435a = mVar.a(20);
        this.f30436b = mVar.a(3) + 1;
        this.f30437c = mVar.a(5) + 1;
        this.f30438d = ((mVar.a(4) & 15) << 32) | (mVar.a(32) & 4294967295L);
    }
}
