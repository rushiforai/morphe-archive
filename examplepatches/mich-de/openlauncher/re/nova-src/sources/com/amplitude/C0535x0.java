package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: com.amplitude.x0, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0535x0 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public static final C0535x0 f20810a = new C0535x0();

    public C0535x0() {
        super(0);
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        boolean z11;
        try {
            Class.forName("io.flutter.embedding.android.FlutterView");
            z11 = true;
        } catch (Throwable unused) {
            z11 = false;
        }
        return Boolean.valueOf(z11);
    }
}
