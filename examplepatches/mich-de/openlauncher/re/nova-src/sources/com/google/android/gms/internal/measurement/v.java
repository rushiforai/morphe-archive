package com.google.android.gms.internal.measurement;

import java.util.AbstractSet;
import java.util.Arrays;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class v extends AbstractSet {

    /* renamed from: a, reason: collision with root package name */
    public final int f33118a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ w f33119b;

    public v(w wVar, int i5) {
        this.f33119b = wVar;
        this.f33118a = i5;
    }

    public final int c() {
        int i5 = this.f33118a;
        if (i5 == -1) {
            return 0;
        }
        return this.f33119b.f33166b[i5];
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        return Arrays.binarySearch(this.f33119b.f33165a, c(), d(), obj, this.f33118a == -1 ? w.f33164f : x.f33204b) >= 0;
    }

    public final int d() {
        return this.f33119b.f33166b[this.f33118a + 1];
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        return new u(this, 0);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return d() - c();
    }
}
