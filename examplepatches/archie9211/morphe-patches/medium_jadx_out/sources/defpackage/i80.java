package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class i80 implements Iterable, th6 {
    public final /* synthetic */ int a;
    public final Object b;

    public /* synthetic */ i80(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return w2g.A((Object[]) obj);
            case 1:
                return new zm3((Iterator) ((m45) obj).invoke());
            default:
                return ((mzb) obj).iterator();
        }
    }
}
