package defpackage;

import java.util.Comparator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class jx1 implements Comparator {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ jx1(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        int i = this.a;
        Object obj3 = this.b;
        switch (i) {
            case 0:
                for (x45 x45Var : (x45[]) obj3) {
                    int iD = pwd.D((Comparable) x45Var.invoke(obj), (Comparable) x45Var.invoke(obj2));
                    if (iD != 0) {
                        return iD;
                    }
                }
                return 0;
            default:
                return ((Number) ((b55) obj3).invoke(obj, obj2)).intValue();
        }
    }
}
