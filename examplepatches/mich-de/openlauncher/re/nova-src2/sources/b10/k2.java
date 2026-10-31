package b10;

import android.content.Context;
import com.amplitude.core.events.Plan;
import com.vungle.ads.internal.protos.Sdk;
import e10.a3;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.collections.builders.MapBuilder;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k2 {

    /* renamed from: a, reason: collision with root package name */
    public final String f16762a;

    /* renamed from: b, reason: collision with root package name */
    public final w70.i2 f16763b;

    /* renamed from: c, reason: collision with root package name */
    public final w70.i2 f16764c;

    /* renamed from: d, reason: collision with root package name */
    public final w70.i2 f16765d;

    /* renamed from: e, reason: collision with root package name */
    public final w70.i2 f16766e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f16767f;

    /* renamed from: g, reason: collision with root package name */
    public final AtomicBoolean f16768g;

    public k2(String str) {
        this.f16762a = str;
        w70.i2 i2VarC = w70.u1.c(f2.f16671a);
        this.f16763b = i2VarC;
        this.f16764c = i2VarC;
        w70.i2 i2VarC2 = w70.u1.c(null);
        this.f16765d = i2VarC2;
        this.f16766e = i2VarC2;
        this.f16768g = new AtomicBoolean(false);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:100:0x0224  */
    /* JADX WARN: Removed duplicated region for block: B:102:0x0228 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:106:0x0279  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x0293  */
    /* JADX WARN: Removed duplicated region for block: B:109:0x0297  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x02b1  */
    /* JADX WARN: Removed duplicated region for block: B:113:0x02da  */
    /* JADX WARN: Removed duplicated region for block: B:122:0x030e  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x0330  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x036f  */
    /* JADX WARN: Removed duplicated region for block: B:149:0x03ce  */
    /* JADX WARN: Removed duplicated region for block: B:150:0x03d5  */
    /* JADX WARN: Removed duplicated region for block: B:152:0x03d8  */
    /* JADX WARN: Removed duplicated region for block: B:153:0x03df  */
    /* JADX WARN: Removed duplicated region for block: B:155:0x03e2  */
    /* JADX WARN: Removed duplicated region for block: B:157:0x03ec  */
    /* JADX WARN: Removed duplicated region for block: B:160:0x03f1  */
    /* JADX WARN: Removed duplicated region for block: B:162:0x03fb  */
    /* JADX WARN: Removed duplicated region for block: B:163:0x03fe  */
    /* JADX WARN: Removed duplicated region for block: B:168:0x0408  */
    /* JADX WARN: Removed duplicated region for block: B:171:0x0411  */
    /* JADX WARN: Removed duplicated region for block: B:172:0x0414  */
    /* JADX WARN: Removed duplicated region for block: B:174:0x0418  */
    /* JADX WARN: Removed duplicated region for block: B:175:0x041b  */
    /* JADX WARN: Removed duplicated region for block: B:177:0x041f  */
    /* JADX WARN: Removed duplicated region for block: B:178:0x0422  */
    /* JADX WARN: Removed duplicated region for block: B:180:0x0426  */
    /* JADX WARN: Removed duplicated region for block: B:182:0x042b  */
    /* JADX WARN: Removed duplicated region for block: B:187:0x014f A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0105 A[ADDED_TO_REGION, REMOVE] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0141  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x016b  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x017c  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x01a1  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x01de  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0214 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:99:0x0221  */
    /* JADX WARN: Type inference failed for: r0v16 */
    /* JADX WARN: Type inference failed for: r0v19 */
    /* JADX WARN: Type inference failed for: r0v20 */
    /* JADX WARN: Type inference failed for: r11v1, types: [kotlin.collections.EmptyList] */
    /* JADX WARN: Type inference failed for: r11v2 */
    /* JADX WARN: Type inference failed for: r11v25, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r1v69, types: [boolean] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        i2 i2Var;
        k2 k2Var;
        ?? arrayList;
        z1 z1Var;
        String strH;
        boolean zD;
        Context contextE;
        boolean z11;
        ArrayList arrayList2;
        k2 k2Var2;
        int i5;
        cy.g gVar;
        cy.g gVar2;
        cy.g gVar3;
        cy.m0 m0Var;
        ArrayList arrayList3;
        m1 m1Var;
        Object next;
        cy.g gVar4;
        boolean z12;
        cy.g gVar5;
        cy.g gVar6;
        g2 g2Var;
        Object next2;
        List list;
        if (continuationImpl instanceof i2) {
            i2Var = (i2) continuationImpl;
            int i11 = i2Var.D;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                i2Var.D = i11 - Integer.MIN_VALUE;
            } else {
                i2Var = new i2(this, continuationImpl);
            }
        }
        Object objR = i2Var.B;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = i2Var.D;
        if (i12 == 0) {
            ResultKt.b(objR);
            zy.c cVar = zy.c.f98823a;
            i2Var.f16722t = this;
            i2Var.D = 1;
            if (cVar.a(i2Var) != coroutineSingletons) {
                k2Var = this;
            }
            return coroutineSingletons;
        }
        if (i12 != 1) {
            if (i12 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i5 = i2Var.A;
            gVar = i2Var.f16728z;
            gVar2 = i2Var.f16727y;
            gVar3 = i2Var.f16726x;
            cy.m0 m0Var2 = i2Var.f16725w;
            ArrayList arrayList4 = i2Var.f16724v;
            m1Var = i2Var.f16723u;
            k2Var2 = i2Var.f16722t;
            ResultKt.b(objR);
            m0Var = m0Var2;
            arrayList3 = arrayList4;
            cy.e eVar = (cy.e) objR;
            gVar4 = eVar.f48457a;
            List list2 = eVar.f48458b;
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            for (Object obj : list2) {
                String str = ((cy.g) obj).f48470b;
                Object obj2 = linkedHashMap.get(str);
                if (obj2 == null) {
                    ArrayList arrayList5 = new ArrayList();
                    linkedHashMap.put(str, arrayList5);
                    obj2 = arrayList5;
                }
                ((List) obj2).add(obj);
            }
            LinkedHashMap linkedHashMap2 = new LinkedHashMap(b70.k.d0(linkedHashMap.size()));
            for (Map.Entry entry : linkedHashMap.entrySet()) {
                Object key = entry.getKey();
                Iterator it = ((List) entry.getValue()).iterator();
                if (it.hasNext()) {
                    next2 = it.next();
                    if (it.hasNext()) {
                        ?? r02 = ((cy.g) next2).f48473e;
                        while (true) {
                            Object next3 = it.next();
                            list = list2;
                            ?? r12 = ((cy.g) next3).f48473e;
                            boolean z13 = r02;
                            if (r02 < r12) {
                                z13 = r12 == true ? 1 : 0;
                                next2 = next3;
                            }
                            if (!it.hasNext()) {
                                break;
                            }
                            list2 = list;
                            r02 = z13;
                        }
                    } else {
                        list = list2;
                    }
                } else {
                    list = list2;
                    next2 = null;
                }
                Intrinsics.d(next2);
                linkedHashMap2.put(key, (cy.g) next2);
                list2 = list;
            }
            List list3 = list2;
            z12 = m1Var.f16796l;
            gVar5 = !z12 ? (cy.g) linkedHashMap2.get("year") : null;
            gVar6 = !z12 ? (cy.g) linkedHashMap2.get("month") : null;
            if (z12) {
                gVar5 = null;
            } else if (gVar5 == null) {
                gVar5 = (cy.g) b70.g.Y0(list3);
            }
            if (gVar4 == null || gVar5 != null) {
                Object value = k2Var2.f16763b.getValue();
                g2Var = !(value instanceof g2) ? (g2) value : null;
                if (g2Var != null || (str = g2Var.f16694g) == null) {
                    String str2 = m1Var.f16797m;
                }
                String str3 = str2;
                w70.i2 i2Var2 = k2Var2.f16763b;
                g2 g2Var2 = new g2(m1Var, arrayList3, gVar4 != null ? gVar3 : gVar4, gVar5 != null ? gVar2 : gVar5, gVar6 != null ? gVar : gVar6, m0Var, str3, i5 == 0);
                i2Var2.getClass();
                i2Var2.k(null, g2Var2);
            }
            return Unit.f71706a;
        }
        k2Var = i2Var.f16722t;
        ResultKt.b(objR);
        k2Var.getClass();
        zy.c cVar2 = zy.c.f98823a;
        String strH2 = zy.c.h("paywall_features_csv");
        if (strH2.length() > 0) {
            List listI1 = r70.k.i1(strH2, new String[]{","}, 6);
            arrayList = new ArrayList(b70.c.u0(listI1, 10));
            Iterator it2 = listI1.iterator();
            while (it2.hasNext()) {
                arrayList.add(r70.k.u1((String) it2.next()).toString());
            }
        } else {
            arrayList = EmptyList.f71733a;
        }
        List<String> list4 = arrayList;
        i1 i1Var = b2.f16583a;
        zy.c cVar3 = zy.c.f98823a;
        String strH3 = zy.c.h("paywall_onboarding_position");
        i1Var.getClass();
        b2 b2VarA = i1.a(strH3);
        i1 i1Var2 = z1.f16985a;
        String strH4 = zy.c.h("paywall_dismiss_style");
        i1Var2.getClass();
        int iHashCode = strH4.hashCode();
        if (iHashCode == -1037805620) {
            if (strH4.equals("text_link")) {
                z1Var = z1.f16987c;
            }
            z1 z1Var2 = z1Var;
            String strH5 = zy.c.h("paywall_title");
            String strH6 = zy.c.h("paywall_subtitle");
            String strH7 = zy.c.h("paywall_cta_text");
            String strH8 = zy.c.h("paywall_social_proof_text");
            boolean zD2 = zy.c.d("paywall_show_annual_toggle", false);
            boolean zD3 = zy.c.d("paywall_highlight_savings", true);
            boolean zD4 = zy.c.d("paywall_trial_badge_enabled", true);
            strH = zy.c.h("paywall_layout_variant");
            if (strH.length() == 0) {
            }
            String str4 = strH;
            if (zy.c.d("plus_plan_enabled", true)) {
            }
            String strH9 = zy.c.h("paywall_default_plus_period");
            m1 m1Var2 = new m1(b2VarA, z1Var2, strH5, strH6, strH7, strH8, list4, zD2, zD3, zD4, str4, z11, (!strH9.equals("month") || strH9.equals("year")) ? strH9 : "month");
            arrayList2 = new ArrayList();
            while (r14.hasNext()) {
            }
            if (arrayList2.isEmpty()) {
            }
            ArrayList arrayList6 = arrayList2;
            boolean z14 = a3.f51435a.f51552h;
            if (z14) {
            }
            cy.m0 m0Var3 = cy.l0.f48505c;
            cy.m0 m0Var4 = cy.k0.f48502c;
            if (z11) {
            }
            if (!z11) {
            }
            cy.g gVar7 = new cy.g(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "year", null, 0, false, m0Var3, null, 0L, 0, 448);
            if (z11) {
            }
            if (z11) {
            }
            w70.i2 i2Var3 = k2Var.f16763b;
            g2 g2Var3 = new g2(m1Var2, arrayList6, gVar7, gVar, gVar, m0Var, m1Var2.f16797m, z);
            cy.g gVar8 = gVar;
            cy.g gVar9 = gVar;
            cy.m0 m0Var5 = m0Var;
            boolean z15 = z;
            i2Var3.getClass();
            i2Var3.k(null, g2Var3);
            if (z11) {
            }
            i2Var.f16722t = k2Var;
            i2Var.f16723u = m1Var2;
            i2Var.f16724v = arrayList6;
            i2Var.f16725w = m0Var5;
            i2Var.f16726x = gVar7;
            i2Var.f16727y = gVar8;
            i2Var.f16728z = gVar9;
            i2Var.A = z15 ? 1 : 0;
            i2Var.D = 2;
            objR = cy.d0.r(i2Var);
            if (objR != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (iHashCode == 3029889) {
            if (strH4.equals("both")) {
                z1Var = z1.f16988d;
            }
            z1 z1Var22 = z1Var;
            String strH52 = zy.c.h("paywall_title");
            String strH62 = zy.c.h("paywall_subtitle");
            String strH72 = zy.c.h("paywall_cta_text");
            String strH82 = zy.c.h("paywall_social_proof_text");
            boolean zD22 = zy.c.d("paywall_show_annual_toggle", false);
            boolean zD32 = zy.c.d("paywall_highlight_savings", true);
            boolean zD42 = zy.c.d("paywall_trial_badge_enabled", true);
            strH = zy.c.h("paywall_layout_variant");
            if (strH.length() == 0) {
            }
            String str42 = strH;
            if (zy.c.d("plus_plan_enabled", true)) {
            }
            String strH92 = zy.c.h("paywall_default_plus_period");
            m1 m1Var22 = new m1(b2VarA, z1Var22, strH52, strH62, strH72, strH82, list4, zD22, zD32, zD42, str42, z11, (!strH92.equals("month") || strH92.equals("year")) ? strH92 : "month");
            arrayList2 = new ArrayList();
            while (r14.hasNext()) {
            }
            if (arrayList2.isEmpty()) {
            }
            ArrayList arrayList62 = arrayList2;
            boolean z142 = a3.f51435a.f51552h;
            if (z142) {
            }
            cy.m0 m0Var32 = cy.l0.f48505c;
            cy.m0 m0Var42 = cy.k0.f48502c;
            if (z11) {
            }
            if (!z11) {
            }
            cy.g gVar72 = new cy.g(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "year", null, 0, false, m0Var32, null, 0L, 0, 448);
            if (z11) {
            }
            if (z11) {
            }
            w70.i2 i2Var32 = k2Var.f16763b;
            g2 g2Var32 = new g2(m1Var22, arrayList62, gVar72, gVar, gVar, m0Var, m1Var22.f16797m, z);
            cy.g gVar82 = gVar;
            cy.g gVar92 = gVar;
            cy.m0 m0Var52 = m0Var;
            boolean z152 = z;
            i2Var32.getClass();
            i2Var32.k(null, g2Var32);
            if (z11) {
            }
            i2Var.f16722t = k2Var;
            i2Var.f16723u = m1Var22;
            i2Var.f16724v = arrayList62;
            i2Var.f16725w = m0Var52;
            i2Var.f16726x = gVar72;
            i2Var.f16727y = gVar82;
            i2Var.f16728z = gVar92;
            i2Var.A = z152 ? 1 : 0;
            i2Var.D = 2;
            objR = cy.d0.r(i2Var);
            if (objR != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        z1Var = (iHashCode == 14626009 && !strH4.equals("x_button")) ? z1.f16986b : z1.f16986b;
        z1 z1Var222 = z1Var;
        String strH522 = zy.c.h("paywall_title");
        String strH622 = zy.c.h("paywall_subtitle");
        String strH722 = zy.c.h("paywall_cta_text");
        String strH822 = zy.c.h("paywall_social_proof_text");
        boolean zD222 = zy.c.d("paywall_show_annual_toggle", false);
        boolean zD322 = zy.c.d("paywall_highlight_savings", true);
        boolean zD422 = zy.c.d("paywall_trial_badge_enabled", true);
        strH = zy.c.h("paywall_layout_variant");
        if (strH.length() == 0) {
            strH = "standard";
        }
        String str422 = strH;
        if (zy.c.d("plus_plan_enabled", true)) {
            try {
                Context context = mx.g0.f77088a;
                contextE = mx.g0.e();
            } catch (Throwable unused) {
            }
            if (!tx.q0.c(contextE)) {
                if (!cy.d0.x(contextE)) {
                    zy.c cVar4 = zy.c.f98823a;
                    zD = zy.c.d("nova_ai_enabled", true);
                }
                z11 = zD ? false : true;
                String strH922 = zy.c.h("paywall_default_plus_period");
                m1 m1Var222 = new m1(b2VarA, z1Var222, strH522, strH622, strH722, strH822, list4, zD222, zD322, zD422, str422, z11, (!strH922.equals("month") || strH922.equals("year")) ? strH922 : "month");
                arrayList2 = new ArrayList();
                for (String str5 : list4) {
                    cy.e0.f48459d.getClass();
                    Iterator it3 = cy.e0.f48462g.iterator();
                    while (true) {
                        if (!it3.hasNext()) {
                            next = null;
                            break;
                        }
                        next = it3.next();
                        if (((cy.e0) next).f48463a.equals(str5)) {
                            break;
                        }
                    }
                    cy.e0 e0Var = (cy.e0) next;
                    if (e0Var != null) {
                        arrayList2.add(e0Var);
                    }
                }
                if (arrayList2.isEmpty()) {
                    cy.e0.f48459d.getClass();
                    i70.a aVar = cy.e0.f48462g;
                    arrayList2 = new ArrayList();
                    aVar.getClass();
                    b70.a aVar2 = new b70.a(aVar);
                    while (aVar2.hasNext()) {
                        Object next4 = aVar2.next();
                        cy.e0 e0Var2 = (cy.e0) next4;
                        e0Var2.getClass();
                        if (1 >= e0Var2.f48465c.f48513b) {
                            arrayList2.add(next4);
                        }
                    }
                }
                ArrayList arrayList622 = arrayList2;
                boolean z1422 = a3.f51435a.f51552h;
                boolean z16 = !z1422 && z11;
                cy.m0 m0Var322 = cy.l0.f48505c;
                cy.m0 m0Var422 = cy.k0.f48502c;
                cy.m0 m0Var6 = z11 ? m0Var422 : m0Var322;
                if (!z11 && !z1422) {
                    zy.c cVar5 = zy.c.f98823a;
                    zy.c.i("paywall_plus_hidden", MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, k2Var.f16762a), new Pair("plus_plan_enabled_rc", Boolean.valueOf(zy.c.d("plus_plan_enabled", true))), new Pair("nova_ai_enabled_rc", Boolean.valueOf(zy.c.d("nova_ai_enabled", true)))));
                }
                cy.g gVar722 = new cy.g(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "year", null, 0, false, m0Var322, null, 0L, 0, 448);
                cy.g gVar10 = z11 ? new cy.g(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "year", null, 0, false, m0Var422, null, 0L, 0, 448) : null;
                cy.g gVar11 = z11 ? new cy.g(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "month", null, 0, false, m0Var422, null, 0L, 0, 456) : null;
                w70.i2 i2Var322 = k2Var.f16763b;
                g2 g2Var322 = new g2(m1Var222, arrayList622, gVar722, gVar10, gVar11, m0Var6, m1Var222.f16797m, z16);
                cy.g gVar822 = gVar10;
                cy.g gVar922 = gVar11;
                cy.m0 m0Var522 = m0Var6;
                boolean z1522 = z16;
                i2Var322.getClass();
                i2Var322.k(null, g2Var322);
                if (z11) {
                    zy.c cVar6 = zy.c.f98823a;
                    if (zy.c.h("subscription_sku_plus").length() == 0) {
                        zy.c.i("paywall_plus_misconfigured", b70.h.f17594a);
                    }
                }
                i2Var.f16722t = k2Var;
                i2Var.f16723u = m1Var222;
                i2Var.f16724v = arrayList622;
                i2Var.f16725w = m0Var522;
                i2Var.f16726x = gVar722;
                i2Var.f16727y = gVar822;
                i2Var.f16728z = gVar922;
                i2Var.A = z1522 ? 1 : 0;
                i2Var.D = 2;
                objR = cy.d0.r(i2Var);
                if (objR != coroutineSingletons) {
                    k2Var2 = k2Var;
                    i5 = z1522 ? 1 : 0;
                    gVar = gVar922;
                    gVar2 = gVar822;
                    gVar3 = gVar722;
                    m0Var = m0Var522;
                    arrayList3 = arrayList622;
                    m1Var = m1Var222;
                    cy.e eVar2 = (cy.e) objR;
                    gVar4 = eVar2.f48457a;
                    List list22 = eVar2.f48458b;
                    LinkedHashMap linkedHashMap3 = new LinkedHashMap();
                    while (r9.hasNext()) {
                    }
                    LinkedHashMap linkedHashMap22 = new LinkedHashMap(b70.k.d0(linkedHashMap3.size()));
                    while (r10.hasNext()) {
                    }
                    List list32 = list22;
                    z12 = m1Var.f16796l;
                    if (!z12) {
                    }
                    if (!z12) {
                    }
                    if (z12) {
                    }
                    if (gVar4 == null) {
                        Object value2 = k2Var2.f16763b.getValue();
                        if (!(value2 instanceof g2)) {
                        }
                        if (g2Var != null) {
                            String str22 = m1Var.f16797m;
                            String str32 = str22;
                            w70.i2 i2Var22 = k2Var2.f16763b;
                            g2 g2Var22 = new g2(m1Var, arrayList3, gVar4 != null ? gVar3 : gVar4, gVar5 != null ? gVar2 : gVar5, gVar6 != null ? gVar : gVar6, m0Var, str32, i5 == 0);
                            i2Var22.getClass();
                            i2Var22.k(null, g2Var22);
                        }
                    }
                    return Unit.f71706a;
                }
                return coroutineSingletons;
            }
            zD = true;
            if (zD) {
            }
            String strH9222 = zy.c.h("paywall_default_plus_period");
            m1 m1Var2222 = new m1(b2VarA, z1Var222, strH522, strH622, strH722, strH822, list4, zD222, zD322, zD422, str422, z11, (!strH9222.equals("month") || strH9222.equals("year")) ? strH9222 : "month");
            arrayList2 = new ArrayList();
            while (r14.hasNext()) {
            }
            if (arrayList2.isEmpty()) {
            }
            ArrayList arrayList6222 = arrayList2;
            boolean z14222 = a3.f51435a.f51552h;
            if (z14222) {
            }
            cy.m0 m0Var3222 = cy.l0.f48505c;
            cy.m0 m0Var4222 = cy.k0.f48502c;
            if (z11) {
            }
            if (!z11) {
                zy.c cVar52 = zy.c.f98823a;
                zy.c.i("paywall_plus_hidden", MapsKt.j0(new Pair(Plan.AMP_PLAN_SOURCE, k2Var.f16762a), new Pair("plus_plan_enabled_rc", Boolean.valueOf(zy.c.d("plus_plan_enabled", true))), new Pair("nova_ai_enabled_rc", Boolean.valueOf(zy.c.d("nova_ai_enabled", true)))));
            }
            cy.g gVar7222 = new cy.g(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "year", null, 0, false, m0Var3222, null, 0L, 0, 448);
            if (z11) {
            }
            if (z11) {
            }
            w70.i2 i2Var3222 = k2Var.f16763b;
            g2 g2Var3222 = new g2(m1Var2222, arrayList6222, gVar7222, gVar10, gVar11, m0Var6, m1Var2222.f16797m, z16);
            cy.g gVar8222 = gVar10;
            cy.g gVar9222 = gVar11;
            cy.m0 m0Var5222 = m0Var6;
            boolean z15222 = z16;
            i2Var3222.getClass();
            i2Var3222.k(null, g2Var3222);
            if (z11) {
            }
            i2Var.f16722t = k2Var;
            i2Var.f16723u = m1Var2222;
            i2Var.f16724v = arrayList6222;
            i2Var.f16725w = m0Var5222;
            i2Var.f16726x = gVar7222;
            i2Var.f16727y = gVar8222;
            i2Var.f16728z = gVar9222;
            i2Var.A = z15222 ? 1 : 0;
            i2Var.D = 2;
            objR = cy.d0.r(i2Var);
            if (objR != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        String strH92222 = zy.c.h("paywall_default_plus_period");
        m1 m1Var22222 = new m1(b2VarA, z1Var222, strH522, strH622, strH722, strH822, list4, zD222, zD322, zD422, str422, z11, (!strH92222.equals("month") || strH92222.equals("year")) ? strH92222 : "month");
        arrayList2 = new ArrayList();
        while (r14.hasNext()) {
        }
        if (arrayList2.isEmpty()) {
        }
        ArrayList arrayList62222 = arrayList2;
        boolean z142222 = a3.f51435a.f51552h;
        if (z142222) {
        }
        cy.m0 m0Var32222 = cy.l0.f48505c;
        cy.m0 m0Var42222 = cy.k0.f48502c;
        if (z11) {
        }
        if (!z11) {
        }
        cy.g gVar72222 = new cy.g(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "year", null, 0, false, m0Var32222, null, 0L, 0, 448);
        if (z11) {
        }
        if (z11) {
        }
        w70.i2 i2Var32222 = k2Var.f16763b;
        g2 g2Var32222 = new g2(m1Var22222, arrayList62222, gVar72222, gVar10, gVar11, m0Var6, m1Var22222.f16797m, z16);
        cy.g gVar82222 = gVar10;
        cy.g gVar92222 = gVar11;
        cy.m0 m0Var52222 = m0Var6;
        boolean z152222 = z16;
        i2Var32222.getClass();
        i2Var32222.k(null, g2Var32222);
        if (z11) {
        }
        i2Var.f16722t = k2Var;
        i2Var.f16723u = m1Var22222;
        i2Var.f16724v = arrayList62222;
        i2Var.f16725w = m0Var52222;
        i2Var.f16726x = gVar72222;
        i2Var.f16727y = gVar82222;
        i2Var.f16728z = gVar92222;
        i2Var.A = z152222 ? 1 : 0;
        i2Var.D = 2;
        objR = cy.d0.r(i2Var);
        if (objR != coroutineSingletons) {
        }
        return coroutineSingletons;
    }

    public final void b(String str) {
        w70.i2 i2Var = this.f16763b;
        Object value = i2Var.getValue();
        g2 g2Var = value instanceof g2 ? (g2) value : null;
        if (g2Var == null) {
            return;
        }
        if (!Intrinsics.b(g2Var.f16694g, str)) {
            zy.c cVar = zy.c.f98823a;
            zy.c.i("paywall_period_switched", e(b70.k.e0(new Pair("period", str))));
        }
        g2 g2VarA = g2.a(g2Var, null, str, 191);
        i2Var.getClass();
        i2Var.k(null, g2VarA);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Type inference failed for: r2v10, types: [b10.k2] */
    /* JADX WARN: Type inference failed for: r2v15 */
    /* JADX WARN: Type inference failed for: r2v16 */
    /* JADX WARN: Type inference failed for: r2v18 */
    /* JADX WARN: Type inference failed for: r2v19 */
    /* JADX WARN: Type inference failed for: r2v2, types: [b10.j2, kotlin.coroutines.jvm.internal.ContinuationImpl] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(ContinuationImpl continuationImpl) throws Throwable {
        k2 j2Var;
        k2 k2Var;
        k2 k2Var2;
        w70.i2 i2Var;
        Boolean bool;
        w70.i2 i2Var2 = this.f16765d;
        if (continuationImpl instanceof j2) {
            j2 j2Var2 = (j2) continuationImpl;
            int i5 = j2Var2.f16744y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                j2Var2.f16744y = i5 - Integer.MIN_VALUE;
                j2Var = j2Var2;
            } else {
                j2Var = new j2(this, continuationImpl);
            }
        }
        Object objJ = j2Var.f16742w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = j2Var.f16744y;
        try {
            if (i11 == 0) {
                ResultKt.b(objJ);
                AtomicBoolean atomicBoolean = this.f16768g;
                if (!atomicBoolean.compareAndSet(false, true)) {
                    return Unit.f71706a;
                }
                try {
                    i2Var2.j(null);
                    Object value = this.f16763b.getValue();
                    if ((value instanceof g2 ? (g2) value : null) == null) {
                        Boolean bool2 = Boolean.FALSE;
                        i2Var2.getClass();
                        i2Var2.k(null, bool2);
                        Unit unit = Unit.f71706a;
                        atomicBoolean.set(false);
                        return unit;
                    }
                    try {
                        String strConcat = this.f16762a.concat("_restore");
                        j2Var.f16739t = this;
                        j2Var.f16740u = i2Var2;
                        j2Var.f16741v = i2Var2;
                        j2Var.f16744y = 1;
                        objJ = cy.d0.J(strConcat, j2Var);
                        if (objJ == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        k2Var2 = this;
                        i2Var = i2Var2;
                    } catch (Exception e3) {
                        e = e3;
                        k2Var = this;
                        mc0.b bVar = mc0.d.f76206a;
                        bVar.r("NovaPaywall");
                        bVar.p(e, "onRestoreClicked: restore threw", new Object[0]);
                        bool = Boolean.FALSE;
                        j2Var = k2Var;
                        i2Var2.j(bool);
                        j2Var.f16768g.set(false);
                        return Unit.f71706a;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    j2Var = this;
                    j2Var.f16768g.set(false);
                    throw th;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                i2Var2 = j2Var.f16741v;
                i2Var = j2Var.f16740u;
                k2Var2 = j2Var.f16739t;
                try {
                    ResultKt.b(objJ);
                    k2Var2 = k2Var2;
                } catch (Exception e11) {
                    e = e11;
                    i2Var2 = i2Var;
                    k2Var = k2Var2;
                    mc0.b bVar2 = mc0.d.f76206a;
                    bVar2.r("NovaPaywall");
                    bVar2.p(e, "onRestoreClicked: restore threw", new Object[0]);
                    bool = Boolean.FALSE;
                    j2Var = k2Var;
                    i2Var2.j(bool);
                    j2Var.f16768g.set(false);
                    return Unit.f71706a;
                }
            }
            bool = (Boolean) objJ;
            j2Var = k2Var2;
            i2Var2.j(bool);
            j2Var.f16768g.set(false);
            return Unit.f71706a;
        } catch (Throwable th3) {
            th = th3;
        }
    }

    public final void d(cy.m0 m0Var) {
        w70.i2 i2Var = this.f16763b;
        Object value = i2Var.getValue();
        g2 g2Var = value instanceof g2 ? (g2) value : null;
        if (g2Var == null) {
            return;
        }
        g2 g2VarA = g2.a(g2Var, m0Var, null, Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE);
        i2Var.getClass();
        i2Var.k(null, g2VarA);
    }

    public final MapBuilder e(Map map) {
        MapBuilder mapBuilder = new MapBuilder();
        mapBuilder.put(Plan.AMP_PLAN_SOURCE, this.f16762a);
        mapBuilder.putAll(map);
        return mapBuilder.b();
    }
}
