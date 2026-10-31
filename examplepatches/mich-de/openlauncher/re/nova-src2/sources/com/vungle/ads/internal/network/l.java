package com.vungle.ads.internal.network;

import java.io.IOException;
import kotlin.jvm.internal.Intrinsics;
import x80.m0;

/* loaded from: classes4.dex */
public final class l implements x80.j {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ m f47257a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ a f47258b;

    public l(m mVar, a aVar) {
        this.f47257a = mVar;
        this.f47258b = aVar;
    }

    @Override // x80.j
    public final void onFailure(x80.i call, IOException e3) throws Throwable {
        Intrinsics.g(call, "call");
        Intrinsics.g(e3, "e");
        try {
            this.f47258b.a(e3);
        } catch (Throwable th2) {
            h.a(th2);
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.a("OkHttpCall", "Cannot pass failure to callback", th2);
        }
    }

    @Override // x80.j
    public final void onResponse(x80.i call, m0 response) throws Throwable {
        Intrinsics.g(call, "call");
        Intrinsics.g(response, "response");
        try {
            try {
                this.f47258b.a(this.f47257a.a(response));
            } catch (Throwable th2) {
                h.a(th2);
                boolean z11 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.a("OkHttpCall", "Cannot pass response to callback", th2);
            }
        } catch (Throwable th3) {
            boolean z12 = com.vungle.ads.internal.util.u.f47714a;
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("[enqueue] Failed to parse response: ");
            sbA.append(th3.getLocalizedMessage());
            com.vungle.ads.internal.util.t.b("OkHttpCall", sbA.toString());
            h.a(th3);
            try {
                this.f47258b.a(th3);
            } catch (Throwable th4) {
                h.a(th4);
                boolean z13 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.a("OkHttpCall", "Cannot pass failure to callback", th4);
            }
        }
    }
}
