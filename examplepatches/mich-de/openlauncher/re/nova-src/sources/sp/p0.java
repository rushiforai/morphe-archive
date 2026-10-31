package sp;

import android.app.Application;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;

/* loaded from: classes4.dex */
public class p0 extends o0 {
    public p0() {
        double d5 = r0.f87654a;
        if (d5 != 0.0d) {
            r0.f87654a = 0.0d;
            put("asid_timeinterval", String.valueOf(d5));
            put("asid_scope", String.valueOf(r0.f87655b));
        }
    }

    public final void d(t tVar, rp.c cVar) {
        if (!r0.l(tVar.f87666d) && !cVar.f86141j.booleanValue()) {
            put("aifa", tVar.f87666d);
        } else {
            if (r0.l(tVar.f87663a)) {
                return;
            }
            put("asid", tVar.f87663a);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x0091  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void e(m0 m0Var, boolean z11) {
        String str;
        t tVar = m0Var.f87621f;
        Application application = m0Var.f87616a;
        rp.c cVar = m0Var.f87619d;
        String str2 = tVar.f87675m;
        String str3 = tVar.f87669g;
        put("i", str2);
        put("p", tVar.f87677q);
        if (cVar.f86141j.booleanValue()) {
            put("lim", "1");
        }
        r30.c cVarB = s.c().b(p.b(), application);
        if (s.c().f87659a != null) {
            h0 h0Var = p.b().f87645a;
            if (!(h0Var != null ? h0Var.f87586b : h0.a().f87586b)) {
                put("cs", "0");
            }
        }
        if (cVarB != null) {
            String str4 = cVarB.f85475a;
            if (!r0.l(str4) && (z11 || s.c().a(application))) {
                put("k", "SDID");
                put("u", str4);
                d(tVar, cVar);
                if ((s.c().f87659a != null) && cVarB.f85476b == 1) {
                    put("cs", "1");
                }
            } else if (!r0.l(str3)) {
                put("amid", str3);
                put("k", "AMID");
                put("u", str3);
                d(tVar, cVar);
            } else if (!r0.l(tVar.f87666d) && !cVar.f86141j.booleanValue()) {
                put("aifa", tVar.f87666d);
                put("k", "AIFA");
                put("u", tVar.f87666d);
            } else if (!r0.l(null)) {
                put("k", "OAID");
                put("u", null);
                put("oaid", null);
                if (!r0.l(tVar.f87663a)) {
                    put("asid", tVar.f87663a);
                }
            } else if (!r0.l(tVar.f87663a)) {
                put("k", "ASID");
                put("u", tVar.f87663a);
                put("asid", tVar.f87663a);
            } else if (!r0.l(tVar.f87665c) && !cVar.f86141j.booleanValue()) {
                put("k", "ANDI");
                put("u", tVar.f87665c);
                put("andi", tVar.f87665c);
            }
        }
        String str5 = tVar.f87664b;
        if (str5 != null && !r0.l(str5) && (str = tVar.f87663a) != null && !tVar.f87664b.equalsIgnoreCase(str)) {
            put("pasid", tVar.f87664b);
        }
        put("is_asid_singular_id", application.getSharedPreferences("pref_asid_is_singular_id", 0).getBoolean("asid_is_singular_id", false) ? InneractiveMediationDefs.SHOW_HOUSE_AD_YES : "false");
    }
}
