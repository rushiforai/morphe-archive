package com.vungle.ads.internal.ui;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class y extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f47650a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y(String str) {
        super(0);
        this.f47650a = str;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Requested range exceeds cached file: ");
        sbA.append(this.f47650a);
        return sbA.toString();
    }
}
