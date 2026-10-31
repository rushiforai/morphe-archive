package com.stripe.android.link;

import com.stripe.android.link.LinkAccountUpdate;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final LinkConfiguration f42972a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentMethodMetadata f42973b;

    /* renamed from: c, reason: collision with root package name */
    public final es.o f42974c;

    /* renamed from: d, reason: collision with root package name */
    public final LinkAccountUpdate.Value f42975d;

    /* renamed from: e, reason: collision with root package name */
    public final LinkLaunchMode f42976e;

    public e(LinkAccountUpdate.Value linkAccountInfo, LinkConfiguration configuration, LinkLaunchMode launchMode, PaymentMethodMetadata paymentMethodMetadata, es.o linkExpressMode) {
        Intrinsics.g(configuration, "configuration");
        Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
        Intrinsics.g(linkExpressMode, "linkExpressMode");
        Intrinsics.g(linkAccountInfo, "linkAccountInfo");
        Intrinsics.g(launchMode, "launchMode");
        this.f42972a = configuration;
        this.f42973b = paymentMethodMetadata;
        this.f42974c = linkExpressMode;
        this.f42975d = linkAccountInfo;
        this.f42976e = launchMode;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return Intrinsics.b(this.f42972a, eVar.f42972a) && Intrinsics.b(this.f42973b, eVar.f42973b) && this.f42974c == eVar.f42974c && Intrinsics.b(this.f42975d, eVar.f42975d) && Intrinsics.b(this.f42976e, eVar.f42976e);
    }

    public final int hashCode() {
        return this.f42976e.hashCode() + ((this.f42975d.hashCode() + ((this.f42974c.hashCode() + ((this.f42973b.hashCode() + (this.f42972a.hashCode() * 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "Args(configuration=" + this.f42972a + ", paymentMethodMetadata=" + this.f42973b + ", linkExpressMode=" + this.f42974c + ", linkAccountInfo=" + this.f42975d + ", launchMode=" + this.f42976e + ")";
    }
}
