package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class zh implements rh {

    /* renamed from: a, reason: collision with root package name */
    public final rh f33300a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f33301b;

    public zh(rh rhVar, Object obj) {
        this.f33300a = rhVar;
        fb.b(obj, "log site qualifier");
        this.f33301b = obj;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof zh)) {
            return false;
        }
        zh zhVar = (zh) obj;
        return this.f33300a.equals(zhVar.f33300a) && this.f33301b.equals(zhVar.f33301b);
    }

    public final int hashCode() {
        return this.f33300a.hashCode() ^ this.f33301b.hashCode();
    }

    public final String toString() {
        String string = this.f33300a.toString();
        int length = string.length();
        String string2 = this.f33301b.toString();
        StringBuilder sb2 = new StringBuilder(length + 47 + string2.length() + 3);
        b.c0.D(sb2, "SpecializedLogSiteKey{ delegate='", string, "', qualifier='", string2);
        sb2.append("' }");
        return sb2.toString();
    }
}
