package defpackage;

import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lj2 extends co6 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ int b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lj2(ha7 ha7Var, int i, String str, LinkedHashMap linkedHashMap, Long l, String str2) {
        super(2);
        this.c = ha7Var;
        this.b = i;
        this.d = str;
        this.e = linkedHashMap;
        this.f = l;
        this.g = str2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.g;
        Object obj4 = this.f;
        Object obj5 = this.e;
        Object obj6 = this.d;
        Object obj7 = this.c;
        switch (i) {
            case 0:
                ((Number) obj2).intValue();
                k40.e((dsd) obj7, (r28) obj6, (tj4) obj5, (x45) obj4, (mz1) obj3, (x12) obj, tr7.y(this.b | 1));
                break;
            default:
                vu2 vu2Var = (vu2) obj;
                x45 x45Var = (x45) obj2;
                vu2Var.getClass();
                x45Var.getClass();
                ha7 ha7Var = (ha7) obj7;
                ev2 ev2Var = ha7Var.f;
                String name = Thread.currentThread().getName();
                long jLongValue = ((Long) obj4).longValue();
                name.getClass();
                x45Var.invoke(new jr(ha7Var, 10, vx0.O(ev2Var, this.b, (String) obj6, null, (LinkedHashMap) obj5, ny3.a, jLongValue, name, vu2Var, (String) obj3, false)));
                break;
        }
        return c1eVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lj2(dsd dsdVar, r28 r28Var, tj4 tj4Var, x45 x45Var, mz1 mz1Var, int i) {
        super(2);
        this.c = dsdVar;
        this.d = r28Var;
        this.e = tj4Var;
        this.f = x45Var;
        this.g = mz1Var;
        this.b = i;
    }
}
