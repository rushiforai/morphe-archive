package defpackage;

import java.util.Collections;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class r9f implements Iterator {
    public int a;
    public final y9f b;
    public final String c;
    public Iterator d;
    public int e;
    public Iterator f;
    public q9f g;
    public final /* synthetic */ t9f h;

    public r9f(t9f t9fVar, y9f y9fVar, String str, int i) {
        this.h = t9fVar;
        this.a = 0;
        this.d = null;
        this.e = 0;
        this.f = Collections.EMPTY_LIST.iterator();
        this.g = null;
        this.b = y9fVar;
        this.a = 0;
        if (y9fVar.j().c(Integer.MIN_VALUE)) {
            t9fVar.b = y9fVar.a;
        }
        this.c = a(y9fVar, str, i);
    }

    public final String a(y9f y9fVar, String str, int i) {
        String str2;
        String str3;
        if (y9fVar.c == null || y9fVar.j().c(Integer.MIN_VALUE)) {
            return null;
        }
        if (y9fVar.c.j().c(512)) {
            str2 = "[" + String.valueOf(i) + "]";
            str3 = "";
        } else {
            str2 = y9fVar.a;
            str3 = "/";
        }
        return (str == null || str.length() == 0) ? str2 : this.h.a.c(1024) ? !str2.startsWith("?") ? str2 : str2.substring(1) : ev6.x(str, str3, str2);
    }

    public final boolean b(Iterator it2) {
        if (!this.f.hasNext() && it2.hasNext()) {
            y9f y9fVar = (y9f) it2.next();
            int i = this.e + 1;
            this.e = i;
            this.f = new r9f(this.h, y9fVar, this.c, i);
        }
        if (!this.f.hasNext()) {
            return false;
        }
        this.g = (q9f) this.f.next();
        return true;
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        t9f t9fVar = this.h;
        td tdVar = t9fVar.a;
        if (this.g != null) {
            return true;
        }
        int i = this.a;
        y9f y9fVar = this.b;
        if (i == 0) {
            this.a = 1;
            if (y9fVar.c == null || (tdVar.c(512) && y9fVar.n())) {
                return hasNext();
            }
            this.g = new q9f(y9fVar, t9fVar.b, this.c, y9fVar.j().c(Integer.MIN_VALUE) ? null : y9fVar.b);
            return true;
        }
        Iterator itQ = this.d;
        if (i != 1) {
            if (itQ == null) {
                itQ = y9fVar.q();
                this.d = itQ;
            }
            return b(itQ);
        }
        if (itQ == null) {
            itQ = y9fVar.p();
            this.d = itQ;
        }
        boolean zB = b(itQ);
        if (zB || !y9fVar.o() || tdVar.c(4096)) {
            return zB;
        }
        this.a = 2;
        this.d = null;
        return hasNext();
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            ywb.h("There are no more nodes to return");
            return null;
        }
        q9f q9fVar = this.g;
        this.g = null;
        return q9fVar;
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException();
    }

    public r9f(t9f t9fVar) {
        this.h = t9fVar;
        this.a = 0;
        this.d = null;
        this.e = 0;
        this.f = Collections.EMPTY_LIST.iterator();
        this.g = null;
    }
}
