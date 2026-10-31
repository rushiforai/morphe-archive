package com.fyber.inneractive.sdk.config.global;

/* loaded from: classes.dex */
public final class f implements d {

    /* renamed from: a, reason: collision with root package name */
    public final String f27814a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f27815b;

    public f(boolean z11, String str) {
        this.f27814a = str;
        this.f27815b = z11;
    }

    @Override // com.fyber.inneractive.sdk.config.global.d
    public final boolean a(e eVar) {
        String str = this.f27814a;
        if (str != null) {
            return str.equalsIgnoreCase("android") ? !this.f27815b : this.f27815b;
        }
        return false;
    }

    public final String toString() {
        return "os - " + this.f27814a + " include: " + this.f27815b;
    }
}
