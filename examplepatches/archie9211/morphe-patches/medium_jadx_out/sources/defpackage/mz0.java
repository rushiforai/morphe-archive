package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mz0 extends l1 {
    public final /* synthetic */ int d = 0;
    public final Object e;

    public mz0(int i, int i2, Object[] objArr) {
        super(i, i2, 1);
        this.e = objArr;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final Object next() {
        int i = this.d;
        Object obj = this.e;
        switch (i) {
            case 0:
                if (!hasNext()) {
                    ywb.n();
                } else {
                    int i2 = this.b;
                    this.b = i2 + 1;
                }
                break;
            default:
                if (!hasNext()) {
                    ywb.n();
                } else {
                    this.b++;
                }
                break;
        }
        return null;
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        int i = this.d;
        Object obj = this.e;
        switch (i) {
            case 0:
                if (!hasPrevious()) {
                    ywb.n();
                } else {
                    int i2 = this.b - 1;
                    this.b = i2;
                }
                break;
            default:
                if (!hasPrevious()) {
                    ywb.n();
                } else {
                    this.b--;
                }
                break;
        }
        return null;
    }

    public mz0(int i, Object obj) {
        super(i, 1, 1);
        this.e = obj;
    }
}
