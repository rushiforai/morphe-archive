package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ab8 implements Iterator, th6 {
    public int a = -1;
    public boolean b;
    public final /* synthetic */ jl1 c;

    public ab8(jl1 jl1Var) {
        this.c = jl1Var;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.a + 1 < ((xkc) this.c.e).e();
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            ywb.n();
            return null;
        }
        this.b = true;
        xkc xkcVar = (xkc) this.c.e;
        int i = this.a + 1;
        this.a = i;
        return (va8) xkcVar.g(i);
    }

    @Override // java.util.Iterator
    public final void remove() {
        if (!this.b) {
            ygf.f("You must call next() before you can remove an element");
            return;
        }
        xkc xkcVar = (xkc) this.c.e;
        ((va8) xkcVar.g(this.a)).c = null;
        int i = this.a;
        Object[] objArr = xkcVar.c;
        Object obj = objArr[i];
        Object obj2 = s42.j;
        if (obj != obj2) {
            objArr[i] = obj2;
            xkcVar.a = true;
        }
        this.a = i - 1;
        this.b = false;
    }
}
