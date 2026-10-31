package com.bytedance.sdk.component.adexpress.dynamic.lud;

import android.text.TextUtils;
import b.c9;
import com.amplitude.core.events.Identify;
import com.bytedance.sdk.component.adexpress.zb.ry;
import com.tiktok.util.TTConst;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb {
    private String fby;

    /* renamed from: jw, reason: collision with root package name */
    private ry f23445jw;

    /* renamed from: lt, reason: collision with root package name */
    private int f23446lt;
    private double lud;

    /* renamed from: ul, reason: collision with root package name */
    private double f23447ul;
    public Map<String, sya> ycx = new HashMap();

    /* renamed from: zb, reason: collision with root package name */
    public Map<String, sya> f23448zb = new HashMap();
    public Map<String, sya> sya = new HashMap();

    /* renamed from: dj, reason: collision with root package name */
    private double f23444dj = Math.random();

    public static class sya {
        float ycx;

        /* renamed from: zb, reason: collision with root package name */
        float f23449zb;

        public sya() {
        }

        public String toString() {
            StringBuilder sb2 = new StringBuilder("UnitSize{width=");
            sb2.append(this.ycx);
            sb2.append(", height=");
            return c9.k(sb2, this.f23449zb, AbstractJsonLexerKt.END_OBJ);
        }

        public sya(float f11, float f12) {
            this.ycx = f11;
            this.f23449zb = f12;
        }
    }

    public static class ycx implements Cloneable {
        float sya;
        float ycx;

        /* renamed from: zb, reason: collision with root package name */
        boolean f23450zb;

        public Object clone() {
            try {
                return (ycx) super.clone();
            } catch (CloneNotSupportedException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX7ApSf0ohw==", "eOEghRaobPWVRtJPyDesLUPHI5MM", "WOIimwY=", 810);
                return null;
            }
        }
    }

    /* renamed from: com.bytedance.sdk.component.adexpress.dynamic.lud.zb$zb, reason: collision with other inner class name */
    public static class C0029zb {

        /* renamed from: dj, reason: collision with root package name */
        double f23451dj;
        float lud;
        int sya;
        float ycx;

        /* renamed from: zb, reason: collision with root package name */
        int f23452zb;

        public static JSONObject ycx(C0029zb c0029zb) throws JSONException {
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.put("fontSize", c0029zb.ycx);
                jSONObject.put("letterSpacing", c0029zb.f23452zb);
                jSONObject.put("lineHeight", c0029zb.f23451dj);
                jSONObject.put("maxWidth", c0029zb.lud);
                jSONObject.put("fontWeight", c0029zb.sya);
                return jSONObject;
            } catch (JSONException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX7ApSf0ohw==", "eOEghRaobPWVRtJPyDevJk/ZJJEXtFrTmUbS", "T+EHhgyy", 793);
                return jSONObject;
            }
        }
    }

    public zb(double d5, int i5, double d11, String str, ry ryVar) {
        this.lud = d5;
        this.f23446lt = i5;
        this.f23447ul = d11;
        this.fby = str;
        this.f23445jw = ryVar;
    }

    private sya lt(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar, float f11, float f12) {
        new sya();
        com.bytedance.sdk.component.adexpress.dynamic.dj.lt ltVarLud = fbyVar.jc().lud();
        fbyVar.jc().sya();
        ltVarLud.duz();
        float fPmi = ltVarLud.pmi();
        int iUf = ltVarLud.uf();
        double dMp = ltVarLud.mp();
        int iUz = ltVarLud.uz();
        boolean zSz = ltVarLud.sz();
        boolean zLv = ltVarLud.lv();
        int iYi = ltVarLud.yi();
        C0029zb c0029zb = new C0029zb();
        c0029zb.ycx = fPmi;
        c0029zb.f23452zb = iUf;
        c0029zb.sya = iUz;
        c0029zb.f23451dj = dMp;
        c0029zb.lud = f11;
        return ycx(fbyVar.jc().sya(), c0029zb, zSz, zLv, iYi, fbyVar);
    }

    private sya lud(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar, float f11, float f12) {
        String str = fbyVar.sya() + "_" + f11 + "_" + f12;
        if (this.sya.containsKey(str)) {
            return this.sya.get(str);
        }
        sya syaVarLt = lt(fbyVar, f11, f12);
        this.sya.put(str, syaVarLt);
        return syaVarLt;
    }

    public sya dj(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar, float f11, float f12) {
        float fMin;
        float f13;
        float f14;
        sya syaVar = new sya();
        float f15 = 0.0f;
        if (f12 <= 0.0f || f11 <= 0.0f) {
            syaVar.ycx = 0.0f;
            syaVar.f23449zb = 0.0f;
            return syaVar;
        }
        if (fbyVar.pmi()) {
            return ycx(fbyVar, f11, f12);
        }
        float fFby = fbyVar.fby();
        float fJw = fbyVar.jw();
        float fSyc = fbyVar.syc();
        float fDy = fbyVar.dy();
        com.bytedance.sdk.component.adexpress.dynamic.dj.lt ltVarLud = fbyVar.jc().lud();
        String strBhi = ltVarLud.bhi();
        String strTru = ltVarLud.tru();
        float fMin2 = ((TextUtils.equals(strBhi, "flex") || TextUtils.equals(strBhi, TTConst.TRACK_TYPE_AUTO)) ? f11 : Math.min(fFby, f11)) - fSyc;
        if (TextUtils.equals(strTru, "scale")) {
            fMin = Math.round(fMin2 / fJw) + fDy;
            if (fMin > f12) {
                fMin2 = Math.round((f12 - fDy) * fJw);
            }
        } else {
            fMin = (TextUtils.equals(strTru, TTConst.TRACK_TYPE_AUTO) || TextUtils.equals(strTru, "flex")) ? f12 : Math.min(fJw, f12);
        }
        float f16 = fMin - fDy;
        List<List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby>> listWie = fbyVar.wie();
        float fMax = 0.0f;
        float fMax2 = 0.0f;
        for (List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> list : listWie) {
            float f17 = f15;
            float f18 = fSyc;
            sya syaVarZb = zb(list, fMin2, f16);
            if (zb(list)) {
                f14 = f17 + 1.0f;
            } else {
                fMax = Math.max(fMax, syaVarZb.ycx);
                f14 = f17;
            }
            float f19 = f14;
            float f21 = fMin2;
            fMax2 = fbyVar.jc().zb().equals("carousel") ? Math.max(fbyVar.jw(), syaVarZb.f23449zb) : fMax2 + syaVarZb.f23449zb;
            fSyc = f18;
            f15 = f19;
            fMin2 = f21;
        }
        float f22 = f15;
        float f23 = fMin2;
        float f24 = fSyc;
        if (!TextUtils.equals(strBhi, TTConst.TRACK_TYPE_AUTO)) {
            f13 = f23;
        } else if (f22 == listWie.size()) {
            f13 = f11;
        } else {
            for (List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> list2 : listWie) {
                sya(list2);
                zb(list2, fMax, f16);
            }
            f13 = fMax;
        }
        if (TextUtils.equals(strTru, TTConst.TRACK_TYPE_AUTO)) {
            if (fMax2 <= f12) {
                f16 = fMax2;
            } else {
                ycx(listWie, f13, f16);
            }
        } else if ((TextUtils.equals(strTru, "fixed") || TextUtils.equals(strTru, "flex")) && f16 < fMax2) {
            ycx(listWie, f13, f16);
        }
        syaVar.ycx = Math.min(f13 + f24, f11);
        syaVar.f23449zb = Math.min(f16 + fDy, f12);
        return syaVar;
    }

    public sya sya(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar, float f11, float f12) {
        if (fbyVar == null) {
            return null;
        }
        sya syaVarYcx = ycx(fbyVar);
        if (syaVarYcx != null && (syaVarYcx.ycx != 0.0f || syaVarYcx.f23449zb != 0.0f)) {
            return syaVarYcx;
        }
        sya syaVarDj = dj(fbyVar, f11, f12);
        ycx(fbyVar, syaVarDj);
        return syaVarDj;
    }

    public sya ycx(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar, float f11, float f12) {
        float f13;
        if (TextUtils.isEmpty(fbyVar.jc().sya()) && fbyVar.jc().lud().giw() == null) {
            return new sya(0.0f, 0.0f);
        }
        if (c9.u(fbyVar, "creative-playable-bait")) {
            return new sya(0.0f, 0.0f);
        }
        float fFby = fbyVar.fby();
        float fJw = fbyVar.jw();
        com.bytedance.sdk.component.adexpress.dynamic.dj.lt ltVarLud = fbyVar.jc().lud();
        String strBhi = ltVarLud.bhi();
        String strTru = ltVarLud.tru();
        float fRy = fbyVar.ry();
        float fXkz = fbyVar.xkz();
        float fSyc = fbyVar.syc();
        float fDy = fbyVar.dy();
        if (TextUtils.equals(strBhi, "fixed")) {
            f11 = Math.min(fFby, f11);
            if (TextUtils.equals(strTru, TTConst.TRACK_TYPE_AUTO)) {
                f13 = zb(fbyVar, f11 - fSyc, f12 - fDy).f23449zb;
                fJw = f13 + fDy;
            }
        } else if (TextUtils.equals(strBhi, TTConst.TRACK_TYPE_AUTO)) {
            sya syaVarZb = zb(fbyVar, f11 - fSyc, f12 - fDy);
            f11 = syaVarZb.ycx + fSyc;
            if (TextUtils.equals(strTru, TTConst.TRACK_TYPE_AUTO)) {
                f13 = syaVarZb.f23449zb;
                fJw = f13 + fDy;
            }
        } else if (!TextUtils.equals(strBhi, "flex")) {
            f11 = fFby;
        } else if (TextUtils.equals(strTru, TTConst.TRACK_TYPE_AUTO)) {
            f13 = zb(fbyVar, f11 - fSyc, f12 - fDy).f23449zb;
            fJw = f13 + fDy;
        }
        if (TextUtils.equals(strTru, "scale")) {
            float fRound = Math.round((f11 - fRy) / fJw) + fXkz;
            if (fRound > f12) {
                f11 = Math.round((f12 - fXkz) * fJw) + fRy;
            } else {
                f12 = fRound;
            }
        } else if (TextUtils.equals(strTru, "fixed")) {
            f12 = Math.min(fJw + fXkz, f12);
        } else if (!TextUtils.equals(strTru, "flex")) {
            f12 = fJw;
        }
        sya syaVar = new sya();
        syaVar.ycx = f11;
        syaVar.f23449zb = f12;
        return syaVar;
    }

    public sya zb(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar, float f11, float f12) {
        sya syaVar = new sya();
        if (fbyVar.jc().lud() == null) {
            return syaVar;
        }
        sya syaVarLud = lud(fbyVar, f11, f12);
        float f13 = syaVarLud.ycx;
        float f14 = syaVarLud.f23449zb;
        syaVar.ycx = Math.min(f13, f11);
        syaVar.f23449zb = Math.min(f14, f12);
        return syaVar;
    }

    private sya sya(List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> list, float f11, float f12) {
        float fMax;
        dj(list);
        sya syaVar = new sya();
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar : list) {
            com.bytedance.sdk.component.adexpress.dynamic.dj.lt ltVarLud = fbyVar.jc().lud();
            if (ltVarLud.ui() == 1 || ltVarLud.ui() == 2) {
                arrayList.add(fbyVar);
            }
            if (ltVarLud.ui() != 1 && ltVarLud.ui() != 2) {
                arrayList2.add(fbyVar);
            }
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            sya((com.bytedance.sdk.component.adexpress.dynamic.dj.fby) it.next(), f11, f12);
        }
        if (arrayList2.size() <= 0) {
            return syaVar;
        }
        ArrayList arrayList3 = new ArrayList();
        Iterator it2 = arrayList2.iterator();
        while (it2.hasNext()) {
            arrayList3.add(Float.valueOf(sya((com.bytedance.sdk.component.adexpress.dynamic.dj.fby) it2.next(), f11, f12).ycx));
        }
        ArrayList arrayList4 = new ArrayList();
        int i5 = 0;
        while (true) {
            if (i5 >= arrayList2.size()) {
                break;
            }
            com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar2 = (com.bytedance.sdk.component.adexpress.dynamic.dj.fby) arrayList2.get(i5);
            String strBhi = fbyVar2.jc().lud().bhi();
            float fFby = fbyVar2.fby();
            boolean zEquals = TextUtils.equals(strBhi, "flex");
            if (TextUtils.equals(strBhi, TTConst.TRACK_TYPE_AUTO)) {
                List<List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby>> listWie = fbyVar2.wie();
                if (listWie == null || listWie.size() <= 0) {
                    zEquals = false;
                } else {
                    Iterator<List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby>> it3 = listWie.iterator();
                    while (it3.hasNext()) {
                        if (zb(it3.next())) {
                            zEquals = true;
                            break;
                        }
                    }
                    zEquals = false;
                }
            }
            ycx ycxVar = new ycx();
            if (!zEquals) {
                fFby = ((Float) arrayList3.get(i5)).floatValue();
            }
            ycxVar.ycx = fFby;
            ycxVar.f23450zb = !zEquals;
            if (zEquals) {
                fMax = ((Float) arrayList3.get(i5)).floatValue();
            }
            ycxVar.sya = fMax;
            arrayList4.add(ycxVar);
            i5++;
        }
        ycx(arrayList4, f11, arrayList2);
        List<ycx> listYcx = jc.ycx(f11, arrayList4);
        float f13 = 0.0f;
        for (int i11 = 0; i11 < arrayList2.size(); i11++) {
            f13 += listYcx.get(i11).ycx;
            if (((Float) arrayList3.get(i11)).floatValue() != listYcx.get(i11).ycx) {
                dj((com.bytedance.sdk.component.adexpress.dynamic.dj.fby) arrayList2.get(i11));
            }
        }
        Iterator it4 = arrayList2.iterator();
        int i12 = 0;
        boolean z11 = false;
        while (true) {
            if (!it4.hasNext()) {
                break;
            }
            i12++;
            if (!zb((com.bytedance.sdk.component.adexpress.dynamic.dj.fby) it4.next())) {
                z11 = false;
                break;
            }
            if (i12 == arrayList2.size()) {
                z11 = true;
            }
        }
        fMax = z11 ? f12 : 0.0f;
        ArrayList arrayList5 = new ArrayList();
        for (int i13 = 0; i13 < arrayList2.size(); i13++) {
            com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar3 = (com.bytedance.sdk.component.adexpress.dynamic.dj.fby) arrayList2.get(i13);
            sya syaVarSya = sya(fbyVar3, listYcx.get(i13).ycx, f12);
            if (!zb(fbyVar3)) {
                fMax = Math.max(fMax, syaVarSya.f23449zb);
            }
            arrayList5.add(syaVarSya);
        }
        ArrayList arrayList6 = new ArrayList();
        Iterator it5 = arrayList5.iterator();
        while (it5.hasNext()) {
            arrayList6.add(Float.valueOf(((sya) it5.next()).f23449zb));
        }
        if (!z11) {
            for (int i14 = 0; i14 < arrayList2.size(); i14++) {
                com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar4 = (com.bytedance.sdk.component.adexpress.dynamic.dj.fby) arrayList2.get(i14);
                if (zb(fbyVar4) && ((Float) arrayList6.get(i14)).floatValue() != fMax) {
                    dj(fbyVar4);
                    sya(fbyVar4, listYcx.get(i14).ycx, fMax);
                }
            }
        }
        syaVar.ycx = f13;
        syaVar.f23449zb = fMax;
        return syaVar;
    }

    private boolean zb(List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> list) {
        List<List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby>> listWie;
        Iterator<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> it = list.iterator();
        while (it.hasNext()) {
            if (TextUtils.equals(it.next().jc().lud().bhi(), "flex")) {
                return true;
            }
        }
        while (true) {
            boolean z11 = false;
            for (com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar : list) {
                if (TextUtils.equals(fbyVar.jc().lud().bhi(), TTConst.TRACK_TYPE_AUTO) && (listWie = fbyVar.wie()) != null) {
                    int i5 = 0;
                    for (List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> list2 : listWie) {
                        i5++;
                        if (!zb(list2)) {
                            break;
                        }
                        if (i5 == list2.size()) {
                            z11 = true;
                        }
                    }
                }
            }
            return z11;
        }
    }

    private String lud(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        return fbyVar.sya();
    }

    private sya zb(List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> list, float f11, float f12) {
        sya syaVarYcx = ycx(list);
        if (syaVarYcx != null && (syaVarYcx.ycx != 0.0f || syaVarYcx.f23449zb != 0.0f)) {
            return syaVarYcx;
        }
        sya syaVarSya = sya(list, f11, f12);
        ycx(list, syaVarSya);
        return syaVarSya;
    }

    private boolean zb(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        if (fbyVar == null) {
            return false;
        }
        if (TextUtils.equals(fbyVar.jc().lud().tru(), "flex")) {
            return true;
        }
        return sya(fbyVar);
    }

    private sya ycx(String str, C0029zb c0029zb, boolean z11, boolean z12, int i5, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) throws JSONException {
        return ea.ycx(str, fbyVar.jc().zb(), C0029zb.ycx(c0029zb).toString(), z11, z12, i5, fbyVar, this.lud, this.f23446lt, this.f23447ul, this.fby, this.f23445jw);
    }

    private void dj(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        this.ycx.remove(lud(fbyVar));
        List<List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby>> listWie = fbyVar.wie();
        if (listWie == null || listWie.size() <= 0) {
            return;
        }
        Iterator<List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby>> it = listWie.iterator();
        while (it.hasNext()) {
            sya(it.next());
        }
    }

    private void ycx(List<List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby>> list, float f11, float f12) {
        if (list == null || list.size() <= 0) {
            return;
        }
        Iterator<List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby>> it = list.iterator();
        boolean z11 = false;
        while (it.hasNext()) {
            if (ycx(it.next(), false)) {
                z11 = true;
            }
        }
        ArrayList arrayList = new ArrayList();
        for (List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> list2 : list) {
            ycx ycxVar = new ycx();
            boolean zYcx = ycx(list2, !z11);
            ycxVar.ycx = zYcx ? 1.0f : zb(list2, f11, f12).f23449zb;
            ycxVar.f23450zb = !zYcx;
            arrayList.add(ycxVar);
        }
        List<ycx> listYcx = jc.ycx(f12, arrayList);
        for (int i5 = 0; i5 < list.size(); i5++) {
            if (((ycx) arrayList.get(i5)).ycx != listYcx.get(i5).ycx) {
                List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> list3 = list.get(i5);
                sya(list3);
                zb(list3, f11, listYcx.get(i5).ycx);
            }
        }
    }

    private String dj(List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> list) {
        StringBuilder sb2 = new StringBuilder();
        for (int i5 = 0; i5 < list.size(); i5++) {
            String strSya = list.get(i5).sya();
            if (i5 < list.size() - 1) {
                sb2.append(strSya);
                sb2.append(Identify.UNSET_VALUE);
            } else {
                sb2.append(strSya);
            }
        }
        return sb2.toString();
    }

    private boolean ycx(List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> list, boolean z11) {
        for (com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar : list) {
            com.bytedance.sdk.component.adexpress.dynamic.dj.lt ltVarLud = fbyVar.jc().lud();
            String strTru = ltVarLud.tru();
            if (TextUtils.equals(strTru, "flex") || (z11 && ((TextUtils.equals(ltVarLud.bhi(), "flex") && TextUtils.equals(ltVarLud.tru(), "scale") && com.bytedance.sdk.component.adexpress.dynamic.dj.lud.ycx.get(fbyVar.jc().zb()).intValue() == 7) || TextUtils.equals(strTru, "flex")))) {
                return true;
            }
        }
        Iterator<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> it = list.iterator();
        while (it.hasNext()) {
            if (sya(it.next())) {
                return true;
            }
        }
        return false;
    }

    private boolean sya(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        List<List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby>> listWie;
        if (!fbyVar.pmi() && TextUtils.equals(fbyVar.jc().lud().tru(), TTConst.TRACK_TYPE_AUTO) && (listWie = fbyVar.wie()) != null && listWie.size() > 0) {
            if (listWie.size() == 1) {
                Iterator<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> it = listWie.get(0).iterator();
                while (it.hasNext()) {
                    if (!zb(it.next())) {
                        return false;
                    }
                }
                return true;
            }
            Iterator<List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby>> it2 = listWie.iterator();
            while (it2.hasNext()) {
                if (ycx(it2.next(), true)) {
                    return true;
                }
            }
        }
        return false;
    }

    private void ycx(List<ycx> list, float f11, List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> list2) {
        float f12 = 0.0f;
        for (ycx ycxVar : list) {
            if (ycxVar.f23450zb) {
                f12 += ycxVar.ycx;
            }
        }
        if (f12 > f11) {
            int i5 = 0;
            for (int i11 = 0; i11 < list2.size(); i11++) {
                if (list.get(i11).f23450zb && list2.get(i11).wwx()) {
                    i5++;
                }
            }
            if (i5 > 0) {
                float fCeil = (float) (Math.ceil(((f12 - f11) / i5) * 1000.0f) / 1000.0d);
                for (int i12 = 0; i12 < list2.size(); i12++) {
                    ycx ycxVar2 = list.get(i12);
                    if (ycxVar2.f23450zb && list2.get(i12).wwx()) {
                        ycxVar2.ycx -= fCeil;
                    }
                }
            }
        }
    }

    private void sya(List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> list) {
        if (list == null || list.size() <= 0) {
            return;
        }
        this.f23448zb.remove(dj(list));
        Iterator<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> it = list.iterator();
        while (it.hasNext()) {
            dj(it.next());
        }
    }

    public void ycx() {
        this.sya.clear();
        this.ycx.clear();
        this.f23448zb.clear();
    }

    public sya ycx(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        return this.ycx.get(lud(fbyVar));
    }

    public sya ycx(List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> list) {
        return this.f23448zb.get(dj(list));
    }

    private void ycx(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar, sya syaVar) {
        this.ycx.put(lud(fbyVar), syaVar);
    }

    private void ycx(List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> list, sya syaVar) {
        this.f23448zb.put(dj(list), syaVar);
    }
}
