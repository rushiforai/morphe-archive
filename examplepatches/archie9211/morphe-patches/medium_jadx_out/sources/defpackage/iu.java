package defpackage;

import android.os.Bundle;
import com.medium.android.core.share.PostShareData;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class iu implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ iu(nya nyaVar, ka8 ka8Var, va8 va8Var, Bundle bundle) {
        this.a = 16;
        this.e = nyaVar;
        this.b = ka8Var;
        this.c = va8Var;
        this.d = bundle;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private final Object a(Object obj) {
        ija ijaVar = (ija) this.b;
        md3 md3Var = (md3) this.c;
        ip7 ip7Var = (ip7) this.d;
        qia qiaVar = (qia) this.e;
        xu6 xu6Var = (xu6) obj;
        xu6Var.getClass();
        az5 az5Var = ijaVar.b;
        v08 v08Var = new v08(21, qiaVar);
        eb8 eb8Var = new eb8(11, qiaVar);
        az5Var.getClass();
        ip7Var.getClass();
        stc stcVar = ip7Var == ip7.COMPACT ? stc.M : stc.L;
        int i = 0;
        for (Object obj2 : az5Var) {
            int i2 = i + 1;
            if (i < 0) {
                d46.i0();
                throw null;
            }
            ula ulaVar = (ula) obj2;
            int i3 = 2;
            int i4 = 1;
            if (ulaVar instanceof sla) {
                sla slaVar = (sla) ulaVar;
                ev6.j(xu6Var, ka1.r("publication_home_section_title_", slaVar.a), new mz1(new vla(i, 0, eb8Var, slaVar, az5Var), true, -1081838749), 2);
                az5 az5Var2 = slaVar.c;
                xu6Var.l0(((t0) az5Var2).getSize(), new vja(new v08(22, slaVar), i4, az5Var2), new w91(az5Var2, 5), new mz1(new oda(az5Var2, stcVar, 10), true, 2039820996));
            } else if (ulaVar instanceof rla) {
                rla rlaVar = (rla) ulaVar;
                ev6.j(xu6Var, ka1.r("publication_home_section_title_", rlaVar.a), new mz1(new wla((ula) rlaVar, i, az5Var, 0), true, -1223634214), 2);
                az5 az5Var3 = rlaVar.c;
                xu6Var.l0(((t0) az5Var3).getSize(), new vja(new v08(23, rlaVar), i3, az5Var3), new w91(az5Var3, 6), new mz1(new o37(az5Var3, stcVar, md3Var, 6), true, 2039820996));
            } else if (ulaVar instanceof qla) {
                qla qlaVar = (qla) ulaVar;
                String str = qlaVar.a;
                ev6.j(xu6Var, ka1.r("publication_home_section_title_", str), new mz1(new wla((ula) qlaVar, i, az5Var, i4), true, 1840040539), 2);
                ev6.j(xu6Var, ka1.v(new StringBuilder("publication_home_section_"), str, "_error"), new mz1(new qg9(qlaVar, 8, eb8Var), true, 1647263876), 2);
            } else {
                if (!(ulaVar instanceof tla)) {
                    ygf.a();
                    return null;
                }
                tla tlaVar = (tla) ulaVar;
                ev6.j(xu6Var, ka1.r("promotion_section_", tlaVar.a), new mz1(new wla(tlaVar, i, v08Var, i3), true, 608747996), 2);
            }
            i = i2;
        }
        return c1e.a;
    }

    private final Object d(Object obj) {
        eua euaVar = (eua) this.b;
        vta vtaVar = (vta) this.c;
        stc stcVar = (stc) this.d;
        sh9 sh9Var = (sh9) this.e;
        xu6 xu6Var = (xu6) obj;
        xu6Var.getClass();
        int i = 1;
        ev6.j(xu6Var, "clear_history_item", new mz1(new nra(i, vtaVar), true, 98760754), 2);
        List list = euaVar.a;
        int i2 = 5;
        xu6Var.l0(list.size(), new vja(new qna(i2), i2, list), new lba(list, 9), new mz1(new wja(list, stcVar, sh9Var, i), true, 802480018));
        if (euaVar.c) {
            ev6.l(xu6Var, 5, new qna(6), t40.f, 4);
        }
        return c1e.a;
    }

    private final Object g(Object obj) {
        PostShareData postShareData = (PostShareData) this.b;
        String str = (String) this.c;
        String str2 = (String) this.d;
        String str3 = (String) this.e;
        cs2 cs2Var = (cs2) obj;
        cs2Var.getClass();
        ko2 ko2Var = cs2Var.a.b;
        s26 s26Var = new s26(ko2Var.a.a, 4, on7.b());
        fm fmVar = new fm(ko2Var.a.a);
        ty2 ty2VarQ = ko2Var.q();
        i03 i03Var = i03.a;
        String string = ko2Var.a.a.getString(R.string.facebook_application_id);
        string.getClass();
        return new j6c(postShareData, str, str2, str3, s26Var, fmVar, ty2VarQ, string);
    }

    private final Object h(Object obj) {
        xqc xqcVar;
        msc mscVar = (msc) this.b;
        ssc sscVar = (ssc) this.c;
        isc iscVar = (isc) this.d;
        jsc jscVar = (jsc) this.e;
        xu6 xu6Var = (xu6) obj;
        xu6Var.getClass();
        ev6.j(xu6Var, "charts", new mz1(new qg9(sscVar, 27, iscVar), true, 279580486), 2);
        ArrayList arrayList = mscVar.c;
        if (!arrayList.isEmpty() || (xqcVar = mscVar.b) == xqc.LIFETIME_EARNINGS_DESC || xqcVar == xqc.LIFETIME_EARNINGS_ASC) {
            ev6.j(xu6Var, "lifetime_chart_post_header", new mz1(new qg9(jscVar, 28, iscVar), true, -673594271), 2);
        }
        if (arrayList.isEmpty()) {
            ev6.j(xu6Var, "lifetime_chart_empty_state", new mz1(new gab(mscVar, iscVar, jscVar, 5), true, -1752490088), 2);
        } else {
            xu6Var.l0(arrayList.size(), new vja(new dsb(22), 11, arrayList), new rl5(9, arrayList), new mz1(new oda(arrayList, iscVar, 13), true, 802480018));
        }
        return c1e.a;
    }

    private final Object i(Object obj) {
        az5 az5Var = (az5) this.b;
        mya myaVar = (mya) this.c;
        oe1 oe1Var = (oe1) this.d;
        az5 az5Var2 = (az5) this.e;
        xu6 xu6Var = (xu6) obj;
        xu6Var.getClass();
        bo.F(xu6Var, az5Var, myaVar, oe1Var);
        bo.F(xu6Var, az5Var2, myaVar, oe1Var);
        return c1e.a;
    }

    private final Object j(Object obj) {
        vaf vafVar = (vaf) this.b;
        laf lafVar = (laf) this.c;
        stc stcVar = (stc) this.d;
        md3 md3Var = (md3) this.e;
        xu6 xu6Var = (xu6) obj;
        xu6Var.getClass();
        ev6.j(xu6Var, "you_posts_post_type_selector", new mz1(new dyc(vafVar, 12, lafVar), true, -1310218001), 2);
        uaf uafVar = vafVar.b;
        if (uafVar instanceof qaf) {
            ev6.j(xu6Var, "you_posts_error_state", new mz1(new dyc(uafVar, 13, lafVar), true, -46879753), 2);
        } else {
            int i = 5;
            if (uafVar.equals(raf.a)) {
                for (int i2 = 0; i2 < 5; i2++) {
                    ev6.j(xu6Var, null, new mz1(new dx9(stcVar, 4), true, -892479840), 3);
                }
            } else if (uafVar.equals(saf.a)) {
                ev6.j(xu6Var, "you_posts_empty_state", new mz1(new nra(16, vafVar), true, -12042001), 2);
            } else {
                if (!(uafVar instanceof taf)) {
                    ygf.a();
                    return null;
                }
                taf tafVar = (taf) uafVar;
                List list = tafVar.a;
                xu6Var.l0(list.size(), new j8e(new n2c(20), 8, list), new lba(list, 25), new mz1(new o37(list, stcVar, md3Var, 11), true, 2039820996));
                if (tafVar.b) {
                    ev6.j(xu6Var, "you_posts_loading_more", new mz1(new dx9(stcVar, i), true, -1727397771), 2);
                }
            }
        }
        return c1e.a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:193:0x0613  */
    /* JADX WARN: Removed duplicated region for block: B:208:0x06d9  */
    @Override // defpackage.x45
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invoke(java.lang.Object r23) {
        /*
            Method dump skipped, instruction units count: 3290
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.iu.invoke(java.lang.Object):java.lang.Object");
    }

    public /* synthetic */ iu(x45 x45Var, lr4 lr4Var, akc akcVar, l78 l78Var) {
        this.a = 7;
        this.d = x45Var;
        this.b = lr4Var;
        this.c = akcVar;
        this.e = l78Var;
    }

    public /* synthetic */ iu(Object obj, Object obj2, Object obj3, Object obj4, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
        this.e = obj4;
    }

    public /* synthetic */ iu(ArrayList arrayList, pya pyaVar, List list, int i, mr6 mr6Var) {
        this.a = 11;
        this.b = arrayList;
        this.c = pyaVar;
        this.d = list;
        this.e = mr6Var;
    }
}
