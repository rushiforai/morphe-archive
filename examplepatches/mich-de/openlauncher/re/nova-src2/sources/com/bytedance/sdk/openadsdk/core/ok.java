package com.bytedance.sdk.openadsdk.core;

import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import android.util.Pair;
import b.c9;
import com.bytedance.sdk.component.embedapplog.PangleEncryptConstant;
import com.bytedance.sdk.component.embedapplog.PangleEncryptManager;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.component.utils.hf;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h;
import com.pgl.ssdk.ces.out.PglSSConfig;
import h6.c1;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ok {
    private static final AtomicInteger ycx = new AtomicInteger(0);

    /* renamed from: zb, reason: collision with root package name */
    private static final AtomicBoolean f25882zb = new AtomicBoolean(false);

    /* JADX INFO: Access modifiers changed from: private */
    public static void dj() {
        if (ycx.getAndIncrement() <= 0) {
            com.bytedance.sdk.openadsdk.utils.yzp.ycx().schedule(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.ok.2
                @Override // java.lang.Runnable
                public void run() {
                    ok.zb(ry.ycx(pmi.ycx()));
                }
            }, h.f42227c, TimeUnit.MILLISECONDS);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void sya() {
        ycx.set(0);
    }

    public static void zb(final String str) {
        if (com.bytedance.sdk.openadsdk.core.ea.zb.ycx().lud()) {
            return;
        }
        com.bytedance.sdk.openadsdk.utils.yzp.zb(new com.bytedance.sdk.component.fby.zb.sya("ipv6") { // from class: com.bytedance.sdk.openadsdk.core.ok.1
            /* JADX WARN: Removed duplicated region for block: B:62:0x014b  */
            @Override // java.lang.Runnable
            /*
                Code decompiled incorrectly, please refer to instructions dump.
            */
            public void run() throws JSONException {
                Exception exc;
                boolean z11;
                final List<String> list;
                com.bytedance.sdk.component.ul.ycx.ycx ycxVar;
                final String strUh = com.bytedance.sdk.openadsdk.utils.oby.uh();
                com.bytedance.sdk.openadsdk.dy.dj.ycx(0, strUh);
                final boolean zYcx = com.bytedance.sdk.openadsdk.utils.zb.ycx();
                if (!zYcx) {
                    com.bytedance.sdk.openadsdk.pmi.sya.ycx(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.core.ok.1.1
                        @Override // com.bytedance.sdk.openadsdk.pmi.dj
                        public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                            return c9.h("ipv6");
                        }
                    });
                }
                if (TextUtils.isEmpty(strUh)) {
                    com.bytedance.sdk.openadsdk.dy.dj.ycx(-1, strUh, -1, "url is null");
                    com.bytedance.sdk.openadsdk.dy.ycx.lud.ycx("ipv6", b.f42142b, -2, "url is null", null, null);
                    if (zYcx) {
                        return;
                    }
                    com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.core.ok.1.2
                        @Override // com.bytedance.sdk.openadsdk.pmi.dj
                        public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                            return c9.h("ipv6");
                        }
                    });
                    return;
                }
                final com.bytedance.sdk.component.ul.zb.dj djVarZb = com.bytedance.sdk.openadsdk.htf.zb.zb().sya().zb();
                if (zYcx) {
                    try {
                        djVarZb.ycx(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.core.ok.1.3
                            @Override // com.bytedance.sdk.openadsdk.pmi.dj
                            public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                return c9.h("ipv6");
                            }
                        });
                    } catch (Exception e3) {
                        exc = e3;
                        z11 = zYcx;
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(exc, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "ct4AlA27bNXEGw==", "Sfsj", 232);
                        com.bytedance.sdk.openadsdk.dy.dj.ycx(-1, strUh, -2, exc.getMessage());
                        com.bytedance.sdk.openadsdk.dy.ycx.lud.ycx("ipv6", strUh, -3, exc.getMessage(), null, null);
                        if (!z11) {
                        }
                        com.bytedance.sdk.component.utils.htf.sya(c1.s(exc, new StringBuilder("build ipv6 request failed:")), new Object[0]);
                    }
                }
                try {
                    djVarZb.sya(strUh);
                    if (com.bytedance.sdk.openadsdk.utils.zb.zb()) {
                        List<String> listHtf = com.bytedance.sdk.openadsdk.utils.oby.htf();
                        if (!listHtf.isEmpty()) {
                            djVarZb.ycx(listHtf);
                            djVarZb.ycx(60L, TimeUnit.SECONDS);
                        }
                        list = listHtf;
                    } else {
                        list = null;
                    }
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put("connect_type", com.bytedance.sdk.component.utils.hf.ycx(pmi.ycx(), 0L));
                    if (!TextUtils.isEmpty(str)) {
                        jSONObject.put("device_id", Long.parseLong(str));
                    }
                    jSONObject.put("header", com.bytedance.sdk.openadsdk.dj.ycx.ycx.ycx().zb());
                    try {
                        jSONObject.put("id", pmi.sya().ycx((AdSlot) null, (com.bytedance.sdk.openadsdk.core.model.tru) null, 0));
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "ct4AlA27bNXEGw==", "Sfsj", 168);
                        th2.getMessage();
                    }
                    JSONObject jSONObjectEncryptType4 = PangleEncryptManager.encryptType4(jSONObject, new oty(PangleEncryptConstant.CryptDataScene.DUAL_EVENT));
                    if (jSONObjectEncryptType4 == null || jSONObjectEncryptType4.optInt("cypher") != 4) {
                        hf.zb(false);
                    } else {
                        hf.zb(true);
                        djVarZb.zb("x-pgli18n", "4");
                        djVarZb.zb("Content-Type", "application/json; charset=utf-8");
                    }
                    if (ok.zb(jSONObjectEncryptType4)) {
                        jSONObject = jSONObjectEncryptType4;
                    }
                    djVarZb.zb("Content-Type", "application/json; charset=utf-8");
                    djVarZb.zb("User-Agent", com.bytedance.sdk.openadsdk.utils.oby.dj());
                    djVarZb.ycx(jSONObject);
                    djVarZb.ycx(6);
                    djVarZb.zb("send_i_p_v6");
                } catch (Exception e11) {
                    e = e11;
                    z11 = zYcx;
                    exc = e;
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(exc, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "ct4AlA27bNXEGw==", "Sfsj", 232);
                    com.bytedance.sdk.openadsdk.dy.dj.ycx(-1, strUh, -2, exc.getMessage());
                    com.bytedance.sdk.openadsdk.dy.ycx.lud.ycx("ipv6", strUh, -3, exc.getMessage(), null, null);
                    if (!z11) {
                        com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.core.ok.1.5
                            @Override // com.bytedance.sdk.openadsdk.pmi.dj
                            public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                return c9.h("ipv6");
                            }
                        });
                    }
                    com.bytedance.sdk.component.utils.htf.sya(c1.s(exc, new StringBuilder("build ipv6 request failed:")), new Object[0]);
                }
                try {
                    ycxVar = new com.bytedance.sdk.component.ul.ycx.ycx() { // from class: com.bytedance.sdk.openadsdk.core.ok.1.4
                        @Override // com.bytedance.sdk.component.ul.ycx.ycx
                        public void ycx(com.bytedance.sdk.component.ul.zb.sya syaVar, com.bytedance.sdk.component.ul.zb zbVar) {
                            if (zbVar.lt()) {
                                ok.zb(zbVar.dj(), strUh, syaVar, list);
                                return;
                            }
                            com.bytedance.sdk.openadsdk.dy.dj.ycx(-1, strUh, zbVar.ycx(), zbVar.zb());
                            com.bytedance.sdk.openadsdk.dy.ycx.lud.ycx("ipv6", strUh, zbVar.ycx(), zbVar.zb(), djVarZb.sya(), list);
                            if (!zYcx) {
                                com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.core.ok.1.4.1
                                    @Override // com.bytedance.sdk.openadsdk.pmi.dj
                                    public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                        return c9.h("ipv6");
                                    }
                                });
                            }
                            ok.dj();
                        }

                        @Override // com.bytedance.sdk.component.ul.ycx.ycx
                        public void ycx(com.bytedance.sdk.component.ul.zb.sya syaVar, IOException iOException) {
                            if (iOException != null) {
                                com.bytedance.sdk.openadsdk.dy.dj.ycx(-1, strUh, 1, iOException.getMessage());
                                com.bytedance.sdk.openadsdk.dy.ycx.lud.ycx("ipv6", strUh, -1, iOException.getMessage(), djVarZb.sya(), list);
                                if (!zYcx) {
                                    com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.core.ok.1.4.2
                                        @Override // com.bytedance.sdk.openadsdk.pmi.dj
                                        public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                            return c9.h("ipv6");
                                        }
                                    });
                                }
                            }
                            ok.dj();
                        }
                    };
                    strUh = strUh;
                    z11 = zYcx;
                } catch (Exception e12) {
                    e = e12;
                    strUh = strUh;
                    z11 = zYcx;
                    exc = e;
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(exc, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "ct4AlA27bNXEGw==", "Sfsj", 232);
                    com.bytedance.sdk.openadsdk.dy.dj.ycx(-1, strUh, -2, exc.getMessage());
                    com.bytedance.sdk.openadsdk.dy.ycx.lud.ycx("ipv6", strUh, -3, exc.getMessage(), null, null);
                    if (!z11) {
                    }
                    com.bytedance.sdk.component.utils.htf.sya(c1.s(exc, new StringBuilder("build ipv6 request failed:")), new Object[0]);
                }
                try {
                    djVarZb.zb(ycxVar);
                } catch (Exception e13) {
                    e = e13;
                    exc = e;
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(exc, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "ct4AlA27bNXEGw==", "Sfsj", 232);
                    com.bytedance.sdk.openadsdk.dy.dj.ycx(-1, strUh, -2, exc.getMessage());
                    com.bytedance.sdk.openadsdk.dy.ycx.lud.ycx("ipv6", strUh, -3, exc.getMessage(), null, null);
                    if (!z11) {
                    }
                    com.bytedance.sdk.component.utils.htf.sya(c1.s(exc, new StringBuilder("build ipv6 request failed:")), new Object[0]);
                }
            }
        });
    }

    public static class ycx implements hf.ycx {
        private static final AtomicBoolean ycx = new AtomicBoolean(false);

        /* renamed from: zb, reason: collision with root package name */
        private static volatile long f25885zb = -1;

        private ycx() {
        }

        public static void ycx() {
            if (ycx.compareAndSet(false, true)) {
                f25885zb = System.currentTimeMillis();
                com.bytedance.sdk.component.utils.hf.ycx(new ycx(), pmi.ycx());
            }
        }

        public void zb() {
            com.bytedance.sdk.component.utils.hf.ycx(this);
        }

        @Override // com.bytedance.sdk.component.utils.hf.ycx
        public void ycx(Context context, Intent intent, boolean z11, int i5) {
            if (System.currentTimeMillis() - f25885zb >= 2000 && i5 != 0) {
                ok.sya();
                ok.zb(ry.ycx(pmi.ycx()));
                zb();
            }
        }
    }

    public static void ycx(String str) {
        AtomicBoolean atomicBoolean = f25882zb;
        if (atomicBoolean.compareAndSet(false, true)) {
            if (!com.bytedance.sdk.component.utils.pmi.fby(pmi.ycx())) {
                atomicBoolean.set(false);
            } else {
                ycx.ycx();
                zb(str);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void zb(String str, String str2, com.bytedance.sdk.component.ul.zb.sya syaVar, List<String> list) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            int iOptInt = jSONObject.optInt("cypher");
            boolean zYcx = com.bytedance.sdk.openadsdk.utils.zb.ycx();
            if (iOptInt != 4) {
                com.bytedance.sdk.openadsdk.dy.dj.ycx(-1, str2, 1, "cypher type error");
                com.bytedance.sdk.openadsdk.dy.ycx.lud.ycx("ipv6", str2, -4, "cypher type error", syaVar.sya(), list);
                if (zYcx) {
                    return;
                }
                com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.core.ok.3
                    @Override // com.bytedance.sdk.openadsdk.pmi.dj
                    public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                        return c9.h("ipv6");
                    }
                });
                return;
            }
            Pair<Integer, String> pairDecryptType4 = PangleEncryptManager.decryptType4(jSONObject.optString(PglCryptUtils.KEY_MESSAGE));
            if (pairDecryptType4.second != null) {
                JSONObject jSONObject2 = new JSONObject((String) pairDecryptType4.second);
                String strOptString = jSONObject2.optString("ip_type");
                int iHashCode = strOptString.hashCode();
                if (iHashCode != 3239397) {
                    if (iHashCode != 3239399) {
                        if (iHashCode == 1959784951 && strOptString.equals("invalid")) {
                            return;
                        }
                    } else if (strOptString.equals("ipv6")) {
                        if (jSONObject2.has("ip")) {
                            String strOptString2 = jSONObject2.optString("ip");
                            com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("ttopenadsdk", PglSSConfig.CUSTOMINFO_KEY_IPV6, strOptString2);
                            com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("ttopenadsdk", "key_ipv4");
                            HashMap map = new HashMap();
                            map.put(PglSSConfig.CUSTOMINFO_KEY_IPV6, strOptString2);
                            com.bytedance.sdk.openadsdk.core.ok.sya.ycx(map);
                            com.bytedance.sdk.openadsdk.dy.dj.ycx(1, str2);
                            if (zYcx) {
                                return;
                            }
                            com.bytedance.sdk.openadsdk.pmi.sya.zb(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.core.ok.5
                                @Override // com.bytedance.sdk.openadsdk.pmi.dj
                                public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                    return c9.h("ipv6");
                                }
                            });
                            return;
                        }
                        com.bytedance.sdk.openadsdk.dy.dj.ycx(-1, str2, 4, "no ip");
                        com.bytedance.sdk.openadsdk.dy.ycx.lud.ycx("ipv6", str2, -6, "no ip", syaVar.sya(), list);
                        if (zYcx) {
                            return;
                        }
                        com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.core.ok.6
                            @Override // com.bytedance.sdk.openadsdk.pmi.dj
                            public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                return c9.h("ipv6");
                            }
                        });
                        return;
                    }
                } else if (strOptString.equals("ipv4")) {
                    if (jSONObject2.has("ip")) {
                        com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("ttopenadsdk", "key_ipv4", jSONObject2.optString("ip"));
                        com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("ttopenadsdk", PglSSConfig.CUSTOMINFO_KEY_IPV6);
                        com.bytedance.sdk.openadsdk.dy.dj.ycx(1, str2);
                        if (zYcx) {
                            return;
                        }
                        com.bytedance.sdk.openadsdk.pmi.sya.zb(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.core.ok.7
                            @Override // com.bytedance.sdk.openadsdk.pmi.dj
                            public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                return c9.h("ipv6");
                            }
                        });
                        return;
                    }
                    com.bytedance.sdk.openadsdk.dy.dj.ycx(-1, str2, 4, "no ip");
                    com.bytedance.sdk.openadsdk.dy.ycx.lud.ycx("ipv6", str2, -6, "no ip", syaVar.sya(), list);
                    if (zYcx) {
                        return;
                    }
                    com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.core.ok.8
                        @Override // com.bytedance.sdk.openadsdk.pmi.dj
                        public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                            return c9.h("ipv6");
                        }
                    });
                    return;
                }
                com.bytedance.sdk.openadsdk.dy.dj.ycx(-1, str2, 3, "no ip type ");
                com.bytedance.sdk.openadsdk.dy.ycx.lud.ycx("ipv6", str2, -7, "no ip type ", syaVar.sya(), list);
                if (zYcx) {
                    return;
                }
                com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.core.ok.9
                    @Override // com.bytedance.sdk.openadsdk.pmi.dj
                    public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                        return c9.h("ipv6");
                    }
                });
                return;
            }
            int iIntValue = ((Integer) pairDecryptType4.first).intValue();
            com.bytedance.sdk.openadsdk.dy.dj.ycx(-1, str2, 2, "decrypt failed ".concat(String.valueOf(iIntValue)));
            com.bytedance.sdk.openadsdk.dy.ycx.lud.ycx("ipv6", str2, -5, "decrypt failed ".concat(String.valueOf(iIntValue)), syaVar.sya(), list);
            if (zYcx) {
                return;
            }
            com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.core.ok.4
                @Override // com.bytedance.sdk.openadsdk.pmi.dj
                public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                    return c9.h("ipv6");
                }
            });
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "ct4AlA27bNU=", "U+8jkQ+5QNeWHOVYnwSsPA==", 378);
            com.bytedance.sdk.openadsdk.dy.dj.ycx(-1, str2, 2, "decrypt failed, wrong data ");
            com.bytedance.sdk.openadsdk.dy.ycx.lud.ycx("ipv6", str2, -8, "decrypt failed, wrong data ", syaVar.sya(), list);
            if (com.bytedance.sdk.openadsdk.utils.zb.ycx()) {
                return;
            }
            com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.core.ok.10
                @Override // com.bytedance.sdk.openadsdk.pmi.dj
                public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                    return c9.h("ipv6");
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean zb(JSONObject jSONObject) {
        return jSONObject != null && jSONObject.length() > 0;
    }
}
