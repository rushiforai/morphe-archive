package com.bytedance.adsdk.ugeno.core;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import com.bytedance.adsdk.ugeno.core.ul;
import com.bytedance.adsdk.ugeno.zb.ycx;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ok {

    /* renamed from: dj, reason: collision with root package name */
    private fby f22205dj;

    /* renamed from: dy, reason: collision with root package name */
    private boolean f22206dy;

    /* renamed from: ea, reason: collision with root package name */
    private String f22207ea;
    private com.bytedance.adsdk.ugeno.lud.xkz fby;
    private float htf;

    /* renamed from: jc, reason: collision with root package name */
    private ul f22208jc;

    /* renamed from: jw, reason: collision with root package name */
    private com.bytedance.adsdk.ugeno.lud.ry f22209jw;

    /* renamed from: lt, reason: collision with root package name */
    private pmi f22210lt;
    private syc lud;

    /* renamed from: ok, reason: collision with root package name */
    private ea f22211ok;
    private List<String> pmi;
    private com.bytedance.adsdk.ugeno.zb.sya<View> sya;
    private com.bytedance.adsdk.ugeno.lud.ycx.ycx syc;
    private float thx;

    /* renamed from: uh, reason: collision with root package name */
    private lud f22213uh;

    /* renamed from: ul, reason: collision with root package name */
    private dy f22214ul;
    private boolean wie;
    private jw wwx;
    private Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private JSONObject f22215zb;

    /* renamed from: ry, reason: collision with root package name */
    private boolean f22212ry = true;
    private boolean xkz = false;

    public ok(Context context) {
        this.ycx = context;
    }

    public void ycx(String str, ea eaVar) {
        this.f22211ok = eaVar;
        this.f22207ea = str;
        if (eaVar != null) {
            this.f22215zb = eaVar.ycx();
        }
    }

    public com.bytedance.adsdk.ugeno.zb.sya<View> zb(ul.ycx ycxVar, com.bytedance.adsdk.ugeno.zb.sya<View> syaVar) {
        List<ul.ycx> listSya;
        ycx.C0024ycx c0024ycxJc = null;
        if (!ul.dj(ycxVar)) {
            return null;
        }
        String strDj = ycxVar.dj();
        zb zbVarYcx = dj.ycx(strDj);
        if (zbVarYcx == null) {
            this.f22206dy = true;
            if (this.pmi == null) {
                this.pmi = new ArrayList();
            }
            this.pmi.add(strDj);
            return null;
        }
        com.bytedance.adsdk.ugeno.zb.sya syaVarYcx = zbVarYcx.ycx(this.ycx);
        if (syaVarYcx == null) {
            return null;
        }
        syaVarYcx.jw(com.bytedance.adsdk.ugeno.dj.zb.ycx(ycxVar.ycx(), this.f22215zb));
        syaVarYcx.jc(strDj);
        syaVarYcx.sya(ycxVar.lud());
        syaVarYcx.ycx(ycxVar);
        syaVarYcx.ycx(this.f22211ok);
        if (syaVar instanceof com.bytedance.adsdk.ugeno.zb.ycx) {
            com.bytedance.adsdk.ugeno.zb.ycx ycxVar2 = (com.bytedance.adsdk.ugeno.zb.ycx) syaVar;
            syaVarYcx.ycx(ycxVar2);
            c0024ycxJc = ycxVar2.jc();
        }
        Iterator<String> itKeys = ycxVar.lud().keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            String strYcx = com.bytedance.adsdk.ugeno.dj.zb.ycx(ycxVar.lud().optString(next), this.f22215zb);
            syaVarYcx.ycx(next, strYcx);
            if (c0024ycxJc != null) {
                c0024ycxJc.ycx(this.ycx, next, strYcx);
            }
        }
        if (syaVarYcx instanceof com.bytedance.adsdk.ugeno.zb.ycx) {
            List<ul.ycx> listLt = ycxVar.lt();
            if (listLt == null || listLt.size() <= 0) {
                if (TextUtils.equals(syaVarYcx.kgy(), "RecyclerLayout") && (listSya = this.f22208jc.sya()) != null && listSya.size() > 0) {
                    Iterator<ul.ycx> it = listSya.iterator();
                    while (it.hasNext()) {
                        com.bytedance.adsdk.ugeno.zb.sya<View> syaVarZb = zb(it.next(), (com.bytedance.adsdk.ugeno.zb.sya<View>) syaVarYcx);
                        if (syaVarZb != null && syaVarZb.dwi()) {
                            ((com.bytedance.adsdk.ugeno.zb.ycx) syaVarYcx).ycx(syaVarZb);
                        }
                    }
                }
                return syaVarYcx;
            }
            if (TextUtils.equals(syaVarYcx.kgy(), "Swiper") && listLt.size() != 1) {
                Log.e("UGTemplateEngine", "Swiper must be only one widget");
            }
            Iterator<ul.ycx> it2 = listLt.iterator();
            while (it2.hasNext()) {
                com.bytedance.adsdk.ugeno.zb.sya<View> syaVarZb2 = zb(it2.next(), (com.bytedance.adsdk.ugeno.zb.sya<View>) syaVarYcx);
                if (syaVarZb2 != null && syaVarZb2.dwi()) {
                    ((com.bytedance.adsdk.ugeno.zb.ycx) syaVarYcx).ycx(syaVarZb2);
                }
            }
        }
        if (c0024ycxJc != null) {
            syaVarYcx.ycx(c0024ycxJc.ycx());
        }
        this.sya = syaVarYcx;
        return syaVarYcx;
    }

    public com.bytedance.adsdk.ugeno.zb.sya<View> ycx(JSONObject jSONObject, JSONObject jSONObject2, JSONObject jSONObject3) throws JSONException {
        this.f22215zb = jSONObject2;
        pmi pmiVar = this.f22210lt;
        if (pmiVar != null) {
            pmiVar.ycx();
        }
        ul ulVar = new ul(jSONObject, jSONObject2, jSONObject3);
        this.f22208jc = ulVar;
        ulVar.ycx(this.htf, this.thx);
        this.syc = new com.bytedance.adsdk.ugeno.lud.ycx.ycx();
        if (!(this.lud instanceof com.bytedance.adsdk.ugeno.core.ycx.zb)) {
            this.sya = ycx(this.f22208jc.ycx(), (com.bytedance.adsdk.ugeno.zb.sya<View>) null);
            if (this.wwx == null) {
                pmi pmiVar2 = this.f22210lt;
                if (pmiVar2 != null) {
                    pmiVar2.zb();
                    this.sya.ycx(this.f22210lt);
                    this.f22210lt.sya();
                }
                ycx(this.sya);
                if (this.f22210lt != null) {
                    wie wieVar = new wie();
                    wieVar.ycx(0);
                    wieVar.ycx(this.sya);
                    this.f22210lt.ycx(wieVar);
                }
                return this.sya;
            }
            throw null;
        }
        this.f22208jc.zb();
        throw null;
    }

    public com.bytedance.adsdk.ugeno.zb.sya<View> ycx(ul.ycx ycxVar, JSONObject jSONObject, JSONObject jSONObject2) throws JSONException {
        this.f22215zb = jSONObject;
        pmi pmiVar = this.f22210lt;
        if (pmiVar != null) {
            pmiVar.ycx();
        }
        this.syc = new com.bytedance.adsdk.ugeno.lud.ycx.ycx();
        if (!(this.lud instanceof com.bytedance.adsdk.ugeno.core.ycx.zb)) {
            this.sya = ycx(ycxVar, (com.bytedance.adsdk.ugeno.zb.sya<View>) null);
            pmi pmiVar2 = this.f22210lt;
            if (pmiVar2 != null) {
                pmiVar2.zb();
                this.sya.ycx(this.f22210lt);
            }
            ycx(this.sya);
            return this.sya;
        }
        throw null;
    }

    public com.bytedance.adsdk.ugeno.zb.sya<View> ycx(ul.ycx ycxVar, com.bytedance.adsdk.ugeno.zb.sya<View> syaVar) {
        ycx.C0024ycx c0024ycxJc;
        List<ul.ycx> listSya;
        if (!ul.dj(ycxVar)) {
            return null;
        }
        String strDj = ycxVar.dj();
        zb zbVarYcx = dj.ycx(strDj);
        zb zbVar = zbVarYcx;
        if (zbVarYcx == null) {
            this.f22206dy = true;
            if (this.pmi == null) {
                this.pmi = new ArrayList();
            }
            this.pmi.add(strDj);
            strDj = "View";
            ycxVar.ycx("View");
            zb zbVarYcx2 = dj.ycx("View");
            zbVar = zbVarYcx2;
            if (zbVarYcx2 == null) {
                return null;
            }
        }
        com.bytedance.adsdk.ugeno.zb.sya syaVarYcx = zbVar.ycx(this.ycx);
        if (syaVarYcx == null) {
            return null;
        }
        JSONObject jSONObjectLud = ycxVar.lud();
        syaVarYcx.jw(com.bytedance.adsdk.ugeno.dj.zb.ycx(ycxVar.ycx(), this.f22215zb));
        syaVarYcx.jc(strDj);
        syaVarYcx.sya(jSONObjectLud);
        syaVarYcx.ycx(ycxVar);
        syaVarYcx.zb(this.f22215zb);
        ul ulVar = this.f22208jc;
        if (ulVar == null) {
            syaVarYcx.zb(true);
        } else {
            syaVarYcx.zb(ulVar.dj());
        }
        syaVarYcx.ycx(this.f22211ok);
        syaVarYcx.ycx(this.syc);
        Iterator<String> itKeys = jSONObjectLud.keys();
        if (syaVar instanceof com.bytedance.adsdk.ugeno.zb.ycx) {
            com.bytedance.adsdk.ugeno.zb.ycx ycxVar2 = (com.bytedance.adsdk.ugeno.zb.ycx) syaVar;
            c0024ycxJc = ycxVar2.jc();
            syaVarYcx.ycx(ycxVar2);
        } else {
            c0024ycxJc = null;
        }
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            String strYcx = com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONObjectLud.optString(next), this.f22215zb);
            syaVarYcx.ycx(next, strYcx);
            if (this.wwx != null) {
                throw null;
            }
            if (c0024ycxJc != null) {
                c0024ycxJc.ycx(this.ycx, next, strYcx);
            }
        }
        if (c0024ycxJc != null) {
            syaVarYcx.ycx(c0024ycxJc.ycx());
        }
        if (syaVar != null && TextUtils.equals("virtualNode", syaVar.rmy()) && syaVarYcx.mp()) {
            this.wie = true;
        }
        if (syaVarYcx instanceof com.bytedance.adsdk.ugeno.zb.ycx) {
            List<ul.ycx> listLt = ycxVar.lt();
            if (listLt != null && listLt.size() > 0) {
                if (TextUtils.equals(syaVarYcx.kgy(), "Swiper") && listLt.size() != 1) {
                    Log.e("UGTemplateEngine", "Swiper must be only one widget");
                }
                try {
                    Collections.sort(listLt, new Comparator<ul.ycx>() { // from class: com.bytedance.adsdk.ugeno.core.ok.1
                        @Override // java.util.Comparator
                        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
                        public int compare(ul.ycx ycxVar3, ul.ycx ycxVar4) {
                            return ycxVar3.lud().optInt("order", 0) - ycxVar4.lud().optInt("order", 0);
                        }
                    });
                } catch (Throwable unused) {
                }
                Iterator<ul.ycx> it = listLt.iterator();
                while (it.hasNext()) {
                    com.bytedance.adsdk.ugeno.zb.sya<View> syaVarYcx2 = ycx(it.next(), (com.bytedance.adsdk.ugeno.zb.sya<View>) syaVarYcx);
                    if (syaVarYcx2 != null && !syaVarYcx2.mp()) {
                        ((com.bytedance.adsdk.ugeno.zb.ycx) syaVarYcx).ycx(syaVarYcx2, syaVarYcx2.av());
                    }
                }
            } else {
                if (TextUtils.equals(syaVarYcx.kgy(), "RecyclerLayout") && (listSya = this.f22208jc.sya()) != null && listSya.size() > 0) {
                    Iterator<ul.ycx> it2 = listSya.iterator();
                    while (it2.hasNext()) {
                        com.bytedance.adsdk.ugeno.zb.sya<View> syaVarYcx3 = ycx(it2.next(), (com.bytedance.adsdk.ugeno.zb.sya<View>) syaVarYcx);
                        if (syaVarYcx3 != null && syaVarYcx3.dwi()) {
                            ((com.bytedance.adsdk.ugeno.zb.ycx) syaVarYcx).ycx(syaVarYcx3);
                        }
                    }
                }
                return syaVarYcx;
            }
        }
        this.sya = syaVarYcx;
        return syaVarYcx;
    }

    public void zb(JSONObject jSONObject) throws JSONException {
        pmi pmiVar = this.f22210lt;
        if (pmiVar != null) {
            pmiVar.sya();
        }
        this.f22215zb = jSONObject;
        ycx(this.sya, jSONObject);
        ycx(this.sya);
        if (this.f22210lt != null) {
            wie wieVar = new wie();
            wieVar.ycx(0);
            wieVar.ycx(this.sya);
            this.f22210lt.ycx(wieVar);
        }
    }

    private void zb(com.bytedance.adsdk.ugeno.zb.sya syaVar) throws JSONException {
        try {
            if (!syaVar.aeu() || syaVar.rmf() == null || syaVar.rmf().ul() == null) {
                return;
            }
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("i18n", syaVar.rmf().ul());
            this.f22215zb.put("xNode", jSONObject);
        } catch (Exception unused) {
        }
    }

    public List<String> zb() {
        return this.pmi;
    }

    private void zb(JSONObject jSONObject, com.bytedance.adsdk.ugeno.zb.sya syaVar) {
        List<com.bytedance.adsdk.ugeno.zb.sya<View>> listJw;
        if (syaVar == null) {
            return;
        }
        this.f22215zb = jSONObject;
        syaVar.zb(jSONObject);
        syaVar.ycx(this.f22211ok);
        ycx.C0024ycx c0024ycxJc = syaVar.xz() != null ? syaVar.xz().jc() : null;
        Iterator<String> itKeys = syaVar.hf().keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            String strYcx = com.bytedance.adsdk.ugeno.dj.zb.ycx(syaVar.hf().optString(next), jSONObject);
            syaVar.ycx(next, strYcx);
            if (c0024ycxJc != null) {
                c0024ycxJc.ycx(this.ycx, next, strYcx);
            }
        }
        if ((syaVar instanceof com.bytedance.adsdk.ugeno.zb.ycx) && (listJw = ((com.bytedance.adsdk.ugeno.zb.ycx) syaVar).jw()) != null && !listJw.isEmpty()) {
            Iterator<com.bytedance.adsdk.ugeno.zb.sya<View>> it = listJw.iterator();
            while (it.hasNext()) {
                zb(jSONObject, it.next());
            }
        }
        if (c0024ycxJc != null) {
            syaVar.ycx(c0024ycxJc.ycx());
        }
    }

    public com.bytedance.adsdk.ugeno.zb.sya<View> ycx(JSONObject jSONObject) {
        pmi pmiVar = this.f22210lt;
        if (pmiVar != null) {
            pmiVar.ycx();
        }
        ul ulVar = new ul(jSONObject, this.f22215zb);
        this.f22208jc = ulVar;
        if (!(this.lud instanceof com.bytedance.adsdk.ugeno.core.ycx.zb)) {
            this.sya = zb(ulVar.ycx(), (com.bytedance.adsdk.ugeno.zb.sya<View>) null);
            pmi pmiVar2 = this.f22210lt;
            if (pmiVar2 != null) {
                pmiVar2.zb();
                this.sya.ycx(this.f22210lt);
            }
            return this.sya;
        }
        ulVar.zb();
        throw null;
    }

    public void ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, JSONObject jSONObject) throws JSONException {
        if (syaVar == null) {
            return;
        }
        if (syaVar instanceof com.bytedance.adsdk.ugeno.zb.ycx) {
            syaVar.ycx(jSONObject);
            List<com.bytedance.adsdk.ugeno.zb.sya<View>> listJw = ((com.bytedance.adsdk.ugeno.zb.ycx) syaVar).jw();
            if (listJw == null || listJw.size() <= 0) {
                return;
            }
            Iterator<com.bytedance.adsdk.ugeno.zb.sya<View>> it = listJw.iterator();
            while (it.hasNext()) {
                ycx(it.next(), jSONObject);
            }
            return;
        }
        syaVar.ycx(jSONObject);
    }

    private void ycx(com.bytedance.adsdk.ugeno.zb.sya<View> syaVar) throws JSONException {
        List<com.bytedance.adsdk.ugeno.zb.sya<View>> listJw;
        if (syaVar == null) {
            return;
        }
        JSONObject jSONObjectHf = syaVar.hf();
        Iterator<String> itKeys = jSONObjectHf.keys();
        com.bytedance.adsdk.ugeno.zb.ycx ycxVarXz = syaVar.xz();
        ycx.C0024ycx c0024ycxJc = ycxVarXz != null ? ycxVarXz.jc() : null;
        zb(syaVar);
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            String strYcx = com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONObjectHf.optString(next), this.f22215zb);
            syaVar.ycx(next, strYcx);
            if (c0024ycxJc != null) {
                c0024ycxJc.ycx(this.ycx, next, strYcx);
            }
        }
        syaVar.ycx(this.f22205dj);
        syaVar.ycx(this.lud);
        syaVar.ycx(this.f22214ul);
        jw jwVar = this.wwx;
        if (jwVar != null) {
            syaVar.ycx(jwVar);
        }
        lud ludVar = this.f22213uh;
        if (ludVar != null) {
            syaVar.ycx(ludVar);
        }
        com.bytedance.adsdk.ugeno.lud.xkz xkzVar = this.fby;
        if (xkzVar != null) {
            syaVar.ycx(xkzVar);
        }
        com.bytedance.adsdk.ugeno.lud.ry ryVar = this.f22209jw;
        if (ryVar != null) {
            syaVar.ycx(ryVar);
        }
        if ((syaVar instanceof com.bytedance.adsdk.ugeno.zb.ycx) && (listJw = ((com.bytedance.adsdk.ugeno.zb.ycx) syaVar).jw()) != null && listJw.size() > 0) {
            Iterator<com.bytedance.adsdk.ugeno.zb.sya<View>> it = listJw.iterator();
            while (it.hasNext()) {
                ycx(it.next());
            }
        }
        if (c0024ycxJc != null) {
            syaVar.ycx(c0024ycxJc.ycx());
        }
        syaVar.zb();
    }

    public void ycx(syc sycVar) {
        com.bytedance.adsdk.ugeno.core.ycx.ycx ycxVarLt = com.bytedance.adsdk.ugeno.lt.ycx().lt();
        if (ycxVarLt == null) {
            this.lud = sycVar;
        } else {
            if (ycxVarLt.ycx(sycVar) == null) {
                this.lud = sycVar;
                return;
            }
            throw null;
        }
    }

    public void ycx(dy dyVar) {
        this.f22214ul = dyVar;
    }

    public void ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, String str, Object... objArr) {
        List<com.bytedance.adsdk.ugeno.zb.sya<View>> listJw;
        if (syaVar == null) {
            return;
        }
        syaVar.ycx(str, objArr);
        if (!(syaVar instanceof com.bytedance.adsdk.ugeno.zb.ycx) || (listJw = ((com.bytedance.adsdk.ugeno.zb.ycx) syaVar).jw()) == null || listJw.isEmpty()) {
            return;
        }
        Iterator<com.bytedance.adsdk.ugeno.zb.sya<View>> it = listJw.iterator();
        while (it.hasNext()) {
            ycx(it.next(), str, objArr);
        }
    }

    public boolean ycx() {
        return this.f22206dy;
    }

    public void ycx(lud ludVar) {
        this.f22213uh = ludVar;
    }

    public void ycx(JSONObject jSONObject, com.bytedance.adsdk.ugeno.zb.sya syaVar) throws JSONException {
        zb(jSONObject, syaVar);
        ycx((com.bytedance.adsdk.ugeno.zb.sya<View>) syaVar);
    }

    public void ycx(com.bytedance.adsdk.ugeno.lud.xkz xkzVar) {
        this.fby = xkzVar;
    }
}
