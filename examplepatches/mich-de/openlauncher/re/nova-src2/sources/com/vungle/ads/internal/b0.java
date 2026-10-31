package com.vungle.ads.internal;

import com.vungle.ads.BaseAdListener;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class b0 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ i0 f46737a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b0(i0 i0Var) {
        super(0);
        this.f46737a = i0Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        BaseAdListener adListener = this.f46737a.getAdListener();
        if (adListener != null) {
            adListener.onAdClicked(this.f46737a);
        }
        return Unit.f71706a;
    }
}
