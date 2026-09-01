package defpackage;

import java.util.AbstractSet;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class t07 extends AbstractSet {
    public final /* synthetic */ int a;
    public final /* synthetic */ w07 b;

    public /* synthetic */ t07(w07 w07Var, int i) {
        this.a = i;
        this.b = w07Var;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final void clear() {
        int i = this.a;
        w07 w07Var = this.b;
        switch (i) {
            case 0:
                w07Var.clear();
                break;
            default:
                w07Var.clear();
                break;
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        v07 v07VarA;
        Object obj2;
        Object value;
        int i = this.a;
        w07 w07Var = this.b;
        switch (i) {
            case 0:
                if (!(obj instanceof Map.Entry)) {
                    return false;
                }
                Map.Entry entry = (Map.Entry) obj;
                Object key = entry.getKey();
                v07 v07Var = null;
                if (key != null) {
                    try {
                        v07VarA = w07Var.a(key, false);
                    } catch (ClassCastException unused) {
                        v07VarA = null;
                    }
                    break;
                } else {
                    v07VarA = null;
                }
                if (v07VarA != null && ((obj2 = v07VarA.h) == (value = entry.getValue()) || (obj2 != null && obj2.equals(value)))) {
                    v07Var = v07VarA;
                }
                return v07Var != null;
            default:
                return w07Var.containsKey(obj);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        int i = this.a;
        w07 w07Var = this.b;
        switch (i) {
            case 0:
                return new s07(w07Var, 0);
            default:
                return new s07(w07Var, 1);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean remove(Object obj) {
        v07 v07VarA;
        Object obj2;
        Object value;
        int i = this.a;
        v07 v07VarA2 = null;
        w07 w07Var = this.b;
        switch (i) {
            case 0:
                if (obj instanceof Map.Entry) {
                    Map.Entry entry = (Map.Entry) obj;
                    Object key = entry.getKey();
                    if (key != null) {
                        try {
                            v07VarA = w07Var.a(key, false);
                        } catch (ClassCastException unused) {
                            v07VarA = null;
                        }
                    } else {
                        v07VarA = null;
                    }
                    if (v07VarA != null && ((obj2 = v07VarA.h) == (value = entry.getValue()) || (obj2 != null && obj2.equals(value)))) {
                        v07VarA2 = v07VarA;
                    }
                    if (v07VarA2 != null) {
                        w07Var.c(v07VarA2, true);
                        break;
                    }
                    break;
                }
                break;
            default:
                if (obj != null) {
                    try {
                        v07VarA2 = w07Var.a(obj, false);
                        break;
                    } catch (ClassCastException unused2) {
                    }
                }
                if (v07VarA2 != null) {
                    w07Var.c(v07VarA2, true);
                }
                if (v07VarA2 != null) {
                }
                break;
        }
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        int i = this.a;
        w07 w07Var = this.b;
        switch (i) {
        }
        return w07Var.d;
    }
}
