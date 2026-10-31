package ai;

import android.os.Bundle;
import com.google.android.gms.measurement.internal.zzbf;
import com.google.android.gms.measurement.internal.zzbh;

/* loaded from: classes3.dex */
public final class p0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f13216a;

    /* renamed from: b, reason: collision with root package name */
    public final String f13217b;

    /* renamed from: c, reason: collision with root package name */
    public final long f13218c;

    /* renamed from: d, reason: collision with root package name */
    public final long f13219d;

    /* renamed from: e, reason: collision with root package name */
    public final Bundle f13220e;

    public p0(long j11, long j12, Bundle bundle, String str, String str2) {
        this.f13216a = str;
        this.f13217b = str2;
        this.f13220e = bundle;
        this.f13218c = j11;
        this.f13219d = j12;
    }

    public static p0 a(zzbh zzbhVar) {
        String str = zzbhVar.f33768f;
        String str2 = zzbhVar.f33770h;
        return new p0(zzbhVar.f33771i, zzbhVar.f33772j, zzbhVar.f33769g.p(), str, str2);
    }

    public final zzbh b() {
        zzbf zzbfVar = new zzbf(new Bundle(this.f13220e));
        return new zzbh(this.f13216a, zzbfVar, this.f13217b, this.f13218c, this.f13219d);
    }

    public final String toString() {
        String string = this.f13220e.toString();
        String str = this.f13217b;
        int length = String.valueOf(str).length();
        String str2 = this.f13216a;
        StringBuilder sb2 = new StringBuilder(length + 13 + String.valueOf(str2).length() + 8 + string.length());
        b.c0.D(sb2, "origin=", str, ",name=", str2);
        return b.c0.q(sb2, ",params=", string);
    }
}
