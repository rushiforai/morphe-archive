package com.moloco.sdk.internal.publisher;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final /* synthetic */ class d0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f37090a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ n f37091b;

    public /* synthetic */ d0(n nVar, int i5) {
        this.f37090a = i5;
        this.f37091b = nVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f37090a) {
            case 0:
                return n.a(this.f37091b, (a.AbstractC0299a.c) obj);
            default:
                return n.a(this.f37091b, ((Long) obj).longValue());
        }
    }
}
