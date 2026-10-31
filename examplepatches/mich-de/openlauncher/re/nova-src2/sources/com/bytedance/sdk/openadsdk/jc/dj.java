package com.bytedance.sdk.openadsdk.jc;

import android.content.Context;
import com.bytedance.sdk.component.lud.htf;
import com.bytedance.sdk.component.lud.syc;
import com.bytedance.sdk.component.lud.thx;
import com.bytedance.sdk.component.lud.zb.sya.lud;
import com.bytedance.sdk.component.utils.jc;
import com.bytedance.sdk.component.zb.ycx.ea;
import com.bytedance.sdk.component.zb.ycx.lt;
import com.bytedance.sdk.component.zb.ycx.ok;
import com.bytedance.sdk.component.zb.ycx.xkz;
import com.bytedance.sdk.openadsdk.CacheDirFactory;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.ifb;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;

/* loaded from: classes2.dex */
public class dj {

    public static final class ycx {

        /* renamed from: zb, reason: collision with root package name */
        private static final syc f26852zb = ycx(pmi.ycx());
        private static int sya = 10;

        /* renamed from: dj, reason: collision with root package name */
        private static int f26851dj = 15;
        private static int lud = 30;
        public static boolean ycx = false;

        /* renamed from: com.bytedance.sdk.openadsdk.jc.dj$ycx$ycx, reason: collision with other inner class name */
        public static class C0104ycx implements com.bytedance.sdk.component.lud.dj {
            private C0104ycx() {
            }

            @Override // com.bytedance.sdk.component.lud.dj
            /* renamed from: zb, reason: merged with bridge method [inline-methods] */
            public com.bytedance.sdk.component.lud.ycx.sya ycx(com.bytedance.sdk.component.lud.lud ludVar) throws IOException {
                ea eaVarFby = com.bytedance.sdk.openadsdk.htf.zb.zb().sya().fby();
                ok okVarZb = new ok.ycx().zb(ludVar.ycx()).ycx().zb();
                com.bytedance.sdk.component.lud.ycx.dj djVar = ludVar.sya() ? new com.bytedance.sdk.component.lud.ycx.dj() : null;
                if (djVar != null) {
                    djVar.ycx(System.currentTimeMillis());
                }
                try {
                    xkz xkzVarZb = eaVarFby.ycx(okVarZb).zb();
                    if (djVar != null) {
                        djVar.zb(System.currentTimeMillis());
                    }
                    Map<String, String> mapYcx = ycx(ludVar, xkzVarZb);
                    com.bytedance.sdk.component.zb.ycx.syc sycVarLt = xkzVarZb.lt();
                    if (sycVarLt == null) {
                        com.bytedance.sdk.component.lud.ycx.sya syaVarYcx = ycx(djVar, new RuntimeException("net response body is null"));
                        jc.ycx(xkzVarZb);
                        return syaVarYcx;
                    }
                    com.bytedance.sdk.component.lud.ycx.sya syaVar = new com.bytedance.sdk.component.lud.ycx.sya(xkzVarZb.sya(), sycVarLt.dj(), b.f42142b, mapYcx);
                    jc.ycx(xkzVarZb);
                    return syaVar;
                } catch (Throwable th2) {
                    try {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4Ucpw==", "cuMskgaQZsaET8VqnhCwOF78abwOvW7CrEXWWYkDlzpa/j2QEZRmy4RPxRmlHKEvXsY5gROfZc6FRMM=", "WO8hmQ==", TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173);
                        return ycx(djVar, th2);
                    } finally {
                        jc.ycx(null);
                    }
                }
            }

            private Map<String, String> ycx(com.bytedance.sdk.component.lud.lud ludVar, xkz xkzVar) {
                if (!ludVar.zb()) {
                    return null;
                }
                lt ltVarUl = xkzVar.ul();
                HashMap map = new HashMap();
                int iYcx = ltVarUl.ycx();
                for (int i5 = 0; i5 < iYcx; i5++) {
                    String strYcx = ltVarUl.ycx(i5);
                    String strZb = ltVarUl.zb(i5);
                    if (strYcx != null) {
                        map.put(strYcx, strZb);
                    }
                }
                return map;
            }

