package com.google.android.play.core.review;

import android.app.PendingIntent;
import android.os.Bundle;
import fi.j;
import ih.g;
import rk.f;

/* loaded from: classes3.dex */
public final class c extends g {

    /* renamed from: b, reason: collision with root package name */
    public final ex.a f34558b;

    /* renamed from: c, reason: collision with root package name */
    public final j f34559c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ qk.b f34560d;

    public c(qk.b bVar, j jVar) {
        ex.a aVar = new ex.a("OnRequestInstallCallback", 5);
        this.f34560d = bVar;
        super(8);
        attachInterface(this, "com.google.android.play.core.inappreview.protocol.IInAppReviewServiceCallback");
        this.f34558b = aVar;
        this.f34559c = jVar;
    }

    public final void G(Bundle bundle) {
        rk.g gVar = this.f34560d.f84097a;
        if (gVar != null) {
            j jVar = this.f34559c;
            synchronized (gVar.f86026f) {
                gVar.f86025e.remove(jVar);
            }
            gVar.a().post(new f(gVar, 0));
        }
        this.f34558b.h("onGetLaunchReviewFlowInfo", new Object[0]);
        this.f34559c.c(new zza((PendingIntent) bundle.get("confirmation_intent"), bundle.getBoolean("is_review_no_op")));
    }
}
