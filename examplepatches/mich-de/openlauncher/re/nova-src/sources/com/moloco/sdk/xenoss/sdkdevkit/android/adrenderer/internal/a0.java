package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.H;
import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final /* synthetic */ class a0 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f38626a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e f38627b;

    public /* synthetic */ a0(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e eVar, int i5) {
        this.f38626a = i5;
        this.f38627b = eVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f38626a) {
            case 0:
                return A.b(this.f38627b);
            case 1:
                return A.c(this.f38627b);
            default:
                return H.b.a(this.f38627b);
        }
    }
}
