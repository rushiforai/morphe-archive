package com.fyber.inneractive.sdk.activities;

import org.json.JSONException;

/* loaded from: classes3.dex */
public final class i implements com.fyber.inneractive.sdk.click.o {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ InneractiveInternalBrowserActivity f27595a;

    public i(InneractiveInternalBrowserActivity inneractiveInternalBrowserActivity) {
        this.f27595a = inneractiveInternalBrowserActivity;
    }

    @Override // com.fyber.inneractive.sdk.click.o
    public final void a(com.fyber.inneractive.sdk.click.b bVar) throws JSONException {
        if (bVar.f27697a != com.fyber.inneractive.sdk.click.q.FAILED) {
            InneractiveInternalBrowserActivity.a(this.f27595a, bVar);
            this.f27595a.finish();
        }
    }
}
