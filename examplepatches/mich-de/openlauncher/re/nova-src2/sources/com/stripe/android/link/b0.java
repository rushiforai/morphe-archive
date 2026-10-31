package com.stripe.android.link;

import com.stripe.android.link.LinkAccountUpdate;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import fs.r0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b0 {

    /* renamed from: a, reason: collision with root package name */
    public final LinkActivityContract f42965a;

    /* renamed from: b, reason: collision with root package name */
    public final r0 f42966b;

    /* renamed from: c, reason: collision with root package name */
    public final gs.c f42967c;

    /* renamed from: d, reason: collision with root package name */
    public j.c f42968d;

    public b0(bu.c linkAnalyticsComponentFactory, String paymentElementCallbackIdentifier, LinkActivityContract linkActivityContract, r0 linkStore) {
        Intrinsics.g(linkAnalyticsComponentFactory, "linkAnalyticsComponentFactory");
        Intrinsics.g(paymentElementCallbackIdentifier, "paymentElementCallbackIdentifier");
        Intrinsics.g(linkActivityContract, "linkActivityContract");
        Intrinsics.g(linkStore, "linkStore");
        this.f42965a = linkActivityContract;
        this.f42966b = linkStore;
        this.f42967c = linkAnalyticsComponentFactory.a().a();
    }

    public final void a(LinkAccountUpdate.Value linkAccountInfo, LinkConfiguration configuration, LinkLaunchMode launchMode, PaymentMethodMetadata paymentMethodMetadata, es.o linkExpressMode) {
        Intrinsics.g(configuration, "configuration");
        Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
        Intrinsics.g(linkAccountInfo, "linkAccountInfo");
        Intrinsics.g(launchMode, "launchMode");
        Intrinsics.g(linkExpressMode, "linkExpressMode");
        e eVar = new e(linkAccountInfo, configuration, launchMode, paymentMethodMetadata, linkExpressMode);
        j.c cVar = this.f42968d;
        if (cVar != null) {
            cVar.a(eVar, null);
        }
        ((gs.a) this.f42967c).f57757a.a(gs.d.f57770h, null);
    }
}
