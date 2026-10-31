package com.fyber.inneractive.sdk.bidder.adm;

import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.flow.c0;
import org.json.JSONException;

/* loaded from: classes3.dex */
public final class u implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ c0 f27609a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Exception f27610b;

    public u(c0 c0Var, Exception exc) {
        this.f27609a = c0Var;
        this.f27610b = exc;
    }

    @Override // java.lang.Runnable
    public final void run() throws JSONException {
        c0 c0Var = this.f27609a;
        if (c0Var != null) {
            c0Var.a(this.f27610b, InneractiveErrorCode.INVALID_INPUT, new com.fyber.inneractive.sdk.response.e[0]);
        }
    }
}
