package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class l89 implements Iterator, th6 {
    public final atd[] a;
    public int b;
    public boolean c = true;

    public l89(zsd zsdVar, atd[] atdVarArr) {
        this.a = atdVarArr;
        atdVarArr[0].a(Integer.bitCount(zsdVar.a) * 2, 0, zsdVar.d);
        this.b = 0;
        a();
    }

    public final void a() {
        int i = this.b;
        atd[] atdVarArr = this.a;
        atd atdVar = atdVarArr[i];
        if (atdVar.c < atdVar.b) {
            return;
        }
        while (-1 < i) {
            int iB = b(i);
            if (iB == -1) {
                atd atdVar2 = atdVarArr[i];
                int i2 = atdVar2.c;
                Object[] objArr = atdVar2.a;
                if (i2 < objArr.length) {
                    int length = objArr.length;
                    atdVar2.c = i2 + 1;
                    iB = b(i);
                }
            }
            if (iB != -1) {
                this.b = iB;
                return;
            }
            if (i > 0) {
                atd atdVar3 = atdVarArr[i - 1];
                int i3 = atdVar3.c;
                int length2 = atdVar3.a.length;
                atdVar3.c = i3 + 1;
            }
            atdVarArr[i].a(0, 0, zsd.e.d);
            i--;
        }
        this.c = false;
    }

    public final int b(int i) {
        atd[] atdVarArr = this.a;
        atd atdVar = atdVarArr[i];
        int i2 = atdVar.c;
        if (i2 < atdVar.b) {
            return i;
        }
        Object[] objArr = atdVar.a;
        if (i2 >= objArr.length) {
            return -1;
        }
        int length = objArr.length;
        Object obj = objArr[i2];
        obj.getClass();
        zsd zsdVar = (zsd) obj;
        if (i == 6) {
            atd atdVar2 = atdVarArr[i + 1];
            Object[] objArr2 = zsdVar.d;
            atdVar2.a(objArr2.length, 0, objArr2);
        } else {
            atdVarArr[i + 1].a(Integer.bitCount(zsdVar.a) * 2, 0, zsdVar.d);
        }
        return b(i + 1);
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.c;
    }

    @Override // java.util.Iterator
    public Object next() {
        if (!this.c) {
            ywb.n();
            return null;
        }
        Object next = this.a[this.b].next();
        a();
        return next;
    }

    @Override // java.util.Iterator
    public void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
