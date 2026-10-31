package com.bytedance.sdk.openadsdk.xkz.ycx.ycx;

import android.text.TextUtils;
import b.c0;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.core.model.oty;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.model.tru;
import com.bytedance.sdk.openadsdk.core.model.wwx;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.UrlConst;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.SoftReference;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya {

    /* renamed from: dj, reason: collision with root package name */
    private static final LinkedHashMap<String, SoftReference<String>> f27425dj = new LinkedHashMap<String, SoftReference<String>>(16, 0.75f, true) { // from class: com.bytedance.sdk.openadsdk.xkz.ycx.ycx.sya.1
        @Override // java.util.LinkedHashMap
        public boolean removeEldestEntry(Map.Entry<String, SoftReference<String>> entry) {
            return size() > 5;
        }
    };
    private static volatile sya ycx;
    private tn lud;

    /* renamed from: zb, reason: collision with root package name */
    private final Object f27426zb = new Object();
    private tn sya = null;

    /* renamed from: com.bytedance.sdk.openadsdk.xkz.ycx.ycx.sya$sya, reason: collision with other inner class name */
    public interface InterfaceC0116sya {
        void ycx(String str);

        default void zb(String str) {
        }
    }

    public interface ycx {
        void ycx();

        default void ycx(Exception exc) {
        }
    }

    public interface zb {
        void ycx(List<com.bytedance.sdk.openadsdk.xkz.ycx.ycx> list);
    }

    private void lt(String str) {
        Iterator<Map.Entry<String, SoftReference<String>>> it = f27425dj.entrySet().iterator();
        while (it.hasNext()) {
            it.next().getKey();
        }
    }

    private String lud(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        synchronized (this.f27426zb) {
            try {
                LinkedHashMap<String, SoftReference<String>> linkedHashMap = f27425dj;
                SoftReference<String> softReference = linkedHashMap.get(str);
                if (softReference != null) {
                    String str2 = softReference.get();
                    if (str2 != null) {
                        lt("After add: ".concat(String.valueOf(str)));
                        return str2;
                    }
                    linkedHashMap.remove(str);
                }
                return null;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public String sya(String str) {
        if (TextUtils.isEmpty(str)) {
            return b.f42142b;
        }
        try {
            return com.bytedance.sdk.openadsdk.xkz.ycx.ycx.ycx.ycx(str, "XOR$1_");
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/pcghCnLUk=", "XuAuhxqsfeqBXtJPhRCs", 353);
            return null;
        }
    }

    public void zb(final com.bytedance.sdk.openadsdk.xkz.ycx.ycx ycxVar) {
        if (ycxVar == null) {
            return;
        }
        yzp.ycx(new com.bytedance.sdk.component.fby.zb.sya("iabhistory_insert") { // from class: com.bytedance.sdk.openadsdk.xkz.ycx.ycx.sya.3
            @Override // java.lang.Runnable
            public void run() {
                try {
                    com.bytedance.sdk.openadsdk.xkz.ycx.ycx.zb.ycx().zb(ycxVar);
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/pcghCnLUmqfg==", "Sfsj", 170);
                }
            }
        }, 8);
    }

    public static sya ycx() {
        if (ycx == null) {
            synchronized (sya.class) {
                try {
                    if (ycx == null) {
                        ycx = new sya();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }

    public String dj(String str) {
        try {
            if (TextUtils.isEmpty(str)) {
                return b.f42142b;
            }
            String strZb = com.bytedance.sdk.openadsdk.xkz.ycx.ycx.ycx.zb(str, "XOR$1_");
            return !TextUtils.isEmpty(strZb) ? strZb : str;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/pcghCnLUk=", "X+suhxqsfeqBXtJPhRCs", 370);
            return null;
        }
    }

    public void zb() {
        yzp.ycx(new com.bytedance.sdk.component.fby.zb.sya("iabhistory_clear_overlimit") { // from class: com.bytedance.sdk.openadsdk.xkz.ycx.ycx.sya.7
            @Override // java.lang.Runnable
            public void run() {
                try {
                    com.bytedance.sdk.openadsdk.xkz.ycx.ycx.zb.ycx().dj();
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/pcghCnLUmqeg==", "Sfsj", 270);
                }
            }
        }, 8);
    }

    public static List<tn> zb(String str) {
        if (str == null) {
            return new ArrayList();
        }
        ArrayList arrayList = new ArrayList();
        com.bytedance.sdk.openadsdk.core.model.ycx ycxVar = new com.bytedance.sdk.openadsdk.core.model.ycx();
        try {
            JSONObject jSONObject = new JSONObject(str);
            ycxVar.ycx(jSONObject.optString("request_id"));
            ycxVar.ycx(jSONObject.optInt("ret"));
            ycxVar.zb(jSONObject.optInt("multi_ad_style", 0));
            ycxVar.zb(jSONObject.optString(PglCryptUtils.KEY_MESSAGE));
            String strOptString = jSONObject.optString("gdid_encrypted");
            ycxVar.ycx(wwx.ycx(jSONObject.optJSONObject("loop_config")));
            String strOptString2 = jSONObject.optString("auction_price");
            if (ycxVar.dj() != 0) {
                return null;
            }
            ycxVar.ycx(oty.ycx(jSONObject.optString("multi_ad_config")));
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("creatives");
            if (jSONArrayOptJSONArray != null) {
                for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                    tn tnVarYcx = com.bytedance.sdk.openadsdk.core.zb.ycx(jSONArrayOptJSONArray.optJSONObject(i5), (AdSlot) null, (tru) null, ycxVar, i5);
                    if (tnVarYcx != null) {
                        tnVarYcx.syc(strOptString2);
                        if (TextUtils.isEmpty(tnVarYcx.ybg())) {
                            tnVarYcx.kgy(jSONObject.toString());
                        }
                        if (!TextUtils.isEmpty(strOptString)) {
                            tnVarYcx.jw(strOptString);
                        }
                    }
                    ycxVar.ycx(tnVarYcx);
                    arrayList.add(tnVarYcx);
                }
            }
            return arrayList.isEmpty() ? ycxVar.lud() : arrayList;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/pcghCnLUk=", "WOEjgwaufe2TRdlpgzyhPF78JJQPkWzTgQ==", 339);
            return null;
        }
    }

    public tn sya() {
        return this.lud;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(String str, String str2) {
        if (TextUtils.isEmpty(str) || str2 == null) {
            return;
        }
        synchronized (this.f27426zb) {
            LinkedHashMap<String, SoftReference<String>> linkedHashMap = f27425dj;
            linkedHashMap.put(str, new SoftReference<>(str2));
            linkedHashMap.size();
        }
    }

    public void ycx(final com.bytedance.sdk.openadsdk.xkz.ycx.ycx ycxVar) {
        if (ycxVar == null) {
            return;
        }
        yzp.ycx(new com.bytedance.sdk.component.fby.zb.sya("iabhistory_insert") { // from class: com.bytedance.sdk.openadsdk.xkz.ycx.ycx.sya.2
            @Override // java.lang.Runnable
            public void run() {
                try {
                    com.bytedance.sdk.openadsdk.xkz.ycx.ycx.zb.ycx().ycx(ycxVar);
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/pcghCnLUmqfw==", "Sfsj", 152);
                }
            }
        }, 8);
    }

    public void ycx(final String str, final InterfaceC0116sya interfaceC0116sya) {
        if (TextUtils.isEmpty(str)) {
            if (interfaceC0116sya != null) {
                interfaceC0116sya.zb("materialKey is empty");
                return;
            }
            return;
        }
        String strLud = lud(str);
        if (strLud == null) {
            yzp.ycx(new com.bytedance.sdk.component.fby.zb.sya("iabhistory_query_material") { // from class: com.bytedance.sdk.openadsdk.xkz.ycx.ycx.sya.4
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        String strDj = sya.this.dj(com.bytedance.sdk.openadsdk.xkz.ycx.ycx.zb.ycx().ycx(str));
                        if (!TextUtils.isEmpty(strDj)) {
                            sya.this.ycx(str, strDj);
                        }
                        InterfaceC0116sya interfaceC0116sya2 = interfaceC0116sya;
                        if (interfaceC0116sya2 != null) {
                            interfaceC0116sya2.ycx(strDj);
                        }
                    } catch (Exception e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/pcghCnLUmqeQ==", "Sfsj", Sdk.SDKError.Reason.INVALID_BID_PAYLOAD_VALUE);
                        InterfaceC0116sya interfaceC0116sya3 = interfaceC0116sya;
                        if (interfaceC0116sya3 != null) {
                            interfaceC0116sya3.zb(e3.getMessage());
                        }
                    }
                }
            }, 8);
        } else if (interfaceC0116sya != null) {
            interfaceC0116sya.ycx(strLud);
        }
    }

    public void ycx(final zb zbVar) {
        yzp.ycx(new com.bytedance.sdk.component.fby.zb.sya("iabhistory_get_all") { // from class: com.bytedance.sdk.openadsdk.xkz.ycx.ycx.sya.5
            @Override // java.lang.Runnable
            public void run() {
                try {
                    List<com.bytedance.sdk.openadsdk.xkz.ycx.ycx> listZb = com.bytedance.sdk.openadsdk.xkz.ycx.ycx.zb.ycx().zb();
                    zb zbVar2 = zbVar;
                    if (zbVar2 != null) {
                        if (listZb == null) {
                            listZb = Collections.EMPTY_LIST;
                        }
                        zbVar2.ycx(listZb);
                    }
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/pcghCnLUmqeA==", "Sfsj", 230);
                }
            }
        }, 8);
    }

    public void ycx(final ycx ycxVar) {
        yzp.ycx(new com.bytedance.sdk.component.fby.zb.sya("iabhistory_clear") { // from class: com.bytedance.sdk.openadsdk.xkz.ycx.ycx.sya.6
            @Override // java.lang.Runnable
            public void run() {
                try {
                    com.bytedance.sdk.openadsdk.xkz.ycx.ycx.zb.ycx().sya();
                    sya.f27425dj.clear();
                    ycx ycxVar2 = ycxVar;
                    if (ycxVar2 != null) {
                        ycxVar2.ycx();
                    }
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/pcghCnLUmqew==", "Sfsj", 252);
                    ycx ycxVar3 = ycxVar;
                    if (ycxVar3 != null) {
                        ycxVar3.ycx(e3);
                    }
                }
            }
        }, 8);
    }

    public String ycx(String str) {
        try {
            return c0.l(UrlConst.HTTPS, new URL(str).getHost(), "/favicon.ico");
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4AQrixS4CqFArtsiYhDxEmDA7lmX+w=", "cs8PvQqvfciSU/pcghCnLUk=", "WOEjgwaufe6NS9BYuQOs", 289);
            return null;
        }
    }

    public void ycx(tn tnVar) {
        this.lud = tnVar;
    }
}
