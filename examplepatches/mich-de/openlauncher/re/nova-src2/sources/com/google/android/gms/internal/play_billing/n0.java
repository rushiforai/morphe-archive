package com.google.android.gms.internal.play_billing;

import java.util.Iterator;
import java.util.Set;

/* loaded from: classes3.dex */
public abstract class n0 extends h0 implements Set {

    /* renamed from: b, reason: collision with root package name */
    public transient k0 f33457b;

    @Override // com.google.android.gms.internal.play_billing.h0
    public k0 e() {
        k0 k0Var = this.f33457b;
        if (k0Var != null) {
            return k0Var;
        }
        k0 k0VarH = h();
        this.f33457b = k0VarH;
        return k0VarH;
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean equals(Object obj) {
        if (obj == this || obj == this) {
            return true;
        }
        if (obj instanceof Set) {
            Set set = (Set) obj;
            try {
                if (size() == set.size()) {
                    return containsAll(set);
                }
            } catch (ClassCastException | NullPointerException unused) {
            }
        }
        return false;
    }

    public k0 h() {
        Object[] array = toArray(h0.f33413a);
        i0 i0Var = k0.f33433b;
        return k0.j(array.length, array);
    }

    @Override // java.util.Collection, java.util.Set
    public final int hashCode() {
        Iterator it = iterator();
        int iHashCode = 0;
        while (it.hasNext()) {
            Object next = it.next();
            iHashCode += next != null ? next.hashCode() : 0;
        }
        return iHashCode;
    }
}