            private com.bytedance.sdk.component.lud.ycx.sya ycx(com.bytedance.sdk.component.lud.ycx.dj djVar, Throwable th2) {
                th2.getMessage();
                if (djVar != null) {
                    djVar.sya(System.currentTimeMillis());
                }
                com.bytedance.sdk.component.lud.ycx.sya syaVar = new com.bytedance.sdk.component.lud.ycx.sya(98765, th2, "net failed");
                syaVar.ycx(djVar);
                return syaVar;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static com.bytedance.sdk.component.lud.jc zb(String str) {
            return ycx(f26852zb.ycx(str).lud(dc.lt(pmi.ycx())).dj(dc.dj(pmi.ycx())));
        }

        public static void ycx() {
            sya = com.bytedance.sdk.openadsdk.dv.lud.ycx("image_config", "bitmap_cache_count", 10);
            f26851dj = com.bytedance.sdk.openadsdk.dv.lud.ycx("image_config", "data_cache_count", 15);
            lud = com.bytedance.sdk.openadsdk.dv.lud.ycx("image_config", "disk_cache_count", 30);
            ycx = com.bytedance.sdk.openadsdk.dv.lud.ycx("img_need_scale", 0) == 1;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static com.bytedance.sdk.component.lud.jc zb(com.bytedance.sdk.openadsdk.core.model.pmi pmiVar) {
            return ycx(f26852zb.ycx(pmiVar.ycx()).ycx(pmiVar.zb()).zb(pmiVar.sya()).lud(dc.lt(pmi.ycx())).dj(dc.dj(pmi.ycx())).ycx(pmiVar.ul()));
        }

        private static syc ycx(Context context) {
            ycx();
            return com.bytedance.sdk.component.lud.zb.sya.zb.ycx(context, new lud.ycx().ycx(new com.bytedance.sdk.component.lud.zb.sya.ycx.zb(0, sya, f26851dj, lud, new File(CacheDirFactory.getImageCacheDir("image_p")))).ycx(ycx).ycx(new htf() { // from class: com.bytedance.sdk.openadsdk.jc.dj.ycx.2
                @Override // com.bytedance.sdk.component.lud.htf
                public ExecutorService ycx() {
                    return yzp.zb();
                }

                @Override // com.bytedance.sdk.component.lud.htf
                public ExecutorService zb() {
                    return yzp.sya();
                }
            }).ycx(new thx() { // from class: com.bytedance.sdk.openadsdk.jc.dj.ycx.1
                @Override // com.bytedance.sdk.component.lud.thx
                public void ycx(int i5, String str) {
                    com.bytedance.sdk.openadsdk.dy.dj.ycx(str, true);
                }
            }).ycx(new C0104ycx()).ycx());
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static InputStream zb(String str, String str2) {
            return f26852zb.ycx(str, str2);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static boolean zb(String str, String str2, String str3) {
            return f26852zb.ycx(str, str2, str3);
        }

        private static com.bytedance.sdk.component.lud.jc ycx(com.bytedance.sdk.component.lud.jc jcVar) {
            return ifb.ycx() ? jcVar.ycx(new lud()) : jcVar;
        }
    }

    public static com.bytedance.sdk.component.lud.jc ycx(String str) {
        return ycx.zb(str);
    }

    public static boolean zb() {
        return ycx.ycx;
    }

    public static com.bytedance.sdk.component.lud.jc ycx(com.bytedance.sdk.openadsdk.core.model.pmi pmiVar) {
        return ycx.zb(pmiVar);
    }

    public static InputStream ycx(String str, String str2) {
        return ycx.zb(str, str2);
    }

    public static boolean ycx(String str, String str2, String str3) {
        return ycx.zb(str, str2, str3);
    }

    public static syc ycx() {
        return ycx.f26852zb;
    }
}
