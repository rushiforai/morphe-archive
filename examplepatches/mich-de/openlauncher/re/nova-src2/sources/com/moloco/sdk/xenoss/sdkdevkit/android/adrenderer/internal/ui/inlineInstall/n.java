package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.inlineInstall;

import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class n implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f39885a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ h f39886b;

    public /* synthetic */ n(h hVar, int i5) {
        this.f39885a = i5;
        this.f39886b = hVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f39885a) {
            case 0:
                return h.a(this.f39886b, (j) obj);
            default:
                return h.b(this.f39886b, (j) obj);
        }
    }
}
