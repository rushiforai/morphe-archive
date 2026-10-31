package com.google.android.exoplayer2;

import java.io.IOException;

/* loaded from: classes3.dex */
public class ParserException extends IOException {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f31441a;

    /* renamed from: b, reason: collision with root package name */
    public final int f31442b;

    public ParserException(String str, Throwable th2, boolean z11, int i5) {
        super(str, th2);
        this.f31441a = z11;
        this.f31442b = i5;
    }

    public static ParserException a(String str, Exception exc) {
        return new ParserException(str, exc, true, 1);
    }

    public static ParserException b(String str) {
        return new ParserException(str, null, false, 1);
    }
}
