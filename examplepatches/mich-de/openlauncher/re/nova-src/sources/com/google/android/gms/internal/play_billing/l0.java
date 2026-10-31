package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class l0 {

    /* renamed from: a, reason: collision with root package name */
    public final Object f33441a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f33442b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f33443c;

    public l0(Object obj, Object obj2, Object obj3) {
        this.f33441a = obj;
        this.f33442b = obj2;
        this.f33443c = obj3;
    }

    public final IllegalArgumentException a() {
        Object obj = this.f33441a;
        String strValueOf = String.valueOf(obj);
        String strValueOf2 = String.valueOf(this.f33442b);
        return new IllegalArgumentException(b.c0.r(b.c0.w("Multiple entries with same key: ", strValueOf, "=", strValueOf2, " and "), String.valueOf(obj), "=", String.valueOf(this.f33443c)));
    }
}
