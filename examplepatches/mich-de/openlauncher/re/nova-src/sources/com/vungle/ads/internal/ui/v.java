package com.vungle.ads.internal.ui;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class v extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f47591a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v(String str) {
        super(0);
        this.f47591a = str;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("mraid Injecting JS ");
        sbA.append(this.f47591a);
        return sbA.toString();
    }
}
