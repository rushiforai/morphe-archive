package com.bytedance.adsdk.ugeno.lud;

import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.MotionEvent;
import com.bytedance.adsdk.ugeno.lud.dj.sya;
import com.bytedance.adsdk.ugeno.lud.lt;
import com.bytedance.adsdk.ugeno.lud.zb.ycx;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class jw implements ea {

    /* renamed from: dj, reason: collision with root package name */
    private Map<String, List<com.bytedance.adsdk.ugeno.lud.dj.sya>> f22467dj;

    /* renamed from: ea, reason: collision with root package name */
    private boolean f22468ea;
    private ry fby;

    /* renamed from: jc, reason: collision with root package name */
    private boolean f22469jc;

    /* renamed from: jw, reason: collision with root package name */
    private com.bytedance.adsdk.ugeno.core.zb.ycx f22470jw;

    /* renamed from: lt, reason: collision with root package name */
    private com.bytedance.adsdk.ugeno.core.lud f22471lt;
    private com.bytedance.adsdk.ugeno.zb.sya lud;

    /* renamed from: ok, reason: collision with root package name */
    private boolean f22472ok;
    private Map<String, List<com.bytedance.adsdk.ugeno.lud.dj.sya>> sya;

    /* renamed from: ul, reason: collision with root package name */
    private xkz f22473ul;
    Handler ycx = new Handler(Looper.getMainLooper());

    /* renamed from: zb, reason: collision with root package name */
    private ycx f22474zb;

    public static class ycx {
        public Map<String, com.bytedance.adsdk.ugeno.lud.dj.sya> sya;
        public Map<String, List<com.bytedance.adsdk.ugeno.lud.dj.sya>> ycx;

        /* renamed from: zb, reason: collision with root package name */
        public Map<String, List<com.bytedance.adsdk.ugeno.lud.dj.sya>> f22477zb;

        public ycx(Map<String, List<com.bytedance.adsdk.ugeno.lud.dj.sya>> map, Map<String, com.bytedance.adsdk.ugeno.lud.dj.sya> map2, Map<String, List<com.bytedance.adsdk.ugeno.lud.dj.sya>> map3) {
            this.ycx = map;
            this.sya = map2;
            this.f22477zb = map3;
        }
    }

    public jw(com.bytedance.adsdk.ugeno.zb.sya syaVar, ycx ycxVar) {
        this.lud = syaVar;
        this.f22474zb = ycxVar;
        if (ycxVar != null) {
            this.sya = ycxVar.ycx;
            this.f22467dj = ycxVar.f22477zb;
        }
        if (syaVar != null && syaVar.uf() && this.f22470jw == null) {
            this.f22470jw = new com.bytedance.adsdk.ugeno.core.zb.ycx();
        }
    }

    public void dj() {
        List<com.bytedance.adsdk.ugeno.lud.dj.sya> listZb = zb("animateState");
        if (listZb == null || listZb.isEmpty()) {
            return;
        }
        for (com.bytedance.adsdk.ugeno.lud.dj.sya syaVar : listZb) {
            if (syaVar != null) {
                syaVar.ycx(this);
                syaVar.ycx(new Object[0]);
            }
        }
    }

    public void lt() {
        List<com.bytedance.adsdk.ugeno.lud.dj.sya> listZb = zb("timer");
        if (listZb == null || listZb.isEmpty()) {
            return;
        }
        for (com.bytedance.adsdk.ugeno.lud.dj.sya syaVar : listZb) {
            if (syaVar != null) {
                syaVar.ycx(this);
                syaVar.ycx(new Object[0]);
            }
        }
    }

    public void lud() {
        List<com.bytedance.adsdk.ugeno.lud.dj.sya> listZb = zb("timerState");
        if (listZb == null || listZb.isEmpty()) {
            return;
        }
        for (com.bytedance.adsdk.ugeno.lud.dj.sya syaVar : listZb) {
            if (syaVar != null) {
                syaVar.ycx(this);
                syaVar.ycx(new Object[0]);
            }
        }
    }

    public void sya() {
        List<com.bytedance.adsdk.ugeno.lud.dj.sya> value;
        ycx ycxVar = this.f22474zb;
        if (ycxVar == null) {
            return;
        }
        for (Map.Entry<String, List<com.bytedance.adsdk.ugeno.lud.dj.sya>> entry : ycxVar.ycx.entrySet()) {
            if (entry != null && (value = entry.getValue()) != null && !value.isEmpty()) {
                for (com.bytedance.adsdk.ugeno.lud.dj.sya syaVar : value) {
                    if (syaVar instanceof com.bytedance.adsdk.ugeno.lud.dj.dj) {
                        syaVar.ycx(this);
                        syaVar.ycx(new Object[0]);
                    }
                }
            }
        }
    }

    public void zb() {
        List<com.bytedance.adsdk.ugeno.lud.dj.sya> listZb = zb("twist");
        if (listZb == null || listZb.isEmpty()) {
            return;
        }
        for (com.bytedance.adsdk.ugeno.lud.dj.sya syaVar : listZb) {
            if (syaVar != null) {
                syaVar.ycx(this);
                syaVar.ycx(new Object[0]);
            }
        }
    }

    public void ycx(com.bytedance.adsdk.ugeno.core.lud ludVar) {
        this.f22471lt = ludVar;
    }

    public void ycx(xkz xkzVar) {
        this.f22473ul = xkzVar;
    }

    public void ycx(ry ryVar) {
        this.fby = ryVar;
    }

    public void ycx() {
        List<com.bytedance.adsdk.ugeno.lud.dj.sya> listZb = zb("shake");
        if (listZb == null || listZb.isEmpty()) {
            return;
        }
        for (com.bytedance.adsdk.ugeno.lud.dj.sya syaVar : listZb) {
            if (syaVar != null) {
                syaVar.ycx(this);
                syaVar.ycx(new Object[0]);
            }
        }
    }

    public List<com.bytedance.adsdk.ugeno.lud.dj.sya> zb(String str) {
        Map<String, List<com.bytedance.adsdk.ugeno.lud.dj.sya>> map;
        Map<String, List<com.bytedance.adsdk.ugeno.lud.dj.sya>> map2 = this.sya;
        if (((map2 == null || map2.isEmpty()) && ((map = this.f22467dj) == null || map.isEmpty())) || TextUtils.isEmpty(str)) {
            return null;
        }
        Map<String, List<com.bytedance.adsdk.ugeno.lud.dj.sya>> map3 = this.sya;
        if (map3 != null && map3.containsKey(str)) {
            return this.sya.get(str);
        }
        Map<String, List<com.bytedance.adsdk.ugeno.lud.dj.sya>> map4 = this.f22467dj;
        if (map4 != null && map4.containsKey(str)) {
            return this.f22467dj.get(str);
        }
        return null;
    }

    public List<com.bytedance.adsdk.ugeno.lud.dj.sya> sya(String str) {
        Map<String, List<com.bytedance.adsdk.ugeno.lud.dj.sya>> map;
        Map<String, List<com.bytedance.adsdk.ugeno.lud.dj.sya>> map2 = this.f22467dj;
        if (map2 == null || map2.isEmpty() || TextUtils.isEmpty(str) || (map = this.f22467dj) == null || !map.containsKey(str)) {
            return null;
        }
        return this.f22467dj.get(str);
    }

    public void ycx(int i5) {
        List<com.bytedance.adsdk.ugeno.lud.dj.sya> listZb = zb("timer");
        if (listZb == null || listZb.isEmpty()) {
            return;
        }
        for (com.bytedance.adsdk.ugeno.lud.dj.sya syaVar : listZb) {
            if (syaVar instanceof com.bytedance.adsdk.ugeno.lud.dj.jc) {
                ((com.bytedance.adsdk.ugeno.lud.dj.jc) syaVar).ycx(i5);
            }
        }
    }

    public void ycx(boolean z11) {
        List<com.bytedance.adsdk.ugeno.lud.dj.sya> listZb = zb("timer");
        if (listZb == null || listZb.isEmpty()) {
            return;
        }
        for (com.bytedance.adsdk.ugeno.lud.dj.sya syaVar : listZb) {
            if (syaVar instanceof com.bytedance.adsdk.ugeno.lud.dj.jc) {
                ((com.bytedance.adsdk.ugeno.lud.dj.jc) syaVar).ycx(z11);
            }
        }
    }

    public void ycx(String str) {
        List<com.bytedance.adsdk.ugeno.lud.dj.sya> listZb = zb("timer");
        if (listZb == null || listZb.isEmpty()) {
            return;
        }
        if (str == null) {
            str = b.f42142b;
        }
        for (com.bytedance.adsdk.ugeno.lud.dj.sya syaVar : listZb) {
            if (syaVar instanceof com.bytedance.adsdk.ugeno.lud.dj.jc) {
                com.bytedance.adsdk.ugeno.lud.dj.jc jcVar = (com.bytedance.adsdk.ugeno.lud.dj.jc) syaVar;
                if (TextUtils.equals(str, jcVar.zb())) {
                    jcVar.ycx();
                }
            }
        }
    }

    public boolean ycx(MotionEvent motionEvent) {
        List<com.bytedance.adsdk.ugeno.lud.dj.sya> listZb = zb("touchStart");
        if (listZb != null && !listZb.isEmpty()) {
            for (com.bytedance.adsdk.ugeno.lud.dj.sya syaVar : listZb) {
                if (syaVar instanceof com.bytedance.adsdk.ugeno.lud.dj.xkz) {
                    syaVar.ycx(this);
                    syaVar.ycx(motionEvent);
                }
            }
        }
        List<com.bytedance.adsdk.ugeno.lud.dj.sya> listZb2 = zb("touchEnd");
        List<com.bytedance.adsdk.ugeno.lud.dj.sya> listZb3 = zb("tap");
        List<com.bytedance.adsdk.ugeno.lud.dj.sya> listZb4 = zb("slide");
        if (listZb2 != null && !listZb2.isEmpty()) {
            for (com.bytedance.adsdk.ugeno.lud.dj.sya syaVar2 : listZb2) {
                if (syaVar2 instanceof com.bytedance.adsdk.ugeno.lud.dj.ry) {
                    syaVar2.ycx(this);
                    this.f22472ok = syaVar2.ycx(motionEvent);
                }
            }
        }
        if ((listZb3 != null && !listZb3.isEmpty()) || (listZb4 != null && !listZb4.isEmpty())) {
            if (this.f22472ok && motionEvent.getAction() == 1) {
                return true;
            }
            com.bytedance.adsdk.ugeno.core.zb.ycx ycxVar = this.f22470jw;
            if (ycxVar != null) {
                if (ycxVar.ycx(motionEvent)) {
                    return false;
                }
                this.f22470jw.ycx(this.lud, motionEvent);
            }
            if (listZb3 != null && !listZb3.isEmpty()) {
                for (com.bytedance.adsdk.ugeno.lud.dj.sya syaVar3 : listZb3) {
                    if (syaVar3 instanceof com.bytedance.adsdk.ugeno.lud.dj.jw) {
                        ((com.bytedance.adsdk.ugeno.lud.dj.jw) syaVar3).ycx(this.f22473ul);
                        syaVar3.ycx(this);
                        this.f22469jc = syaVar3.ycx(motionEvent);
                    }
                }
            }
            int action = motionEvent.getAction();
            if ((action == 1 || action == 3) && this.f22469jc) {
                com.bytedance.adsdk.ugeno.core.zb.ycx ycxVar2 = this.f22470jw;
                if (ycxVar2 != null) {
                    ycxVar2.ycx();
                }
                return true;
            }
            if (listZb4 != null && !listZb4.isEmpty()) {
                for (com.bytedance.adsdk.ugeno.lud.dj.sya syaVar4 : listZb4) {
                    if (syaVar4 instanceof com.bytedance.adsdk.ugeno.lud.dj.lud) {
                        ((com.bytedance.adsdk.ugeno.lud.dj.lud) syaVar4).ycx(this.fby);
                        syaVar4.ycx(this);
                        this.f22468ea = syaVar4.ycx(motionEvent);
                    }
                }
            }
            if (action == 1 || action == 3) {
                if (this.f22468ea) {
                    com.bytedance.adsdk.ugeno.core.zb.ycx ycxVar3 = this.f22470jw;
                    if (ycxVar3 != null) {
                        ycxVar3.ycx();
                    }
                    return true;
                }
                com.bytedance.adsdk.ugeno.core.zb.ycx ycxVar4 = this.f22470jw;
                if (ycxVar4 != null) {
                    ycxVar4.ycx(this.lud);
                }
            }
            return this.f22469jc || this.f22468ea;
        }
        return this.f22472ok;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(String str, List<lt.ycx> list) {
        if (list == null || list.isEmpty()) {
            return;
        }
        for (lt.ycx ycxVar : list) {
            if (ycxVar != null) {
                com.bytedance.adsdk.ugeno.lud.zb.ycx ycxVarYcx = ycx.C0019ycx.ycx(this.lud, str, ycxVar);
                ycxVar.toString();
                if (ycxVarYcx != null) {
                    ycxVarYcx.ycx();
                    ycxVarYcx.zb();
                }
            }
        }
    }

    public void ycx(String str, Object... objArr) {
        List<com.bytedance.adsdk.ugeno.lud.dj.sya> listSya = sya(str);
        if (listSya == null || listSya.isEmpty()) {
            return;
        }
        for (com.bytedance.adsdk.ugeno.lud.dj.sya syaVar : listSya) {
            syaVar.ycx(this);
            syaVar.ycx(objArr);
        }
    }

    @Override // com.bytedance.adsdk.ugeno.lud.ea
    public void ycx(final com.bytedance.adsdk.ugeno.zb.sya syaVar, final String str, final List<lt.ycx> list, lt ltVar) {
        ltVar.sya();
        ltVar.dj();
        if (ltVar.sya()) {
            return;
        }
        final int iDj = ltVar.dj();
        if (iDj > 0) {
            this.ycx.postDelayed(new com.bytedance.adsdk.ugeno.fby.jc(new Runnable() { // from class: com.bytedance.adsdk.ugeno.lud.jw.1
                @Override // java.lang.Runnable
                public void run() {
                    if (jw.this.f22471lt != null) {
                        jw.this.f22471lt.ycx(syaVar, str, list);
                    }
                    jw.this.ycx(str, (List<lt.ycx>) list);
                }
            }), iDj);
            return;
        }
        com.bytedance.adsdk.ugeno.core.lud ludVar = this.f22471lt;
        if (ludVar != null) {
            ludVar.ycx(syaVar, str, list);
        }
        ycx(str, list);
    }

    public static jw ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, String str) {
        com.bytedance.adsdk.ugeno.lud.dj.sya syaVarYcx;
        if (syaVar != null && !TextUtils.isEmpty(str)) {
            try {
                JSONArray jSONArray = new JSONArray(str);
                if (jSONArray.length() <= 0) {
                    return null;
                }
                ycx ycxVar = new ycx(new HashMap(), new HashMap(), new HashMap());
                for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                    JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i5);
                    if (jSONObjectOptJSONObject != null && (syaVarYcx = sya.ycx.ycx(syaVar.ea().getContext(), syaVar, jSONObjectOptJSONObject, syaVar.ok())) != null) {
                        if (ycxVar.ycx.containsKey(syaVarYcx.dj())) {
                            List<com.bytedance.adsdk.ugeno.lud.dj.sya> list = ycxVar.ycx.get(syaVarYcx.dj());
                            if (list == null) {
                                ArrayList arrayList = new ArrayList();
                                arrayList.add(syaVarYcx);
                                ycxVar.ycx.put(syaVarYcx.dj(), arrayList);
                                ycxVar.f22477zb.put(syaVarYcx.lt(), arrayList);
                            } else {
                                list.add(syaVarYcx);
                            }
                        } else {
                            ArrayList arrayList2 = new ArrayList();
                            arrayList2.add(syaVarYcx);
                            ycxVar.ycx.put(syaVarYcx.dj(), arrayList2);
                            ycxVar.f22477zb.put(syaVarYcx.lt(), arrayList2);
                        }
                        ycxVar.sya.put(syaVarYcx.lud(), syaVarYcx);
                    }
                }
                return new jw(syaVar, ycxVar);
            } catch (JSONException unused) {
            }
        }
        return null;
    }
}
