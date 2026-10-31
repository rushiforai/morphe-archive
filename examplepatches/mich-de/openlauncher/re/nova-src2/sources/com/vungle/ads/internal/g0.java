package com.vungle.ads.internal;

import com.vungle.ads.BaseAdListener;
import com.vungle.ads.VungleError;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class g0 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ i0 f46839a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ VungleError f46840b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g0(i0 i0Var, VungleError vungleError) {
        super(0);
        this.f46839a = i0Var;
        this.f46840b = vungleError;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        BaseAdListener adListener = this.f46839a.getAdListener();
        if (adListener != null) {
            adListener.onAdFailedToPlay(this.f46839a, this.f46840b);
        }
        return Unit.f71706a;
    }
}
