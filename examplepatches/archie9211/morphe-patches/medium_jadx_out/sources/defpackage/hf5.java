package defpackage;

import android.os.Handler;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hf5 extends AbstractList {
    public static final AtomicInteger e = new AtomicInteger();
    public Handler a;
    public final ArrayList c;
    public final String b = String.valueOf(Integer.valueOf(e.incrementAndGet()));
    public final ArrayList d = new ArrayList();

    public hf5(ff5... ff5VarArr) {
        List listAsList = Arrays.asList(ff5VarArr);
        listAsList.getClass();
        this.c = new ArrayList(listAsList);
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        ff5 ff5Var = (ff5) obj;
        ff5Var.getClass();
        return this.c.add(ff5Var);
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final void clear() {
        this.c.clear();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final /* bridge */ boolean contains(Object obj) {
        if (obj == null ? true : obj instanceof ff5) {
            return super.contains((ff5) obj);
        }
        return false;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i) {
        return (ff5) this.c.get(i);
    }

    @Override // java.util.AbstractList, java.util.List
    public final /* bridge */ int indexOf(Object obj) {
        if (obj == null ? true : obj instanceof ff5) {
            return super.indexOf((ff5) obj);
        }
        return -1;
    }

    @Override // java.util.AbstractList, java.util.List
    public final /* bridge */ int lastIndexOf(Object obj) {
        if (obj == null ? true : obj instanceof ff5) {
            return super.lastIndexOf((ff5) obj);
        }
        return -1;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final /* bridge */ boolean remove(Object obj) {
        if (obj == null ? true : obj instanceof ff5) {
            return super.remove((ff5) obj);
        }
        return false;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i, Object obj) {
        ff5 ff5Var = (ff5) obj;
        ff5Var.getClass();
        return (ff5) this.c.set(i, ff5Var);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.c.size();
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i, Object obj) {
        ff5 ff5Var = (ff5) obj;
        ff5Var.getClass();
        this.c.add(i, ff5Var);
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object remove(int i) {
        return (ff5) this.c.remove(i);
    }

    public hf5(List list) {
        this.c = new ArrayList(list);
    }
}
