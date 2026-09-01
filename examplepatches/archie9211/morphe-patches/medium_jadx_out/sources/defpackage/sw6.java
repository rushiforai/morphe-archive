package defpackage;

import j$.util.DesugarCollections;
import java.io.UnsupportedEncodingException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.RandomAccess;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class sw6 extends AbstractList implements RandomAccess, vw6 {
    public static final k1e b = new k1e(new sw6());
    public final ArrayList a;

    public sw6(vw6 vw6Var) {
        this.a = new ArrayList(vw6Var.size());
        addAll(vw6Var);
    }

    @Override // defpackage.vw6
    public final List a() {
        return DesugarCollections.unmodifiableList(this.a);
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i, Object obj) {
        this.a.add(i, (String) obj);
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final boolean addAll(int i, Collection collection) {
        if (collection instanceof vw6) {
            collection = ((vw6) collection).a();
        }
        boolean zAddAll = this.a.addAll(i, collection);
        ((AbstractList) this).modCount++;
        return zAddAll;
    }

    @Override // defpackage.vw6
    public final k1e b() {
        return new k1e(this);
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final void clear() {
        this.a.clear();
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i) {
        ArrayList arrayList = this.a;
        Object obj = arrayList.get(i);
        if (obj instanceof String) {
            return (String) obj;
        }
        if (obj instanceof g21) {
            g21 g21Var = (g21) obj;
            String strX = g21Var.x();
            if (g21Var.r()) {
                arrayList.set(i, strX);
            }
            return strX;
        }
        byte[] bArr = (byte[]) obj;
        byte[] bArr2 = w56.a;
        try {
            String str = new String(bArr, "UTF-8");
            if (iq7.P(bArr, 0, bArr.length) == 0) {
                arrayList.set(i, str);
            }
            return str;
        } catch (UnsupportedEncodingException e) {
            lg8.p("UTF-8 not supported?", e);
            return null;
        }
    }

    @Override // defpackage.vw6
    public final g21 k(int i) {
        g21 c57Var;
        ArrayList arrayList = this.a;
        Object obj = arrayList.get(i);
        if (obj instanceof g21) {
            c57Var = (g21) obj;
        } else if (obj instanceof String) {
            try {
                c57Var = new c57(((String) obj).getBytes("UTF-8"));
            } catch (UnsupportedEncodingException e) {
                lg8.p("UTF-8 not supported?", e);
                return null;
            }
        } else {
            byte[] bArr = (byte[]) obj;
            int length = bArr.length;
            byte[] bArr2 = new byte[length];
            System.arraycopy(bArr, 0, bArr2, 0, length);
            c57Var = new c57(bArr2);
        }
        if (c57Var != obj) {
            arrayList.set(i, c57Var);
        }
        return c57Var;
    }

    @Override // defpackage.vw6
    public final void l(c57 c57Var) {
        this.a.add(c57Var);
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object remove(int i) {
        Object objRemove = this.a.remove(i);
        ((AbstractList) this).modCount++;
        if (objRemove instanceof String) {
            return (String) objRemove;
        }
        if (objRemove instanceof g21) {
            return ((g21) objRemove).x();
        }
        byte[] bArr = (byte[]) objRemove;
        byte[] bArr2 = w56.a;
        try {
            return new String(bArr, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            lg8.p("UTF-8 not supported?", e);
            return null;
        }
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i, Object obj) {
        Object obj2 = this.a.set(i, (String) obj);
        if (obj2 instanceof String) {
            return (String) obj2;
        }
        if (obj2 instanceof g21) {
            return ((g21) obj2).x();
        }
        byte[] bArr = (byte[]) obj2;
        byte[] bArr2 = w56.a;
        try {
            return new String(bArr, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            lg8.p("UTF-8 not supported?", e);
            return null;
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.a.size();
    }

    public sw6() {
        this.a = new ArrayList();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        return addAll(this.a.size(), collection);
    }
}
