package com.bytedance.sdk.openadsdk.core;

import android.os.Build;
import com.bytedance.sdk.component.embedapplog.PangleEncryptConstant;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class hf {

    /* renamed from: dj, reason: collision with root package name */
    private static final AtomicInteger f25372dj;
    private static final AtomicInteger sya;
    private static final AtomicInteger ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static final AtomicInteger f25373zb;

    static {
        AtomicInteger atomicInteger = new AtomicInteger();
        ycx = atomicInteger;
        AtomicInteger atomicInteger2 = new AtomicInteger();
        f25373zb = atomicInteger2;
        AtomicInteger atomicInteger3 = new AtomicInteger();
        sya = atomicInteger3;
        AtomicInteger atomicInteger4 = new AtomicInteger();
        f25372dj = atomicInteger4;
        atomicInteger.addAndGet(com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("encrypt_statistics_file", "encrypt_success_count", 0));
        atomicInteger2.addAndGet(com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("encrypt_statistics_file", "encrypt_fail_count", 0));
        atomicInteger3.addAndGet(com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("encrypt_statistics_file", "decrypt_success_count", 0));
        atomicInteger4.addAndGet(com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("encrypt_statistics_file", "decrypt_fail_count", 0));
    }

    public static void ycx() {
        try {
            long jYcx = com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("encrypt_statistics_file", "upload_time_key", 0L);
            if (jYcx <= 0 || System.currentTimeMillis() - jYcx < 86400000) {
                if (jYcx > 0 && jYcx <= System.currentTimeMillis()) {
                    return;
                }
                com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("encrypt_statistics_file", "upload_time_key", Long.valueOf(System.currentTimeMillis()));
                return;
            }
            zb();
            synchronized (hf.class) {
                ycx.set(0);
                f25373zb.set(0);
                sya.set(0);
                f25372dj.set(0);
                com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("encrypt_statistics_file");
                com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("encrypt_statistics_file", "upload_time_key", Long.valueOf(System.currentTimeMillis()));
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "a+khsA2/e96QXuRJjQWpO0/nLoYruWXXhVg=", "Ses9mhGo", 63);
        }
    }

    private static void zb() {
        final int i5 = ycx.get();
        final int i11 = f25373zb.get();
        final int i12 = sya.get();
        final int i13 = f25372dj.get();
        com.bytedance.sdk.openadsdk.dy.dj.ycx("crypt_v4_statistics", false, new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.core.hf.1
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("encrypt_success_count", i5);
                    jSONObject.put("encrypt_fail_count", i11);
                    jSONObject.put("decrypt_success_count", i12);
                    jSONObject.put("decrypt_fail_count", i13);
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "a+khsA2/e96QXuRJjQWpO0/nLoYruWXXhViTDA==", "XOs5uQy7WtOBXsQ=", 84);
                }
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("crypt_v4_statistics").zb(jSONObject.toString());
            }
        });
    }

    public static synchronized void zb(boolean z11) {
        if (z11) {
            com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("encrypt_statistics_file", "encrypt_success_count", Integer.valueOf(ycx.incrementAndGet()));
        } else {
            com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("encrypt_statistics_file", "encrypt_fail_count", Integer.valueOf(f25373zb.incrementAndGet()));
        }
    }

    public static void ycx(final int i5, final PangleEncryptConstant.CryptDataScene cryptDataScene, final int i11) {
        com.bytedance.sdk.openadsdk.dy.dj.ycx("crypt_v4_fail", false, new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.core.hf.2
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("crypt", i5);
                    jSONObject.put("scene", cryptDataScene.value());
                    jSONObject.put("reason", i11);
                    if (i11 == 6) {
                        jSONObject.put("model", Build.MODEL);
                        jSONObject.put("vendor", Build.MANUFACTURER);
                    }
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "a+khsA2/e96QXuRJjQWpO0/nLoYruWXXhViTDw==", "XOs5uQy7WtOBXsQ=", 108);
                }
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("crypt_v4_fail").zb(jSONObject.toString());
            }
        });
    }

    public static synchronized void ycx(boolean z11) {
        if (z11) {
            com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("encrypt_statistics_file", "decrypt_success_count", Integer.valueOf(sya.incrementAndGet()));
        } else {
            com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("encrypt_statistics_file", "decrypt_fail_count", Integer.valueOf(sya.incrementAndGet()));
        }
    }

    public static void ycx(JSONObject jSONObject) {
        zb(jSONObject != null && jSONObject.optInt("cypher") == 4);
    }
}
