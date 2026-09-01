package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xo extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ArrayList b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ xo(int i, ArrayList arrayList) {
        super(1);
        this.a = i;
        this.b = arrayList;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        ArrayList arrayList = this.b;
        switch (i) {
            case 0:
                s99 s99Var = (s99) obj;
                int size = arrayList.size();
                for (int i2 = 0; i2 < size; i2++) {
                    s99.j(s99Var, (t99) arrayList.get(i2), 0, 0);
                }
                break;
            case 1:
                s99 s99Var2 = (s99) obj;
                int size2 = arrayList.size() - 1;
                if (size2 >= 0) {
                    int i3 = 0;
                    while (true) {
                        s99.j(s99Var2, (t99) arrayList.get(i3), 0, 0);
                        if (i3 != size2) {
                            i3++;
                        }
                    }
                }
                break;
            case 2:
                s99 s99Var3 = (s99) obj;
                int size3 = arrayList.size();
                for (int i4 = 0; i4 < size3; i4++) {
                    s99Var3.g((t99) arrayList.get(i4), 0, 0, 0.0f);
                }
                break;
            default:
                s99 s99Var4 = (s99) obj;
                int size4 = arrayList.size();
                for (int i5 = 0; i5 < size4; i5++) {
                    s99.k(s99Var4, (t99) arrayList.get(i5), 0, 0);
                }
                break;
        }
        return c1eVar;
    }
}
