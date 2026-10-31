package com.fyber.inneractive.sdk.flow;

import android.content.Context;
import com.fyber.inneractive.sdk.util.g1;

/* loaded from: classes3.dex */
public final class y implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Context f28446a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f28447b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ g1 f28448c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ com.fyber.inneractive.sdk.util.g f28449d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ boolean f28450e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ com.fyber.inneractive.sdk.click.o f28451f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ b0 f28452g;

    public y(b0 b0Var, Context context, String str, g1 g1Var, com.fyber.inneractive.sdk.util.g gVar, boolean z11, com.fyber.inneractive.sdk.click.o oVar) {
        this.f28452g = b0Var;
        this.f28446a = context;
        this.f28447b = str;
        this.f28448c = g1Var;
        this.f28449d = gVar;
        this.f28450e = z11;
        this.f28451f = oVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f28452g.a(this.f28446a, this.f28447b, this.f28448c, this.f28449d, this.f28450e, this.f28451f);
    }
}
