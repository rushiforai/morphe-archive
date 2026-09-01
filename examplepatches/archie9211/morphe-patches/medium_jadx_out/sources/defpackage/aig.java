package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aig implements Iterator {
    public final /* synthetic */ int a;
    public final Iterator b;
    public final Iterator c;

    public /* synthetic */ aig(Iterator it2, Iterator it3, int i) {
        this.a = i;
        this.b = it2;
        this.c = it3;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        switch (this.a) {
            case 0:
                if (this.b.hasNext() || this.c.hasNext()) {
                }
                break;
            default:
                if (this.b.hasNext() || this.c.hasNext()) {
                }
                break;
        }
        return true;
    }

    @Override // java.util.Iterator
    public final Object next() {
        int i = this.a;
        Iterator it2 = this.c;
        Iterator it3 = this.b;
        switch (i) {
            case 0:
                if (!it3.hasNext()) {
                }
                break;
            default:
                if (!it3.hasNext()) {
                }
                break;
        }
        return it2.next();
    }
}
