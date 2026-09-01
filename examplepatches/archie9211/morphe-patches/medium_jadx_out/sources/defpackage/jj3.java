package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class jj3 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ long c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ jj3(amb ambVar, sb2 sb2Var, pod podVar, long j) {
        this.a = 3;
        this.d = ambVar;
        this.e = sb2Var;
        this.b = podVar;
        this.c = j;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        int i2 = 1;
        c1e c1eVar = c1e.a;
        Object obj3 = this.b;
        Object obj4 = this.e;
        Object obj5 = this.d;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                guc.d((mg1) obj5, (kj3) obj4, (r28) obj3, this.c, (x12) obj, tr7.y(1));
                break;
            case 1:
                ((Integer) obj2).getClass();
                k40.s((String) obj5, (r28) obj3, this.c, (m45) obj4, (x12) obj, tr7.y(7));
                break;
            case 2:
                ((Integer) obj2).getClass();
                qv5.a((by5) obj5, (String) obj4, (r28) obj3, this.c, (x12) obj, tr7.y(1));
                break;
            case 3:
                amb ambVar = (amb) obj5;
                sb2 sb2Var = (sb2) obj4;
                pod podVar = (pod) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    c09 c09VarJ = vn7.J(R.drawable.ic_info_16, 0, p65Var);
                    String strR = vo7.R(p65Var, R.string.cd_learn_more);
                    r28 r28VarY = r40.y(o28.b, ambVar);
                    boolean zH = p65Var.h(sb2Var) | p65Var.h(podVar);
                    Object objM = p65Var.M();
                    if (zH || objM == w12.a) {
                        objM = new ip0(sb2Var, podVar, i2);
                        p65Var.j0(objM);
                    }
                    qv5.b(c09VarJ, strR, bgf.N(jfc.l(hlg.r(r28VarY, false, null, null, (m45) objM, 15), 16.0f), "icon"), this.c, p65Var, 8, 0);
                }
                break;
            case 4:
                ((Integer) obj2).getClass();
                ur7.u((owb) obj5, (m45) obj4, (r28) obj3, this.c, (x12) obj, tr7.y(439));
                break;
            default:
                ((Integer) obj2).getClass();
                ur7.f((String) obj5, (String) obj4, this.c, (r28) obj3, (x12) obj, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ jj3(Object obj, Object obj2, r28 r28Var, long j, int i, int i2) {
        this.a = i2;
        this.d = obj;
        this.e = obj2;
        this.b = r28Var;
        this.c = j;
    }

    public /* synthetic */ jj3(String str, r28 r28Var, long j, m45 m45Var, int i) {
        this.a = 1;
        this.d = str;
        this.b = r28Var;
        this.c = j;
        this.e = m45Var;
    }

    public /* synthetic */ jj3(String str, String str2, long j, r28 r28Var, int i) {
        this.a = 5;
        this.d = str;
        this.e = str2;
        this.c = j;
        this.b = r28Var;
    }
}
