package com.fyber.inneractive.sdk.config;

import android.text.TextUtils;
import b.u4;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.fyber.inneractive.sdk.config.enums.Orientation;
import com.fyber.inneractive.sdk.config.enums.Skip;
import com.fyber.inneractive.sdk.config.enums.TapAction;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.config.enums.Vendor;
import com.fyber.inneractive.sdk.external.InvalidAppIdException;
import com.fyber.inneractive.sdk.util.IAlog;
import com.tiktok.util.UrlConst;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class f implements com.fyber.inneractive.sdk.cache.a {

    /* renamed from: a, reason: collision with root package name */
    public boolean f27800a = false;

    @Override // com.fyber.inneractive.sdk.cache.a
    public final String a() {
        String str = IAConfigManager.Q.f27745c;
        StringBuilder sb2 = new StringBuilder(UrlConst.HTTPS);
        int i5 = n.f27870a;
        String property = System.getProperty("ia.testEnvironmentConfiguration.baseConfigUrl");
        if (TextUtils.isEmpty(property)) {
            sb2.append("cdn2.inner-active.mobi/ia-sdk-config/apps/");
        } else {
            sb2.append(property);
        }
        sb2.append(str);
        sb2.append('/');
        sb2.append(str);
        sb2.append(".json");
        String string = sb2.toString();
        IAlog.d("%s: %s", "APP_CONFIG_REQUEST", string);
        return string;
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final String b() {
        return "IALastModifiedFromHeader";
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final String c() {
        return "inneractive.config";
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final boolean d() {
        String string = com.fyber.inneractive.sdk.util.o.f31210a.getSharedPreferences("IAConfigurationPreferences", 0).getString("cached.config.appid", null);
        return string != null && string.equalsIgnoreCase(IAConfigManager.Q.f27745c);
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final void a(Object obj) {
        m0 m0Var = (m0) obj;
        if (m0Var == null || m0Var.f27864a == null) {
            return;
        }
        com.fyber.inneractive.sdk.util.o.f31210a.getSharedPreferences("IAConfigurationPreferences", 0).edit().putString("cached.config.appid", m0Var.f27864a).apply();
    }

    public final void a(String str, Throwable th2) {
        String strSubstring;
        String name;
        String localizedMessage;
        if (this.f27800a) {
            return;
        }
        this.f27800a = true;
        if (!TextUtils.isEmpty(str)) {
            strSubstring = str.length() > 501 ? str.substring(0, 500) : u4.f(1, 0, str);
        } else {
            strSubstring = "Empty Json Data";
        }
        String str2 = strSubstring;
        if (th2 != null) {
            name = th2.getClass().getName();
            localizedMessage = th2.getLocalizedMessage();
        } else {
            name = "Bad remote configuration";
            localizedMessage = "Internal error";
        }
        String str3 = name;
        String str4 = IAConfigManager.Q.f27745c;
        com.fyber.inneractive.sdk.network.w wVar = new com.fyber.inneractive.sdk.network.w(com.fyber.inneractive.sdk.network.t.FATAL_CONFIGURATION_ERROR);
        if (localizedMessage == null) {
            localizedMessage = "No message";
        }
        String str5 = localizedMessage;
        if (TextUtils.isEmpty(str4)) {
            str4 = "EMPTY_APP_ID";
        }
        wVar.a("exception", str3, PglCryptUtils.KEY_MESSAGE, str5, "data", str2, "appId", str4).a((String) null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static m0 a(com.fyber.inneractive.sdk.config.remote.e eVar) {
        boolean z11;
        m0 m0Var;
        Iterator it;
        HashMap map;
        String str;
        HashMap map2;
        v0 v0Var;
        ArrayList arrayList;
        UnitDisplayType unitDisplayType;
        Integer num;
        Boolean bool;
        UnitDisplayType unitDisplayType2;
        String strB;
        com.fyber.inneractive.sdk.config.remote.e eVar2 = eVar;
        char c11 = 1;
        int i5 = 0;
        m0 m0Var2 = new m0();
        m0Var2.f27866c = eVar2.f27902c;
        com.fyber.inneractive.sdk.config.remote.a aVar = eVar2.f27900a;
        m0Var2.f27865b = aVar.f27890b;
        m0Var2.f27864a = aVar.f27889a;
        Iterator it2 = eVar2.f27901b.iterator();
        while (it2.hasNext()) {
            com.fyber.inneractive.sdk.config.remote.h hVar = (com.fyber.inneractive.sdk.config.remote.h) it2.next();
            HashMap map3 = m0Var2.f27867d;
            String str2 = hVar.f27904a;
            com.fyber.inneractive.sdk.config.remote.a aVar2 = eVar2.f27900a;
            HashMap map4 = m0Var2.f27868e;
            o0 o0Var = m0Var2.f27869f;
            v0 v0Var2 = new v0();
            int i11 = 2;
            int i12 = i5;
            com.fyber.inneractive.sdk.config.remote.c[] cVarArr = new com.fyber.inneractive.sdk.config.remote.c[2];
            cVarArr[i12] = aVar2;
            cVarArr[c11] = hVar;
            int i13 = i12;
            while (true) {
                if (i13 >= i11) {
                    z11 = 1;
                    break;
                }
                com.fyber.inneractive.sdk.config.remote.c cVar = cVarArr[i13];
                if (cVar != null && (strB = cVar.b()) != null && strB.equals("false")) {
                    z11 = i12;
                    break;
                }
                i13++;
                i11 = 2;
            }
            v0Var2.f27941b = z11;
            Iterator it3 = hVar.f27910g.iterator();
            while (it3.hasNext()) {
                com.fyber.inneractive.sdk.config.remote.i iVar = (com.fyber.inneractive.sdk.config.remote.i) it3.next();
                w0 w0Var = new w0();
                String str3 = iVar.f27911a;
                if (str3 != null) {
                    Iterator it4 = it3;
                    String str4 = iVar.f27912b;
                    if (str4 == null) {
                        it3 = it4;
                    } else {
                        w0Var.f27943a = str3;
                        w0Var.f27944b = str4;
                        com.fyber.inneractive.sdk.config.remote.b bVar = iVar.f27913c;
                        if (bVar != null) {
                            com.fyber.inneractive.sdk.config.remote.b bVar2 = hVar.f27906c;
                            m0Var = m0Var2;
                            com.fyber.inneractive.sdk.config.remote.b bVar3 = aVar2.f27893e;
                            it = it2;
                            q0 q0Var = new q0();
                            map = map3;
                            UnitDisplayType unitDisplayType3 = bVar.f27896a;
                            str = str2;
                            if (unitDisplayType3 == UnitDisplayType.BANNER || unitDisplayType3 == UnitDisplayType.MRECT || unitDisplayType3.isFullscreenUnit()) {
                                q0Var.f27882b = bVar.f27896a;
                                Integer num2 = bVar.f27898c;
                                Integer num3 = bVar2 != null ? bVar2.f27898c : null;
                                if (bVar3 != null) {
                                    map2 = map4;
                                    num = bVar3.f27898c;
                                } else {
                                    map2 = map4;
                                    num = null;
                                }
                                Integer num4 = (Integer) a((Object) null, num2, num3, num);
                                if (num4 != null && num4.intValue() >= 5 && num4.intValue() <= 60) {
                                    q0Var.f27881a = num4;
                                }
                                Boolean bool2 = Boolean.TRUE;
                                Boolean bool3 = bVar.f27897b;
                                Boolean bool4 = bVar2 != null ? bVar2.f27897b : null;
                                if (bVar3 != null) {
                                    v0Var = v0Var2;
                                    bool = bVar3.f27897b;
                                } else {
                                    v0Var = v0Var2;
                                    bool = null;
                                }
                                Boolean bool5 = (Boolean) a(bool2, bool3, bool4, bool);
                                bool5.getClass();
                                q0Var.f27883c = bool5;
                                Integer num5 = (Integer) a((Object) null, bVar.f27899d, bVar2 != null ? bVar2.f27899d : null, bVar3 != null ? bVar3.f27899d : null);
                                if (num5 != null && num5.intValue() >= 5 && num5.intValue() <= 60) {
                                    q0Var.f27884d = num5;
                                }
                                if (q0Var.f27884d == null && !q0Var.f27883c.booleanValue() && ((unitDisplayType2 = bVar.f27896a) == UnitDisplayType.INTERSTITIAL || unitDisplayType2 == UnitDisplayType.REWARDED)) {
                                    q0Var.f27883c = bool2;
                                }
                                w0Var.f27945c = q0Var;
                            } else {
                                it3 = it4;
                                m0Var2 = m0Var;
                                it2 = it;
                                map3 = map;
                                str2 = str;
                            }
                        } else {
                            m0Var = m0Var2;
                            it = it2;
                            map = map3;
                            str = str2;
                            map2 = map4;
                            v0Var = v0Var2;
                        }
                        com.fyber.inneractive.sdk.config.remote.j jVar = iVar.f27916f;
                        if (jVar != null || iVar.f27915e != null) {
                            if (jVar != null) {
                                UnitDisplayType unitDisplayType4 = jVar.f27927j;
                                UnitDisplayType unitDisplayType5 = UnitDisplayType.REWARDED;
                                if (unitDisplayType4 == unitDisplayType5 && iVar.f27913c == null) {
                                    q0 q0Var2 = new q0();
                                    w0Var.f27945c = q0Var2;
                                    q0Var2.f27883c = Boolean.FALSE;
                                    q0Var2.f27884d = -1;
                                    q0 q0Var3 = w0Var.f27945c;
                                    q0Var3.f27882b = unitDisplayType5;
                                    q0Var3.f27881a = -1;
                                }
                            }
                            y0 y0Var = new y0();
                            com.fyber.inneractive.sdk.config.remote.j jVar2 = iVar.f27916f;
                            com.fyber.inneractive.sdk.config.remote.j jVar3 = hVar.f27908e;
                            com.fyber.inneractive.sdk.config.remote.j jVar4 = aVar2.f27892d;
                            if (jVar2 != null && ((unitDisplayType = jVar2.f27927j) == UnitDisplayType.LANDSCAPE || unitDisplayType == UnitDisplayType.SQUARE || unitDisplayType == UnitDisplayType.INTERSTITIAL || unitDisplayType == UnitDisplayType.VERTICAL || unitDisplayType == UnitDisplayType.REWARDED || unitDisplayType == UnitDisplayType.MRECT)) {
                                y0Var.f27963j = unitDisplayType;
                            } else if (iVar.f27915e != null) {
                                y0Var.f27963j = UnitDisplayType.NATIVE;
                                w0Var.f27947e = new u0();
                            } else {
                                it3 = it4;
                                m0Var2 = m0Var;
                                it2 = it;
                                map3 = map;
                                str2 = str;
                                map4 = map2;
                                v0Var2 = v0Var;
                            }
                            Object objA = a((Object) null, jVar2 != null ? jVar2.f27918a : null, jVar3 != null ? jVar3.f27918a : null, jVar4 != null ? jVar4.f27918a : null);
                            if (objA != null) {
                                y0Var.f27954a = (Boolean) objA;
                                y0Var.f27955b = (Integer) a((Object) 5000, jVar2 != null ? jVar2.f27919b : null, jVar3 != null ? jVar3.f27919b : null, jVar4 != null ? jVar4.f27919b : null);
                                Integer num6 = (Integer) a((Object) 0, jVar2 != null ? jVar2.f27920c : null, jVar3 != null ? jVar3.f27920c : null, jVar4 != null ? jVar4.f27920c : null);
                                y0Var.f27956c = Integer.valueOf(num6.intValue() < 0 ? i12 : num6.intValue());
                                y0Var.f27957d = (Boolean) a(Boolean.TRUE, jVar2 != null ? jVar2.f27922e : null, jVar3 != null ? jVar3.f27922e : null, jVar4 != null ? jVar4.f27922e : null);
                                y0Var.f27958e = (Orientation) a(Orientation.USER, jVar2 != null ? jVar2.f27924g : null, jVar3 != null ? jVar3.f27924g : null, jVar4 != null ? jVar4.f27924g : null);
                                Integer num7 = (Integer) a((Object) 0, jVar2 != null ? jVar2.f27926i : null, jVar3 != null ? jVar3.f27926i : null, jVar4 != null ? jVar4.f27926i : null);
                                y0Var.f27959f = Integer.valueOf(num7.intValue() < 0 ? i12 : num7.intValue());
                                Integer num8 = (Integer) a((Object) 2048, jVar2 != null ? jVar2.f27925h : null, jVar3 != null ? jVar3.f27925h : null, jVar4 != null ? jVar4.f27925h : null);
                                if (num8.intValue() > y0Var.f27955b.intValue()) {
                                    num8 = y0Var.f27955b;
                                }
                                y0Var.f27960g = num8;
                                y0Var.f27961h = (Skip) a(Skip._0, jVar2 != null ? jVar2.f27921d : null, jVar3 != null ? jVar3.f27921d : null, jVar4 != null ? jVar4.f27921d : null);
                                y0Var.f27962i = (TapAction) a(TapAction.DO_NOTHING, jVar2 != null ? jVar2.f27923f : null, jVar3 != null ? jVar3.f27923f : null, jVar4 != null ? jVar4.f27923f : null);
                                ArrayList arrayList2 = new ArrayList();
                                com.fyber.inneractive.sdk.config.remote.d[] dVarArr = new com.fyber.inneractive.sdk.config.remote.d[1];
                                dVarArr[i12] = iVar;
                                com.fyber.inneractive.sdk.config.remote.j jVarA = dVarArr[i12].a();
                                if (jVarA != null && (arrayList = jVarA.f27928k) != null && arrayList.size() > 0) {
                                    arrayList2 = jVarA.f27928k;
                                }
                                y0Var.f27964k = arrayList2;
                                w0Var.f27948f = y0Var;
                            } else {
                                it3 = it4;
                                m0Var2 = m0Var;
                                it2 = it;
                                map3 = map;
                                str2 = str;
                                map4 = map2;
                                v0Var2 = v0Var;
                            }
                        }
                        t0 t0Var = new t0();
                        HashSet hashSet = new HashSet();
                        com.fyber.inneractive.sdk.config.remote.f fVar = iVar.f27914d;
                        Set set = fVar != null ? fVar.f27903a : null;
                        com.fyber.inneractive.sdk.config.remote.f fVar2 = hVar.f27907d;
                        Set set2 = fVar2 != null ? fVar2.f27903a : null;
                        com.fyber.inneractive.sdk.config.remote.f fVar3 = aVar2.f27891c;
                        t0Var.f27934a = (Set) a(hashSet, set, set2, fVar3 != null ? fVar3.f27903a : null);
                        w0Var.f27946d = t0Var;
                        z0 z0Var = new z0();
                        com.fyber.inneractive.sdk.config.remote.k kVar = iVar.f27917g;
                        com.fyber.inneractive.sdk.config.remote.k kVar2 = hVar.f27909f;
                        com.fyber.inneractive.sdk.config.remote.k kVar3 = aVar2.f27894f;
                        Integer num9 = (Integer) a((Object) 1, kVar != null ? kVar.f27929a : null, kVar2 != null ? kVar2.f27929a : null, kVar3 != null ? kVar3.f27929a : null);
                        if (num9.intValue() <= 0 && num9.intValue() > 100) {
                            z0Var.f27967a = 1;
                        } else {
                            z0Var.f27967a = num9;
                        }
                        Integer num10 = (Integer) a((Object) 0, kVar != null ? kVar.f27930b : null, kVar2 != null ? kVar2.f27930b : null, kVar3 != null ? kVar3.f27930b : null);
                        if (num10.intValue() < 0 && num10.intValue() > 100) {
                            z0Var.f27968b = 0;
                        } else {
                            z0Var.f27968b = num10;
                        }
                        Set<Vendor> set3 = (Set) a(new HashSet(), kVar != null ? kVar.f27931c : null, kVar2 != null ? kVar2.f27931c : null, kVar3 != null ? kVar3.f27931c : null);
                        z0Var.f27969c = set3;
                        w0Var.f27949g = z0Var;
                        if (o0Var != null && set3 != null) {
                            for (Vendor vendor : set3) {
                                if (vendor != null && !o0Var.f27872a.contains(vendor)) {
                                    o0Var.f27872a.add(vendor);
                                }
                            }
                        }
                        v0 v0Var3 = v0Var;
                        v0Var3.f27940a.add(w0Var);
                        HashMap map5 = map2;
                        map5.put(w0Var.f27943a, w0Var);
                        v0Var2 = v0Var3;
                        map4 = map5;
                        it3 = it4;
                        m0Var2 = m0Var;
                        it2 = it;
                        map3 = map;
                        str2 = str;
                    }
                }
            }
            map3.put(str2, v0Var2);
            eVar2 = eVar;
            c11 = 1;
            i5 = i12;
            it2 = it2;
        }
        return m0Var2;
    }

    public static Object a(Object obj, Object... objArr) {
        for (Object obj2 : objArr) {
            if (obj2 != null) {
                return obj2;
            }
        }
        return obj;
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final Object a(String str) {
        try {
            IAConfigManager iAConfigManager = IAConfigManager.Q;
            h hVar = iAConfigManager.E;
            if (hVar != null) {
                hVar.j();
            }
            com.fyber.inneractive.sdk.config.remote.e eVarA = com.fyber.inneractive.sdk.config.remote.e.a(new JSONObject(str));
            String str2 = iAConfigManager.f27745c;
            if (eVarA != null && str2.equals(eVarA.f27900a.f27889a)) {
                return a(eVarA);
            }
            IAlog.b("internal error while parsing local configuration", new Object[0]);
            if (eVarA != null && !str2.equals(eVarA.f27900a.f27889a)) {
                throw new InvalidAppIdException();
            }
            a(str, (Throwable) null);
            return null;
        } catch (Throwable th2) {
            a(str, th2);
            IAlog.b("Exception Error while parsing local configuration", new Object[0]);
            throw th2;
        }
    }
}
