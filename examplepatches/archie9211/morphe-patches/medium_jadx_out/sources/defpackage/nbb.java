package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Uri;
import android.view.textclassifier.TextClassification;
import com.medium.android.core.navigation.s;
import com.medium.android.data.preferences.DarkMode;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.onboarding.ui.starterpacks.StarterPacksFragment;
import com.medium.android.onboarding.ui.starterpacks.a;
import com.medium.android.onboarding.ui.starterpacks.b;
import com.medium.android.settings.main.SettingsFragment;
import com.medium.proto.event.FindYourFriendsClicked;
import gen.model.SourceParameter;
import java.util.LinkedHashMap;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class nbb implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ nbb(vjd vjdVar, lx lxVar, jt jtVar) {
        this.a = 20;
        this.b = lxVar;
        this.c = jtVar;
    }

    @Override // defpackage.m45
    public final Object invoke() throws PendingIntent.CanceledException {
        String str;
        long j;
        rjd rjdVarD;
        kx6 kx6Var;
        mx mxVar;
        e07 e07Var;
        int i = 5;
        int i2 = 0;
        n92 n92Var = null;
        switch (this.a) {
            case 0:
                bf7 bf7Var = (bf7) this.b;
                String str2 = (String) this.c;
                bf7Var.getClass();
                str2.getClass();
                MainActivity mainActivity = bf7Var.a;
                int i3 = MainActivity.H;
                sg7 sg7VarV = mainActivity.v();
                km4.I(wld.a, null, "Request address book access accepted.", new Object[0], "Request address book access accepted.");
                cx2 cx2Var = sg7VarV.t;
                String string = Locale.getDefault().toString();
                string.getClass();
                String str3 = sg7VarV.B;
                String str4 = sg7VarV.z;
                cx2Var.getClass();
                str3.getClass();
                str4.getClass();
                rqd.a(cx2Var.a, new FindYourFriendsClicked(null, string, null, 5, null), "", str3, false, null, str4, 24);
                sg7VarV.b.z(ek6.HAS_DISMISSED_FIND_YOUR_FRIENDS_DIALOG, true);
                sg7VarV.x.l(null);
                ((p13) mainActivity.t()).i(mainActivity, str2);
                return c1e.a;
            case 1:
                nib nibVar = (nib) this.b;
                String str5 = ((xgb) this.c).a;
                str5.getClass();
                vx0.c0(f76.F(nibVar), null, null, new mw9(nibVar, str5, n92Var, 18), 3);
                return c1e.a;
            case 2:
                ((lgb) this.b).d(((aib) this.c).c());
                return c1e.a;
            case 3:
                ((lgb) this.b).a.g((String) this.c);
                return c1e.a;
            case 4:
                b55 b55Var = (b55) this.b;
                yvb yvbVar = (yvb) this.c;
                b55Var.invoke(yvbVar.a, yvbVar.d);
                return c1e.a;
            case 5:
                z2c z2cVar = (z2c) this.b;
                SettingsFragment settingsFragment = ((d2c) this.c).a;
                boolean z = z2cVar.c;
                if (z && (str = z2cVar.d) != null) {
                    ((p13) settingsFragment.Z()).b(settingsFragment.S(), str);
                } else if (z) {
                    ((p13) settingsFragment.Z()).e0(settingsFragment.S(), Uri.parse("https://play.google.com/store/account/subscriptions"));
                } else {
                    s sVarZ = settingsFragment.Z();
                    Context contextS = settingsFragment.S();
                    settingsFragment.i1();
                    ((p13) sVarZ).f(contextS, Uri.parse(i03.k), settingsFragment.j1().A);
                }
                return c1e.a;
            case 6:
                ((w5c) this.b).e((String) ((m45) this.c).invoke());
                return c1e.a;
            case 7:
                gz8 gz8Var = (gz8) this.b;
                h6c h6cVar = (h6c) this.c;
                if (gz8Var.k() <= 0) {
                    return null;
                }
                c5c c5cVar = (c5c) bu1.A0(gz8Var.k() - 1, h6cVar.c);
                if (c5cVar != null) {
                    return c5cVar.a;
                }
                return null;
            case 8:
                q58 q58Var = (q58) this.b;
                ConnectivityManager connectivityManager = (ConnectivityManager) this.c;
                synchronized (t6c.b) {
                    LinkedHashMap linkedHashMap = t6c.c;
                    linkedHashMap.remove(q58Var);
                    if (linkedHashMap.isEmpty()) {
                        d87.h().d(a7f.a, "NetworkRequestConstraintController unregister shared callback");
                        connectivityManager.unregisterNetworkCallback(t6c.a);
                        t6c.f = null;
                        t6c.d = null;
                        t6c.e = false;
                    }
                    break;
                }
                return c1e.a;
            case 9:
                jhc jhcVar = (jhc) this.b;
                m94 m94Var = (m94) this.c;
                if (!g76.L(jhcVar, m94Var.a)) {
                    bu1.S0(m94Var.b, new zzb(i, jhcVar));
                    mwa mwaVar = m94Var.c;
                    if (mwaVar != null) {
                        mwaVar.b();
                    }
                }
                return c1e.a;
            case 10:
                ihc ihcVar = (ihc) this.b;
                l94 l94Var = (l94) this.c;
                if (!g76.L(ihcVar, l94Var.a)) {
                    bu1.S0(l94Var.b, new zzb(6, ihcVar));
                    mwa mwaVar2 = l94Var.c;
                    if (mwaVar2 != null) {
                        mwaVar2.b();
                    }
                }
                return c1e.a;
            case 11:
                obe obeVar = (obe) this.b;
                kmc kmcVar = (kmc) this.c;
                obeVar.p(kmcVar.a, kmcVar.i);
                return c1e.a;
            case 12:
                cpc cpcVar = (cpc) this.b;
                boolean z2 = ((epc) this.c).c;
                jpc jpcVar = cpcVar.b;
                if (z2) {
                    jpcVar.g.a(jpcVar.i, jpcVar.j, "onboarding_tags", jpcVar.b);
                }
                StarterPacksFragment starterPacksFragment = ((b) cpcVar.a).a;
                vx0.c0(o7f.x(starterPacksFragment), null, null, new a(starterPacksFragment, null), 3);
                return c1e.a;
            case 13:
                qqc qqcVar = (qqc) this.b;
                wqc wqcVar = (wqc) this.c;
                qqcVar.a(wqcVar.a, wqcVar.m);
                return c1e.a;
            case 14:
                ((x45) this.b).invoke((i8d) this.c);
                return c1e.a;
            case 15:
                odd oddVar = (odd) this.b;
                rg1 rg1Var = (rg1) this.c;
                rg1Var.getClass();
                vx0.c0(f76.F(oddVar), null, null, new edd(oddVar, rg1Var, n92Var, i2), 3);
                return c1e.a;
            case 16:
                aed aedVar = (aed) this.b;
                ((l78) this.c).setValue(Boolean.TRUE);
                qed qedVar = aedVar.a;
                vx0.c0(f76.F(qedVar), null, null, new xi7(qedVar, n92Var, 25), 3);
                return c1e.a;
            case 17:
                u36.s((Context) this.b, (TextClassification) this.c);
                return c1e.a;
            case 18:
                vx0.c0((sb2) this.b, null, wb2.UNDISPATCHED, new qid(i2, n92Var, (x45) this.c), 1);
                return c1e.a;
            case 19:
                lid lidVar = (lid) this.b;
                long j2 = ((s46) ((l78) this.c).getValue()).a;
                ip8 ip8VarG = lidVar.g();
                long jFloatToRawIntBits = 9205357640488583168L;
                if (ip8VarG != null) {
                    long j3 = ip8VarG.a;
                    mx mxVarK = lidVar.k();
                    if (mxVarK != null && mxVarK.b.length() != 0) {
                        ai5 ai5Var = (ai5) lidVar.q.getValue();
                        int i4 = ai5Var == null ? -1 : nid.a[ai5Var.ordinal()];
                        if (i4 != -1) {
                            if (i4 == 1 || i4 == 2) {
                                long j4 = lidVar.l().b;
                                int i5 = bkd.c;
                                j = j4 >> 32;
                            } else {
                                if (i4 != 3) {
                                    ygf.a();
                                    return null;
                                }
                                long j5 = lidVar.l().b;
                                int i6 = bkd.c;
                                j = j5 & 4294967295L;
                            }
                            int i7 = (int) j;
                            kx6 kx6Var2 = lidVar.d;
                            if (kx6Var2 != null && (rjdVarD = kx6Var2.d()) != null && (kx6Var = lidVar.d) != null && (mxVar = (mx) kx6Var.a.b) != null) {
                                lidVar.b.a(i7);
                                int iV = iq7.v(i7, 0, mxVar.b.length());
                                float fIntBitsToFloat = Float.intBitsToFloat((int) (rjdVarD.d(j3) >> 32));
                                qjd qjdVar = rjdVarD.a;
                                f58 f58Var = qjdVar.b;
                                int iD = f58Var.d(iV);
                                float fE = qjdVar.e(iD);
                                float f = qjdVar.f(iD);
                                float fU = iq7.u(fIntBitsToFloat, Math.min(fE, f), Math.max(fE, f));
                                if (s46.a(j2, 0L) || Math.abs(fIntBitsToFloat - fU) <= ((int) (j2 >> 32)) / 2) {
                                    float f2 = f58Var.f(iD);
                                    jFloatToRawIntBits = (((long) Float.floatToRawIntBits(fU)) << 32) | (((long) Float.floatToRawIntBits(((f58Var.b(iD) - f2) / 2.0f) + f2)) & 4294967295L);
                                }
                            }
                        }
                    }
                }
                return new ip8(jFloatToRawIntBits);
            case 20:
                lx lxVar = (lx) this.b;
                jt jtVar = (jt) this.c;
                d07 d07Var = (d07) lxVar.a;
                if (d07Var instanceof c07) {
                    try {
                        jtVar.a(((c07) d07Var).a);
                        break;
                    } catch (IllegalArgumentException unused) {
                    }
                } else if ((d07Var instanceof b07) && (e07Var = ((b07) d07Var).c) != null) {
                    e07Var.a(d07Var);
                }
                return c1e.a;
            case 21:
                ((x45) this.b).invoke((DarkMode) this.c);
                return c1e.a;
            case 22:
                fv9 fv9Var = (fv9) this.b;
                dpd dpdVar = (dpd) this.c;
                String str6 = dpdVar.b;
                String str7 = dpdVar.d;
                str6.getClass();
                sw9 sw9Var = fv9Var.a;
                if (!sw9Var.H0) {
                    vx0.c0(f76.F(sw9Var), null, null, new av9(sw9Var, str6, str7, null, 10), 3);
                }
                return c1e.a;
            case 23:
                mpd mpdVar = (mpd) this.b;
                xpd xpdVar = (xpd) this.c;
                xpdVar.getClass();
                fqd fqdVar = mpdVar.b;
                vx0.c0(f76.F(fqdVar), null, null, new gbd(xpdVar, fqdVar, n92Var, i), 3);
                return c1e.a;
            case 24:
                l8e l8eVar = (l8e) this.b;
                SourceParameter sourceParameter = ((j9e) this.c).c;
                l8eVar.getClass();
                sourceParameter.getClass();
                l8eVar.b.I(sourceParameter);
                return c1e.a;
            case 25:
                n8e n8eVar = (n8e) this.b;
                dr9 dr9Var = (dr9) this.c;
                n8eVar.a(dr9Var.x.b, dr9Var.a, null);
                return c1e.a;
            case 26:
                sh9 sh9Var = (sh9) this.b;
                dr9 dr9Var2 = ((aae) this.c).f;
                sh9Var.z(dr9Var2.a, dr9Var2.x.b);
                return c1e.a;
            case 27:
                n8e n8eVar2 = (n8e) this.b;
                z9e z9eVar = (z9e) this.c;
                n8eVar2.b(z9eVar.g, z9eVar.i);
                return c1e.a;
            case 28:
                sh9 sh9Var2 = (sh9) this.b;
                dr9 dr9Var3 = ((z9e) this.c).f;
                sh9Var2.z(dr9Var3.a, dr9Var3.x.b);
                return c1e.a;
            default:
                zbe zbeVar = (zbe) this.b;
                rg1 rg1Var2 = ((mce) ((nce) this.c)).a;
                ide ideVar = zbeVar.a;
                vx0.c0(f76.F(ideVar), null, null, new fde(ideVar, rg1Var2, n92Var, i2), 3);
                return c1e.a;
        }
    }

    public /* synthetic */ nbb(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }
}
