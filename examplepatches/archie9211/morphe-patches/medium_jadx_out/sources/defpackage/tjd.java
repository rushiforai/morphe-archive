package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class tjd implements x45 {
    public final /* synthetic */ int a;

    public /* synthetic */ tjd(zwd zwdVar) {
        this.a = 9;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((jyb) obj).d(eyb.B, c1eVar);
                return c1eVar;
            case 1:
                return Boolean.TRUE;
            case 2:
                List list = (List) obj;
                return new vod(((Number) list.get(0)).floatValue(), ((Number) list.get(1)).floatValue(), ((Number) list.get(2)).floatValue());
            case 3:
                ypd ypdVar = (ypd) obj;
                ypdVar.getClass();
                return ypdVar.a;
            case 4:
                ((ov) obj).getClass();
                return ht2.G0(sz3.c(f76.Q(200, 0, null, 6), 2), sz3.d(f76.Q(200, 0, null, 6), 2));
            case 5:
                jyb jybVar = (jyb) obj;
                jybVar.getClass();
                hyb.a(jybVar);
                return c1eVar;
            case 6:
                gnb gnbVar = (gnb) obj;
                gnbVar.getClass();
                return Boolean.valueOf(gnbVar.w0());
            case 7:
                hwb hwbVar = (hwb) obj;
                long j = hwbVar.g;
                gjc gjcVar = hwbVar.i;
                if (gjcVar != null) {
                    gjcVar.d(hwbVar, k40.m, hwbVar.h);
                }
                long j2 = hwbVar.g;
                if (j != j2) {
                    awb awbVar = hwbVar.p;
                    if (awbVar != null) {
                        if (awbVar.a > j2) {
                            hwbVar.x0();
                        } else {
                            awbVar.g = j2;
                            if (awbVar.b == null) {
                                awbVar.h = nk7.x0((1.0d - ((double) awbVar.e.a(0))) * hwbVar.g);
                            }
                        }
                    } else if (j2 != 0) {
                        hwbVar.C0();
                    }
                }
                return c1eVar;
            case 8:
                gnb gnbVar2 = (gnb) obj;
                gnbVar2.getClass();
                p1c p1cVar = new p1c();
                while (gnbVar2.w0()) {
                    p1cVar.add(Integer.valueOf((int) gnbVar2.getLong(0)));
                }
                return qo7.k(p1cVar);
            case 9:
                ak6 ak6Var = (ak6) obj;
                ak6Var.getClass();
                bk6 bk6Var = ak6Var.a;
                if (bk6Var == null) {
                    return "*";
                }
                qj6 qj6Var = ak6Var.b;
                zwd zwdVar = qj6Var instanceof zwd ? (zwd) qj6Var : null;
                String strA = zwdVar != null ? zwdVar.a(true) : String.valueOf(qj6Var);
                int i2 = ywd.a[bk6Var.ordinal()];
                if (i2 == 1) {
                    return strA;
                }
                if (i2 == 2) {
                    return "in ".concat(strA);
                }
                if (i2 == 3) {
                    return "out ".concat(strA);
                }
                ygf.a();
                return null;
            case 10:
                jyb jybVar2 = (jyb) obj;
                jybVar2.getClass();
                hyb.a(jybVar2);
                return c1eVar;
            case 11:
                jyb jybVar3 = (jyb) obj;
                jybVar3.getClass();
                z82.a.getClass();
                gyb.c(jybVar3, y82.c);
                return c1eVar;
            case 12:
                zv6 zv6Var = (zv6) obj;
                zv6Var.getClass();
                zv6Var.r.e(12, new yv6(new tjd(13), h06.s, null, pxf.z));
                return c1eVar;
            case 13:
                return b09.w(((Integer) obj).intValue(), "placeholder_");
            case 14:
                jyb jybVar4 = (jyb) obj;
                jybVar4.getClass();
                hyb.a(jybVar4);
                return c1eVar;
            case 15:
                jyb jybVar5 = (jyb) obj;
                jybVar5.getClass();
                hyb.a(jybVar5);
                return c1eVar;
            case 16:
                jyb jybVar6 = (jyb) obj;
                jybVar6.getClass();
                hyb.a(jybVar6);
                return c1eVar;
            case 17:
                jyb jybVar7 = (jyb) obj;
                jybVar7.getClass();
                hyb.a(jybVar7);
                return c1eVar;
            case 18:
                jyb jybVar8 = (jyb) obj;
                jybVar8.getClass();
                hyb.a(jybVar8);
                return c1eVar;
            case 19:
                return new s46(((long) ((int) (((s46) obj).a >> 32))) << 32);
            case 20:
                jyb jybVar9 = (jyb) obj;
                jybVar9.getClass();
                hyb.a(jybVar9);
                return c1eVar;
            case 21:
                jyb jybVar10 = (jyb) obj;
                jybVar10.getClass();
                hyb.a(jybVar10);
                return c1eVar;
            case 22:
                return b09.w(((Integer) obj).intValue(), "loading_more_item_");
            case 23:
                jyb jybVar11 = (jyb) obj;
                jybVar11.getClass();
                hyb.a(jybVar11);
                return c1eVar;
            case 24:
                jyb jybVar12 = (jyb) obj;
                jybVar12.getClass();
                hyb.a(jybVar12);
                return c1eVar;
            case 25:
                j8b j8bVar = (j8b) obj;
                j8bVar.getClass();
                return j8bVar.i.a;
            case 26:
                hne hneVar = (hne) obj;
                hneVar.getClass();
                return ka1.r("users_search_user_", hneVar.a);
            case 27:
                return c1eVar;
            case 28:
                return new zw(((Float) obj).floatValue());
            default:
                return new zw(((Integer) obj).intValue());
        }
    }

    public /* synthetic */ tjd(int i) {
        this.a = i;
    }
}
