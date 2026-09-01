package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t70 implements Iterator, th6 {
    public int a;
    public int b;
    public boolean c;
    public final /* synthetic */ int d;
    public final /* synthetic */ Object e;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public t70(y70 y70Var, int i) {
        this(y70Var.c);
        this.d = i;
        switch (i) {
            case 1:
                this.e = y70Var;
                this(y70Var.c);
                break;
            default:
                this.e = y70Var;
                break;
        }
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.b < this.a;
    }

    @Override // java.util.Iterator
    public final Object next() {
        Object objF;
        if (!hasNext()) {
            ywb.n();
            return null;
        }
        int i = this.b;
        int i2 = this.d;
        Object obj = this.e;
        switch (i2) {
            case 0:
                objF = ((y70) obj).f(i);
                break;
            case 1:
                objF = ((y70) obj).i(i);
                break;
            default:
                objF = ((d80) obj).b[i];
                break;
        }
        this.b++;
        this.c = true;
        return objF;
    }

    @Override // java.util.Iterator
    public final void remove() {
        if (!this.c) {
            ygf.f("Call next() before removing an element.");
            return;
        }
        int i = this.b - 1;
        this.b = i;
        int i2 = this.d;
        Object obj = this.e;
        switch (i2) {
            case 0:
                ((y70) obj).g(i);
                break;
            case 1:
                ((y70) obj).g(i);
                break;
            default:
                ((d80) obj).d(i);
                break;
        }
        this.a--;
        this.c = false;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public t70(d80 d80Var) {
        this(d80Var.c);
        this.d = 2;
        this.e = d80Var;
    }

    public t70(int i) {
        this.a = i;
    }
}
