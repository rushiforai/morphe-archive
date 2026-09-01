package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Patterns;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.android.core.navigation.PublicationStatsReference;
import com.medium.android.data.settings.NotificationNetwork;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.publication.ui.main.PublicationFragment;
import com.medium.proto.event.CollectionShare;
import com.medium.reader.R;
import com.medium.stats.ui.pub.PubStatsFragment;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import java.util.WeakHashMap;
import java.util.regex.Matcher;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class gx4 implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ gx4(tha thaVar, kv6 kv6Var, jha jhaVar) {
        this.a = 23;
        this.c = thaVar;
        this.b = kv6Var;
        this.d = jhaVar;
    }

    private final Object a(Object obj, Object obj2, Object obj3) {
        u88 u88Var = (u88) this.b;
        i88 i88Var = (i88) this.c;
        String str = (String) this.d;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xr6) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarJ);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i2 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i2, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            String strQ = vo7.Q(R.string.see_all, new Object[]{u88Var.a}, p65Var);
            boolean zF = p65Var.f(i88Var) | p65Var.f(str) | p65Var.f(u88Var);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                objM = new i16(i88Var, str, u88Var, 7);
                p65Var.j0(objM);
            }
            nk7.P(strQ, (m45) objM, null, p65Var, 0);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object d(Object obj, Object obj2, Object obj3) {
        r28 r28Var = (r28) this.b;
        List list = (List) this.c;
        iaa iaaVar = (iaa) this.d;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xr6) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            r28 r28VarD = jfc.d(jfc.r(r28Var, 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i2 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i2, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i3 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i3, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            boolean zF = p65Var.f(iaaVar);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                xi1 xi1Var = new xi1(2, iaaVar, iaa.class, "onSocialNavigationSelected", "onSocialNavigationSelected(Landroid/net/Uri;Lgen/model/SourceParameter;)V", 0, 13);
                p65Var.j0(xi1Var);
                objM = xi1Var;
            }
            op8.b(list, (b55) ((qh6) objM), null, p65Var, 0);
            b09.H(p65Var, true, true, true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object g(Object obj, Object obj2, Object obj3) {
        qaa qaaVar = (qaa) this.b;
        iaa iaaVar = (iaa) this.c;
        a1a a1aVar = (a1a) this.d;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            r28 r28VarB = w2g.B(o28.b, hy8Var);
            if (qaaVar instanceof naa) {
                p65Var.Y(-1744255096);
                vo7.f((naa) qaaVar, iaaVar, a1aVar, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (qaaVar instanceof paa) {
                p65Var.Y(-1744246611);
                vo7.h(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(qaaVar instanceof oaa)) {
                    throw ho2.L(p65Var, -1744257309, false);
                }
                p65Var.Y(-1744242005);
                vo7.g(r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object h(Object obj, Object obj2, Object obj3) {
        List listQ;
        r28 r28Var = (r28) this.b;
        final naa naaVar = (naa) this.c;
        final iaa iaaVar = (iaa) this.d;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xr6) obj).getClass();
        int i = 0;
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            r28 r28VarD = jfc.d(jfc.r(r28Var, 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i2 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i2);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i3 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i3, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            String str = naaVar.b;
            if (str == null) {
                ay0.e("Publication description cannot be null, filtered upfront");
                return null;
            }
            boolean zF = p65Var.f(str);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                kx kxVar = new kx();
                x2b x2bVar = new x2b(b09.y(Patterns.WEB_URL.pattern(), "|", Patterns.EMAIL_ADDRESS.pattern()));
                str.getClass();
                muc.m0(0);
                Matcher matcher = x2bVar.a.matcher(str);
                if (matcher.find()) {
                    ArrayList arrayList = new ArrayList(10);
                    int iEnd = 0;
                    do {
                        arrayList.add(str.subSequence(iEnd, matcher.start()).toString());
                        iEnd = matcher.end();
                    } while (matcher.find());
                    arrayList.add(str.subSequence(iEnd, str.length()).toString());
                    listQ = arrayList;
                } else {
                    listQ = d46.Q(str.toString());
                }
                if (str.length() < 0) {
                    throw new IndexOutOfBoundsException("Start index out of bounds: 0, input length: " + str.length());
                }
                List listO0 = szb.O0(new hi3(new ui9(x2bVar, 20, str), w2b.a, 2));
                for (Object obj4 : listQ) {
                    int i4 = i + 1;
                    if (i < 0) {
                        d46.i0();
                        throw null;
                    }
                    kxVar.d((String) obj4);
                    ij7 ij7Var = (ij7) bu1.A0(i, listO0);
                    if (ij7Var != null) {
                        final String strGroup = ij7Var.a.group();
                        strGroup.getClass();
                        final boolean zMatches = Patterns.EMAIL_ADDRESS.matcher(strGroup).matches();
                        int iG = kxVar.g(new b07("url", new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439), null, 14), new e07() { // from class: gaa
                            @Override // defpackage.e07
                            public final void a(d07 d07Var) {
                                d07Var.getClass();
                                boolean z = zMatches;
                                String str2 = strGroup;
                                Uri uri = !z ? Uri.parse(huc.a(str2)) : Uri.parse(str2);
                                SourceParameter sourceParameter = naaVar.g;
                                uri.getClass();
                                sourceParameter.getClass();
                                ((kia) ((sja) iaaVar.a.a)).c(uri, sourceParameter);
                            }
                        }));
                        try {
                            kxVar.d(strGroup);
                        } finally {
                            kxVar.f(iG);
                        }
                    }
                    i = i4;
                }
                objM = kxVar.i();
                p65Var.j0(objM);
            }
            mx mxVar = (mx) objM;
            h70 h70Var = new h70(16.0f, true, new z10(21));
            r28 r28VarG = w2g.G(o28Var, 24.0f, 32.0f, 24.0f, 0.0f, 8);
            wv1 wv1VarA = uv1.a(h70Var, z46.p, p65Var, 6);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarG);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var2);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL3);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR3);
            String upperCase = vo7.R(p65Var, R.string.publication_about_note_from_editor).toUpperCase(((f67) p65Var.j(z22.p)).a);
            upperCase.getClass();
            sn3 sn3Var = jt7.c;
            jjd.b(upperCase, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var)).w, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 131070);
            jjd.c(mxVar, null, 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, ((bu7) p65Var.j(sn3Var)).l, p65Var, 0, 0, 262142);
            b09.H(p65Var, true, true, true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object i(Object obj, Object obj2, Object obj3) {
        dca dcaVar = (dca) this.b;
        nba nbaVar = (nba) this.c;
        sh9 sh9Var = (sh9) this.d;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            r28 r28VarB = w2g.B(o28.b, hy8Var);
            if (dcaVar instanceof cca) {
                p65Var.Y(-25420278);
                pba.d(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (dcaVar instanceof bca) {
                p65Var.Y(-25233844);
                pba.c(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(dcaVar instanceof aca)) {
                    throw ho2.L(p65Var, 1107556620, false);
                }
                p65Var.Y(-25042357);
                pba.b((aca) dcaVar, nbaVar, sh9Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object j(Object obj, Object obj2, Object obj3) {
        wca wcaVar = (wca) this.b;
        obe obeVar = (obe) this.c;
        qca qcaVar = (qca) this.d;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            r28 r28VarB = w2g.B(o28.b, hy8Var);
            if (wcaVar instanceof sca) {
                p65Var.Y(-750065295);
                vv2.k((sca) wcaVar, obeVar, qcaVar, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (wcaVar instanceof vca) {
                p65Var.Y(-750056899);
                vv2.n(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (wcaVar instanceof uca) {
                p65Var.Y(-750052126);
                vv2.m((uca) wcaVar, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(wcaVar instanceof tca)) {
                    throw ho2.L(p65Var, -750067377, false);
                }
                p65Var.Y(-750046245);
                vv2.l(r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object l(Object obj, Object obj2, Object obj3) {
        sda sdaVar = (sda) this.b;
        uga ugaVar = (uga) this.c;
        wda wdaVar = (wda) this.d;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xr6) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            boolean zF = p65Var.f(sdaVar);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                g98 g98Var = new g98(1, sdaVar, sda.class, "onMeterConfigurationChange", "onMeterConfigurationChange(Z)V", 0, 22);
                p65Var.j0(g98Var);
                objM = g98Var;
            }
            qh6 qh6Var = (qh6) objM;
            boolean zF2 = p65Var.f(sdaVar);
            Object objM2 = p65Var.M();
            if (zF2 || objM2 == uobVar) {
                objM2 = new g98(1, sdaVar, sda.class, "onUnlistedConfigurationChange", "onUnlistedConfigurationChange(Lcom/medium/android/postpublishing/data/PublicationFlowPostVisibility;)V", 0, 23);
                p65Var.j0(objM2);
            }
            qh6 qh6Var2 = (qh6) objM2;
            boolean zF3 = p65Var.f(sdaVar);
            Object objM3 = p65Var.M();
            if (zF3 || objM3 == uobVar) {
                g98 g98Var2 = new g98(1, sdaVar, sda.class, "onNotifySubscribersChange", "onNotifySubscribersChange(Z)V", 0, 24);
                p65Var.j0(g98Var2);
                objM3 = g98Var2;
            }
            xz5.u(ugaVar, wdaVar, (x45) qh6Var, (x45) ((qh6) objM3), (x45) qh6Var2, p65Var, 0);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object n(Object obj, Object obj2, Object obj3) {
        upc upcVar = (upc) this.b;
        wea weaVar = (wea) this.c;
        uda udaVar = (uda) this.d;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            d46.o((sea) upcVar.getValue(), new a1a(weaVar, 3, udaVar), w2g.G(w2g.B(o28.b, hy8Var), 0.0f, 12.0f, 0.0f, 0.0f, 13), p65Var, 0, 0);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r10v13 */
    /* JADX WARN: Type inference failed for: r8v12 */
    /* JADX WARN: Type inference failed for: r8v4 */
    /* JADX WARN: Type inference failed for: r8v5 */
    /* JADX WARN: Type inference failed for: r8v6 */
    /* JADX WARN: Type inference failed for: r8v7, types: [int] */
    private final Object o(Object obj, Object obj2, Object obj3) {
        ?? size;
        String strW;
        boolean z;
        Object obj4;
        List list;
        boolean z2;
        int i;
        int i2;
        sea seaVar = (sea) this.b;
        a1a a1aVar = (a1a) this.c;
        l78 l78Var = (l78) this.d;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xr6) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarJ);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarE = w2g.E(o28Var, 24.0f, 0.0f, 2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarE);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            String strR = vo7.R(p65Var, R.string.publication_flow_add_topics);
            sn3 sn3Var = kt7.c;
            kjd.b(strR, o28Var, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((eu7) p65Var.j(sn3Var)).g, p65Var, 48, 0, 65532);
            hp7.t(p65Var, jfc.e(o28Var, 12.0f));
            kjd.b(vo7.R(p65Var, R.string.publication_flow_add_topics_description), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((eu7) p65Var.j(sn3Var)).m, p65Var, 0, 0, 65534);
            hp7.t(p65Var, jfc.e(o28Var, 24.0f));
            boolean z3 = seaVar instanceof rea;
            if (z3) {
                p65Var.Y(342698197);
                List list2 = ((rea) seaVar).a;
                if (list2.isEmpty()) {
                    z2 = false;
                    strW = km4.w(p65Var, 342860048, R.string.add_a_topic, p65Var, false);
                } else {
                    z2 = false;
                    if (list2.size() >= 5) {
                        i = 343061796;
                        i2 = R.string.maximum_number_of_topic;
                    } else {
                        i = 343239178;
                        i2 = R.string.add_another_topic;
                    }
                    strW = km4.w(p65Var, i, i2, p65Var, false);
                }
                p65Var.p(z2);
                size = z2;
            } else {
                size = 0;
                strW = km4.w(p65Var, 343465664, R.string.add_a_topic, p65Var, false);
            }
            String str = strW;
            String str2 = (String) l78Var.getValue();
            r28 r28VarG = w2g.G(o28Var, 0.0f, 32.0f, 0.0f, 0.0f, 13);
            rea reaVar = z3 ? (rea) seaVar : null;
            if (reaVar != null && (list = reaVar.a) != null) {
                size = list.size();
            }
            ?? r10 = size;
            sk6 sk6Var = new sk6(0, (Boolean) null, 0, 3, PanasonicMakernoteDirectory.TAG_BURST_SPEED);
            boolean zF = p65Var.f(a1aVar);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                z = true;
                jea jeaVar = new jea(a1aVar, l78Var, true ? 1 : 0);
                p65Var.j0(jeaVar);
                obj4 = jeaVar;
            } else {
                z = true;
                obj4 = objM;
            }
            d46.l(str2, r10 == true ? 1 : 0, (x45) obj4, r28VarG, false, 0, sk6Var, null, str, p65Var, 805331328);
            b09.H(p65Var, z, z, z);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object r(Object obj, Object obj2, Object obj3) {
        tha thaVar = (tha) this.c;
        kv6 kv6Var = (kv6) this.b;
        jha jhaVar = (jha) this.d;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            r28 r28VarB = w2g.B(o28.b, hy8Var);
            if (thaVar instanceof sha) {
                p65Var.Y(-124507883);
                f76.m(kv6Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (thaVar instanceof pha) {
                p65Var.Y(-124504021);
                f76.j((pha) thaVar, jhaVar, kv6Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (thaVar instanceof qha) {
                p65Var.Y(-124495740);
                f76.k(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(thaVar instanceof rha)) {
                    throw ho2.L(p65Var, -124509930, false);
                }
                p65Var.Y(-124492518);
                f76.l((rha) thaVar, jhaVar, r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object t(Object obj, Object obj2, Object obj3) {
        kv6 kv6Var = (kv6) this.b;
        pha phaVar = (pha) this.c;
        jha jhaVar = (jha) this.d;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((hy0) obj).getClass();
        int i = 1;
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            r28 r28VarN = bgf.N(o28.b, "followers_list");
            boolean zF = p65Var.f(phaVar) | p65Var.f(jhaVar);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                objM = new pda(phaVar, i, jhaVar);
                p65Var.j0(objM);
            }
            k40.t(r28VarN, kv6Var, null, null, null, null, false, null, (x45) objM, p65Var, 6, 508);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object u(Object obj, Object obj2, Object obj3) {
        uob uobVar;
        final int i;
        final int i2;
        final sma smaVar = (sma) this.b;
        final nla nlaVar = (nla) this.c;
        final l78 l78Var = (l78) this.d;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xv1) obj).getClass();
        final int i3 = 1;
        final int i4 = 0;
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            et1 et1Var = smaVar.d;
            final int i5 = 4;
            uob uobVar2 = w12.a;
            if (et1Var != null) {
                p65Var.Y(1193957953);
                bq7 bq7Var = new bq7(vo7.R(p65Var, R.string.common_share_publication), false, null, null, 30);
                boolean zH = p65Var.h(nlaVar) | p65Var.f(smaVar);
                Object objM = p65Var.M();
                if (zH || objM == uobVar2) {
                    objM = new m45() { // from class: oma
                        @Override // defpackage.m45
                        public final Object invoke() throws PendingIntent.CanceledException {
                            int i6 = i5;
                            c1e c1eVar = c1e.a;
                            l78 l78Var2 = l78Var;
                            sma smaVar2 = smaVar;
                            nla nlaVar2 = nlaVar;
                            switch (i6) {
                                case 0:
                                    l78Var2.setValue(Boolean.FALSE);
                                    nlaVar2.c(smaVar2.h);
                                    break;
                                case 1:
                                    l78Var2.setValue(Boolean.FALSE);
                                    nlaVar2.a(smaVar2.h);
                                    break;
                                case 2:
                                    l78Var2.setValue(Boolean.FALSE);
                                    String str = smaVar2.a;
                                    SourceParameter sourceParameter = smaVar2.h;
                                    str.getClass();
                                    PublicationFragment publicationFragment = ((kia) nlaVar2.a).a;
                                    ((p13) publicationFragment.Z()).h(publicationFragment.S(), str, gp7.u(sourceParameter));
                                    break;
                                case 3:
                                    l78Var2.setValue(Boolean.FALSE);
                                    String str2 = smaVar2.a;
                                    SourceParameter sourceParameter2 = smaVar2.h;
                                    str2.getClass();
                                    PublicationFragment publicationFragment2 = ((kia) nlaVar2.a).a;
                                    publicationFragment2.Z();
                                    Context contextS = publicationFragment2.S();
                                    String strU = gp7.u(sourceParameter2);
                                    PublicationStatsReference.PubById pubById = new PublicationStatsReference.PubById(str2);
                                    Bundle bundle = new Bundle();
                                    bundle.putParcelable("bundle_info", new PubStatsFragment.BundleInfo(pubById, strU));
                                    m4.w(contextS, R.id.pubStatsFragments, bundle, null, 12);
                                    break;
                                default:
                                    l78Var2.setValue(Boolean.FALSE);
                                    et1 et1Var2 = smaVar2.d;
                                    et1Var2.getClass();
                                    nna nnaVar = nlaVar2.b;
                                    String str3 = et1Var2.b;
                                    str3.getClass();
                                    ax2 ax2Var = nnaVar.p;
                                    String str4 = nnaVar.c;
                                    String strU2 = gp7.u(nnaVar.e());
                                    String str5 = nnaVar.z;
                                    ax2Var.getClass();
                                    str4.getClass();
                                    str5.getClass();
                                    rqd.a(ax2Var.b, new CollectionShare(null, str3, null, 5, null), str4, strU2, false, null, str5, 24);
                                    Context contextS2 = ((kia) nlaVar2.a).a.S();
                                    String str6 = et1Var2.c;
                                    String string = contextS2.getString(R.string.share_collection_content, str6, et1Var2.a.toString());
                                    string.getClass();
                                    String string2 = contextS2.getString(R.string.share_collection_email_subject, str6);
                                    string2.getClass();
                                    String string3 = contextS2.getString(R.string.share_collection_prompt);
                                    string3.getClass();
                                    o2b o2bVar = new o2b(contextS2);
                                    o2bVar.d = string3;
                                    Intent intent = (Intent) o2bVar.c;
                                    intent.setType("text/plain");
                                    intent.putExtra("android.intent.extra.SUBJECT", string2);
                                    intent.putExtra("android.intent.extra.TEXT", (CharSequence) string);
                                    o2bVar.K();
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                }
                uobVar = uobVar2;
                aq7.b(bq7Var, (m45) objM, null, 0L, 0L, p65Var, 0, 28);
            } else {
                uobVar = uobVar2;
                p65Var.Y(1190301844);
            }
            p65Var.p(false);
            int i6 = qma.a[smaVar.e.ordinal()];
            if (i6 == 1) {
                i = 3;
                i2 = 2;
                p65Var.Y(1194599839);
                bq7 bq7Var2 = new bq7(vo7.R(p65Var, R.string.common_unmute_publication), false, null, null, 30);
                boolean zH2 = p65Var.h(nlaVar) | p65Var.f(smaVar);
                Object objM2 = p65Var.M();
                if (zH2 || objM2 == uobVar) {
                    objM2 = new m45() { // from class: oma
                        @Override // defpackage.m45
                        public final Object invoke() throws PendingIntent.CanceledException {
                            int i62 = i4;
                            c1e c1eVar = c1e.a;
                            l78 l78Var2 = l78Var;
                            sma smaVar2 = smaVar;
                            nla nlaVar2 = nlaVar;
                            switch (i62) {
                                case 0:
                                    l78Var2.setValue(Boolean.FALSE);
                                    nlaVar2.c(smaVar2.h);
                                    break;
                                case 1:
                                    l78Var2.setValue(Boolean.FALSE);
                                    nlaVar2.a(smaVar2.h);
                                    break;
                                case 2:
                                    l78Var2.setValue(Boolean.FALSE);
                                    String str = smaVar2.a;
                                    SourceParameter sourceParameter = smaVar2.h;
                                    str.getClass();
                                    PublicationFragment publicationFragment = ((kia) nlaVar2.a).a;
                                    ((p13) publicationFragment.Z()).h(publicationFragment.S(), str, gp7.u(sourceParameter));
                                    break;
                                case 3:
                                    l78Var2.setValue(Boolean.FALSE);
                                    String str2 = smaVar2.a;
                                    SourceParameter sourceParameter2 = smaVar2.h;
                                    str2.getClass();
                                    PublicationFragment publicationFragment2 = ((kia) nlaVar2.a).a;
                                    publicationFragment2.Z();
                                    Context contextS = publicationFragment2.S();
                                    String strU = gp7.u(sourceParameter2);
                                    PublicationStatsReference.PubById pubById = new PublicationStatsReference.PubById(str2);
                                    Bundle bundle = new Bundle();
                                    bundle.putParcelable("bundle_info", new PubStatsFragment.BundleInfo(pubById, strU));
                                    m4.w(contextS, R.id.pubStatsFragments, bundle, null, 12);
                                    break;
                                default:
                                    l78Var2.setValue(Boolean.FALSE);
                                    et1 et1Var2 = smaVar2.d;
                                    et1Var2.getClass();
                                    nna nnaVar = nlaVar2.b;
                                    String str3 = et1Var2.b;
                                    str3.getClass();
                                    ax2 ax2Var = nnaVar.p;
                                    String str4 = nnaVar.c;
                                    String strU2 = gp7.u(nnaVar.e());
                                    String str5 = nnaVar.z;
                                    ax2Var.getClass();
                                    str4.getClass();
                                    str5.getClass();
                                    rqd.a(ax2Var.b, new CollectionShare(null, str3, null, 5, null), str4, strU2, false, null, str5, 24);
                                    Context contextS2 = ((kia) nlaVar2.a).a.S();
                                    String str6 = et1Var2.c;
                                    String string = contextS2.getString(R.string.share_collection_content, str6, et1Var2.a.toString());
                                    string.getClass();
                                    String string2 = contextS2.getString(R.string.share_collection_email_subject, str6);
                                    string2.getClass();
                                    String string3 = contextS2.getString(R.string.share_collection_prompt);
                                    string3.getClass();
                                    o2b o2bVar = new o2b(contextS2);
                                    o2bVar.d = string3;
                                    Intent intent = (Intent) o2bVar.c;
                                    intent.setType("text/plain");
                                    intent.putExtra("android.intent.extra.SUBJECT", string2);
                                    intent.putExtra("android.intent.extra.TEXT", (CharSequence) string);
                                    o2bVar.K();
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                aq7.b(bq7Var2, (m45) objM2, null, 0L, 0L, p65Var, 0, 28);
                p65Var.p(false);
            } else if (i6 == 2) {
                p65Var.Y(1195105635);
                bq7 bq7Var3 = new bq7(vo7.R(p65Var, R.string.common_mute_publication), false, null, null, 30);
                boolean zH3 = p65Var.h(nlaVar) | p65Var.f(smaVar);
                Object objM3 = p65Var.M();
                if (zH3 || objM3 == uobVar) {
                    objM3 = new m45() { // from class: oma
                        @Override // defpackage.m45
                        public final Object invoke() throws PendingIntent.CanceledException {
                            int i62 = i3;
                            c1e c1eVar = c1e.a;
                            l78 l78Var2 = l78Var;
                            sma smaVar2 = smaVar;
                            nla nlaVar2 = nlaVar;
                            switch (i62) {
                                case 0:
                                    l78Var2.setValue(Boolean.FALSE);
                                    nlaVar2.c(smaVar2.h);
                                    break;
                                case 1:
                                    l78Var2.setValue(Boolean.FALSE);
                                    nlaVar2.a(smaVar2.h);
                                    break;
                                case 2:
                                    l78Var2.setValue(Boolean.FALSE);
                                    String str = smaVar2.a;
                                    SourceParameter sourceParameter = smaVar2.h;
                                    str.getClass();
                                    PublicationFragment publicationFragment = ((kia) nlaVar2.a).a;
                                    ((p13) publicationFragment.Z()).h(publicationFragment.S(), str, gp7.u(sourceParameter));
                                    break;
                                case 3:
                                    l78Var2.setValue(Boolean.FALSE);
                                    String str2 = smaVar2.a;
                                    SourceParameter sourceParameter2 = smaVar2.h;
                                    str2.getClass();
                                    PublicationFragment publicationFragment2 = ((kia) nlaVar2.a).a;
                                    publicationFragment2.Z();
                                    Context contextS = publicationFragment2.S();
                                    String strU = gp7.u(sourceParameter2);
                                    PublicationStatsReference.PubById pubById = new PublicationStatsReference.PubById(str2);
                                    Bundle bundle = new Bundle();
                                    bundle.putParcelable("bundle_info", new PubStatsFragment.BundleInfo(pubById, strU));
                                    m4.w(contextS, R.id.pubStatsFragments, bundle, null, 12);
                                    break;
                                default:
                                    l78Var2.setValue(Boolean.FALSE);
                                    et1 et1Var2 = smaVar2.d;
                                    et1Var2.getClass();
                                    nna nnaVar = nlaVar2.b;
                                    String str3 = et1Var2.b;
                                    str3.getClass();
                                    ax2 ax2Var = nnaVar.p;
                                    String str4 = nnaVar.c;
                                    String strU2 = gp7.u(nnaVar.e());
                                    String str5 = nnaVar.z;
                                    ax2Var.getClass();
                                    str4.getClass();
                                    str5.getClass();
                                    rqd.a(ax2Var.b, new CollectionShare(null, str3, null, 5, null), str4, strU2, false, null, str5, 24);
                                    Context contextS2 = ((kia) nlaVar2.a).a.S();
                                    String str6 = et1Var2.c;
                                    String string = contextS2.getString(R.string.share_collection_content, str6, et1Var2.a.toString());
                                    string.getClass();
                                    String string2 = contextS2.getString(R.string.share_collection_email_subject, str6);
                                    string2.getClass();
                                    String string3 = contextS2.getString(R.string.share_collection_prompt);
                                    string3.getClass();
                                    o2b o2bVar = new o2b(contextS2);
                                    o2bVar.d = string3;
                                    Intent intent = (Intent) o2bVar.c;
                                    intent.setType("text/plain");
                                    intent.putExtra("android.intent.extra.SUBJECT", string2);
                                    intent.putExtra("android.intent.extra.TEXT", (CharSequence) string);
                                    o2bVar.K();
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM3);
                }
                i2 = 2;
                i = 3;
                aq7.b(bq7Var3, (m45) objM3, null, 0L, 0L, p65Var, 0, 28);
                p65Var.p(false);
            } else {
                if (i6 != 3 && i6 != 4) {
                    throw ho2.L(p65Var, 454175831, false);
                }
                p65Var.Y(454211250);
                p65Var.p(false);
                i = 3;
                i2 = 2;
            }
            if (smaVar.g) {
                p65Var.Y(1195739988);
                bq7 bq7Var4 = new bq7(vo7.R(p65Var, R.string.publication_view_featured_stories), false, null, null, 30);
                boolean zH4 = p65Var.h(nlaVar) | p65Var.f(smaVar);
                Object objM4 = p65Var.M();
                if (zH4 || objM4 == uobVar) {
                    objM4 = new m45() { // from class: oma
                        @Override // defpackage.m45
                        public final Object invoke() throws PendingIntent.CanceledException {
                            int i62 = i2;
                            c1e c1eVar = c1e.a;
                            l78 l78Var2 = l78Var;
                            sma smaVar2 = smaVar;
                            nla nlaVar2 = nlaVar;
                            switch (i62) {
                                case 0:
                                    l78Var2.setValue(Boolean.FALSE);
                                    nlaVar2.c(smaVar2.h);
                                    break;
                                case 1:
                                    l78Var2.setValue(Boolean.FALSE);
                                    nlaVar2.a(smaVar2.h);
                                    break;
                                case 2:
                                    l78Var2.setValue(Boolean.FALSE);
                                    String str = smaVar2.a;
                                    SourceParameter sourceParameter = smaVar2.h;
                                    str.getClass();
                                    PublicationFragment publicationFragment = ((kia) nlaVar2.a).a;
                                    ((p13) publicationFragment.Z()).h(publicationFragment.S(), str, gp7.u(sourceParameter));
                                    break;
                                case 3:
                                    l78Var2.setValue(Boolean.FALSE);
                                    String str2 = smaVar2.a;
                                    SourceParameter sourceParameter2 = smaVar2.h;
                                    str2.getClass();
                                    PublicationFragment publicationFragment2 = ((kia) nlaVar2.a).a;
                                    publicationFragment2.Z();
                                    Context contextS = publicationFragment2.S();
                                    String strU = gp7.u(sourceParameter2);
                                    PublicationStatsReference.PubById pubById = new PublicationStatsReference.PubById(str2);
                                    Bundle bundle = new Bundle();
                                    bundle.putParcelable("bundle_info", new PubStatsFragment.BundleInfo(pubById, strU));
                                    m4.w(contextS, R.id.pubStatsFragments, bundle, null, 12);
                                    break;
                                default:
                                    l78Var2.setValue(Boolean.FALSE);
                                    et1 et1Var2 = smaVar2.d;
                                    et1Var2.getClass();
                                    nna nnaVar = nlaVar2.b;
                                    String str3 = et1Var2.b;
                                    str3.getClass();
                                    ax2 ax2Var = nnaVar.p;
                                    String str4 = nnaVar.c;
                                    String strU2 = gp7.u(nnaVar.e());
                                    String str5 = nnaVar.z;
                                    ax2Var.getClass();
                                    str4.getClass();
                                    str5.getClass();
                                    rqd.a(ax2Var.b, new CollectionShare(null, str3, null, 5, null), str4, strU2, false, null, str5, 24);
                                    Context contextS2 = ((kia) nlaVar2.a).a.S();
                                    String str6 = et1Var2.c;
                                    String string = contextS2.getString(R.string.share_collection_content, str6, et1Var2.a.toString());
                                    string.getClass();
                                    String string2 = contextS2.getString(R.string.share_collection_email_subject, str6);
                                    string2.getClass();
                                    String string3 = contextS2.getString(R.string.share_collection_prompt);
                                    string3.getClass();
                                    o2b o2bVar = new o2b(contextS2);
                                    o2bVar.d = string3;
                                    Intent intent = (Intent) o2bVar.c;
                                    intent.setType("text/plain");
                                    intent.putExtra("android.intent.extra.SUBJECT", string2);
                                    intent.putExtra("android.intent.extra.TEXT", (CharSequence) string);
                                    o2bVar.K();
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM4);
                }
                aq7.b(bq7Var4, (m45) objM4, null, 0L, 0L, p65Var, 0, 28);
            } else {
                p65Var.Y(1190301844);
            }
            p65Var.p(false);
            if (smaVar.f) {
                p65Var.Y(1196349696);
                bq7 bq7Var5 = new bq7(vo7.R(p65Var, R.string.common_views_stats_collection), false, null, null, 30);
                boolean zH5 = p65Var.h(nlaVar) | p65Var.f(smaVar);
                Object objM5 = p65Var.M();
                if (zH5 || objM5 == uobVar) {
                    objM5 = new m45() { // from class: oma
                        @Override // defpackage.m45
                        public final Object invoke() throws PendingIntent.CanceledException {
                            int i62 = i;
                            c1e c1eVar = c1e.a;
                            l78 l78Var2 = l78Var;
                            sma smaVar2 = smaVar;
                            nla nlaVar2 = nlaVar;
                            switch (i62) {
                                case 0:
                                    l78Var2.setValue(Boolean.FALSE);
                                    nlaVar2.c(smaVar2.h);
                                    break;
                                case 1:
                                    l78Var2.setValue(Boolean.FALSE);
                                    nlaVar2.a(smaVar2.h);
                                    break;
                                case 2:
                                    l78Var2.setValue(Boolean.FALSE);
                                    String str = smaVar2.a;
                                    SourceParameter sourceParameter = smaVar2.h;
                                    str.getClass();
                                    PublicationFragment publicationFragment = ((kia) nlaVar2.a).a;
                                    ((p13) publicationFragment.Z()).h(publicationFragment.S(), str, gp7.u(sourceParameter));
                                    break;
                                case 3:
                                    l78Var2.setValue(Boolean.FALSE);
                                    String str2 = smaVar2.a;
                                    SourceParameter sourceParameter2 = smaVar2.h;
                                    str2.getClass();
                                    PublicationFragment publicationFragment2 = ((kia) nlaVar2.a).a;
                                    publicationFragment2.Z();
                                    Context contextS = publicationFragment2.S();
                                    String strU = gp7.u(sourceParameter2);
                                    PublicationStatsReference.PubById pubById = new PublicationStatsReference.PubById(str2);
                                    Bundle bundle = new Bundle();
                                    bundle.putParcelable("bundle_info", new PubStatsFragment.BundleInfo(pubById, strU));
                                    m4.w(contextS, R.id.pubStatsFragments, bundle, null, 12);
                                    break;
                                default:
                                    l78Var2.setValue(Boolean.FALSE);
                                    et1 et1Var2 = smaVar2.d;
                                    et1Var2.getClass();
                                    nna nnaVar = nlaVar2.b;
                                    String str3 = et1Var2.b;
                                    str3.getClass();
                                    ax2 ax2Var = nnaVar.p;
                                    String str4 = nnaVar.c;
                                    String strU2 = gp7.u(nnaVar.e());
                                    String str5 = nnaVar.z;
                                    ax2Var.getClass();
                                    str4.getClass();
                                    str5.getClass();
                                    rqd.a(ax2Var.b, new CollectionShare(null, str3, null, 5, null), str4, strU2, false, null, str5, 24);
                                    Context contextS2 = ((kia) nlaVar2.a).a.S();
                                    String str6 = et1Var2.c;
                                    String string = contextS2.getString(R.string.share_collection_content, str6, et1Var2.a.toString());
                                    string.getClass();
                                    String string2 = contextS2.getString(R.string.share_collection_email_subject, str6);
                                    string2.getClass();
                                    String string3 = contextS2.getString(R.string.share_collection_prompt);
                                    string3.getClass();
                                    o2b o2bVar = new o2b(contextS2);
                                    o2bVar.d = string3;
                                    Intent intent = (Intent) o2bVar.c;
                                    intent.setType("text/plain");
                                    intent.putExtra("android.intent.extra.SUBJECT", string2);
                                    intent.putExtra("android.intent.extra.TEXT", (CharSequence) string);
                                    o2bVar.K();
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM5);
                }
                aq7.b(bq7Var5, (m45) objM5, null, 0L, 0L, p65Var, 0, 28);
            } else {
                p65Var.Y(1190301844);
            }
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object v(Object obj, Object obj2, Object obj3) {
        yna ynaVar = (yna) this.b;
        obe obeVar = (obe) this.c;
        sna snaVar = (sna) this.d;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            r28 r28VarB = w2g.B(o28.b, hy8Var);
            if (ynaVar instanceof xna) {
                p65Var.Y(-1554822211);
                nk7.J((xna) ynaVar, obeVar, snaVar, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (ynaVar instanceof wna) {
                p65Var.Y(-1554813815);
                nk7.M(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (ynaVar instanceof vna) {
                p65Var.Y(-1554809042);
                nk7.L((vna) ynaVar, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(ynaVar instanceof una)) {
                    throw ho2.L(p65Var, -1554824293, false);
                }
                p65Var.Y(-1554803161);
                nk7.K(r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object w(Object obj, Object obj2, Object obj3) {
        kv6 kv6Var = (kv6) this.b;
        xna xnaVar = (xna) this.c;
        obe obeVar = (obe) this.d;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((hy0) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            jy8 jy8VarH = w2g.h(0.0f, 0.0f, 0.0f, 24.0f, 7);
            boolean zF = p65Var.f(xnaVar) | p65Var.f(obeVar);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                objM = new pda(xnaVar, 4, obeVar);
                p65Var.j0(objM);
            }
            k40.t(null, kv6Var, jy8VarH, null, null, null, false, null, (x45) objM, p65Var, 384, 505);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object x(Object obj, Object obj2, Object obj3) {
        oj8 oj8Var = (oj8) this.b;
        x45 x45Var = (x45) this.c;
        l78 l78Var = (l78) this.d;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xv1) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            for (NotificationNetwork notificationNetwork : NotificationNetwork.getEntries()) {
                bq7 bq7Var = new bq7(qb8.b0(notificationNetwork, p65Var), oj8Var.c == notificationNetwork, null, null, 28);
                boolean zF = p65Var.f(x45Var) | p65Var.d(notificationNetwork.ordinal());
                Object objM = p65Var.M();
                if (zF || objM == w12.a) {
                    objM = new i16(x45Var, notificationNetwork, l78Var, 19);
                    p65Var.j0(objM);
                }
                aq7.b(bq7Var, (m45) objM, null, 0L, 0L, p65Var, 0, 28);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        Object value;
        boolean z;
        boolean z2;
        boolean z3;
        int i = this.a;
        o28 o28Var = o28.b;
        uob uobVar = w12.a;
        c1e c1eVar = c1e.a;
        Object obj4 = this.d;
        Object obj5 = this.c;
        Object obj6 = this.b;
        switch (i) {
            case 0:
                kv6 kv6Var = (kv6) obj6;
                lx4 lx4Var = (lx4) obj5;
                cs1 cs1Var = (cs1) obj4;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    r28 r28VarN = bgf.N(o28Var, "following_publications_list");
                    boolean zF = p65Var.f(lx4Var) | p65Var.f(cs1Var);
                    Object objM = p65Var.M();
                    if (zF || objM == uobVar) {
                        objM = new si3(lx4Var, 12, cs1Var);
                        p65Var.j0(objM);
                    }
                    k40.t(r28VarN, kv6Var, null, null, null, null, false, null, (x45) objM, p65Var, 6, 508);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                iza izaVar = (iza) obj6;
                zx4 zx4Var = (zx4) obj5;
                String str = (String) obj4;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    jp7 jp7Var = (jp7) p65Var2.j(kt7.a);
                    o28 o28Var2 = o28.b;
                    r28 r28VarJ = ka1.j(jp7Var, o28Var2, 3, 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var2.T;
                    int i2 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var2.l();
                    r28 r28VarR = gx1.R(p65Var2, r28VarJ);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var2, cuVar, zk7VarC);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var2, cuVar2, i89VarL);
                    Integer numValueOf = Integer.valueOf(i2);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var2, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var2, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var2, cuVar4, r28VarR);
                    r28 r28VarD = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j2 = p65Var2.T;
                    int i3 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var2.l();
                    r28 r28VarR2 = gx1.R(p65Var2, r28VarD);
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, cuVar, zk7VarC2);
                    tp7.B(p65Var2, cuVar2, i89VarL2);
                    ka1.z(i3, p65Var2, cuVar3, p65Var2, fnVar);
                    tp7.B(p65Var2, cuVar4, r28VarR2);
                    String strQ = vo7.Q(R.string.see_all, new Object[]{Integer.valueOf(((hza) izaVar).a)}, p65Var2);
                    boolean zF2 = p65Var2.f(zx4Var) | p65Var2.f(str) | p65Var2.f(izaVar);
                    Object objM2 = p65Var2.M();
                    if (zF2 || objM2 == uobVar) {
                        objM2 = new le0(zx4Var, str, izaVar, 22);
                        p65Var2.j0(objM2);
                    }
                    n01.O(strQ, (m45) objM2, null, p65Var2, 0);
                    p65Var2.p(true);
                    p65Var2.p(true);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
                dza dzaVar = (dza) obj6;
                zx4 zx4Var2 = (zx4) obj5;
                String str2 = (String) obj4;
                x12 x12Var3 = (x12) obj2;
                int iIntValue3 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 17) != 16)) {
                    jp7 jp7Var2 = (jp7) p65Var3.j(kt7.a);
                    o28 o28Var3 = o28.b;
                    r28 r28VarJ2 = ka1.j(jp7Var2, o28Var3, 3, 1.0f);
                    zk7 zk7VarC3 = dy0.c(z46.h, false);
                    long j3 = p65Var3.T;
                    int i4 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL3 = p65Var3.l();
                    r28 r28VarR3 = gx1.R(p65Var3, r28VarJ2);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var2);
                    } else {
                        p65Var3.m0();
                    }
                    cu cuVar5 = q12.f;
                    tp7.B(p65Var3, cuVar5, zk7VarC3);
                    cu cuVar6 = q12.e;
                    tp7.B(p65Var3, cuVar6, i89VarL3);
                    Integer numValueOf2 = Integer.valueOf(i4);
                    cu cuVar7 = q12.g;
                    tp7.B(p65Var3, cuVar7, numValueOf2);
                    fn fnVar2 = q12.h;
                    tp7.y(p65Var3, fnVar2);
                    cu cuVar8 = q12.d;
                    tp7.B(p65Var3, cuVar8, r28VarR3);
                    r28 r28VarD2 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC4 = dy0.c(z46.d, false);
                    long j4 = p65Var3.T;
                    int i5 = (int) (j4 ^ (j4 >>> 32));
                    i89 i89VarL4 = p65Var3.l();
                    r28 r28VarR4 = gx1.R(p65Var3, r28VarD2);
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var2);
                    } else {
                        p65Var3.m0();
                    }
                    tp7.B(p65Var3, cuVar5, zk7VarC4);
                    tp7.B(p65Var3, cuVar6, i89VarL4);
                    ka1.z(i5, p65Var3, cuVar7, p65Var3, fnVar2);
                    tp7.B(p65Var3, cuVar8, r28VarR4);
                    String strQ2 = vo7.Q(R.string.see_all, new Object[]{Integer.valueOf(((aza) dzaVar).a)}, p65Var3);
                    boolean zF3 = p65Var3.f(zx4Var2) | p65Var3.f(str2) | p65Var3.f(dzaVar);
                    Object objM3 = p65Var3.M();
                    if (zF3 || objM3 == uobVar) {
                        objM3 = new le0(zx4Var2, str2, dzaVar, 23);
                        p65Var3.j0(objM3);
                    }
                    n01.O(strQ2, (m45) objM3, null, p65Var3, 0);
                    p65Var3.p(true);
                    p65Var3.p(true);
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            case 3:
                mza mzaVar = (mza) obj6;
                zx4 zx4Var3 = (zx4) obj5;
                String str3 = (String) obj4;
                x12 x12Var4 = (x12) obj2;
                int iIntValue4 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(iIntValue4 & 1, (iIntValue4 & 17) != 16)) {
                    jp7 jp7Var3 = (jp7) p65Var4.j(kt7.a);
                    o28 o28Var4 = o28.b;
                    r28 r28VarJ3 = ka1.j(jp7Var3, o28Var4, 3, 1.0f);
                    zk7 zk7VarC5 = dy0.c(z46.h, false);
                    long j5 = p65Var4.T;
                    int i6 = (int) (j5 ^ (j5 >>> 32));
                    i89 i89VarL5 = p65Var4.l();
                    r28 r28VarR5 = gx1.R(p65Var4, r28VarJ3);
                    r12.W.getClass();
                    ot2 ot2Var3 = q12.b;
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var3);
                    } else {
                        p65Var4.m0();
                    }
                    cu cuVar9 = q12.f;
                    tp7.B(p65Var4, cuVar9, zk7VarC5);
                    cu cuVar10 = q12.e;
                    tp7.B(p65Var4, cuVar10, i89VarL5);
                    Integer numValueOf3 = Integer.valueOf(i6);
                    cu cuVar11 = q12.g;
                    tp7.B(p65Var4, cuVar11, numValueOf3);
                    fn fnVar3 = q12.h;
                    tp7.y(p65Var4, fnVar3);
                    cu cuVar12 = q12.d;
                    tp7.B(p65Var4, cuVar12, r28VarR5);
                    r28 r28VarD3 = jfc.d(jfc.o(o28Var4, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC6 = dy0.c(z46.d, false);
                    long j6 = p65Var4.T;
                    int i7 = (int) (j6 ^ (j6 >>> 32));
                    i89 i89VarL6 = p65Var4.l();
                    r28 r28VarR6 = gx1.R(p65Var4, r28VarD3);
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var3);
                    } else {
                        p65Var4.m0();
                    }
                    tp7.B(p65Var4, cuVar9, zk7VarC6);
                    tp7.B(p65Var4, cuVar10, i89VarL6);
                    ka1.z(i7, p65Var4, cuVar11, p65Var4, fnVar3);
                    tp7.B(p65Var4, cuVar12, r28VarR6);
                    String strQ3 = vo7.Q(R.string.see_all, new Object[]{Integer.valueOf(((lza) mzaVar).a)}, p65Var4);
                    boolean zF4 = p65Var4.f(zx4Var3) | p65Var4.f(str3) | p65Var4.f(mzaVar);
                    Object objM4 = p65Var4.M();
                    if (zF4 || objM4 == uobVar) {
                        objM4 = new le0(zx4Var3, str3, mzaVar, 25);
                        p65Var4.j0(objM4);
                    }
                    n01.O(strQ3, (m45) objM4, null, p65Var4, 0);
                    p65Var4.p(true);
                    p65Var4.p(true);
                } else {
                    p65Var4.S();
                }
                return c1eVar;
            case 4:
                nza nzaVar = (nza) obj6;
                zx4 zx4Var4 = (zx4) obj5;
                l78 l78Var = (l78) obj4;
                x12 x12Var5 = (x12) obj2;
                int iIntValue5 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var5 = (p65) x12Var5;
                if (p65Var5.P(iIntValue5 & 1, (iIntValue5 & 17) != 16)) {
                    for (eza ezaVar : eza.getEntries()) {
                        bq7 bq7Var = new bq7(vo7.R(p65Var5, ezaVar.getTitleResId()), ezaVar == nzaVar.b, null, null, 28);
                        r28 r28VarN2 = bgf.N(o28Var, "refine_recommendation_filter_item_" + ezaVar.name());
                        boolean zF5 = p65Var5.f(zx4Var4) | p65Var5.d(ezaVar.ordinal());
                        Object objM5 = p65Var5.M();
                        if (zF5 || objM5 == uobVar) {
                            objM5 = new le0(zx4Var4, ezaVar, l78Var, 24);
                            p65Var5.j0(objM5);
                        }
                        aq7.b(bq7Var, (m45) objM5, r28VarN2, 0L, 0L, p65Var5, 0, 24);
                    }
                } else {
                    p65Var5.S();
                }
                return c1eVar;
            case 5:
                ul ulVar = (ul) obj6;
                ub0 ub0Var = (ub0) obj5;
                i45 i45Var = (i45) obj4;
                jy0 jy0Var = (jy0) obj;
                x12 x12Var6 = (x12) obj2;
                int iIntValue6 = ((Integer) obj3).intValue();
                jy0Var.getClass();
                if ((iIntValue6 & 6) == 0) {
                    iIntValue6 |= ((p65) x12Var6).f(jy0Var) ? 4 : 2;
                }
                p65 p65Var6 = (p65) x12Var6;
                if (p65Var6.P(iIntValue6 & 1, (iIntValue6 & 19) != 18)) {
                    float fG = f72.g(jy0Var.b);
                    boolean zC = p65Var6.c(fG);
                    Object objM6 = p65Var6.M();
                    if (zC || objM6 == uobVar) {
                        objM6 = new fu0(1, fG);
                        p65Var6.j0(objM6);
                    }
                    il3 il3Var = new il3();
                    ((x45) objM6).invoke(il3Var);
                    float[] fArr = il3Var.b;
                    ArrayList arrayList = il3Var.a;
                    int size = arrayList.size();
                    hlg.u(size, fArr.length);
                    float[] fArrCopyOfRange = Arrays.copyOfRange(fArr, 0, size);
                    fArrCopyOfRange.getClass();
                    ry2 ry2Var = new ry2(arrayList, fArrCopyOfRange);
                    g49 g49Var = ulVar.f;
                    k49 k49Var = ulVar.c;
                    k49 k49Var2 = ulVar.h;
                    j83 j83Var = ulVar.e;
                    if (Float.isNaN(g49Var.g()) || (value = ry2Var.a(ulVar.f.g())) == null) {
                        value = j83Var.getValue();
                    }
                    if (!g76.L(ulVar.b(), ry2Var)) {
                        ulVar.i.setValue(ry2Var);
                        z78 z78Var = ulVar.b;
                        a98 a98Var = z78Var.b;
                        a98 a98Var2 = z78Var.b;
                        boolean zE = a98Var.e(null);
                        if (zE) {
                            try {
                                pl plVar = ulVar.j;
                                float fC = ulVar.b().c(value);
                                if (!Float.isNaN(fC)) {
                                    plVar.a(fC, 0.0f);
                                    k49Var2.setValue(null);
                                }
                                k49Var.setValue(value);
                                ulVar.d.setValue(value);
                                a98Var2.f(null);
                            } catch (Throwable th) {
                                a98Var2.f(null);
                                throw th;
                            }
                        }
                        if (!zE) {
                            k49Var2.setValue(value);
                        }
                    }
                    r28 r28VarO = jfc.o(o28.b, 0.0f, 0.0f, 840.0f, 0.0f, 11);
                    hw8 hw8Var = hw8.Vertical;
                    boolean z4 = k49Var.getValue() == j45.Expanded;
                    cud cudVar = gk.a;
                    Object objM7 = p65Var6.M();
                    if (objM7 == uobVar) {
                        objM7 = new cq4(21);
                        p65Var6.j0(objM7);
                    }
                    x45 x45Var = (x45) objM7;
                    cud cudVar2 = gk.a;
                    cud cudVar3 = gk.a;
                    m73 m73Var = (m73) p65Var6.j(z22.h);
                    boolean zF6 = p65Var6.f(m73Var) | p65Var6.f(cudVar3);
                    Object objM8 = p65Var6.M();
                    if (zF6 || objM8 == uobVar) {
                        z = false;
                        objM8 = new iic(new m50(ulVar, x45Var, new ik(m73Var, 0), 8), vx0.b, cudVar3);
                        p65Var6.j0(objM8);
                    } else {
                        z = false;
                    }
                    r28 r28VarC = vx0.C(r28VarO, ulVar, hw8Var, z4, (iic) objM8);
                    zk7 zk7VarC7 = dy0.c(z46.d, z);
                    long j7 = p65Var6.T;
                    int i8 = (int) (j7 ^ (j7 >>> 32));
                    i89 i89VarL7 = p65Var6.l();
                    r28 r28VarR7 = gx1.R(p65Var6, r28VarC);
                    r12.W.getClass();
                    ot2 ot2Var4 = q12.b;
                    p65Var6.c0();
                    if (p65Var6.S) {
                        p65Var6.k(ot2Var4);
                    } else {
                        p65Var6.m0();
                    }
                    tp7.B(p65Var6, q12.f, zk7VarC7);
                    tp7.B(p65Var6, q12.e, i89VarL7);
                    tp7.B(p65Var6, q12.g, Integer.valueOf(i8));
                    tp7.y(p65Var6, q12.h);
                    tp7.B(p65Var6, q12.d, r28VarR7);
                    Object objM9 = p65Var6.M();
                    if (objM9 == uobVar) {
                        objM9 = new ff4(11, ulVar);
                        p65Var6.j0(objM9);
                    }
                    vc2.x(ub0Var, i45Var, (x45) objM9, null, p65Var6, 3072);
                    p65Var6.p(true);
                } else {
                    p65Var6.S();
                }
                return c1eVar;
            case 6:
                j57 j57Var = (j57) obj6;
                m45 m45Var = (m45) obj5;
                b55 b55Var = (b55) obj4;
                x12 x12Var7 = (x12) obj2;
                int iIntValue7 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var7 = (p65) x12Var7;
                if (p65Var7.P(iIntValue7 & 1, (iIntValue7 & 17) != 16)) {
                    o28 o28Var5 = o28.b;
                    r28 r28VarD4 = jfc.d(w2g.E(w2g.G(o28Var5, 4.0f, 0.0f, 0.0f, 0.0f, 14), 0.0f, 14.0f, 1), 1.0f);
                    wv1 wv1VarA = uv1.a(new h70(24.0f, true, new z10(21)), z46.q, p65Var7, 54);
                    long j8 = p65Var7.T;
                    int i9 = (int) (j8 ^ (j8 >>> 32));
                    i89 i89VarL8 = p65Var7.l();
                    r28 r28VarR8 = gx1.R(p65Var7, r28VarD4);
                    r12.W.getClass();
                    ot2 ot2Var5 = q12.b;
                    p65Var7.c0();
                    if (p65Var7.S) {
                        p65Var7.k(ot2Var5);
                    } else {
                        p65Var7.m0();
                    }
                    tp7.B(p65Var7, q12.f, wv1VarA);
                    tp7.B(p65Var7, q12.e, i89VarL8);
                    tp7.B(p65Var7, q12.g, Integer.valueOf(i9));
                    tp7.y(p65Var7, q12.h);
                    tp7.B(p65Var7, q12.d, r28VarR8);
                    jjd.b(vo7.R(p65Var7, R.string.responses_load_more_failed), w2g.E(o28Var5, 24.0f, 0.0f, 2), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var7.j(jt7.c)).m, p65Var7, 48, 0, 131068);
                    boolean zF7 = p65Var7.f(j57Var) | p65Var7.f(m45Var) | p65Var7.f(b55Var);
                    Object objM10 = p65Var7.M();
                    if (zF7 || objM10 == uobVar) {
                        objM10 = new z23(j57Var, m45Var, b55Var);
                        p65Var7.j0(objM10);
                    }
                    fo7.r((m45) objM10, vo7.R(p65Var7, R.string.common_try_again), xn7.M, bgf.N(o28Var5, "load_more_error_responses_button"), false, p65Var7, 3456, 16);
                    p65Var7.p(true);
                } else {
                    p65Var7.S();
                }
                return c1eVar;
            case 7:
                ub0 ub0Var2 = (ub0) obj6;
                MainActivity mainActivity = (MainActivity) obj5;
                upc upcVar = (upc) obj4;
                x12 x12Var8 = (x12) obj2;
                ((Integer) obj3).getClass();
                int i10 = MainActivity.H;
                ((lw) obj).getClass();
                p65 p65Var8 = (p65) x12Var8;
                r28 r28VarA0 = flb.a0(jfc.d(o28Var, 1.0f), ((zo7) p65Var8.j(kt7.b)).a, rv8.r);
                wv1 wv1VarA2 = uv1.a(qb8.c, z46.p, x12Var8, 0);
                long j9 = p65Var8.T;
                int i11 = (int) (j9 ^ (j9 >>> 32));
                i89 i89VarL9 = p65Var8.l();
                r28 r28VarR9 = gx1.R(x12Var8, r28VarA0);
                r12.W.getClass();
                ot2 ot2Var6 = q12.b;
                p65 p65Var9 = (p65) x12Var8;
                p65Var9.c0();
                if (p65Var9.S) {
                    p65Var9.k(ot2Var6);
                } else {
                    p65Var9.m0();
                }
                tp7.B(x12Var8, q12.f, wv1VarA2);
                tp7.B(x12Var8, q12.e, i89VarL9);
                tp7.B(x12Var8, q12.g, Integer.valueOf(i11));
                tp7.y(x12Var8, q12.h);
                tp7.B(x12Var8, q12.d, r28VarR9);
                if (ub0Var2 == null) {
                    ay0.e("Required value was null.");
                    return null;
                }
                iq7.c(ub0Var2, mainActivity.D, x12Var8, 384);
                if (((Boolean) upcVar.getValue()).booleanValue()) {
                    z2 = false;
                    p65Var9.Y(1241374766);
                } else {
                    p65Var9.Y(1260474021);
                    WeakHashMap weakHashMap = f5f.w;
                    hp7.t(x12Var8, f49.Y(tr7.o(x12Var8).e));
                    z2 = false;
                }
                p65Var9.p(z2);
                p65Var9.p(true);
                return c1eVar;
            case 8:
                mz1 mz1Var = (mz1) obj6;
                mx0 mx0Var = (mx0) obj5;
                m45 m45Var2 = (m45) obj4;
                hy8 hy8Var = (hy8) obj;
                x12 x12Var9 = (x12) obj2;
                int iIntValue8 = ((Integer) obj3).intValue();
                hy8Var.getClass();
                if ((iIntValue8 & 6) == 0) {
                    iIntValue8 |= ((p65) x12Var9).f(hy8Var) ? 4 : 2;
                }
                p65 p65Var10 = (p65) x12Var9;
                if (p65Var10.P(iIntValue8 & 1, (iIntValue8 & 19) != 18)) {
                    r40.h(null, null, pxf.E(395989282, new ov2(mz1Var, hy8Var, mx0Var, m45Var2, 9), p65Var10), p65Var10, 3072, 7);
                } else {
                    p65Var10.S();
                }
                return c1eVar;
            case 9:
                String str4 = (String) obj6;
                String str5 = (String) obj5;
                mz1 mz1Var2 = (mz1) obj4;
                xv1 xv1Var = (xv1) obj;
                x12 x12Var10 = (x12) obj2;
                int iIntValue9 = ((Integer) obj3).intValue();
                xv1Var.getClass();
                if ((iIntValue9 & 6) == 0) {
                    iIntValue9 |= ((p65) x12Var10).f(xv1Var) ? 4 : 2;
                }
                p65 p65Var11 = (p65) x12Var10;
                if (p65Var11.P(iIntValue9 & 1, (iIntValue9 & 19) != 18)) {
                    o28 o28Var6 = o28.b;
                    r28 r28VarG = w2g.G(o28Var6, 40.0f, 0.0f, 40.0f, 0.0f, 10);
                    yq0 yq0Var = z46.q;
                    r28 r28VarA = xv1.a(yq0Var, r28VarG);
                    jgd jgdVar = new jgd(3);
                    sn3 sn3Var = jt7.c;
                    jjd.b(str4, r28VarA, 0L, 0L, 0L, null, jgdVar, 0L, 0, false, 0, 0, null, ((bu7) p65Var11.j(sn3Var)).i, p65Var11, 0, 0, 130044);
                    if (str5 != null) {
                        p65Var11.Y(1062413447);
                        jjd.b(str5, xv1.a(yq0Var, w2g.G(o28Var6, 40.0f, 8.0f, 40.0f, 0.0f, 8)), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var11.j(sn3Var)).m, p65Var11, 0, 0, 130044);
                        z3 = false;
                    } else {
                        z3 = false;
                        p65Var11.Y(1057953508);
                    }
                    p65Var11.p(z3);
                    mz1Var2.f(xv1Var, p65Var11, Integer.valueOf(iIntValue9 & 14));
                } else {
                    p65Var11.S();
                }
                return c1eVar;
            case 10:
                l38 l38Var = (l38) obj6;
                x45 x45Var2 = (x45) obj5;
                l78 l78Var2 = (l78) obj4;
                x12 x12Var11 = (x12) obj2;
                int iIntValue10 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var12 = (p65) x12Var11;
                if (p65Var12.P(iIntValue10 & 1, (iIntValue10 & 17) != 16)) {
                    for (Calendar calendar : l38Var.b) {
                        bq7 bq7Var2 = new bq7(vo7.u(calendar.getTimeInMillis(), p65Var12), calendar.equals(l38Var.a), null, null, 28);
                        boolean zF8 = p65Var12.f(x45Var2) | p65Var12.h(calendar);
                        Object objM11 = p65Var12.M();
                        if (zF8 || objM11 == uobVar) {
                            objM11 = new i16(x45Var2, calendar, l78Var2, 6);
                            p65Var12.j0(objM11);
                        }
                        aq7.b(bq7Var2, (m45) objM11, null, 0L, 0L, p65Var12, 0, 28);
                    }
                } else {
                    p65Var12.S();
                }
                return c1eVar;
            case 11:
                t88 t88Var = (t88) obj6;
                i88 i88Var = (i88) obj5;
                String str6 = (String) obj4;
                x12 x12Var12 = (x12) obj2;
                int iIntValue11 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var13 = (p65) x12Var12;
                if (!p65Var13.P(iIntValue11 & 1, (iIntValue11 & 17) != 16)) {
                    p65Var13.S();
                    return c1eVar;
                }
                jp7 jp7Var4 = (jp7) p65Var13.j(kt7.a);
                o28 o28Var7 = o28.b;
                r28 r28VarJ4 = ka1.j(jp7Var4, o28Var7, 3, 1.0f);
                zk7 zk7VarC8 = dy0.c(z46.h, false);
                long j10 = p65Var13.T;
                int i12 = (int) (j10 ^ (j10 >>> 32));
                i89 i89VarL10 = p65Var13.l();
                r28 r28VarR10 = gx1.R(p65Var13, r28VarJ4);
                r12.W.getClass();
                ot2 ot2Var7 = q12.b;
                p65Var13.c0();
                if (p65Var13.S) {
                    p65Var13.k(ot2Var7);
                } else {
                    p65Var13.m0();
                }
                cu cuVar13 = q12.f;
                tp7.B(p65Var13, cuVar13, zk7VarC8);
                cu cuVar14 = q12.e;
                tp7.B(p65Var13, cuVar14, i89VarL10);
                Integer numValueOf4 = Integer.valueOf(i12);
                cu cuVar15 = q12.g;
                tp7.B(p65Var13, cuVar15, numValueOf4);
                fn fnVar4 = q12.h;
                tp7.y(p65Var13, fnVar4);
                cu cuVar16 = q12.d;
                tp7.B(p65Var13, cuVar16, r28VarR10);
                r28 r28VarD5 = jfc.d(jfc.o(o28Var7, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC9 = dy0.c(z46.d, false);
                long j11 = p65Var13.T;
                int i13 = (int) (j11 ^ (j11 >>> 32));
                i89 i89VarL11 = p65Var13.l();
                r28 r28VarR11 = gx1.R(p65Var13, r28VarD5);
                p65Var13.c0();
                if (p65Var13.S) {
                    p65Var13.k(ot2Var7);
                } else {
                    p65Var13.m0();
                }
                tp7.B(p65Var13, cuVar13, zk7VarC9);
                tp7.B(p65Var13, cuVar14, i89VarL11);
                ka1.z(i13, p65Var13, cuVar15, p65Var13, fnVar4);
                tp7.B(p65Var13, cuVar16, r28VarR11);
                String strQ4 = vo7.Q(R.string.see_all, new Object[]{t88Var.a}, p65Var13);
                boolean zF9 = p65Var13.f(i88Var) | p65Var13.f(str6) | p65Var13.f(t88Var);
                Object objM12 = p65Var13.M();
                if (zF9 || objM12 == uobVar) {
                    objM12 = new i16(i88Var, str6, t88Var, 8);
                    p65Var13.j0(objM12);
                }
                nk7.P(strQ4, (m45) objM12, null, p65Var13, 0);
                p65Var13.p(true);
                p65Var13.p(true);
                return c1eVar;
            case 12:
                v88 v88Var = (v88) obj6;
                i88 i88Var2 = (i88) obj5;
                l78 l78Var3 = (l78) obj4;
                x12 x12Var13 = (x12) obj2;
                int iIntValue12 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var14 = (p65) x12Var13;
                if (p65Var14.P(iIntValue12 & 1, (iIntValue12 & 17) != 16)) {
                    for (s88 s88Var : s88.getEntries()) {
                        bq7 bq7Var3 = new bq7(vo7.R(p65Var14, s88Var.getTitleResId()), s88Var == v88Var.b, null, null, 28);
                        r28 r28VarN3 = bgf.N(o28Var, "refine_recommendation_filter_item_" + s88Var.name());
                        boolean zF10 = p65Var14.f(i88Var2) | p65Var14.d(s88Var.ordinal());
                        Object objM13 = p65Var14.M();
                        if (zF10 || objM13 == uobVar) {
                            objM13 = new i16(i88Var2, s88Var, l78Var3, 9);
                            p65Var14.j0(objM13);
                        }
                        aq7.b(bq7Var3, (m45) objM13, r28VarN3, 0L, 0L, p65Var14, 0, 24);
                    }
                } else {
                    p65Var14.S();
                }
                return c1eVar;
            case 13:
                return a(obj, obj2, obj3);
            case 14:
                return d(obj, obj2, obj3);
            case 15:
                return g(obj, obj2, obj3);
            case 16:
                return h(obj, obj2, obj3);
            case 17:
                return i(obj, obj2, obj3);
            case 18:
                return j(obj, obj2, obj3);
            case 19:
                kv6 kv6Var2 = (kv6) obj6;
                sca scaVar = (sca) obj5;
                obe obeVar = (obe) obj4;
                x12 x12Var14 = (x12) obj2;
                int iIntValue13 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var15 = (p65) x12Var14;
                if (p65Var15.P(iIntValue13 & 1, (iIntValue13 & 17) != 16)) {
                    jy8 jy8VarH = w2g.h(0.0f, 0.0f, 0.0f, 24.0f, 7);
                    boolean zF11 = p65Var15.f(scaVar) | p65Var15.f(obeVar);
                    Object objM14 = p65Var15.M();
                    if (zF11 || objM14 == uobVar) {
                        objM14 = new q58(scaVar, 28, obeVar);
                        p65Var15.j0(objM14);
                    }
                    k40.t(null, kv6Var2, jy8VarH, null, null, null, false, null, (x45) objM14, p65Var15, 384, 505);
                } else {
                    p65Var15.S();
                }
                return c1eVar;
            case 20:
                return l(obj, obj2, obj3);
            case 21:
                return n(obj, obj2, obj3);
            case 22:
                return o(obj, obj2, obj3);
            case 23:
                return r(obj, obj2, obj3);
            case 24:
                return t(obj, obj2, obj3);
            case 25:
                return u(obj, obj2, obj3);
            case 26:
                return v(obj, obj2, obj3);
            case 27:
                return w(obj, obj2, obj3);
            case 28:
                return x(obj, obj2, obj3);
            default:
                x9b x9bVar = (x9b) obj6;
                i9b i9bVar = (i9b) obj5;
                sh9 sh9Var = (sh9) obj4;
                hy8 hy8Var2 = (hy8) obj;
                x12 x12Var15 = (x12) obj2;
                int iIntValue14 = ((Integer) obj3).intValue();
                hy8Var2.getClass();
                if ((iIntValue14 & 6) == 0) {
                    iIntValue14 |= ((p65) x12Var15).f(hy8Var2) ? 4 : 2;
                }
                p65 p65Var16 = (p65) x12Var15;
                if (p65Var16.P(iIntValue14 & 1, (iIntValue14 & 19) != 18)) {
                    r28 r28VarB = w2g.B(o28Var, hy8Var2);
                    if (x9bVar instanceof w9b) {
                        p65Var16.Y(146147869);
                        ok7.i(r28VarB, p65Var16, 0);
                        p65Var16.p(false);
                    } else if (x9bVar instanceof u9b) {
                        p65Var16.Y(146152534);
                        ok7.g((u9b) x9bVar, i9bVar, sh9Var, r28VarB, p65Var16, 0);
                        p65Var16.p(false);
                    } else {
                        if (!(x9bVar instanceof v9b)) {
                            throw ho2.L(p65Var16, 146145907, false);
                        }
                        p65Var16.Y(146160839);
                        ok7.h((v9b) x9bVar, i9bVar, r28VarB, p65Var16, 0);
                        p65Var16.p(false);
                    }
                } else {
                    p65Var16.S();
                }
                return c1eVar;
        }
    }

    public /* synthetic */ gx4(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }
}
