package com.instabridge.mobilesdk.internal.ui.screens;

import android.content.Context;
import kotlin.jvm.functions.Function0;

/* loaded from: classes3.dex */
public final /* synthetic */ class u implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35879a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f35880b;

    public /* synthetic */ u(Object obj, int i5) {
        this.f35879a = i5;
        this.f35880b = obj;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f35879a) {
            case 0:
                return CheckoutScreenKt.CheckoutScreen$lambda$28$lambda$27$lambda$26(k0.z.f70781a, (Context) this.f35880b);
            case 1:
                return Float.valueOf(((Float) this.f35880b).floatValue());
            default:
                return Float.valueOf(InstallingScreenKt.InstallingScreen$lambda$5$lambda$4$lambda$3$lambda$2((c0.e) this.f35880b));
        }
    }
}
