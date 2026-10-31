package com.google.android.gms.internal.play_billing;

import java.util.concurrent.CancellationException;

/* loaded from: classes3.dex */
public final class c2 {

    /* renamed from: b, reason: collision with root package name */
    public static final c2 f33365b;

    /* renamed from: c, reason: collision with root package name */
    public static final c2 f33366c;

    /* renamed from: a, reason: collision with root package name */
    public final Throwable f33367a;

    static {
        if (t5.f33540d) {
            f33366c = null;
            f33365b = null;
        } else {
            f33366c = new c2(null);
            f33365b = new c2(null);
        }
    }

    public c2(CancellationException cancellationException) {
        this.f33367a = cancellationException;
    }
}
