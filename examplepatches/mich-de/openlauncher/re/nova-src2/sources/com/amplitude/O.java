package com.amplitude;

import androidx.compose.ui.platform.AndroidComposeView;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class O extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public static final O f20338a = new O();

    public O() {
        super(0);
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        boolean z11;
        try {
            c3.n nVar = AndroidComposeView.Companion;
            z11 = true;
        } catch (Throwable unused) {
            z11 = false;
        }
        return Boolean.valueOf(z11);
    }
}
