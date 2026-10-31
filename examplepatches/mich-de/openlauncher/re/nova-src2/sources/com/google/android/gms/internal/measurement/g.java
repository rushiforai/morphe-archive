package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final d0 f32547a = d0.f32447c;

    /* renamed from: b, reason: collision with root package name */
    public final String f32548b;

    public g(String str) {
        this.f32548b = str;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return this.f32547a.equals(gVar.f32547a) && this.f32548b.equals(gVar.f32548b);
    }

    public final int hashCode() {
        return this.f32547a.hashCode() ^ this.f32548b.hashCode();
    }
}
