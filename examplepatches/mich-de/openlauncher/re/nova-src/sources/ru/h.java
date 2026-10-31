package ru;

import b.c0;

/* loaded from: classes4.dex */
public final class h extends j {

    /* renamed from: a, reason: collision with root package name */
    public final int f86362a;

    /* renamed from: b, reason: collision with root package name */
    public final String f86363b;

    public h(int i5) {
        this.f86362a = i5;
        this.f86363b = String.valueOf(i5);
    }

    @Override // ru.j
    public final String a() {
        return c0.k("googlePay_", this.f86363b);
    }

    @Override // ru.j
    public final String b() {
        return this.f86363b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof h) && this.f86362a == ((h) obj).f86362a;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f86362a);
    }

    @Override // java.lang.Throwable
    public final String toString() {
        return c0.i(this.f86362a, "GooglePay(errorCodeInt=", ")");
    }
}
