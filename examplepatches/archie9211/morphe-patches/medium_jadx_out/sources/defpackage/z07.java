package defpackage;

import j$.util.Objects;
import java.util.AbstractSet;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z07 extends AbstractSet {
    public final /* synthetic */ int a;
    public final /* synthetic */ b17 b;

    public /* synthetic */ z07(b17 b17Var, int i) {
        this.a = i;
        this.b = b17Var;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final void clear() {
        int i = this.a;
        b17 b17Var = this.b;
        switch (i) {
            case 0:
                b17Var.clear();
                break;
            default:
                b17Var.clear();
                break;
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        a17 a17VarA;
        int i = this.a;
        b17 b17Var = this.b;
        switch (i) {
            case 0:
                if (!(obj instanceof Map.Entry)) {
                    return false;
                }
                Map.Entry entry = (Map.Entry) obj;
                Object key = entry.getKey();
                a17 a17Var = null;
                if (key != null) {
                    try {
                        a17VarA = b17Var.a(key, false);
                    } catch (ClassCastException unused) {
                        a17VarA = null;
                    }
                    break;
                } else {
                    a17VarA = null;
                }
                if (a17VarA != null && Objects.equals(a17VarA.h, entry.getValue())) {
                    a17Var = a17VarA;
                }
                return a17Var != null;
            default:
                return b17Var.containsKey(obj);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        int i = this.a;
        b17 b17Var = this.b;
        switch (i) {
            case 0:
                return new y07(b17Var, 0);
            default:
                return new y07(b17Var, 1);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean remove(Object obj) {
        a17 a17VarA;
        int i = this.a;
        a17 a17VarA2 = null;
        b17 b17Var = this.b;
        switch (i) {
            case 0:
                if (obj instanceof Map.Entry) {
                    Map.Entry entry = (Map.Entry) obj;
                    Object key = entry.getKey();
                    if (key != null) {
                        try {
                            a17VarA = b17Var.a(key, false);
                        } catch (ClassCastException unused) {
                            a17VarA = null;
                        }
                    } else {
                        a17VarA = null;
                    }
                    if (a17VarA != null && Objects.equals(a17VarA.h, entry.getValue())) {
                        a17VarA2 = a17VarA;
                    }
                    if (a17VarA2 != null) {
                        b17Var.c(a17VarA2, true);
                        break;
                    }
                    break;
                }
                break;
            default:
                if (obj != null) {
                    try {
                        a17VarA2 = b17Var.a(obj, false);
                        break;
                    } catch (ClassCastException unused2) {
                    }
                }
                if (a17VarA2 != null) {
                    b17Var.c(a17VarA2, true);
                }
                if (a17VarA2 != null) {
                }
                break;
        }
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        int i = this.a;
        b17 b17Var = this.b;
        switch (i) {
        }
        return b17Var.d;
    }
}
