package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class mbb implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;
    public final /* synthetic */ bf7 c;

    public /* synthetic */ mbb(String str, bf7 bf7Var, int i) {
        this.a = 1;
        this.b = str;
        this.c = bf7Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        bf7 bf7Var;
        int i = this.a;
        bf7 bf7Var2 = this.c;
        c1e c1eVar = c1e.a;
        int i2 = 2;
        String str = this.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(1 & iIntValue, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    g3d.a(null, bmb.a(24.0f), ((zo7) p65Var.j(kt7.b)).a, 0L, 0.0f, 0.0f, null, pxf.E(-1363503623, new mbb(bf7Var2, str, i2), p65Var), p65Var, 12582912, PanasonicMakernoteDirectory.TAG_INTELLIGENT_D_RANGE);
                }
                break;
            case 1:
                ((Integer) obj2).getClass();
                mo7.v(str, bf7Var2, (x12) obj, tr7.y(1));
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
                    long j = p65Var2.T;
                    int i3 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var2.l();
                    o28 o28Var = o28.b;
                    r28 r28VarR = gx1.R(p65Var2, o28Var);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var2, cuVar, wv1VarA);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var2, cuVar2, i89VarL);
                    Integer numValueOf = Integer.valueOf(i3);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var2, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var2, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var2, cuVar4, r28VarR);
                    c09 c09VarJ = vn7.J(2131231259, 0, p65Var2);
                    r28 r28VarG = w2g.G(o28Var, 24.0f, 24.0f, 24.0f, 0.0f, 8);
                    yq0 yq0Var = z46.q;
                    r28 r28VarI = ka1.i(yq0Var, r28VarG);
                    sn3 sn3Var = kt7.b;
                    qv5.b(c09VarJ, null, r28VarI, ((zo7) p65Var2.j(sn3Var)).n, p65Var2, 56, 0);
                    String strR = vo7.R(p65Var2, R.string.request_address_book_access_title);
                    r28 r28VarI2 = ka1.i(yq0Var, w2g.G(o28Var, 24.0f, 24.0f, 24.0f, 0.0f, 8));
                    jgd jgdVar = new jgd(3);
                    sn3 sn3Var2 = jt7.c;
                    jjd.b(strR, r28VarI2, 0L, 0L, 0L, null, jgdVar, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(sn3Var2)).i, p65Var2, 0, 0, 130044);
                    jjd.b(vo7.R(p65Var2, R.string.request_address_book_access_description), ka1.i(yq0Var, w2g.G(o28Var, 24.0f, 8.0f, 24.0f, 0.0f, 8)), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var2.j(sn3Var2)).m, ((zo7) p65Var2.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 0, 0, 130044);
                    r28 r28VarI3 = ka1.i(z46.r, w2g.G(o28Var, 0.0f, 12.0f, 8.0f, 12.0f, 1));
                    omb ombVarA = nmb.a(qb8.a, z46.m, p65Var2, 0);
                    long j2 = p65Var2.T;
                    int i4 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var2.l();
                    r28 r28VarR2 = gx1.R(p65Var2, r28VarI3);
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, cuVar, ombVarA);
                    tp7.B(p65Var2, cuVar2, i89VarL2);
                    ka1.z(i4, p65Var2, cuVar3, p65Var2, fnVar);
                    tp7.B(p65Var2, cuVar4, r28VarR2);
                    bf7 bf7Var3 = this.c;
                    boolean zF = p65Var2.f(bf7Var3);
                    Object objM = p65Var2.M();
                    uob uobVar = w12.a;
                    if (zF || objM == uobVar) {
                        uta utaVar = new uta(0, bf7Var3, bf7.class, "onRequestAddressBookAccessDeclined", "onRequestAddressBookAccessDeclined()V", 0, 23);
                        bf7Var = bf7Var3;
                        p65Var2.j0(utaVar);
                        objM = utaVar;
                    } else {
                        bf7Var = bf7Var3;
                    }
                    String strR2 = vo7.R(p65Var2, R.string.request_address_book_access_decline);
                    xn7 xn7Var = xn7.M;
                    fo7.k(1573248, 56, null, p65Var2, (m45) ((qh6) objM), xn7Var, null, strR2, false, false);
                    boolean zF2 = p65Var2.f(bf7Var) | p65Var2.f(str);
                    Object objM2 = p65Var2.M();
                    if (zF2 || objM2 == uobVar) {
                        objM2 = new nbb(bf7Var, 0, str);
                        p65Var2.j0(objM2);
                    }
                    String strR3 = vo7.R(p65Var2, R.string.request_address_book_access_share);
                    jy8 jy8Var = h11.a;
                    g11 g11VarB = h11.b((fv1) p65Var2.j(iv1.a));
                    long j3 = uu1.g;
                    fo7.k(1573248, 40, g11VarB.a(j3, ((zo7) p65Var2.j(sn3Var)).r, j3, uu1.b(0.5f, ((zo7) p65Var2.j(sn3Var)).r)), p65Var2, (m45) objM2, xn7Var, null, strR3, false, false);
                    p65Var2.p(true);
                    p65Var2.p(true);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ mbb(bf7 bf7Var, String str, int i) {
        this.a = i;
        this.c = bf7Var;
        this.b = str;
    }
}
