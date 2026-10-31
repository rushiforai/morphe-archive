package com.fyber.inneractive.sdk.network.timeouts.request;

import com.fyber.inneractive.sdk.config.global.features.k;

/* loaded from: classes.dex */
public abstract class a extends com.fyber.inneractive.sdk.network.timeouts.a {

    /* renamed from: h, reason: collision with root package name */
    public int f28799h;

    /* renamed from: i, reason: collision with root package name */
    public int f28800i;

    /* renamed from: j, reason: collision with root package name */
    public int f28801j;

    /* renamed from: k, reason: collision with root package name */
    public int f28802k;

    /* renamed from: l, reason: collision with root package name */
    public final String f28803l;

    public a(String str, k kVar, String str2) {
        this.f28803l = str2;
        d(kVar, str);
    }

    public int a(int i5) {
        return 0;
    }

    public abstract int a(k kVar);

    public abstract int a(k kVar, String str);

    public int b() {
        return 0;
    }

    public abstract int b(k kVar, String str);

    public int c() {
        return 0;
    }

    public abstract int c(k kVar, String str);

    public void d(k kVar, String str) {
        int iB = b(kVar, "read");
        int iB2 = b(kVar, "conn");
        int iA = a(kVar, str);
        this.f28796f = a(kVar);
        this.f28801j = c(kVar, "read");
        int iC = c(kVar, "conn");
        this.f28802k = iC;
        int i5 = (this.f28801j * iA) / 100;
        this.f28799h = i5;
        this.f28800i = (iA * iC) / 100;
        this.f28799h = Math.max(iB, i5);
        this.f28800i = Math.max(iB2, this.f28800i);
    }
}
