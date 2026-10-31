package com.vungle.ads.internal;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class z extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Sdk.SDKError.Reason f47740a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f47741b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Sdk.SDKError.Builder f47742c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z(Sdk.SDKError.Reason reason, String str, Sdk.SDKError.Builder builder) {
        super(0);
        this.f47740a = reason;
        this.f47741b = str;
        this.f47742c = builder;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Logging error: ");
        sbA.append(this.f47740a);
        sbA.append(" with message: ");
        sbA.append(this.f47741b);
        sbA.append(", mediation: ");
        sbA.append(this.f47742c.getMediationName());
        return sbA.toString();
    }
}
