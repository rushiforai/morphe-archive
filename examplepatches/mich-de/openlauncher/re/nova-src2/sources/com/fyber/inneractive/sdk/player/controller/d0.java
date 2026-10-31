package com.fyber.inneractive.sdk.player.controller;

import android.view.View;
import org.json.JSONException;

/* loaded from: classes3.dex */
public final class d0 implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ f0 f28894a;

    public d0(f0 f0Var) {
        this.f28894a = f0Var;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) throws JSONException {
        this.f28894a.f28909b.dismiss();
        v vVar = this.f28894a.f28908a;
        vVar.f28940b.d(vVar.f28939a);
    }
}
