package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.webview;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.webview.b;
import kotlin.jvm.functions.Function0;
import w70.m1;

/* loaded from: classes4.dex */
public final /* synthetic */ class l implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f42028a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ m1 f42029b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function0 f42030c;

    public /* synthetic */ l(m1 m1Var, Function0 function0, int i5) {
        this.f42028a = i5;
        this.f42029b = m1Var;
        this.f42030c = function0;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f42028a) {
            case 0:
                return b.b(this.f42029b, this.f42030c);
            case 1:
                return b.e(this.f42029b, this.f42030c);
            case 2:
                return b.d(this.f42029b, this.f42030c);
            default:
                return b.a.a(this.f42029b, this.f42030c);
        }
    }
}
