package defpackage;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public final class es6 implements m45 {
    public final /* synthetic */ int a;
    public final gs6 b;

    public /* synthetic */ es6(gs6 gs6Var, int i) {
        this.a = i;
        this.b = gs6Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        gs6 gs6Var = this.b;
        switch (i) {
            case 0:
                Class<?>[] declaredClasses = gs6Var.o.a.getDeclaredClasses();
                declaredClasses.getClass();
                return bu1.q1(szb.O0(szb.N0(new zh4(k80.b0(declaredClasses), false, p79.i), p79.j)));
            case 1:
                List listB = gs6Var.o.b();
                ArrayList arrayList = new ArrayList();
                for (Object obj : listB) {
                    if (((w0b) obj).a.isEnumConstant()) {
                        arrayList.add(obj);
                    }
                }
                int iP = ei7.P(cu1.k0(arrayList, 10));
                if (iP < 16) {
                    iP = 16;
                }
                LinkedHashMap linkedHashMap = new LinkedHashMap(iP);
                for (Object obj2 : arrayList) {
                    linkedHashMap.put(((w0b) obj2).c(), obj2);
                }
                return linkedHashMap;
            default:
                return qo7.v(gs6Var.b(), gs6Var.g());
        }
    }
}
