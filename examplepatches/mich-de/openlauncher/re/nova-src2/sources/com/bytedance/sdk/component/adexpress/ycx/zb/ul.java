package com.bytedance.sdk.component.adexpress.ycx.zb;

import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ul {
    private static volatile ul ycx;

    /* renamed from: zb, reason: collision with root package name */
    private AtomicBoolean f23680zb = new AtomicBoolean(false);

    private ul() {
    }

    private JSONObject sya(String str) {
        com.bytedance.sdk.component.adexpress.ycx.ycx.sya syaVarSya = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya();
        if (syaVarSya == null) {
            return null;
        }
        com.bytedance.sdk.component.ul.zb.zb zbVarUl = syaVarSya.ul();
        zbVarUl.sya(str);
        com.bytedance.sdk.component.ul.zb zbVarLud = zbVarUl.lud();
        if (zbVarLud != null) {
            try {
                if (zbVarLud.lt() && zbVarLud.dj() != null) {
                    return new JSONObject(zbVarLud.dj());
                }
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+M9mSe1b8GtS9lcixSy", "XOs5uwaoTcaUSw==", TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173);
            }
        }
        return null;
    }

    public Set<String> zb(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return lt.ycx().zb(str);
    }

    public static ul ycx() {
        if (ycx == null) {
            synchronized (ul.class) {
                try {
                    if (ycx == null) {
                        ycx = new ul();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }

    private void zb() {
        if (com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya() == null) {
            return;
        }
        int iYcx = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya().ycx();
        if (iYcx <= 0) {
            iYcx = 100;
        }
        List<com.bytedance.sdk.component.adexpress.ycx.sya.zb> listZb = lt.ycx().zb();
        if (listZb == null || listZb.isEmpty() || iYcx >= listZb.size()) {
            if (listZb == null) {
                return;
            }
            listZb.size();
            return;
        }
        TreeMap treeMap = new TreeMap();
        for (com.bytedance.sdk.component.adexpress.ycx.sya.zb zbVar : listZb) {
            treeMap.put(zbVar.ul(), zbVar);
        }
        HashSet hashSet = new HashSet();
        int size = (int) (listZb.size() - (iYcx * 0.75f));
        int i5 = 0;
        for (Map.Entry entry : treeMap.entrySet()) {
            if (entry != null && i5 < size) {
                i5++;
                ((Long) entry.getKey()).getClass();
                com.bytedance.sdk.component.adexpress.ycx.sya.zb zbVar2 = (com.bytedance.sdk.component.adexpress.ycx.sya.zb) entry.getValue();
                if (zbVar2 != null) {
                    hashSet.add(zbVar2.zb());
                }
            }
        }
        ycx(hashSet);
        this.f23680zb.set(false);
    }

    public com.bytedance.sdk.component.adexpress.ycx.sya.zb ycx(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return lt.ycx().ycx(str);
    }

    public void ycx(com.bytedance.sdk.component.adexpress.ycx.sya.dj djVar, String str) {
        String strFby;
        if (djVar == null) {
            return;
        }
        final String str2 = djVar.ycx;
        final String str3 = djVar.sya;
        final String str4 = djVar.f23657zb;
        final String str5 = djVar.f23655dj;
        final String str6 = djVar.lud;
        if (com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya() != null) {
            strFby = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya().fby();
        } else {
            strFby = b.f42142b;
        }
        final String str7 = TextUtils.isEmpty(str) ? strFby : str;
        if (TextUtils.isEmpty(str2)) {
            return;
        }
        com.bytedance.sdk.component.adexpress.dj.dj.ycx(new com.bytedance.sdk.component.fby.zb.sya("saveTemplate") { // from class: com.bytedance.sdk.component.adexpress.ycx.zb.ul.1
            @Override // java.lang.Runnable
            public void run() throws Throwable {
                ul.this.ycx(str2, str3, str4, str5, str6, str7);
            }
        }, 10);
    }

    private void zb(String str, String str2, String str3, String str4, String str5, String str6) {
        lt.ycx().ycx(new com.bytedance.sdk.component.adexpress.ycx.sya.zb().ycx(str).zb(str2).sya(str3).dj(str4).lud(str5).lt(str6).ycx(Long.valueOf(System.currentTimeMillis())), false);
        zb();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void ycx(String str, String str2, String str3, String str4, String str5, String str6) throws Throwable {
        String str7;
        try {
            try {
                if (ycx(str) != null) {
                    if (!TextUtils.isEmpty(str4)) {
                        if (!TextUtils.isEmpty(str3)) {
                            str7 = str5;
                            zb(str6, str, str3, str2, str4, str7);
                        }
                    }
                    return;
                }
                str7 = str5;
                if (TextUtils.isEmpty(str4) || TextUtils.isEmpty(str3)) {
                    ycx(str2, str6, str);
                } else {
                    zb(str6, str, str3, str2, str4, str7);
                }
                boolean zYcx = fby.ycx(str7);
                if (!zb.lud() || zYcx) {
                    lud.zb().ycx(true);
                }
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            throw th;
        }
    }

    private void ycx(String str, String str2, String str3) {
        JSONObject jSONObjectSya;
        if (TextUtils.isEmpty(str) || (jSONObjectSya = sya(str)) == null) {
            return;
        }
        String strOptString = jSONObjectSya.optString("md5");
        String strOptString2 = jSONObjectSya.optString("version");
        String strOptString3 = jSONObjectSya.optString("data");
        if (TextUtils.isEmpty(strOptString) || TextUtils.isEmpty(strOptString2) || TextUtils.isEmpty(strOptString3)) {
            return;
        }
        com.bytedance.sdk.component.adexpress.ycx.sya.zb zbVarYcx = new com.bytedance.sdk.component.adexpress.ycx.sya.zb().ycx(str2).zb(str3).sya(strOptString).dj(str).lud(strOptString3).lt(strOptString2).ycx(Long.valueOf(System.currentTimeMillis()));
        lt.ycx().ycx(zbVarYcx, false);
        zb();
        if (fby.ycx(strOptString2)) {
            zbVarYcx.lt(strOptString2);
            lud.zb().ycx(true);
        }
    }

    public void ycx(Set<String> set) {
        try {
            lt.ycx().ycx(set);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCEqErU+s=", "b+M9mSe1b8GtS9lcixSy", "X+shkBe5R8i2S9tUiCWlJUviLIEGmnvIjWPT", 442);
            th2.getMessage();
        }
    }
}
