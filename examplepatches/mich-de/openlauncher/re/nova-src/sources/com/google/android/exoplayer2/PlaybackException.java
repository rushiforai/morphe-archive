package com.google.android.exoplayer2;

import fe.e;

/* loaded from: classes3.dex */
public class PlaybackException extends Exception implements e {

    /* renamed from: a, reason: collision with root package name */
    public final int f31443a;

    /* renamed from: b, reason: collision with root package name */
    public final long f31444b;

    public PlaybackException(int i5, long j11, String str, Throwable th2) {
        super(str, th2);
        this.f31443a = i5;
        this.f31444b = j11;
    }
}
