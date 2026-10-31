package com.vungle.ads.internal.ui;

import android.content.Intent;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class c extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f47560a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f47561b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Intent f47562c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(int i5, int i11, Intent intent) {
        super(0);
        this.f47560a = i5;
        this.f47561b = i11;
        this.f47562c = intent;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("onActivityResult: ");
        sbA.append(this.f47560a);
        sbA.append(", ");
        sbA.append(this.f47561b);
        sbA.append(", ");
        sbA.append(this.f47562c);
        return sbA.toString();
    }
}
