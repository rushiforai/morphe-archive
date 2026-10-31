package com.google.android.gms.internal.measurement;

import android.net.Uri;

/* loaded from: classes3.dex */
public final class of {

    /* renamed from: a, reason: collision with root package name */
    public final Uri f32934a;

    /* renamed from: b, reason: collision with root package name */
    public final bd f32935b;

    /* renamed from: c, reason: collision with root package name */
    public final vk.o f32936c;

    /* renamed from: d, reason: collision with root package name */
    public final xk.v0 f32937d;

    public of(Uri uri, bd bdVar, vk.o oVar, xk.v0 v0Var) {
        this.f32934a = uri;
        this.f32935b = bdVar;
        this.f32936c = oVar;
        this.f32937d = v0Var;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof of)) {
            return false;
        }
        of ofVar = (of) obj;
        if (!this.f32934a.equals(ofVar.f32934a) || !this.f32935b.equals(ofVar.f32935b) || !this.f32936c.equals(ofVar.f32936c) || !this.f32937d.equals(ofVar.f32937d)) {
            return false;
        }
        Object obj2 = k1.f32722c;
        return obj2.equals(obj2);
    }

    public final int hashCode() {
        return ((((((((((((this.f32934a.hashCode() ^ 1000003) * 1000003) ^ this.f32935b.hashCode()) * 1000003) ^ this.f32936c.hashCode()) * 1000003) ^ this.f32937d.hashCode()) * 1000003) ^ k1.f32722c.hashCode()) * 1000003) ^ 1231) * 1000003) ^ 1237;
    }

    public final String toString() {
        String string = this.f32934a.toString();
        int length = string.length();
        String string2 = this.f32935b.toString();
        int length2 = string2.length();
        k1 k1Var = k1.f32722c;
        String strValueOf = String.valueOf(this.f32936c);
        String strValueOf2 = String.valueOf(this.f32937d);
        String string3 = k1Var.toString();
        int length3 = strValueOf.length();
        int length4 = strValueOf2.length();
        StringBuilder sb2 = new StringBuilder(length + 34 + length2 + 10 + length3 + 13 + length4 + 16 + string3.length() + 32 + String.valueOf(true).length() + 22);
        b.c0.D(sb2, "ProtoDataStoreConfig{uri=", string, ", schema=", string2);
        b.c0.D(sb2, ", handler=", strValueOf, ", migrations=", strValueOf2);
        return b.c0.r(sb2, ", variantConfig=", string3, ", useGeneratedExtensionRegistry=true, enableTracing=false}");
    }
}
