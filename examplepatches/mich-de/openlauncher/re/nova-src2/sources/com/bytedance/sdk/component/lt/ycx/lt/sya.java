package com.bytedance.sdk.component.lt.ycx.lt;

import android.annotation.SuppressLint;
import android.content.Context;
import android.text.TextUtils;
import com.bytedance.sdk.component.lt.ycx.ul;
import com.tiktok.util.UrlConst;
import java.security.SecureRandom;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya implements zb {
    private final Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final lud f23842zb;

    @SuppressLint({"StaticFieldLeak"})
    public class ycx extends com.bytedance.sdk.component.lt.ycx.lud.lud {

        /* renamed from: dj, reason: collision with root package name */
        private final Map<String, String> f23846dj;
        private final String sya;

        /* renamed from: zb, reason: collision with root package name */
        private final dj f23847zb;

        private String sya(String str) {
            if (TextUtils.isEmpty(str)) {
                return str;
            }
            if (str.contains("{TS}") || str.contains("__TS__")) {
                long jCurrentTimeMillis = System.currentTimeMillis();
                str = str.replace("{TS}", String.valueOf(jCurrentTimeMillis)).replace("__TS__", String.valueOf(jCurrentTimeMillis));
            }
            return ((str.contains("{UID}") || str.contains("__UID__")) && !TextUtils.isEmpty(this.sya)) ? str.replace("{UID}", this.sya).replace("__UID__", this.sya) : str;
        }

        @Override // java.lang.Runnable
        public void run() {
            com.bytedance.sdk.component.lt.ycx.lud.dj djVarYcx;
            com.bytedance.sdk.component.lt.ycx.lud ludVarSyc = ul.lt().syc();
            if (ludVarSyc == null || ul.lt().lud() == null || !ludVarSyc.sya() || !ycx(this.f23847zb.zb())) {
                return;
            }
            if (this.f23847zb.dj() >= ludVarSyc.sya(this.f23847zb.lt())) {
                sya.this.f23842zb.sya(this.f23847zb);
                return;
            }
            try {
                if (this.f23847zb.ea()) {
                    sya.this.f23842zb.ycx(this.f23847zb);
                }
                if (ludVarSyc.ycx(sya.this.ycx())) {
                    long jCurrentTimeMillis = System.currentTimeMillis();
                    String strZb = this.f23847zb.zb();
                    if (ludVarSyc.lt() == 0) {
                        strZb = sya(this.f23847zb.zb());
                        if (this.f23847zb.sya()) {
                            strZb = zb(strZb);
                        }
                    }
                    com.bytedance.sdk.component.lt.ycx.lud.sya syaVarJc = ludVarSyc.jc();
                    if (syaVarJc == null) {
                        return;
                    }
                    syaVarJc.ycx("User-Agent", ludVarSyc.jw());
                    syaVarJc.ycx("csj_client_source_from", "1");
                    if (this.f23846dj != null) {
                        JSONObject jSONObject = new JSONObject();
                        for (Map.Entry<String, String> entry : this.f23846dj.entrySet()) {
                            jSONObject.put(entry.getKey(), entry.getValue());
                        }
                        syaVarJc.ycx("csj_extra_info", jSONObject.toString());
                    }
                    syaVarJc.ycx(strZb);
                    try {
                        djVarYcx = syaVarJc.ycx();
                        try {
                            djVarYcx.ycx();
                        } catch (Throwable unused) {
                        }
                    } catch (Throwable unused2) {
                        djVarYcx = null;
                    }
                    dj djVar = this.f23847zb;
                    djVar.ycx(djVar.dj() + 1);
                    if (djVarYcx != null && djVarYcx.ycx()) {
                        sya.this.f23842zb.sya(this.f23847zb);
                        this.f23847zb.zb();
                        ludVarSyc.ycx(true, 200, System.currentTimeMillis() - jCurrentTimeMillis, this.f23847zb);
                        return;
                    }
                    if (djVarYcx != null) {
                        this.f23847zb.zb(djVarYcx.zb());
                        this.f23847zb.sya(djVarYcx.sya());
                    }
                    if (djVarYcx == null || djVarYcx.zb() != 8848) {
                        this.f23847zb.zb();
                        if (this.f23847zb.dj() >= ludVarSyc.sya(this.f23847zb.lt())) {
                            sya.this.f23842zb.sya(this.f23847zb);
                            this.f23847zb.zb();
                        } else {
                            sya.this.f23842zb.zb(this.f23847zb);
                        }
                    } else {
                        djVarYcx.sya();
                        sya.this.f23842zb.sya(this.f23847zb);
                    }
                    ludVarSyc.ycx(false, this.f23847zb.fby(), System.currentTimeMillis() - jCurrentTimeMillis, this.f23847zb);
                }
            } catch (Throwable unused3) {
            }
        }

        public boolean ycx(String str) {
            if (TextUtils.isEmpty(str)) {
                return false;
            }
            return str.startsWith("http://") || str.startsWith(UrlConst.HTTPS);
        }

        public String zb(String str) {
            if (TextUtils.isEmpty(str)) {
                return str;
            }
            try {
                return str.replace("[ss_random]", String.valueOf(sya.sya().nextLong())).replace("[ss_timestamp]", String.valueOf(System.currentTimeMillis()));
            } catch (Exception unused) {
                return str;
            }
        }

        private ycx(dj djVar, String str, Map<String, String> map) {
            super("AdsStats");
            this.f23847zb = djVar;
            this.sya = str;
            this.f23846dj = map;
        }
    }

    public sya(Context context, lud ludVar) {
        this.ycx = context;
        this.f23842zb = ludVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Random sya() {
        try {
            return SecureRandom.getInstanceStrong();
        } catch (Throwable unused) {
            return new SecureRandom();
        }
    }

    public Context ycx() {
        Context context = this.ycx;
        return context == null ? ul.lt().lud() : context;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.lt.zb
    public void ycx(String str, List<String> list, boolean z11, Map<String, String> map, int i5, String str2) {
        com.bytedance.sdk.component.lt.ycx.lud ludVarSyc = ul.lt().syc();
        if (ludVarSyc == null || ul.lt().lud() == null || ludVarSyc.dj() == null || !ludVarSyc.sya() || list == null || list.size() == 0) {
            return;
        }
        Iterator<String> it = list.iterator();
        while (it.hasNext()) {
            ludVarSyc.dj().execute(new ycx(new dj(UUID.randomUUID().toString() + "_" + System.currentTimeMillis(), it.next(), z11, i5, str2), str, map));
        }
    }

    @Override // com.bytedance.sdk.component.lt.ycx.lt.zb
    public Runnable ycx(final dj djVar, final String str, final Map<String, String> map) {
        if (djVar == null || TextUtils.isEmpty(djVar.ycx())) {
            return null;
        }
        return new Runnable() { // from class: com.bytedance.sdk.component.lt.ycx.lt.sya.1
            @Override // java.lang.Runnable
            public void run() {
                if (sya.this.f23842zb.ycx(djVar.ycx()) != null) {
                    new ycx(djVar, str, map).run();
                }
            }
        };
    }

    @Override // com.bytedance.sdk.component.lt.ycx.lt.zb
    public void ycx(final String str, final boolean z11) {
        com.bytedance.sdk.component.lt.ycx.lud ludVarSyc = ul.lt().syc();
        if (ludVarSyc == null || ul.lt().lud() == null || !ludVarSyc.sya()) {
            return;
        }
        com.bytedance.sdk.component.lt.ycx.lud.lud ludVar = new com.bytedance.sdk.component.lt.ycx.lud.lud("trackFailedUrls") { // from class: com.bytedance.sdk.component.lt.ycx.lt.sya.2
            @Override // java.lang.Runnable
            public void run() {
                sya.this.ycx(sya.this.f23842zb.ycx(), str, z11);
            }
        };
        ludVar.ycx(1);
        if (ludVarSyc.dj() != null) {
            ludVarSyc.dj().execute(ludVar);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(List<dj> list, String str, boolean z11) {
        String str2;
        if (list == null || list.size() == 0) {
            return;
        }
        com.bytedance.sdk.component.lt.ycx.lud ludVarSyc = ul.lt().syc();
        for (dj djVar : list) {
            if (ludVarSyc == null || ludVarSyc.dj() == null) {
                str2 = str;
            } else {
                djVar.ycx(z11);
                str2 = str;
                ludVarSyc.dj().execute(new ycx(djVar, str2, null));
            }
            str = str2;
        }
    }
}
