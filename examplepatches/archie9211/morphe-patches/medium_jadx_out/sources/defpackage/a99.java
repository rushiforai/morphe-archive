package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class a99 extends l1 {
    public final w89 d;
    public int e;
    public xsd f;
    public int g;

    public a99(w89 w89Var, int i) {
        super(i, w89Var.f, 0);
        this.d = w89Var;
        this.e = w89Var.m();
        this.g = -1;
        c();
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
        this.d.add(this.b, obj);
        this.b++;
        b();
    }

    public final void b() {
        w89 w89Var = this.d;
        this.c = w89Var.getSize();
        this.e = w89Var.m();
        this.g = -1;
        c();
    }

    /* JADX WARN: Type inference failed for: r0v4 */
    /* JADX WARN: Type inference failed for: r0v5, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r0v6 */
    public final void c() {
        w89 w89Var = this.d;
        Object[] objArr = w89Var.d;
        if (objArr == null) {
            this.f = null;
            return;
        }
        int i = (w89Var.f - 1) & (-32);
        int i2 = this.b;
        if (i2 > i) {
            i2 = i;
        }
        int i3 = (w89Var.a / 5) + 1;
        xsd xsdVar = this.f;
        if (xsdVar == null) {
            this.f = new xsd(objArr, i2, i, i3);
            return;
        }
        xsdVar.b = i2;
        xsdVar.c = i;
        xsdVar.d = i3;
        Object[] objArr2 = xsdVar.e;
        if (objArr2.length < i3) {
            objArr2 = new Object[i3];
            xsdVar.e = objArr2;
        }
        objArr2[0] = objArr;
        ?? r0 = i2 == i ? 1 : 0;
        xsdVar.f = r0;
        xsdVar.b(i2 - r0, 1);
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
        xsd xsdVar = this.f;
        w89 w89Var = this.d;
        if (xsdVar == null) {
            Object[] objArr = w89Var.e;
            this.b = i + 1;
            return objArr[i];
        }
        if (xsdVar.hasNext()) {
            this.b++;
            return xsdVar.next();
        }
        Object[] objArr2 = w89Var.e;
        int i2 = this.b;
        this.b = i2 + 1;
        return objArr2[i2 - xsdVar.c];
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
        xsd xsdVar = this.f;
        w89 w89Var = this.d;
        if (xsdVar == null) {
            Object[] objArr = w89Var.e;
            int i2 = i - 1;
            this.b = i2;
            return objArr[i2];
        }
        int i3 = xsdVar.c;
        if (i <= i3) {
            this.b = i - 1;
            return xsdVar.previous();
        }
        Object[] objArr2 = w89Var.e;
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
        this.d.removeAt(i);
        int i2 = this.g;
        if (i2 < this.b) {
            this.b = i2;
        }
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
        w89 w89Var = this.d;
        w89Var.set(i, obj);
        this.e = w89Var.m();
        c();
    }
}
