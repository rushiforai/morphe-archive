package com.fyber.inneractive.sdk.cache;

/* loaded from: classes.dex */
public final class m implements a {

    /* renamed from: a, reason: collision with root package name */
    public final String f27673a;

    /* renamed from: b, reason: collision with root package name */
    public final String f27674b;

    public m(String str) {
        this.f27673a = str;
        this.f27674b = String.format("template_%d.html", Integer.valueOf(str.hashCode()));
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final Object a(String str) {
        return str;
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final String b() {
        return this.f27674b;
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final String c() {
        return this.f27674b;
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final boolean d() {
        return true;
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final /* bridge */ /* synthetic */ void a(Object obj) {
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final String a() {
        return this.f27673a;
    }
}
