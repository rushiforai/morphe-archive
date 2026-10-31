package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui;

import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class e0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f39798a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r f39799b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f39800c;

    public /* synthetic */ e0(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r rVar, String str, int i5) {
        this.f39798a = i5;
        this.f39799b = rVar;
        this.f39800c = str;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f39798a) {
            case 0:
                return C2994a.c(this.f39799b, this.f39800c, (String) obj);
            case 1:
                return C2994a.a(this.f39799b, this.f39800c, (String) obj);
            default:
                return C2994a.b(this.f39799b, this.f39800c, (String) obj);
        }
    }
}
