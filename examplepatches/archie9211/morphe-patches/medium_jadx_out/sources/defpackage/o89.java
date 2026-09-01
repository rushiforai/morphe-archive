package defpackage;

import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o89 extends u1 {
    public final /* synthetic */ int a;
    public final m89 b;

    public /* synthetic */ o89(int i, m89 m89Var) {
        this.a = i;
        this.b = m89Var;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean add(Object obj) {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final void clear() {
        int i = this.a;
        m89 m89Var = this.b;
        switch (i) {
            case 0:
                m89Var.clear();
                break;
            default:
                m89Var.clear();
                break;
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        switch (this.a) {
            case 0:
                if (obj instanceof Map.Entry) {
                    Map.Entry entry = (Map.Entry) obj;
                    Object key = entry.getKey();
                    m89 m89Var = this.b;
                    Object obj2 = m89Var.get(key);
                    if (obj2 != null) {
                        return obj2.equals(entry.getValue());
                    }
                    if (entry.getValue() == null && m89Var.containsKey(entry.getKey())) {
                        return true;
                    }
                }
                return false;
            default:
                return this.b.containsKey(obj);
        }
    }

    @Override // defpackage.u1
    public final int d() {
        int i = this.a;
        m89 m89Var = this.b;
        switch (i) {
        }
        return m89Var.e;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        int i = this.a;
        m89 m89Var = this.b;
        switch (i) {
            case 0:
                return new p89(m89Var);
            default:
                atd[] atdVarArr = new atd[8];
                for (int i2 = 0; i2 < 8; i2++) {
                    atdVarArr[i2] = new btd(1);
                }
                return new q89(m89Var, atdVarArr);
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean remove(Object obj) {
        switch (this.a) {
            case 0:
                if (!(obj instanceof Map.Entry)) {
                    return false;
                }
                Map.Entry entry = (Map.Entry) obj;
                return this.b.remove(entry.getKey(), entry.getValue());
            default:
                m89 m89Var = this.b;
                if (!m89Var.containsKey(obj)) {
                    return false;
                }
                m89Var.remove(obj);
                return true;
        }
    }
}
