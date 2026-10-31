package com.fyber.inneractive.sdk.flow.storepromo.model;

/* loaded from: classes3.dex */
public final class a implements Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final b f28360a;

    /* renamed from: b, reason: collision with root package name */
    public final String f28361b;

    /* renamed from: c, reason: collision with root package name */
    public final int f28362c;

    public a(String str, b bVar) {
        this.f28361b = str;
        this.f28360a = bVar;
        this.f28362c = -1;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return this.f28362c - ((a) obj).f28362c;
    }

    public a(String str, b bVar, int i5) {
        this.f28361b = str;
        this.f28360a = bVar;
        this.f28362c = i5;
    }
}
