package com.vungle.ads.internal;

import android.content.Context;
import com.vungle.ads.internal.model.j3;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class r1 extends y0 implements com.vungle.ads.internal.presenter.z {

    /* renamed from: r, reason: collision with root package name */
    public String f47453r;

    /* renamed from: s, reason: collision with root package name */
    public String f47454s;

    /* renamed from: t, reason: collision with root package name */
    public String f47455t;

    /* renamed from: u, reason: collision with root package name */
    public String f47456u;

    /* renamed from: v, reason: collision with root package name */
    public String f47457v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r1(Context context) {
        super(context);
        Intrinsics.g(context, "context");
    }

    public final void a(String str) {
        this.f47454s = str;
    }

    public final void b(String str) {
        this.f47455t = str;
    }

    public final void c(String str) {
        this.f47456u = str;
    }

    public final void d(String str) {
        this.f47453r = str;
    }

    public final void e(String str) {
        this.f47457v = str;
    }

    @Override // com.vungle.ads.internal.y0
    public final com.vungle.ads.internal.presenter.z m() {
        return this;
    }

    public final String n() {
        return this.f47454s;
    }

    public final String o() {
        return this.f47455t;
    }

    public final String p() {
        return this.f47456u;
    }

    public final String q() {
        return this.f47453r;
    }

    public final String r() {
        return this.f47457v;
    }

    @Override // com.vungle.ads.internal.s
    public final boolean a(j3 placement) {
        Intrinsics.g(placement, "placement");
        return placement.j();
    }
}
