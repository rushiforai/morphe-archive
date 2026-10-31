package com.google.android.gms.internal.play_billing;

import java.util.AbstractMap;
import java.util.Objects;

/* loaded from: classes3.dex */
public final class p0 extends k0 {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ q0 f33475c;

    public p0(q0 q0Var) {
        this.f33475c = q0Var;
    }

    @Override // com.google.android.gms.internal.play_billing.h0
    public final boolean f() {
        return true;
    }

    @Override // java.util.List
    public final /* bridge */ /* synthetic */ Object get(int i5) {
        q0 q0Var = this.f33475c;
        t2.c.U(i5, q0Var.f33493e);
        Object[] objArr = q0Var.f33492d;
        int i11 = i5 + i5;
        Object obj = objArr[i11];
        Objects.requireNonNull(obj);
        Object obj2 = objArr[i11 + 1];
        Objects.requireNonNull(obj2);
        return new AbstractMap.SimpleImmutableEntry(obj, obj2);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f33475c.f33493e;
    }
}
