package com.vungle.ads.internal.network;

import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public final String f47263a;

    /* renamed from: b, reason: collision with root package name */
    public g f47264b;

    /* renamed from: c, reason: collision with root package name */
    public Map f47265c;

    /* renamed from: d, reason: collision with root package name */
    public String f47266d;

    /* renamed from: e, reason: collision with root package name */
    public Boolean f47267e;

    /* renamed from: f, reason: collision with root package name */
    public int f47268f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f47269g;

    /* renamed from: h, reason: collision with root package name */
    public int f47270h;

    /* renamed from: i, reason: collision with root package name */
    public String f47271i;

    /* renamed from: j, reason: collision with root package name */
    public com.vungle.ads.internal.util.s f47272j;

    public p(String url) {
        Intrinsics.g(url, "url");
        this.f47263a = url;
        this.f47264b = g.GET;
        this.f47268f = 3;
        this.f47269g = true;
        this.f47270h = 5;
    }

    public final p a(g method) {
        Intrinsics.g(method, "method");
        this.f47264b = method;
        return this;
    }

    public final void b() {
        this.f47264b = g.GET;
    }

    public final void c() {
        this.f47264b = g.POST;
    }

    public final p d() {
        this.f47267e = Boolean.TRUE;
        return this;
    }

    public final p a(Map map) {
        this.f47265c = map;
        return this;
    }

    public final p b(String str) {
        this.f47271i = str;
        return this;
    }

    public final p a(String str) {
        this.f47266d = str;
        return this;
    }

    public final p a(boolean z11) {
        this.f47269g = z11;
        return this;
    }

    public final p a(com.vungle.ads.internal.util.s sVar) {
        this.f47272j = sVar;
        return this;
    }

    public final q a() {
        return new q(this.f47263a, this.f47264b, this.f47265c, this.f47266d, this.f47267e, this.f47268f, this.f47269g, this.f47270h, this.f47271i, this.f47272j);
    }
}
