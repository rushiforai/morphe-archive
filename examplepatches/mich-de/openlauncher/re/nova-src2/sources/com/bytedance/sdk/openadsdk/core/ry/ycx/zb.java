package com.bytedance.sdk.openadsdk.core.ry.ycx;

import android.text.TextUtils;
import b.u4;
import com.bytedance.sdk.openadsdk.core.jc;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.google.android.gms.internal.measurement.k2;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb {
    private static volatile zb ycx;

    public interface ycx {
        void ycx(int i5, String str, String str2);

        void ycx(JSONObject jSONObject, String str);
    }

    private void zb(String str, String str2, String str3, String str4, String str5) {
        com.bytedance.sdk.openadsdk.core.ry.ycx.ycx ycxVar = new com.bytedance.sdk.openadsdk.core.ry.ycx.ycx();
        ycxVar.sya(str).lud(str3).dj(str4).zb(str2).ycx(str5).ycx(Long.valueOf(System.currentTimeMillis()));
        sya.ycx().ycx(ycxVar);
        zb();
    }

    public static zb ycx() {
        if (ycx == null) {
            synchronized (zb.class) {
                try {
                    if (ycx == null) {
                        ycx = new zb();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.ry.fby.ycx ycxVar, String str) {
        if (ycxVar == null || TextUtils.isEmpty(ycxVar.ycx())) {
            return;
        }
        StringBuilder sbK = k2.k(str, "_");
        sbK.append(ycxVar.ycx());
        final String string = sbK.toString();
        final String strSya = ycxVar.sya();
        final String strZb = ycxVar.zb();
        final String strDj = ycxVar.dj();
        String strLud = ycxVar.lud();
        if (TextUtils.isEmpty(strLud)) {
            if (str.equals("ad")) {
                strLud = jc.zb().dj();
            } else if (str.equals("adv3")) {
                strLud = jc.zb().dj() + "_v3";
            }
        }
        final String str2 = strLud;
        yzp.ycx(new com.bytedance.sdk.component.fby.zb.sya("saveUGenTemplate") { // from class: com.bytedance.sdk.openadsdk.core.ry.ycx.zb.1
            @Override // java.lang.Runnable
            public void run() {
                zb.this.ycx(string, strSya, strZb, strDj, str2);
            }
        }, 10);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb() {
        int iLud = pmi.dj().lud();
        if (iLud <= 0) {
            iLud = 100;
        }
        List<com.bytedance.sdk.openadsdk.core.ry.ycx.ycx> listZb = sya.ycx().zb();
        if (listZb == null || listZb.isEmpty() || iLud >= listZb.size()) {
            if (listZb == null) {
                return;
            }
            listZb.size();
            return;
        }
        int size = (int) (listZb.size() - (iLud * 0.75f));
        if (size <= 0) {
            return;
        }
        TreeMap treeMap = new TreeMap();
        for (com.bytedance.sdk.openadsdk.core.ry.ycx.ycx ycxVar : listZb) {
            treeMap.put(ycxVar.dj(), ycxVar);
        }
        HashSet hashSet = new HashSet();
        int i5 = 0;
        for (Map.Entry entry : treeMap.entrySet()) {
            if (entry != null && i5 < size) {
                i5++;
                com.bytedance.sdk.openadsdk.core.ry.ycx.ycx ycxVar2 = (com.bytedance.sdk.openadsdk.core.ry.ycx.ycx) entry.getValue();
                if (ycxVar2 != null) {
                    hashSet.add(ycxVar2.ycx());
                }
            }
        }
        ycx(hashSet);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(String str, String str2, String str3, String str4, String str5) {
        if (ycx(str, str3) != null) {
            if (TextUtils.isEmpty(str4) || TextUtils.isEmpty(str3)) {
                return;
            }
            zb(str2, str3, str5, str4, str);
            return;
        }
        if (TextUtils.isEmpty(str4)) {
            ycx(str2, str, str3, str5, (ycx) null);
        } else {
            zb(str2, str3, str5, str4, str);
        }
    }

    public void ycx(String str, String str2, String str3, String str4, String str5, final ycx ycxVar) {
        if (TextUtils.isEmpty(str3) || TextUtils.isEmpty(str4)) {
            if (ycxVar != null) {
                ycxVar.ycx(1, "id  or md5 is empty", "net");
                return;
            }
            return;
        }
        String strM = u4.m(str, "_", str3);
        com.bytedance.sdk.openadsdk.core.ry.ycx.ycx ycxVarYcx = ycx(strM, str4);
        if (ycxVarYcx != null && !TextUtils.isEmpty(ycxVarYcx.lud())) {
            ycx(ycxVarYcx);
            if (ycxVar != null) {
                try {
                    ycxVar.ycx(new JSONObject(ycxVarYcx.lud()), "local");
                    return;
                } catch (JSONException e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJqxoNC0g==", "bskomze5ZNeMS8NYoRCuKVzrPw==", "Wu08gAqubPOFR8dRjQWlAVXoIg==", Sdk.SDKError.Reason.OMSDK_JS_WRITE_FAILED_VALUE);
                    ycxVar.ycx(2, "parse json exception data is " + ycxVarYcx.lud(), "local");
                    return;
                }
            }
            return;
        }
        ycx(str2, strM, str4, str5, new ycx() { // from class: com.bytedance.sdk.openadsdk.core.ry.ycx.zb.2
            @Override // com.bytedance.sdk.openadsdk.core.ry.ycx.zb.ycx
            public void ycx(JSONObject jSONObject, String str6) {
                ycx ycxVar2 = ycxVar;
                if (ycxVar2 != null) {
                    ycxVar2.ycx(jSONObject, str6);
                }
            }

            @Override // com.bytedance.sdk.openadsdk.core.ry.ycx.zb.ycx
            public void ycx(int i5, String str6, String str7) {
                ycx ycxVar2 = ycxVar;
                if (ycxVar2 != null) {
                    ycxVar2.ycx(i5, str6, str7);
                }
            }
        });
    }

    private void ycx(final String str, final String str2, final String str3, final String str4, final ycx ycxVar) {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2) || TextUtils.isEmpty(str3)) {
            if (ycxVar != null) {
                ycxVar.ycx(1, "template url or id  or md5 is empty", "net");
            }
        } else {
            com.bytedance.sdk.component.ul.zb.zb zbVarSya = com.bytedance.sdk.openadsdk.htf.zb.zb().sya().sya();
            zbVarSya.sya(str);
            zbVarSya.ycx(7);
            zbVarSya.zb("load_ug_t");
            zbVarSya.zb(new com.bytedance.sdk.component.ul.ycx.ycx() { // from class: com.bytedance.sdk.openadsdk.core.ry.ycx.zb.3
                @Override // com.bytedance.sdk.component.ul.ycx.ycx
                public void ycx(com.bytedance.sdk.component.ul.zb.sya syaVar, com.bytedance.sdk.component.ul.zb zbVar) {
                    if (zbVar == null) {
                        return;
                    }
                    if (!zbVar.lt()) {
                        ycx ycxVar2 = ycxVar;
                        if (ycxVar2 != null) {
                            ycxVar2.ycx(3, "net code error code is " + zbVar.ycx() + " message is " + zbVar.zb(), "net");
                            return;
                        }
                        return;
                    }
                    String strDj = zbVar.dj();
                    if (TextUtils.isEmpty(strDj)) {
                        ycx ycxVar3 = ycxVar;
                        if (ycxVar3 != null) {
                            ycxVar3.ycx(3, "net data is null", "net");
                            return;
                        }
                        return;
                    }
                    sya.ycx().ycx(new com.bytedance.sdk.openadsdk.core.ry.ycx.ycx().ycx(str2).zb(str3).sya(str).lud(str4).dj(strDj).ycx(Long.valueOf(System.currentTimeMillis())));
                    zb.this.zb();
                    if (ycxVar != null) {
                        try {
                            ycxVar.ycx(new JSONObject(strDj), "net");
                        } catch (JSONException e3) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJqxoNC0g==", "bskomze5ZNeMS8NYoRCuKVzrP9FQ", "VOAfkBCsZsmTTw==", 180);
                            ycxVar.ycx(2, "parse json exception data is".concat(String.valueOf(strDj)), "net");
                        }
                    }
                }

                @Override // com.bytedance.sdk.component.ul.ycx.ycx
                public void ycx(com.bytedance.sdk.component.ul.zb.sya syaVar, IOException iOException) {
                    ycx ycxVar2 = ycxVar;
                    if (ycxVar2 != null) {
                        ycxVar2.ycx(3, "net error " + iOException.getMessage(), "net");
                    }
                }
            });
        }
    }

    public Set<com.bytedance.sdk.openadsdk.core.ry.ycx.ycx> ycx(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return sya.ycx().ycx(str);
    }

    public String ycx(String str, String str2, String str3) {
        com.bytedance.sdk.openadsdk.core.ry.ycx.ycx ycxVarYcx = ycx(u4.m(str, "_", str2), str3);
        if (ycxVarYcx == null) {
            return null;
        }
        ycx(ycxVarYcx);
        return ycxVarYcx.lud();
    }

    private com.bytedance.sdk.openadsdk.core.ry.ycx.ycx ycx(String str, String str2) {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return null;
        }
        return sya.ycx().ycx(str, str2);
    }

    private void ycx(final com.bytedance.sdk.openadsdk.core.ry.ycx.ycx ycxVar) {
        ycxVar.ycx(Long.valueOf(System.currentTimeMillis()));
        yzp.ycx(new com.bytedance.sdk.component.fby.zb.sya("updateTmplTime") { // from class: com.bytedance.sdk.openadsdk.core.ry.ycx.zb.4
            @Override // java.lang.Runnable
            public void run() {
                sya.ycx().ycx(ycxVar);
            }
        }, 10);
    }

    public void ycx(Set<String> set) {
        try {
            sya.ycx().ycx(set);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJqxoNC0g==", "bskomze5ZNeMS8NYoRCuKVzrPw==", "X+shkBe5R8i2S9tUiCWlJUviLIEGmnvIjWPT", 297);
            th2.getMessage();
        }
    }
}
