package com.fyber.inneractive.sdk.bidder.adm;

import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.flow.c0;
import org.json.JSONException;

/* loaded from: classes3.dex */
public final class x implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ c0 f27615a;

    public x(c0 c0Var) {
        this.f27615a = c0Var;
    }

    @Override // java.lang.Runnable
    public final void run() throws JSONException {
        c0 c0Var = this.f27615a;
        if (c0Var != null) {
            c0Var.a(new Exception("adm payload must contain ad url"), InneractiveErrorCode.INVALID_INPUT, new com.fyber.inneractive.sdk.response.e[0]);
        }
    }
}
