package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class yh4 implements Iterator, th6 {
    public final /* synthetic */ int a;
    public final Iterator b;
    public int c;
    public Object d;
    public final /* synthetic */ mzb e;

    public yh4(hi3 hi3Var) {
        this.a = 2;
        this.e = hi3Var;
        this.b = ((mzb) hi3Var.b).iterator();
        this.c = -1;
    }

    public void a() {
        Object next;
        zh4 zh4Var = (zh4) this.e;
        do {
            Iterator it2 = this.b;
            if (!it2.hasNext()) {
                this.c = 0;
                return;
            }
            next = it2.next();
        } while (((Boolean) zh4Var.c.invoke(next)).booleanValue() != zh4Var.b);
        this.d = next;
        this.c = 1;
    }

    public void b() {
        Iterator it2 = this.b;
        if (it2.hasNext()) {
            Object next = it2.next();
            if (((Boolean) ((x45) ((hi3) this.e).c).invoke(next)).booleanValue()) {
                this.c = 1;
                this.d = next;
                return;
            }
        }
        this.c = 0;
    }

    public boolean c() {
        Iterator it2;
        Iterator it3 = (Iterator) this.d;
        if (it3 != null && it3.hasNext()) {
            this.c = 1;
            return true;
        }
        do {
            Iterator it4 = this.b;
            if (!it4.hasNext()) {
                this.c = 2;
                this.d = null;
                return false;
            }
            Object next = it4.next();
            ym4 ym4Var = (ym4) this.e;
            it2 = (Iterator) ym4Var.c.invoke(ym4Var.b.invoke(next));
        } while (!it2.hasNext());
        this.d = it2;
        this.c = 1;
        return true;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        switch (this.a) {
            case 0:
                if (this.c == -1) {
                    a();
                }
                return this.c == 1;
            case 1:
                int i = this.c;
                if (i == 1) {
                    return true;
                }
                if (i == 2) {
                    return false;
                }
                return c();
            default:
                if (this.c == -1) {
                    b();
                }
                return this.c == 1;
        }
    }

    @Override // java.util.Iterator
    public final Object next() {
        switch (this.a) {
            case 0:
                if (this.c == -1) {
                    a();
                }
                if (this.c == 0) {
                    ywb.n();
                } else {
                    Object obj = this.d;
                    this.d = null;
                    this.c = -1;
                }
                break;
            case 1:
                int i = this.c;
                if (i == 2) {
                    ywb.n();
                } else if (i == 0 && !c()) {
                    ywb.n();
                } else {
                    this.c = 0;
                    Iterator it2 = (Iterator) this.d;
                    it2.getClass();
                }
                break;
            default:
                if (this.c == -1) {
                    b();
                }
                if (this.c == 0) {
                    ywb.n();
                } else {
                    Object obj2 = this.d;
                    this.d = null;
                    this.c = -1;
                }
                break;
        }
        return null;
    }

    @Override // java.util.Iterator
    public final void remove() {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            case 1:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            default:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }

    public yh4(ym4 ym4Var) {
        this.a = 1;
        this.e = ym4Var;
        this.b = ym4Var.a.iterator();
    }

    public yh4(zh4 zh4Var) {
        this.a = 0;
        this.e = zh4Var;
        this.b = zh4Var.a.iterator();
        this.c = -1;
    }
}
