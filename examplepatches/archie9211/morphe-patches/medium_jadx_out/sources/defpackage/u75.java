package defpackage;

import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class u75 implements Iterator, th6 {
    public final /* synthetic */ int a;
    public int b;
    public Object c;
    public final Object d;

    public u75(i78 i78Var) {
        this.a = 2;
        this.d = i78Var;
        this.b = -1;
        this.c = vn7.F(new h78(i78Var, this, null));
    }

    public void a() {
        Object objInvoke;
        int i = this.b;
        hi3 hi3Var = (hi3) this.d;
        if (i == -2) {
            objInvoke = ((m45) hi3Var.b).invoke();
        } else {
            x45 x45Var = (x45) hi3Var.c;
            Object obj = this.c;
            obj.getClass();
            objInvoke = x45Var.invoke(obj);
        }
        this.c = objInvoke;
        this.b = objInvoke == null ? 0 : 1;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        int i = this.a;
        Object obj = this.d;
        switch (i) {
            case 0:
                if (this.b < 0) {
                    a();
                }
                return this.b == 1;
            case 1:
                return ((nzb) this.c).hasNext();
            case 2:
                return ((nzb) this.c).hasNext();
            case 3:
                return this.b < ((Map) obj).size();
            case 4:
                evc evcVar = (evc) obj;
                Iterator it2 = (Iterator) this.c;
                while (this.b < evcVar.b && it2.hasNext()) {
                    it2.next();
                    this.b++;
                }
                return this.b < evcVar.c && it2.hasNext();
            default:
                return ((Iterator) this.c).hasNext();
        }
    }

    @Override // java.util.Iterator
    public final Object next() {
        int i = this.a;
        Object obj = this.d;
        Object obj2 = null;
        switch (i) {
            case 0:
                if (this.b < 0) {
                    a();
                }
                if (this.b == 0) {
                    ywb.n();
                    return null;
                }
                Object obj3 = this.c;
                obj3.getClass();
                this.b = -1;
                return obj3;
            case 1:
                return ((nzb) this.c).next();
            case 2:
                return ((nzb) this.c).next();
            case 3:
                if (hasNext()) {
                    obj2 = this.c;
                    this.b++;
                    Object obj4 = ((Map) obj).get(obj2);
                    if (obj4 == null) {
                        throw new ConcurrentModificationException("Hash code of an element (" + obj2 + ") has changed after it was added to the persistent set.");
                    }
                    this.c = ((c17) obj4).b;
                } else {
                    ywb.n();
                }
                return obj2;
            case 4:
                evc evcVar = (evc) obj;
                Iterator it2 = (Iterator) this.c;
                while (this.b < evcVar.b && it2.hasNext()) {
                    it2.next();
                    this.b++;
                }
                int i2 = this.b;
                if (i2 < evcVar.c) {
                    this.b = i2 + 1;
                    return it2.next();
                }
                ywb.n();
                return null;
            default:
                v08 v08Var = (v08) ((hi3) obj).c;
                int i3 = this.b;
                this.b = i3 + 1;
                if (i3 >= 0) {
                    return v08Var.invoke(Integer.valueOf(i3), ((Iterator) this.c).next());
                }
                d46.i0();
                throw null;
        }
    }

    @Override // java.util.Iterator
    public final void remove() {
        int i = this.a;
        Object obj = this.d;
        switch (i) {
            case 0:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            case 1:
                int i2 = this.b;
                if (i2 != -1) {
                    ((a78) obj).b.h(i2);
                    this.b = -1;
                    return;
                }
                return;
            case 2:
                int i3 = this.b;
                if (i3 != -1) {
                    ((i78) obj).b.m(i3);
                    this.b = -1;
                    return;
                }
                return;
            case 3:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            case 4:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            default:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }

    public u75(hi3 hi3Var) {
        this.a = 5;
        this.d = hi3Var;
        this.c = ((mzb) hi3Var.b).iterator();
    }

    public u75(evc evcVar) {
        this.a = 4;
        this.d = evcVar;
        this.c = evcVar.a.iterator();
    }

    public u75(hi3 hi3Var, byte b) {
        this.a = 0;
        this.d = hi3Var;
        this.b = -2;
    }

    public u75(Object obj, Map map) {
        this.a = 3;
        this.c = obj;
        this.d = map;
    }

    public u75(a78 a78Var) {
        this.a = 1;
        this.d = a78Var;
        this.b = -1;
        this.c = vn7.F(new z68(a78Var, this, null));
    }
}
