package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose;

import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final /* synthetic */ class d0 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f41165a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.k f41166b;

    public /* synthetic */ d0(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.k kVar, int i5) {
        this.f41165a = i5;
        this.f41166b = kVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        long jA;
        switch (this.f41165a) {
            case 0:
                jA = j.a(this.f41166b);
                break;
            default:
                jA = com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.freeze.c.a(this.f41166b);
                break;
        }
        return Long.valueOf(jA);
    }
}
