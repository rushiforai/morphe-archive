package com.vungle.ads.internal;

import com.vungle.ads.SdkNotInitialized;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class s2 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ v2 f47475a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s2(v2 v2Var) {
        super(0);
        this.f47475a = v2Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        this.f47475a.a(new SdkNotInitialized("Network permissions not granted").logError$vungle_ads_release());
        return Unit.f71706a;
    }
}
