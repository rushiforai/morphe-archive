package com.bytedance.sdk.openadsdk.htf;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.net.Uri;
import android.text.TextUtils;
import android.view.View;
import android.widget.ImageView;
import com.bytedance.sdk.component.embedapplog.PangleEncryptConstant;
import com.bytedance.sdk.component.embedapplog.PangleEncryptManager;
import com.bytedance.sdk.component.lud.dy;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.component.ul.ycx;
import com.bytedance.sdk.component.utils.pmi;
import com.bytedance.sdk.component.zb.ycx.fby;
import com.bytedance.sdk.component.zb.ycx.ok;
import com.bytedance.sdk.component.zb.ycx.xkz;
import com.bytedance.sdk.component.zb.ycx.ycx.ycx.jc;
import com.bytedance.sdk.component.zb.ycx.ycx.ycx.lud;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.oty;
import com.bytedance.sdk.openadsdk.core.settings.ea;
import com.bytedance.sdk.openadsdk.htf.ycx.sya;
import com.bytedance.sdk.openadsdk.pmi.dj;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.google.android.gms.dynamite.descriptors.com.google.android.gms.measurement.dynamite.ModuleDescriptor;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.pgl.ssdk.ces.out.PglSSConfig;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb {

    @SuppressLint({"StaticFieldLeak"})
    private static volatile zb ycx;

    /* renamed from: dj, reason: collision with root package name */
    private final Map<String, JSONObject> f26840dj = new HashMap();
    private sya sya;

    /* renamed from: zb, reason: collision with root package name */
    private final com.bytedance.sdk.component.ul.ycx f26841zb;

    public class ycx implements fby {
        public ycx() {
        }

        @Override // com.bytedance.sdk.component.zb.ycx.fby
        public xkz ycx(fby.ycx ycxVar) throws IOException {
            JSONObject jSONObjectYcx;
            ok okVarYcx = ycxVar.ycx();
            if (okVarYcx.dj() != null && !okVarYcx.dj().dj().isEmpty()) {
                List<String> listDj = okVarYcx.dj().dj();
                StringBuilder sb2 = new StringBuilder();
                for (String str : listDj) {
                    sb2.append("/");
                    sb2.append(str);
                }
                String string = sb2.toString();
                if (!TextUtils.isEmpty(string)) {
                    if (string.equals("/monitor/collect/c/session")) {
                        return ycxVar.ycx(okVarYcx);
                    }
                    if (string.equals("/api/ad/union/sdk/register_status/") || string.equals("/api/ad/union/sdk/compliance_status/")) {
                        return ycxVar.ycx(okVarYcx);
                    }
                }
            }
            ok.ycx ycxVarEa = okVarYcx.ea();
            String strZb = com.bytedance.sdk.openadsdk.uh.dj.ycx.zb("ttopenadsdk", PglSSConfig.CUSTOMINFO_KEY_IPV6, b.f42142b);
            if (!TextUtils.isEmpty(strZb) && (jSONObjectYcx = zb.this.ycx(strZb)) != null) {
                ycxVarEa.zb("transfer-param", jSONObjectYcx.optString(PglCryptUtils.KEY_MESSAGE));
                if (jSONObjectYcx.optInt("cypher") == 4) {
                    ycxVarEa.zb("cypher", "4");
                } else {
                    ycxVarEa.zb("cypher", "3");
                }
            }
            try {
                ycxVarEa.zb("x-pangle-target-idc", ea.zb().pg());
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4IUtA==", "b9oDkBefZc6FRMMZpBShLF78BJsXuXvEhVrDUp4=", "UuA5kBG/bNeU", 277);
            }
            return ycxVar.ycx(ycxVarEa.zb());
        }
    }

    private zb() {
        int iYcx = ycx();
        ycx.C0042ycx c0042ycx = new ycx.C0042ycx();
        long j11 = iYcx;
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        ycx.C0042ycx c0042ycxYcx = c0042ycx.ycx(j11, timeUnit).zb(j11, timeUnit).sya(j11, timeUnit).ycx(new ycx());
        if (com.bytedance.sdk.openadsdk.utils.zb.ycx()) {
            c0042ycxYcx.ycx(new ycx.zb() { // from class: com.bytedance.sdk.openadsdk.htf.zb.1
                @Override // com.bytedance.sdk.component.ul.ycx.zb
                public void sya(dj djVar) {
                    djVar.ycx().sya();
                    djVar.hashCode();
                    com.bytedance.sdk.openadsdk.pmi.sya.sya(djVar);
                }

                @Override // com.bytedance.sdk.component.ul.ycx.zb
                public void ycx(dj djVar) {
                    djVar.ycx().sya();
                    djVar.hashCode();
                    com.bytedance.sdk.openadsdk.pmi.sya.ycx(djVar);
                }

                @Override // com.bytedance.sdk.component.ul.ycx.zb
                public void zb(dj djVar) {
                    djVar.ycx().sya();
                    djVar.hashCode();
                    com.bytedance.sdk.openadsdk.pmi.sya.zb(djVar);
                }
            });
        }
        com.bytedance.sdk.component.ul.ycx ycxVarYcx = c0042ycxYcx.ycx(true).ycx();
        this.f26841zb = ycxVarYcx;
        com.bytedance.sdk.component.zb.ycx.ycx.ycx.ycx.ycx(new jc() { // from class: com.bytedance.sdk.openadsdk.htf.zb.2
            @Override // com.bytedance.sdk.component.zb.ycx.ycx.ycx.jc
            public ExecutorService ycx() {
                if (ea.zb().ufy()) {
                    return yzp.ry();
                }
                return null;
            }

            @Override // com.bytedance.sdk.component.zb.ycx.ycx.ycx.jc
            public boolean zb() {
                return ea.zb().ufy();
            }
        });
        com.bytedance.sdk.component.ul.ycx.ycx(new lud() { // from class: com.bytedance.sdk.openadsdk.htf.zb.3
            @Override // com.bytedance.sdk.component.zb.ycx.ycx.ycx.lud
            public boolean ycx() {
                return com.bytedance.sdk.openadsdk.dv.lud.ycx("net_http_protocol", 0) == 1;
            }
        });
        com.bytedance.sdk.component.ul.ycx.ycx(new ycx.sya() { // from class: com.bytedance.sdk.openadsdk.htf.zb.4
            @Override // com.bytedance.sdk.component.ul.ycx.sya
            public boolean ycx() {
                return com.bytedance.sdk.openadsdk.utils.zb.zb();
            }

            @Override // com.bytedance.sdk.component.ul.ycx.sya
            public boolean zb() {
                return pmi.fby(com.bytedance.sdk.openadsdk.core.pmi.ycx());
            }

            @Override // com.bytedance.sdk.component.ul.ycx.sya
            public void ycx(final String str, final String str2, final String str3, final int i5, final String str4, final boolean z11, final int i11, final int i12) {
                try {
                    if (TextUtils.isEmpty(str3) || !str3.contains("/api/ad/union/sdk/stats/batch/")) {
                        com.bytedance.sdk.openadsdk.dy.dj.ycx("net_call_fail", false, new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.htf.zb.4.1
                            /* JADX WARN: Removed duplicated region for block: B:13:0x0033  */
                            /* JADX WARN: Removed duplicated region for block: B:16:0x003e  */
                            /* JADX WARN: Removed duplicated region for block: B:19:0x0063  */
                            /* JADX WARN: Removed duplicated region for block: B:31:0x0090  */
                            /* JADX WARN: Removed duplicated region for block: B:34:0x009b  */
                            @Override // com.bytedance.sdk.openadsdk.dy.zb
                            /*
                                Code decompiled incorrectly, please refer to instructions dump.
                            */
                            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                                String host;
                                String path;
                                String host2;
                                JSONObject jSONObject = new JSONObject();
                                jSONObject.put("fail_url", str3);
                                String path2 = b.f42142b;
                                try {
                                    Uri uri = Uri.parse(str3);
                                    host = uri.getHost();
                                    try {
                                        path = uri.getPath();
                                    } catch (Throwable th2) {
                                        th = th2;
                                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4IUtA==", "b9oDkBefZc6FRMMZ2FXx", "XOs5uQy7WtOBXsQ=", ModuleDescriptor.MODULE_VERSION);
                                        path = b.f42142b;
                                        if (!TextUtils.isEmpty(host)) {
                                        }
                                        if (!TextUtils.isEmpty(path)) {
                                        }
                                        jSONObject.put("error_code", i5);
                                        jSONObject.put("trace_id", str);
                                        jSONObject.put("error_msg", str4);
                                        jSONObject.put("is_retry_enabled", z11);
                                        if (z11) {
                                        }
                                        return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("net_call_fail").zb(jSONObject.toString());
                                    }
                                } catch (Throwable th3) {
                                    th = th3;
                                    host = b.f42142b;
                                }
                                if (!TextUtils.isEmpty(host)) {
                                    jSONObject.put("error_domain", host);
                                }
                                if (!TextUtils.isEmpty(path)) {
                                    jSONObject.put("error_path", path);
                                }
                                jSONObject.put("error_code", i5);
                                jSONObject.put("trace_id", str);
                                jSONObject.put("error_msg", str4);
                                jSONObject.put("is_retry_enabled", z11);
                                if (z11) {
                                    jSONObject.put("primary_url", str2);
                                    if (!TextUtils.isEmpty(str2)) {
                                        try {
                                            Uri uri2 = Uri.parse(str2);
                                            host2 = uri2.getHost();
                                            try {
                                                path2 = uri2.getPath();
                                            } catch (Throwable th4) {
                                                th = th4;
                                                com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4IUtA==", "b9oDkBefZc6FRMMZ2FXx", "XOs5uQy7WtOBXsQ=", Sdk.SDKError.Reason.INVALID_BID_PAYLOAD_VALUE);
                                                if (!TextUtils.isEmpty(host2)) {
                                                }
                                                if (!TextUtils.isEmpty(path2)) {
                                                }
                                                jSONObject.put("attempt_index", i11);
                                                jSONObject.put("total_attempts", i12);
                                                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("net_call_fail").zb(jSONObject.toString());
                                            }
                                        } catch (Throwable th5) {
                                            th = th5;
                                            host2 = b.f42142b;
                                        }
                                        if (!TextUtils.isEmpty(host2)) {
                                            jSONObject.put("primary_domain", host2);
                                        }
                                        if (!TextUtils.isEmpty(path2)) {
                                            jSONObject.put("primary_path", path2);
                                        }
                                    }
                                    jSONObject.put("attempt_index", i11);
                                    jSONObject.put("total_attempts", i12);
                                }
                                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("net_call_fail").zb(jSONObject.toString());
                            }
                        });
                    }
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4IUtA==", "b9oDkBefZc6FRMMZ2A==", "Ses9mhGoT8aJRsJPiQ==", Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE);
                }
            }
        });
        com.bytedance.sdk.component.ul.sya.sya.ycx().ycx(com.bytedance.sdk.openadsdk.utils.zb.fby());
        com.bytedance.sdk.component.zb.ycx.dj djVarZb = ycxVarYcx.fby().zb();
        if (djVarZb != null) {
            djVarZb.ycx(32);
        }
    }

    private void lud() {
        if (this.sya == null) {
            this.sya = new sya();
        }
    }

    public static zb zb() {
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

    public sya dj() {
        lud();
        return this.sya;
    }

    public com.bytedance.sdk.component.ul.ycx sya() {
        return this.f26841zb;
    }

    public int ycx() {
        try {
            return com.bytedance.sdk.openadsdk.dv.lud.ycx("net_time_out", 10000);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4IUtA==", "b9oDkBefZc6FRMM=", "XOs5uwaofsiSQeNUgRSPPU8=", 85);
            return 10000;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public JSONObject ycx(String str) throws JSONException {
        JSONObject jSONObject = this.f26840dj.get(str);
        if (jSONObject != null) {
            return jSONObject;
        }
        JSONObject jSONObject2 = new JSONObject();
        try {
            jSONObject2.put("ipv6", str);
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4IUtA==", "b9oDkBefZc6FRMM=", "XOs5sA2/e96QXv5Nmkc=", 293);
        }
        JSONObject jSONObjectEncryptType4 = PangleEncryptManager.encryptType4(jSONObject2, new oty(PangleEncryptConstant.CryptDataScene.UNKNOWN));
        this.f26840dj.put(str, jSONObjectEncryptType4);
        return jSONObjectEncryptType4;
    }

    public void ycx(String str, int i5, int i11, ImageView imageView, tn tnVar) {
        com.bytedance.sdk.openadsdk.jc.dj.ycx(str).ycx(i5).zb(i11).lud(dc.lt(com.bytedance.sdk.openadsdk.core.pmi.ycx())).dj(dc.dj(com.bytedance.sdk.openadsdk.core.pmi.ycx())).sya(1).ycx(com.bytedance.sdk.openadsdk.jc.sya.ycx(tnVar, str, imageView));
    }

    public void ycx(int i5, final ImageView imageView, final tn tnVar) {
        if (tnVar == null || !TextUtils.isEmpty(tnVar.wwx())) {
            com.bytedance.sdk.openadsdk.jc.dj.ycx(tnVar.wwx()).ycx(i5).zb(i5).lud(dc.lt(com.bytedance.sdk.openadsdk.core.pmi.ycx())).dj(dc.dj(com.bytedance.sdk.openadsdk.core.pmi.ycx())).sya(1).ycx(com.bytedance.sdk.openadsdk.jc.sya.ycx(tnVar, tnVar.wwx(), imageView));
            if (imageView != null) {
                imageView.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.htf.zb.5
                    @Override // android.view.View.OnClickListener
                    public void onClick(View view) {
                        if (imageView.getDrawable() != null) {
                            Intent intent = new Intent();
                            String strTn = tnVar.tn();
                            intent.setAction("android.intent.action.VIEW");
                            intent.setData(Uri.parse(strTn));
                            try {
                                com.bytedance.sdk.component.utils.zb.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx(), intent, null);
                            } catch (Exception e3) {
                                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4IUtA==", "b9oDkBefZc6FRMMZ2Q==", "VOAOmQq/Yg==", 341);
                            }
                        }
                    }
                });
            }
        }
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.model.pmi pmiVar, ImageView imageView, tn tnVar) {
        if (pmiVar == null || TextUtils.isEmpty(pmiVar.ycx()) || imageView == null) {
            return;
        }
        com.bytedance.sdk.openadsdk.jc.dj.ycx(pmiVar).sya(1).ycx(com.bytedance.sdk.openadsdk.jc.sya.ycx(tnVar, pmiVar.ycx(), imageView));
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.model.pmi pmiVar, ImageView imageView, tn tnVar, dy dyVar) {
        if (pmiVar == null || TextUtils.isEmpty(pmiVar.ycx()) || imageView == null) {
            return;
        }
        com.bytedance.sdk.openadsdk.jc.dj.ycx(pmiVar).sya(1).ycx(com.bytedance.sdk.openadsdk.jc.sya.ycx(tnVar, pmiVar.ycx(), imageView, dyVar));
    }

    public void ycx(String str, View view) {
        if (view == null || TextUtils.isEmpty(str)) {
            return;
        }
        final WeakReference weakReference = new WeakReference(view);
        com.bytedance.sdk.openadsdk.jc.dj.ycx(str).sya(2).ycx(new com.bytedance.sdk.component.lud.fby() { // from class: com.bytedance.sdk.openadsdk.htf.zb.7
            @Override // com.bytedance.sdk.component.lud.fby
            public Bitmap ycx(Bitmap bitmap) {
                View view2 = (View) weakReference.get();
                if (view2 == null) {
                    return null;
                }
                return com.bytedance.sdk.component.adexpress.dj.ycx.ycx(view2.getContext(), bitmap, 10);
            }
        }).ycx(new dy() { // from class: com.bytedance.sdk.openadsdk.htf.zb.6
            @Override // com.bytedance.sdk.component.lud.dy
            public void ycx(int i5, String str2, Throwable th2) {
            }

            @Override // com.bytedance.sdk.component.lud.dy
            public void ycx(com.bytedance.sdk.component.lud.ea eaVar) {
                final View view2;
                if (eaVar == null) {
                    return;
                }
                final Object objZb = eaVar.zb();
                if (!(objZb instanceof Bitmap) || (view2 = (View) weakReference.get()) == null) {
                    return;
                }
                if (!yzp.lt()) {
                    view2.post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.htf.zb.6.1
                        @Override // java.lang.Runnable
                        public void run() {
                            View view3 = view2;
                            if (view3 instanceof ImageView) {
                                ((ImageView) view3).setImageDrawable(new BitmapDrawable(view2.getResources(), (Bitmap) objZb));
                            } else {
                                view3.setBackground(new BitmapDrawable(view2.getResources(), (Bitmap) objZb));
                            }
                        }
                    });
                } else if (view2 instanceof ImageView) {
                    ((ImageView) view2).setImageDrawable(new BitmapDrawable(view2.getResources(), (Bitmap) objZb));
                } else {
                    view2.setBackground(new BitmapDrawable(view2.getResources(), (Bitmap) objZb));
                }
            }
        });
    }
}
