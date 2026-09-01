package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class lr6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ l78 b;
    public final /* synthetic */ ArrayList c;
    public final /* synthetic */ List d;
    public final /* synthetic */ boolean e;

    public /* synthetic */ lr6(l78 l78Var, ArrayList arrayList, List list, boolean z, int i) {
        this.a = i;
        this.b = l78Var;
        this.c = arrayList;
        this.d = list;
        this.e = z;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        boolean z = this.e;
        List list = this.d;
        ArrayList arrayList = this.c;
        l78 l78Var = this.b;
        c1e c1eVar = c1e.a;
        s99 s99Var = (s99) obj;
        switch (i) {
            case 0:
                s99Var.a = true;
                int size = arrayList.size();
                for (int i2 = 0; i2 < size; i2++) {
                    ((nr6) arrayList.get(i2)).k(s99Var, z);
                }
                int size2 = list.size();
                for (int i3 = 0; i3 < size2; i3++) {
                    ((nr6) list.get(i3)).k(s99Var, z);
                }
                s99Var.a = false;
                l78Var.getValue();
                break;
            default:
                s99Var.a = true;
                int size3 = arrayList.size();
                for (int i4 = 0; i4 < size3; i4++) {
                    ((dv6) arrayList.get(i4)).l(s99Var, z);
                }
                int size4 = list.size();
                for (int i5 = 0; i5 < size4; i5++) {
                    ((dv6) list.get(i5)).l(s99Var, z);
                }
                s99Var.a = false;
                l78Var.getValue();
                break;
        }
        return c1eVar;
    }
}
