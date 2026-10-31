package com.google.android.exoplayer2.audio;

import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import fe.k0;

/* loaded from: classes3.dex */
public final class AudioSink$InitializationException extends Exception {

    /* renamed from: a, reason: collision with root package name */
    public final int f31446a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f31447b;

    /* renamed from: c, reason: collision with root package name */
    public final k0 f31448c;

    /* JADX WARN: Illegal instructions before constructor call */
    public AudioSink$InitializationException(int i5, int i11, int i12, int i13, k0 k0Var, boolean z11, RuntimeException runtimeException) {
        StringBuilder sbT = c0.t(i5, "AudioTrack init failed ", " Config(", i11, ", ");
        c0.A(sbT, i12, ", ", i13, ")");
        sbT.append(z11 ? " (recoverable)" : b.f42142b);
        super(sbT.toString(), runtimeException);
        this.f31446a = i5;
        this.f31447b = z11;
        this.f31448c = k0Var;
    }
}
