package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes.dex */
public final class k7 implements m7 {

    /* renamed from: c, reason: collision with root package name */
    public static final Object f32123c = new Object();

    /* renamed from: a, reason: collision with root package name */
    public volatile l7 f32124a;

    /* renamed from: b, reason: collision with root package name */
    public volatile Object f32125b;

    /* JADX WARN: Multi-variable type inference failed */
    public static k7 a(l7 l7Var) {
        if (l7Var instanceof k7) {
            return (k7) l7Var;
        }
        k7 k7Var = new k7();
        k7Var.f32125b = f32123c;
        k7Var.f32124a = l7Var;
        return k7Var;
    }

    @Override // com.google.android.gms.internal.consent_sdk.m7
    public final Object zzb() {
        Object obj = this.f32125b;
        Object obj2 = f32123c;
        if (obj != obj2) {
            return obj;
        }
        synchronized (this) {
            try {
                Object obj3 = this.f32125b;
                if (obj3 != obj2) {
                    return obj3;
                }
                Object objZzb = this.f32124a.zzb();
                Object obj4 = this.f32125b;
                if (obj4 != obj2 && obj4 != objZzb) {
                    throw new IllegalStateException("Scoped provider was invoked recursively returning different results: " + obj4 + " & " + objZzb + ". This is likely due to a circular dependency.");
                }
                this.f32125b = objZzb;
                this.f32124a = null;
                return objZzb;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
