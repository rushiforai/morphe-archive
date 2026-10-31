package aq;

import java.util.AbstractSet;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes4.dex */
public final class a0 extends AbstractSet {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15409a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ d0 f15410b;

    public /* synthetic */ a0(d0 d0Var, int i5) {
        this.f15409a = i5;
        this.f15410b = d0Var;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final void clear() {
        switch (this.f15409a) {
            case 0:
                this.f15410b.clear();
                break;
            default:
                this.f15410b.clear();
                break;
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        c0 c0VarA;
        Object obj2;
        Object value;
        switch (this.f15409a) {
            case 0:
                if (!(obj instanceof Map.Entry)) {
                    return false;
                }
                d0 d0Var = this.f15410b;
                Map.Entry entry = (Map.Entry) obj;
                Object key = entry.getKey();
                c0 c0Var = null;
                if (key != null) {
                    try {
                        c0VarA = d0Var.a(key, false);
                    } catch (ClassCastException unused) {
                    }
                } else {
                    c0VarA = null;
                }
                if (c0VarA != null && ((obj2 = c0VarA.f15430h) == (value = entry.getValue()) || (obj2 != null && obj2.equals(value)))) {
                    c0Var = c0VarA;
                }
                return c0Var != null;
            default:
                return this.f15410b.containsKey(obj);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        switch (this.f15409a) {
            case 0:
                return new z(this.f15410b, 0);
            default:
                return new z(this.f15410b, 1);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean remove(Object obj) {
        c0 c0VarA;
        Object obj2;
        Object value;
        switch (this.f15409a) {
            case 0:
                if (obj instanceof Map.Entry) {
                    Map.Entry entry = (Map.Entry) obj;
                    Object key = entry.getKey();
                    d0 d0Var = this.f15410b;
                    c0 c0Var = null;
                    if (key != null) {
                        try {
                            c0VarA = d0Var.a(key, false);
                        } catch (ClassCastException unused) {
                        }
                    } else {
                        c0VarA = null;
                    }
                    if (c0VarA != null && ((obj2 = c0VarA.f15430h) == (value = entry.getValue()) || (obj2 != null && obj2.equals(value)))) {
                        c0Var = c0VarA;
                    }
                    if (c0Var != null) {
                        d0Var.c(c0Var, true);
                        break;
                    }
                }
                break;
            default:
                d0 d0Var2 = this.f15410b;
                c0 c0VarA2 = null;
                if (obj != null) {
                    try {
                        c0VarA2 = d0Var2.a(obj, false);
                    } catch (ClassCastException unused2) {
                    }
                }
                if (c0VarA2 != null) {
                    d0Var2.c(c0VarA2, true);
                }
                if (c0VarA2 != null) {
                    break;
                }
                break;
        }
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        switch (this.f15409a) {
        }
        return this.f15410b.f15443d;
    }
}
