package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class y89 extends l1 {
    public final Object[] d;
    public final xsd e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y89(int i, int i2, int i3, Object[] objArr, Object[] objArr2) {
        super(i, i2, 0);
        objArr.getClass();
        objArr2.getClass();
        this.d = objArr2;
        int i4 = (i2 - 1) & (-32);
        this.e = new xsd(objArr, i > i4 ? i4 : i, i4, i3);
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            ywb.n();
            return null;
        }
        xsd xsdVar = this.e;
        if (xsdVar.hasNext()) {
            this.b++;
            return xsdVar.next();
        }
        int i = this.b;
        this.b = i + 1;
        return this.d[i - xsdVar.c];
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        if (!hasPrevious()) {
            ywb.n();
            return null;
        }
        int i = this.b;
        xsd xsdVar = this.e;
        int i2 = xsdVar.c;
        if (i <= i2) {
            this.b = i - 1;
            return xsdVar.previous();
        }
        int i3 = i - 1;
        this.b = i3;
        return this.d[i3 - i2];
    }
}
