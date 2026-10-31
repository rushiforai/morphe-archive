package com.fyber.inneractive.sdk.config.global;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.global.features.s;
import com.fyber.inneractive.sdk.config.global.features.v;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.w;
import com.fyber.inneractive.sdk.util.x;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public String f27836a = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f27837b;

    /* renamed from: c, reason: collision with root package name */
    public JSONArray f27838c;

    public r() {
        HashMap map = new HashMap();
        map.put(v.class, new v());
        map.put(com.fyber.inneractive.sdk.config.global.features.d.class, new com.fyber.inneractive.sdk.config.global.features.d());
        map.put(com.fyber.inneractive.sdk.config.global.features.m.class, new com.fyber.inneractive.sdk.config.global.features.m());
        map.put(com.fyber.inneractive.sdk.config.global.features.f.class, new com.fyber.inneractive.sdk.config.global.features.f());
        map.put(com.fyber.inneractive.sdk.config.global.features.l.class, new com.fyber.inneractive.sdk.config.global.features.l());
        map.put(com.fyber.inneractive.sdk.config.global.features.e.class, new com.fyber.inneractive.sdk.config.global.features.e());
        map.put(s.class, new s());
        map.put(com.fyber.inneractive.sdk.config.global.features.j.class, new com.fyber.inneractive.sdk.config.global.features.j());
        map.put(com.fyber.inneractive.sdk.config.global.features.r.class, new com.fyber.inneractive.sdk.config.global.features.r());
        map.put(com.fyber.inneractive.sdk.config.global.features.o.class, new com.fyber.inneractive.sdk.config.global.features.o());
        map.put(com.fyber.inneractive.sdk.config.global.features.c.class, new com.fyber.inneractive.sdk.config.global.features.c());
        map.put(com.fyber.inneractive.sdk.config.global.features.n.class, new com.fyber.inneractive.sdk.config.global.features.n());
        map.put(com.fyber.inneractive.sdk.config.global.features.b.class, new com.fyber.inneractive.sdk.config.global.features.b());
        map.put(com.fyber.inneractive.sdk.config.global.features.h.class, new com.fyber.inneractive.sdk.config.global.features.h());
        map.put(com.fyber.inneractive.sdk.config.global.features.k.class, new com.fyber.inneractive.sdk.config.global.features.k());
        map.put(com.fyber.inneractive.sdk.config.global.features.g.class, new com.fyber.inneractive.sdk.config.global.features.g());
        this.f27837b = map;
        this.f27838c = null;
        HashMap map2 = new HashMap();
        for (Map.Entry entry : map.entrySet()) {
            map2.put((Class) entry.getKey(), ((com.fyber.inneractive.sdk.config.global.features.i) entry.getValue()).b());
        }
        this.f27837b = map2;
        IAlog.a("%s: created. Supported features: %s", "SupportedFeaturesProvider", map2);
    }

    public static r a() {
        int i5 = com.fyber.inneractive.sdk.config.n.f27870a;
        String property = System.getProperty("ia.testEnvironmentConfiguration.featuresConfig");
        boolean z11 = false;
        if (!TextUtils.isEmpty(property)) {
            try {
                IAConfigManager.Q.f27766z.f27803a = l.a(new JSONObject(property));
                z11 = true;
            } catch (Exception unused) {
                IAlog.a("failed parsing local features json", new Object[0]);
            }
        }
        r rVar = new r();
        if (z11) {
            IAConfigManager iAConfigManager = IAConfigManager.Q;
            iAConfigManager.N.a(true, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            iAConfigManager.F.a(iAConfigManager.N);
        }
        return rVar;
    }

    public final JSONArray b() {
        JSONArray jSONArray = this.f27838c;
        if (jSONArray == null || jSONArray.length() == 0) {
            JSONArray jSONArrayA = g.a(this.f27837b, false);
            this.f27838c = jSONArrayA;
            IAlog.a("%s: active experiments json set = %s", "SupportedFeaturesProvider", jSONArrayA);
        }
        return this.f27838c;
    }

    public final void a(e eVar) {
        for (com.fyber.inneractive.sdk.config.global.features.i iVar : this.f27837b.values()) {
            iVar.getClass();
            ArrayList arrayList = new ArrayList(iVar.f27819c.values());
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                b bVar = (b) arrayList.get(size);
                ArrayList arrayList2 = bVar.f27808d;
                if (arrayList2 != null) {
                    Iterator it = arrayList2.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        d dVar = (d) it.next();
                        if (dVar.a(eVar)) {
                            iVar.f27819c.remove(bVar.f27805a);
                            iVar.f27820d.remove(bVar.f27805a);
                            this.f27838c = null;
                            IAlog.a("%s: Experiment %s filtered! after response %s", "SupportedFeaturesProvider", bVar.f27805a, dVar);
                            break;
                        }
                    }
                }
            }
        }
    }

    public final com.fyber.inneractive.sdk.config.global.features.i a(Class cls) {
        if (this.f27837b.containsKey(cls)) {
            com.fyber.inneractive.sdk.config.global.features.i iVar = (com.fyber.inneractive.sdk.config.global.features.i) this.f27837b.get(cls);
            if (cls.isInstance(iVar)) {
                return iVar;
            }
        }
        try {
            return (com.fyber.inneractive.sdk.config.global.features.i) cls.getConstructor(null).newInstance(null);
        } catch (Exception e3) {
            IAlog.a("Couldn't create a feature for %s", e3, cls.getName());
            return null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x00e2  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x013c A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0057 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(boolean z11, String str) throws NumberFormatException {
        boolean z12;
        e eVar;
        k kVar;
        this.f27836a = str;
        a aVar = IAConfigManager.Q.f27766z;
        aVar.f27804b = this;
        for (com.fyber.inneractive.sdk.config.global.features.i iVar : this.f27837b.values()) {
            boolean z13 = iVar instanceof com.fyber.inneractive.sdk.config.global.features.p;
            if ((z13 && z11) || (!z13 && !z11)) {
                l lVar = aVar.f27803a;
                if (iVar != null && lVar != null) {
                    q qVar = (q) lVar.f27831a.get(iVar.f27818b);
                    if (qVar != null) {
                        iVar.f27833a = qVar.f27833a;
                        IAlog.a("%s: Feature before variant merge: %s", "a", iVar);
                        HashMap map = qVar.f27835c;
                        Iterator it = map.keySet().iterator();
                        while (it.hasNext()) {
                            b bVar = (b) map.get((String) it.next());
                            if (bVar != null) {
                                int iNextInt = new Random().nextInt(100) + 1;
                                int i5 = 0;
                                if (bVar.f27806b < iNextInt) {
                                    IAlog.a("%s: Experiment '%s' filtered! rand: %d, with perc: %d", "a", bVar.f27805a, Integer.valueOf(iNextInt), Integer.valueOf(bVar.f27806b));
                                } else {
                                    ArrayList arrayList = bVar.f27808d;
                                    if (arrayList != null) {
                                        Iterator it2 = arrayList.iterator();
                                        while (it2.hasNext()) {
                                            d dVar = (d) it2.next();
                                            try {
                                                Long lValueOf = Long.valueOf(IAConfigManager.Q.f27746d);
                                                eVar = new e();
                                                eVar.f27812b = lValueOf;
                                                eVar.f27813c = com.fyber.inneractive.sdk.serverapi.b.a(aVar.f27804b.f27836a);
                                            } catch (NumberFormatException unused) {
                                                IAlog.a("%s: invalid publisherId", "a");
                                            }
                                            if (dVar.a(eVar)) {
                                                IAlog.a("%s: Experiment '%s' filtered! with %s", "a", bVar.f27805a, dVar);
                                                break;
                                            }
                                        }
                                        if (iVar instanceof v) {
                                            Iterator it3 = bVar.f27807c.iterator();
                                            while (it3.hasNext()) {
                                                k kVar2 = (k) it3.next();
                                                n nVar = kVar2.f27833a;
                                                if (nVar != null && nVar.a() != null && kVar2.f27833a.a().containsKey("use_fmp_cache_mechanism")) {
                                                    w wVar = (w) IAConfigManager.Q.I.get(x.Video);
                                                    if (!(wVar != null ? wVar.a() : false)) {
                                                    }
                                                }
                                            }
                                        }
                                        IAlog.a("%s: Experiment '%s' NOT filtered! rand: %d, with perc: %d", "a", bVar.f27805a, Integer.valueOf(iNextInt), Integer.valueOf(bVar.f27806b));
                                        z12 = false;
                                        if (!z12) {
                                            ArrayList arrayList2 = bVar.f27807c;
                                            int iNextInt2 = new Random().nextInt(100) + 1;
                                            IAlog.a("%s: selectVariant for experiment '%s' generated random number: %d", "a", bVar.f27805a, Integer.valueOf(iNextInt2));
                                            Iterator it4 = arrayList2.iterator();
                                            while (true) {
                                                if (!it4.hasNext()) {
                                                    kVar = null;
                                                    break;
                                                }
                                                kVar = (k) it4.next();
                                                i5 += kVar.f27830c;
                                                IAlog.a("%s: selectVariant variant found: %s", "a", kVar);
                                                if (i5 >= iNextInt2) {
                                                    break;
                                                } else {
                                                    IAlog.a("%s: selectVariant variant '%s' percentage outside selected range", "a", kVar.f27829b);
                                                }
                                            }
                                            if (kVar != null) {
                                                IAlog.a("%s: experiment '%s' variant selected! %s", "a", bVar.f27805a, kVar);
                                            } else {
                                                IAlog.a("%s: experiment '%s' no variant was selected! using control group", "a", bVar.f27805a);
                                            }
                                            iVar.f27819c.put(bVar.f27805a, bVar);
                                            if (kVar != null) {
                                                iVar.f27820d.put(bVar.f27805a, kVar);
                                            }
                                        }
                                    } else {
                                        if (iVar instanceof v) {
                                        }
                                        IAlog.a("%s: Experiment '%s' NOT filtered! rand: %d, with perc: %d", "a", bVar.f27805a, Integer.valueOf(iNextInt), Integer.valueOf(bVar.f27806b));
                                        z12 = false;
                                        if (!z12) {
                                        }
                                    }
                                }
                                z12 = true;
                                if (!z12) {
                                }
                            }
                        }
                    }
                    IAlog.a("%s: Feature after variant merge: %s", "a", iVar);
                }
            }
        }
    }
}
