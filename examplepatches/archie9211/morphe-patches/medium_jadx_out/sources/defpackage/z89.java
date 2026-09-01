package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z89 extends l1 {
    public final Object[] d;
    public final ysd e;

    public z89(int i, int i2, int i3, Object[] objArr, Object[] objArr2) {
        super(i, i2, 1);
        this.d = objArr2;
        int i4 = (i2 - 1) & (-32);
        this.e = new ysd(objArr, i > i4 ? i4 : i, i4, i3);
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final Object next() {
        if (!hasNext()) {
            ywb.n();
            return null;
        }
        ysd ysdVar = this.e;
        if (ysdVar.hasNext()) {
            this.b++;
            return ysdVar.next();
        }
        int i = this.b;
        this.b = i + 1;
        return this.d[i - ysdVar.c];
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        if (!hasPrevious()) {
            ywb.n();
            return null;
        }
        int i = this.b;
        ysd ysdVar = this.e;
        int i2 = ysdVar.c;
        if (i <= i2) {
            this.b = i - 1;
            return ysdVar.previous();
        }
        int i3 = i - 1;
        this.b = i3;
        return this.d[i3 - i2];
    }
}
