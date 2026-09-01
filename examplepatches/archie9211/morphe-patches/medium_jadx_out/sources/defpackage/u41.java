package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u41 implements Runnable {
    public final /* synthetic */ int a;
    public final int b;
    public final Object c;

    public u41(List list, int i, Throwable th) {
        this.a = 1;
        jq7.h("initCallbacks cannot be null", list);
        this.c = new ArrayList(list);
        this.b = i;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        int i2 = this.b;
        Object obj = this.c;
        switch (i) {
            case 0:
                h30 h30Var = (h30) ((qlb) obj).a;
                if (h30Var != null) {
                    h30Var.v(i2);
                }
                break;
            case 1:
                ArrayList arrayList = (ArrayList) obj;
                int size = arrayList.size();
                int i3 = 0;
                if (i2 == 1) {
                    while (i3 < size) {
                        ((ww3) arrayList.get(i3)).b();
                        i3++;
                    }
                } else {
                    while (i3 < size) {
                        ((ww3) arrayList.get(i3)).a();
                        i3++;
                    }
                }
                break;
            default:
                ((uif) obj).e(i2);
                break;
        }
    }

    public /* synthetic */ u41(int i, int i2, Object obj) {
        this.a = i2;
        this.c = obj;
        this.b = i;
    }
}
