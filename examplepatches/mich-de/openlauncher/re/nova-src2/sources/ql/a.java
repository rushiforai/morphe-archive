package ql;

import java.security.spec.ECParameterSpec;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: c, reason: collision with root package name */
    public static final a f84100c = new a("NIST_P256", kl.f.f71587a);

    /* renamed from: d, reason: collision with root package name */
    public static final a f84101d = new a("NIST_P384", kl.f.f71588b);

    /* renamed from: e, reason: collision with root package name */
    public static final a f84102e = new a("NIST_P521", kl.f.f71589c);

    /* renamed from: a, reason: collision with root package name */
    public final String f84103a;

    /* renamed from: b, reason: collision with root package name */
    public final ECParameterSpec f84104b;

    public a(String str, ECParameterSpec eCParameterSpec) {
        this.f84103a = str;
        this.f84104b = eCParameterSpec;
    }

    public final String toString() {
        return this.f84103a;
    }
}
