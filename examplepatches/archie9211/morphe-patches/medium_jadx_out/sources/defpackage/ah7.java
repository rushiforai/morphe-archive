package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ah7 extends ch7 implements Iterator, th6 {
    public final /* synthetic */ int e;

    public ah7(dh7 dh7Var, int i) {
        this.e = i;
        this.d = dh7Var;
        this.b = -1;
        this.c = dh7Var.h;
        f();
    }

    @Override // java.util.Iterator
    public final Object next() {
        switch (this.e) {
            case 0:
                b();
                int i = this.a;
                dh7 dh7Var = (dh7) this.d;
                if (i >= dh7Var.f) {
                    ywb.n();
                } else {
                    this.a = i + 1;
                    this.b = i;
                    bh7 bh7Var = new bh7(dh7Var, i);
                    f();
                }
                break;
            case 1:
                b();
                int i2 = this.a;
                dh7 dh7Var2 = (dh7) this.d;
                if (i2 >= dh7Var2.f) {
                    ywb.n();
                } else {
                    this.a = i2 + 1;
                    this.b = i2;
                    Object obj = dh7Var2.a[i2];
                    f();
                }
                break;
            default:
                b();
                int i3 = this.a;
                dh7 dh7Var3 = (dh7) this.d;
                if (i3 >= dh7Var3.f) {
                    ywb.n();
                } else {
                    this.a = i3 + 1;
                    this.b = i3;
                    Object[] objArr = dh7Var3.b;
                    objArr.getClass();
                    Object obj2 = objArr[this.b];
                    f();
                }
                break;
        }
        return null;
    }
}
