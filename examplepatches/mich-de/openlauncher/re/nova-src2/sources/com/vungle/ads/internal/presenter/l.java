package com.vungle.ads.internal.presenter;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class l extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f47384a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f47385b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(String str, String str2) {
        super(0);
        this.f47384a = str;
        this.f47385b = str2;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Blocked sub-frame MRAID command: ");
        sbA.append(this.f47384a);
        sbA.append(' ');
        sbA.append(this.f47385b);
        return sbA.toString();
    }
}
