package hs;

import com.stripe.android.link.LinkConfiguration;
import fs.h0;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final js.a f60041a;

    /* renamed from: b, reason: collision with root package name */
    public final xw.c f60042b;

    /* renamed from: c, reason: collision with root package name */
    public final h0 f60043c;

    /* renamed from: d, reason: collision with root package name */
    public final LinkConfiguration f60044d;

    /* renamed from: e, reason: collision with root package name */
    public final iu.f f60045e;

    /* renamed from: f, reason: collision with root package name */
    public final CoroutineContext f60046f;

    public b(js.a linkGate, xw.c integrityRequestManager, h0 linkAccountManager, LinkConfiguration linkConfiguration, iu.f errorReporter, CoroutineContext workContext) {
        Intrinsics.g(linkGate, "linkGate");
        Intrinsics.g(integrityRequestManager, "integrityRequestManager");
        Intrinsics.g(linkAccountManager, "linkAccountManager");
        Intrinsics.g(linkConfiguration, "linkConfiguration");
        Intrinsics.g(errorReporter, "errorReporter");
        Intrinsics.g(workContext, "workContext");
        this.f60041a = linkGate;
        this.f60042b = integrityRequestManager;
        this.f60043c = linkAccountManager;
        this.f60044d = linkConfiguration;
        this.f60045e = errorReporter;
        this.f60046f = workContext;
    }
}
