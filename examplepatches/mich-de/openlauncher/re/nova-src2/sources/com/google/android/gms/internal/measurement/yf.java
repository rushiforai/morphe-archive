package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class yf {

    /* renamed from: a, reason: collision with root package name */
    public final bd f33263a;

    /* renamed from: b, reason: collision with root package name */
    public final e1 f33264b;

    public yf(bd bdVar, e1 e1Var) {
        this.f33263a = bdVar;
        if (e1Var == null) {
            throw new NullPointerException("Null extensionRegistryLite");
        }
        this.f33264b = e1Var;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof yf)) {
            return false;
        }
        yf yfVar = (yf) obj;
        return this.f33263a.equals(yfVar.f33263a) && this.f33264b.equals(yfVar.f33264b);
    }

    public final int hashCode() {
        return ((this.f33263a.hashCode() ^ 1000003) * 1000003) ^ this.f33264b.hashCode();
    }

    public final String toString() {
        String string = this.f33263a.toString();
        int length = string.length();
        String string2 = this.f33264b.toString();
        StringBuilder sb2 = new StringBuilder(length + 53 + string2.length() + 1);
        b.c0.D(sb2, "ProtoSerializer{defaultValue=", string, ", extensionRegistryLite=", string2);
        sb2.append("}");
        return sb2.toString();
    }
}
