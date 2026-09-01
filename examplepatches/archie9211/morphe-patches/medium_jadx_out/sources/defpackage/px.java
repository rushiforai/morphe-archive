package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class px implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ArrayList b;

    public /* synthetic */ px(int i, ArrayList arrayList) {
        this.a = i;
        this.b = arrayList;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = 0;
        ArrayList arrayList = this.b;
        switch (i) {
            case 0:
                s99 s99Var = (s99) obj;
                int size = arrayList.size();
                for (int i3 = 0; i3 < size; i3++) {
                    s99.j(s99Var, (t99) arrayList.get(i3), 0, 0);
                }
                break;
            case 1:
                s99 s99Var2 = (s99) obj;
                int size2 = arrayList.size();
                int i4 = 0;
                while (i4 < size2) {
                    el7 el7Var = (el7) arrayList.get(i4);
                    List list = el7Var.b;
                    boolean z = el7Var.g;
                    if (el7Var.k == Integer.MIN_VALUE) {
                        e26.a("position() should be called first");
                    }
                    int size3 = list.size();
                    int i5 = i2;
                    while (i5 < size3) {
                        t99 t99Var = (t99) list.get(i5);
                        int[] iArr = el7Var.i;
                        int i6 = i5 * 2;
                        int i7 = size2;
                        long jD = k46.d((((long) iArr[i6 + 1]) & 4294967295L) | (((long) iArr[i6]) << 32), el7Var.c);
                        if (z) {
                            s99.s(s99Var2, t99Var, jD);
                        } else {
                            s99.l(s99Var2, t99Var, jD);
                        }
                        i5++;
                        size2 = i7;
                    }
                    i4++;
                    i2 = 0;
                }
                break;
            default:
                s99 s99Var3 = (s99) obj;
                int size4 = arrayList.size();
                for (int i8 = 0; i8 < size4; i8++) {
                    s99Var3.g((t99) arrayList.get(i8), 0, 0, 0.0f);
                }
                break;
        }
        return c1eVar;
    }
}
