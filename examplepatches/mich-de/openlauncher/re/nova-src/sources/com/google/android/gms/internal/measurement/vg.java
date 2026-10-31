package com.google.android.gms.internal.measurement;

import java.util.HashMap;

/* loaded from: classes3.dex */
public final class vg {

    /* renamed from: a, reason: collision with root package name */
    public int f33158a;

    /* renamed from: b, reason: collision with root package name */
    public final int f33159b;

    /* renamed from: c, reason: collision with root package name */
    public vg f33160c;

    /* renamed from: d, reason: collision with root package name */
    public final HashMap f33161d = new HashMap(0);

    public vg(int i5, int i11) {
        if (i5 > i11) {
            throw new IllegalArgumentException();
        }
        this.f33158a = i5;
        this.f33159b = i11;
        this.f33160c = null;
    }

    public final String toString() {
        int iIdentityHashCode = System.identityHashCode(this);
        return b.c0.p(new StringBuilder(String.valueOf(iIdentityHashCode).length() + 4), "Node", iIdentityHashCode);
    }
}
