package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gz1 {
    public final List a;
    public final List b;
    public final List c;
    public List d;
    public List e;
    public final w5d f;
    public final w5d g;

    public gz1(List list, List list2, List list3, List list4, List list5) {
        this.a = list;
        this.b = list2;
        this.c = list3;
        this.d = list4;
        this.e = list5;
        final int i = 0;
        this.f = new w5d(new m45(this) { // from class: ez1
            public final /* synthetic */ gz1 b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i2 = i;
                ey3 ey3Var = ey3.a;
                int i3 = 0;
                gz1 gz1Var = this.b;
                switch (i2) {
                    case 0:
                        List list6 = gz1Var.d;
                        ArrayList arrayList = new ArrayList();
                        int size = list6.size();
                        while (i3 < size) {
                            bu1.n0((List) ((m45) list6.get(i3)).invoke(), arrayList);
                            i3++;
                        }
                        gz1Var.d = ey3Var;
                        return arrayList;
                    default:
                        List list7 = gz1Var.e;
                        ArrayList arrayList2 = new ArrayList();
                        int size2 = list7.size();
                        while (i3 < size2) {
                            bu1.n0((List) ((m45) list7.get(i3)).invoke(), arrayList2);
                            i3++;
                        }
                        gz1Var.e = ey3Var;
                        return arrayList2;
                }
            }
        });
        final int i2 = 1;
        this.g = new w5d(new m45(this) { // from class: ez1
            public final /* synthetic */ gz1 b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i22 = i2;
                ey3 ey3Var = ey3.a;
                int i3 = 0;
                gz1 gz1Var = this.b;
                switch (i22) {
                    case 0:
                        List list6 = gz1Var.d;
                        ArrayList arrayList = new ArrayList();
                        int size = list6.size();
                        while (i3 < size) {
                            bu1.n0((List) ((m45) list6.get(i3)).invoke(), arrayList);
                            i3++;
                        }
                        gz1Var.d = ey3Var;
                        return arrayList;
                    default:
                        List list7 = gz1Var.e;
                        ArrayList arrayList2 = new ArrayList();
                        int size2 = list7.size();
                        while (i3 < size2) {
                            bu1.n0((List) ((m45) list7.get(i3)).invoke(), arrayList2);
                            i3++;
                        }
                        gz1Var.e = ey3Var;
                        return arrayList2;
                }
            }
        });
    }
}
