package com.stripe.android.link;

import android.content.Context;
import android.content.Intent;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u0002¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/link/LinkActivityContract;", "Lk/b;", "Lcom/stripe/android/link/e;", "Lcom/stripe/android/link/LinkActivityResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class LinkActivityContract extends k.b {

    /* renamed from: a, reason: collision with root package name */
    public final NativeLinkActivityContract f42870a;

    /* renamed from: b, reason: collision with root package name */
    public final WebLinkActivityContract f42871b;

    /* renamed from: c, reason: collision with root package name */
    public final br.a f42872c;

    public LinkActivityContract(NativeLinkActivityContract nativeLinkActivityContract, WebLinkActivityContract webLinkActivityContract, br.a linkGateFactory) {
        Intrinsics.g(nativeLinkActivityContract, "nativeLinkActivityContract");
        Intrinsics.g(webLinkActivityContract, "webLinkActivityContract");
        Intrinsics.g(linkGateFactory, "linkGateFactory");
        this.f42870a = nativeLinkActivityContract;
        this.f42871b = webLinkActivityContract;
        this.f42872c = linkGateFactory;
    }

    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        e input = (e) obj;
        Intrinsics.g(input, "input");
        LinkConfiguration configuration = input.f42972a;
        this.f42872c.getClass();
        Intrinsics.g(configuration, "configuration");
        return new js.a(configuration).b() ? this.f42870a.createIntent(context, input) : this.f42871b.createIntent(context, input);
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        return i5 == 73563 ? this.f42870a.parseResult(i5, intent) : this.f42871b.parseResult(i5, intent);
    }
}
