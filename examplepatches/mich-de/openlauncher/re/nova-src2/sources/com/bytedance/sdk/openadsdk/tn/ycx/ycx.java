package com.bytedance.sdk.openadsdk.tn.ycx;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.api.reward.BackupConstant;
import com.bytedance.sdk.openadsdk.dv.lud;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.bytedance.sdk.openadsdk.tn.dy;
import com.bytedance.sdk.openadsdk.tn.fby;
import com.bytedance.sdk.openadsdk.tn.lt;
import com.bytedance.sdk.openadsdk.tn.zb;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Hashtable;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx {
    private static Boolean ycx;

    /* JADX INFO: Access modifiers changed from: private */
    public static Bitmap sya(String str) {
        int color;
        int color2;
        try {
            Hashtable hashtable = new Hashtable();
            hashtable.put(lt.CHARACTER_SET, "UTF-8");
            hashtable.put(lt.ERROR_CORRECTION, fby.L);
            hashtable.put(lt.MARGIN, 1);
            int iYcx = ((ycx(str.getBytes("UTF-8").length) - 1) * 4) + 22;
            int i5 = iYcx > 60 ? 60 : iYcx;
            zb zbVarYcx = new dy().ycx(str, i5, i5, hashtable);
            int[] iArr = new int[i5 * i5];
            JSONObject jSONObject = (JSONObject) lud.ycx("water_mark_config", (Object) null, com.bytedance.sdk.openadsdk.dv.zb.ycx);
            if (jSONObject != null) {
                color = Color.parseColor(jSONObject.optString("fg_color", "#FF000000"));
                color2 = Color.parseColor(jSONObject.optString("bg_color", "#FFFFFFFF"));
            } else {
                color = -16777216;
                color2 = -1;
            }
            for (int i11 = 0; i11 < i5; i11++) {
                for (int i12 = 0; i12 < i5; i12++) {
                    iArr[(i11 * i5) + i12] = zbVarYcx.ycx(i12, i11) ? color : color2;
                }
            }
            Bitmap bitmapCreateBitmap = Bitmap.createBitmap(i5, i5, Bitmap.Config.ARGB_8888);
            bitmapCreateBitmap.setPixels(iArr, 0, i5, 0, 0, i5, i5);
            return bitmapCreateBitmap;
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE50Doydf62OAF7Vl1A==", "atwOmge5TsKOT8VcmBSVPFLiPg==", "XOsjkBG9fcKxePRSiBQ=", Sdk.SDKError.Reason.OMSDK_JS_WRITE_FAILED_VALUE);
            htf.sya("QRCodeGenerateUtils", "generateQRCode error: " + th2.getMessage());
            return null;
        }
    }

    public static void ycx(final Context context, final View view, final String str) {
        if (!ycx() || view == null || TextUtils.isEmpty(str)) {
            return;
        }
        yzp.sya((Runnable) new com.bytedance.sdk.component.fby.zb.sya("add_qr_code") { // from class: com.bytedance.sdk.openadsdk.tn.ycx.ycx.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    final Bitmap bitmapSya = ycx.sya(str);
                    if (bitmapSya == null) {
                        return;
                    }
                    JSONObject jSONObject = (JSONObject) lud.ycx("water_mark_config", (Object) null, com.bytedance.sdk.openadsdk.dv.zb.ycx);
                    final float fOptDouble = jSONObject == null ? 0.5f : (float) jSONObject.optDouble("alpha", 0.5d);
                    view.post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.tn.ycx.ycx.1.1
                        @Override // java.lang.Runnable
                        public void run() {
                            ImageView imageView = new ImageView(context);
                            imageView.setImageBitmap(bitmapSya);
                            imageView.setAlpha(fOptDouble);
                            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2);
                            layoutParams.gravity = 85;
                            layoutParams.setMargins(0, 0, 2, 2);
                            View view2 = view;
                            if (view2 instanceof ViewGroup) {
                                ((ViewGroup) view2).addView(imageView, layoutParams);
                            }
                        }
                    });
                } catch (Throwable th2) {
                    sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE50Doydf62OAF7Vl1A==", "atwOmge5TsKOT8VcmBSVPFLiPtFS", "Sfsj", 87);
                    htf.sya("QRCodeGenerateUtils", "addQRCode error: " + th2.getMessage());
                }
            }
        });
    }

    public static int zb() {
        JSONObject jSONObject = (JSONObject) lud.ycx("water_mark_config", (Object) null, com.bytedance.sdk.openadsdk.dv.zb.ycx);
        if (jSONObject == null) {
            return 10;
        }
        return jSONObject.optInt("upload_count", 10);
    }

    private static int ycx(int i5) {
        int[] iArr = {17, 32, 53, 78, 106, Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE, 154, 192, 230, 271, Sdk.SDKError.Reason.BLACK_SCREEN_DETECTION_ERROR_VALUE, 367, 425, 458, 520, 586, 644, 718, 792, 858, 929, BackupConstant.SCENE_CLOSED_WITHOUT_SHOW, 1091, 1171, 1273, 1367, 1465, 1528, 1628, 1732, 1840, 1952, 2068, 2188, 2303, 2431, 2563, 2699, 2809, 2953};
        for (int i11 = 0; i11 < 40; i11++) {
            if (iArr[i11] >= i5) {
                return i11 + 1;
            }
        }
        return 40;
    }

    public static String ycx(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            return com.bytedance.sdk.openadsdk.xkz.ycx.ycx.ycx.ycx(str, b.f42142b);
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE50Doydf62OAF7Vl1A==", "atwOmge5TsKOT8VcmBSVPFLiPg==", "XOs5sA2/e96QXuVYnQSlO0/HKQ==", 164);
            htf.sya("QRCodeGenerateUtils", "getEncryptRequestId error: " + th2.getMessage());
            return null;
        }
    }

    public static boolean ycx() {
        if (ycx == null) {
            JSONObject jSONObject = (JSONObject) lud.ycx("water_mark_config", (Object) null, com.bytedance.sdk.openadsdk.dv.zb.ycx);
            if (jSONObject == null) {
                return false;
            }
            ycx = Boolean.valueOf(jSONObject.optInt("enable", 0) == 1);
        }
        return ycx.booleanValue();
    }
}
