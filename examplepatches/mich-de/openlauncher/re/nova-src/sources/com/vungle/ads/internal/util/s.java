package com.vungle.ads.internal.util;

import h6.c1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class s {

    /* renamed from: a, reason: collision with root package name */
    public String f47701a;

    /* renamed from: b, reason: collision with root package name */
    public String f47702b;

    /* renamed from: c, reason: collision with root package name */
    public String f47703c;

    /* renamed from: d, reason: collision with root package name */
    public String f47704d;

    /* renamed from: e, reason: collision with root package name */
    public String f47705e;

    /* renamed from: f, reason: collision with root package name */
    public String f47706f;

    /* renamed from: g, reason: collision with root package name */
    public Boolean f47707g;

    /* renamed from: h, reason: collision with root package name */
    public Boolean f47708h;

    /* renamed from: i, reason: collision with root package name */
    public com.vungle.ads.internal.h f47709i;

    /* renamed from: j, reason: collision with root package name */
    public Boolean f47710j;

    /* renamed from: k, reason: collision with root package name */
    public String f47711k;

    /* renamed from: l, reason: collision with root package name */
    public Long f47712l;

    /* renamed from: m, reason: collision with root package name */
    public String f47713m;

    public final void a(com.vungle.ads.internal.h hVar) {
        this.f47709i = hVar;
    }

    public final void b(String str) {
        this.f47704d = str;
    }

    public final void c(String str) {
        this.f47702b = str;
    }

    public final void d(String str) {
        this.f47703c = str;
    }

    public final void e(String str) {
        this.f47711k = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!s.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        Intrinsics.e(obj, "null cannot be cast to non-null type com.vungle.ads.internal.util.LogEntry");
        s sVar = (s) obj;
        return Intrinsics.b(this.f47701a, sVar.f47701a) && Intrinsics.b(this.f47702b, sVar.f47702b) && Intrinsics.b(this.f47703c, sVar.f47703c) && Intrinsics.b(this.f47704d, sVar.f47704d) && Intrinsics.b(this.f47705e, sVar.f47705e) && Intrinsics.b(this.f47706f, sVar.f47706f) && Intrinsics.b(this.f47707g, sVar.f47707g) && Intrinsics.b(this.f47708h, sVar.f47708h) && this.f47709i == sVar.f47709i && Intrinsics.b(this.f47710j, sVar.f47710j) && Intrinsics.b(this.f47711k, sVar.f47711k) && Intrinsics.b(this.f47712l, sVar.f47712l) && Intrinsics.b(this.f47713m, sVar.f47713m);
    }

    public final void f(String str) {
        this.f47705e = str;
    }

    public final void g(String str) {
        this.f47701a = str;
    }

    public final String h() {
        return this.f47703c;
    }

    public final int hashCode() {
        int iA = (a(this.f47706f) + ((a(this.f47705e) + ((a(this.f47704d) + ((a(this.f47703c) + ((a(this.f47702b) + (a(this.f47701a) * 31)) * 31)) * 31)) * 31)) * 31)) * 31;
        Boolean bool = this.f47707g;
        int iHashCode = (iA + (bool != null ? bool.hashCode() : 0)) * 31;
        Boolean bool2 = this.f47708h;
        int iHashCode2 = (iHashCode + (bool2 != null ? bool2.hashCode() : 0)) * 31;
        com.vungle.ads.internal.h hVar = this.f47709i;
        int iHashCode3 = (iHashCode2 + (hVar != null ? hVar.hashCode() : 0)) * 31;
        Boolean bool3 = this.f47710j;
        int iA2 = (a(this.f47711k) + ((iHashCode3 + (bool3 != null ? bool3.hashCode() : 0)) * 31)) * 31;
        Long l9 = this.f47712l;
        return a(this.f47713m) + ((iA2 + (l9 != null ? l9.hashCode() : 0)) * 31);
    }

    public final String i() {
        return this.f47711k;
    }

    public final String j() {
        return this.f47705e;
    }

    public final Boolean k() {
        return this.f47707g;
    }

    public final String l() {
        return this.f47701a;
    }

    public final String m() {
        return this.f47706f;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("LogEntry(placementRefId=");
        sb2.append(this.f47701a);
        sb2.append(", creativeId=");
        sb2.append(this.f47702b);
        sb2.append(", eventId=");
        sb2.append(this.f47703c);
        sb2.append(", adSource=");
        sb2.append(this.f47704d);
        sb2.append(", mediationName=");
        sb2.append(this.f47705e);
        sb2.append(", vmVersion=");
        sb2.append(this.f47706f);
        sb2.append(", partialDownloadEnabled=");
        sb2.append(this.f47707g);
        sb2.append(", adoEnabled=");
        sb2.append(this.f47708h);
        sb2.append(", adState=");
        sb2.append(this.f47709i);
        sb2.append(" adPoddingEnabled=");
        sb2.append(this.f47710j);
        sb2.append(", experiments=");
        sb2.append(this.f47711k);
        sb2.append(", adLoadType=");
        sb2.append(this.f47712l);
        sb2.append(", adapterAdFormat=");
        return c1.t(sb2, this.f47713m, ')');
    }

    public final void a(Boolean bool) {
        this.f47710j = bool;
    }

    public final void b(Boolean bool) {
        this.f47708h = bool;
    }

    public final String c() {
        return this.f47704d;
    }

    public final com.vungle.ads.internal.h d() {
        return this.f47709i;
    }

    public final String e() {
        return this.f47713m;
    }

    public final Boolean f() {
        return this.f47708h;
    }

    public final String g() {
        return this.f47702b;
    }

    public final void h(String str) {
        this.f47706f = str;
    }

    public final Long a() {
        return this.f47712l;
    }

    public final Boolean b() {
        return this.f47710j;
    }

    public final void c(Boolean bool) {
        this.f47707g = bool;
    }

    public final void a(Long l9) {
        this.f47712l = l9;
    }

    public static int a(String str) {
        if (str != null) {
            return str.hashCode();
        }
        return 0;
    }
}
