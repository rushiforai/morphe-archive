package com.google.android.gms.internal.play_billing;

import java.util.Iterator;
import java.util.Map;

/* loaded from: classes3.dex */
public final class q0 extends n0 {

    /* renamed from: c, reason: collision with root package name */
    public final transient t0 f33491c;

    /* renamed from: d, reason: collision with root package name */
    public final transient Object[] f33492d;

    /* renamed from: e, reason: collision with root package name */
    public final transient int f33493e;

    public q0(t0 t0Var, Object[] objArr, int i5) {
        this.f33491c = t0Var;
        this.f33492d = objArr;
        this.f33493e = i5;
    }

    @Override // com.google.android.gms.internal.play_billing.h0
    public final int b(Object[] objArr) {
        return e().b(objArr);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        if (obj instanceof Map.Entry) {
            Map.Entry entry = (Map.Entry) obj;
            Object key = entry.getKey();
            Object value = entry.getValue();
            if (value != null && value.equals(this.f33491c.get(key))) {
                return true;
            }
        }
        return false;
    }

    @Override // com.google.android.gms.internal.play_billing.n0
    public final k0 h() {
        return new p0(this);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final /* synthetic */ Iterator iterator() {
        return e().listIterator(0);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.f33493e;
    }
}
