package com.amplitude;

import kotlin.jvm.internal.Intrinsics;

/* renamed from: com.amplitude.h0, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0446h0 {

    /* renamed from: a, reason: collision with root package name */
    public transient String f20592a;

    public final void a(Throwable throwable, String source) {
        Intrinsics.g(throwable, "throwable");
        Intrinsics.g(source, "source");
        try {
            this.f20592a = throwable.getClass().getName() + "_" + source;
        } catch (Throwable unused) {
        }
    }

    public final void a(String message, String source) {
        Intrinsics.g(message, "message");
        Intrinsics.g(source, "source");
        try {
            this.f20592a = message + "_" + source;
        } catch (Throwable unused) {
        }
    }
}
