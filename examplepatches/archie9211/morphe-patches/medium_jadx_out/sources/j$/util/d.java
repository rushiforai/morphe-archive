package j$.util;

import java.io.Serializable;
import java.util.function.Function;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final /* synthetic */ class d implements java.util.Comparator, Serializable {
    public final /* synthetic */ int a;
    public final /* synthetic */ java.util.Comparator b;
    public final /* synthetic */ Object c;

    public /* synthetic */ d(java.util.Comparator comparator, Object obj, int i) {
        this.a = i;
        this.b = comparator;
        this.c = obj;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        switch (this.a) {
            case 0:
                java.util.Comparator comparator = this.b;
                java.util.Comparator comparator2 = (java.util.Comparator) this.c;
                int iCompare = comparator.compare(obj, obj2);
                return iCompare != 0 ? iCompare : comparator2.compare(obj, obj2);
            default:
                java.util.Comparator comparator3 = this.b;
                Function function = (Function) this.c;
                return comparator3.compare(function.apply(obj), function.apply(obj2));
        }
    }
}
