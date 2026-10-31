package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.H;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class b0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f38670a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e f38671b;

    public /* synthetic */ b0(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.e eVar, int i5) {
        this.f38670a = i5;
        this.f38671b = eVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f38670a) {
            case 0:
                return A.a(this.f38671b, (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c) obj);
            default:
                return H.b.a(this.f38671b, (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c) obj);
        }
    }
}
