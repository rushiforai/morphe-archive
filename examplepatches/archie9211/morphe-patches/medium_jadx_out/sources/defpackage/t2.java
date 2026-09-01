package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public final class t2 implements m45 {
    public final /* synthetic */ int a = 1;
    public final List b;

    public t2(List list, zdc zdcVar) {
        this.b = list;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        List<qn6> list = this.b;
        switch (i) {
            case 0:
                ArrayList arrayList = new ArrayList();
                for (qn6 qn6Var : list) {
                    qn6Var.getClass();
                    mn6 mn6VarR = qk7.r((mn6) qn6Var);
                    if (mn6VarR != null) {
                        arrayList.add(mn6VarR);
                    }
                }
                return arrayList;
            default:
                return list;
        }
    }

    public t2(List list) {
        this.b = list;
    }
}
