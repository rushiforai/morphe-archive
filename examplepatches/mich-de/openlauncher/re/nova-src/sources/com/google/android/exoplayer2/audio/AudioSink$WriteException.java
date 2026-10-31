package com.google.android.exoplayer2.audio;

import b.c0;
import fe.k0;

/* loaded from: classes3.dex */
public final class AudioSink$WriteException extends Exception {

    /* renamed from: a, reason: collision with root package name */
    public final int f31449a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f31450b;

    /* renamed from: c, reason: collision with root package name */
    public final k0 f31451c;

    public AudioSink$WriteException(int i5, k0 k0Var, boolean z11) {
        super(c0.h(i5, "AudioTrack write failed: "));
        this.f31450b = z11;
        this.f31449a = i5;
        this.f31451c = k0Var;
    }
}
