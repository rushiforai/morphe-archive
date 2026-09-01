package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b99 extends l1 {
    public final x89 d;
    public int e;
    public ysd f;
    public int g;

    public b99(x89 x89Var, int i) {
        super(i, x89Var.h, 1);
        this.d = x89Var;
        this.e = x89Var.m();
        this.g = -1;
        b();
    }

    public final void a() {
        if (this.e == this.d.m()) {
            return;
        }
        z10.g();
    }

    @Override // defpackage.l1, java.util.ListIterator
    public final void add(Object obj) {
        a();
        int i = this.b;
        x89 x89Var = this.d;
        x89Var.add(i, obj);
        this.b++;
        this.c = x89Var.getSize();
        this.e = x89Var.m();
        this.g = -1;
        b();
    }

    /* JADX WARN: Type inference failed for: r0v4 */
    /* JADX WARN: Type inference failed for: r0v5, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r0v6 */
    public final void b() {
        x89 x89Var = this.d;
        Object[] objArr = x89Var.f;
        if (objArr == null) {
            this.f = null;
            return;
        }
        int i = (x89Var.h - 1) & (-32);
        int i2 = this.b;
        if (i2 > i) {
            i2 = i;
        }
        int i3 = (x89Var.d / 5) + 1;
        ysd ysdVar = this.f;
        if (ysdVar == null) {
            this.f = new ysd(objArr, i2, i, i3);
            return;
        }
        ysdVar.b = i2;
        ysdVar.c = i;
        ysdVar.d = i3;
        Object[] objArr2 = ysdVar.e;
        if (objArr2.length < i3) {
            objArr2 = new Object[i3];
            ysdVar.e = objArr2;
        }
        objArr2[0] = objArr;
        ?? r0 = i2 == i ? 1 : 0;
        ysdVar.f = r0;
        ysdVar.b(i2 - r0, 1);
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final Object next() {
        a();
        if (!hasNext()) {
            ywb.n();
            return null;
        }
        int i = this.b;
        this.g = i;
        ysd ysdVar = this.f;
        x89 x89Var = this.d;
        if (ysdVar == null) {
            Object[] objArr = x89Var.g;
            this.b = i + 1;
            return objArr[i];
        }
        if (ysdVar.hasNext()) {
            this.b++;
            return ysdVar.next();
        }
        Object[] objArr2 = x89Var.g;
        int i2 = this.b;
        this.b = i2 + 1;
        return objArr2[i2 - ysdVar.c];
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        a();
        if (!hasPrevious()) {
            ywb.n();
            return null;
        }
        int i = this.b;
        this.g = i - 1;
        ysd ysdVar = this.f;
        x89 x89Var = this.d;
        if (ysdVar == null) {
            Object[] objArr = x89Var.g;
            int i2 = i - 1;
            this.b = i2;
            return objArr[i2];
        }
        int i3 = ysdVar.c;
        if (i <= i3) {
            this.b = i - 1;
            return ysdVar.previous();
        }
        Object[] objArr2 = x89Var.g;
        int i4 = i - 1;
        this.b = i4;
        return objArr2[i4 - i3];
    }

    @Override // defpackage.l1, java.util.ListIterator, java.util.Iterator
    public final void remove() {
        a();
        int i = this.g;
        if (i == -1) {
            lg8.d();
            return;
        }
        x89 x89Var = this.d;
        x89Var.removeAt(i);
        int i2 = this.g;
        if (i2 < this.b) {
            this.b = i2;
        }
        this.c = x89Var.getSize();
        this.e = x89Var.m();
        this.g = -1;
        b();
    }

    @Override // defpackage.l1, java.util.ListIterator
    public final void set(Object obj) {
        a();
        int i = this.g;
        if (i == -1) {
            lg8.d();
            return;
        }
        x89 x89Var = this.d;
        x89Var.set(i, obj);
        this.e = x89Var.m();
        b();
    }
}
