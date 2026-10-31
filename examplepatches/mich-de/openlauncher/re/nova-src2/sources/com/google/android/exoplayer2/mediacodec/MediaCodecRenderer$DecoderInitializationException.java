package com.google.android.exoplayer2.mediacodec;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import fe.k0;
import we.l;

/* loaded from: classes3.dex */
public class MediaCodecRenderer$DecoderInitializationException extends Exception {

    /* renamed from: a, reason: collision with root package name */
    public final String f31463a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f31464b;

    /* renamed from: c, reason: collision with root package name */
    public final l f31465c;

    /* renamed from: d, reason: collision with root package name */
    public final String f31466d;

    public MediaCodecRenderer$DecoderInitializationException(k0 k0Var, MediaCodecUtil$DecoderQueryException mediaCodecUtil$DecoderQueryException, boolean z11, int i5) {
        this("Decoder init failed: [" + i5 + "], " + k0Var, mediaCodecUtil$DecoderQueryException, k0Var.f54883l, z11, null, "com.google.android.exoplayer2.mediacodec.MediaCodecRenderer_" + (i5 < 0 ? "neg_" : b.f42142b) + Math.abs(i5));
    }

    public MediaCodecRenderer$DecoderInitializationException(String str, Throwable th2, String str2, boolean z11, l lVar, String str3) {
        super(str, th2);
        this.f31463a = str2;
        this.f31464b = z11;
        this.f31465c = lVar;
        this.f31466d = str3;
    }
}
