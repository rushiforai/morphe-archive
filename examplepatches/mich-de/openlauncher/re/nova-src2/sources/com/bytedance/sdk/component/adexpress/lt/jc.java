package com.bytedance.sdk.component.adexpress.lt;

import android.content.Context;
import android.graphics.Bitmap;
import android.text.TextUtils;
import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes2.dex */
public class jc extends com.bytedance.adsdk.zb.lt {
    private Map<String, Bitmap> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private String f23557zb;

    public static class ycx implements com.bytedance.sdk.component.lud.dy {

        /* renamed from: dj, reason: collision with root package name */
        private final Map<String, Bitmap> f23559dj;
        private final String sya;
        private final WeakReference<jc> ycx;

        /* renamed from: zb, reason: collision with root package name */
        private final com.bytedance.adsdk.zb.jc f23560zb;

        public ycx(jc jcVar, com.bytedance.adsdk.zb.jc jcVar2, String str, Map<String, Bitmap> map) {
            this.ycx = new WeakReference<>(jcVar);
            this.f23560zb = jcVar2;
            this.sya = str;
            this.f23559dj = map;
        }

        @Override // com.bytedance.sdk.component.lud.dy
        public void ycx(int i5, String str, Throwable th2) {
        }

        @Override // com.bytedance.sdk.component.lud.dy
        public void ycx(com.bytedance.sdk.component.lud.ea eaVar) {
            Object objZb = eaVar.zb();
            if (objZb instanceof Bitmap) {
                Bitmap bitmapCreateScaledBitmap = Bitmap.createScaledBitmap((Bitmap) objZb, this.f23560zb.ycx(), this.f23560zb.zb(), false);
                this.f23559dj.put(this.sya, bitmapCreateScaledBitmap);
                jc jcVar = this.ycx.get();
                if (jcVar != null) {
                    jcVar.ycx(this.f23560zb.fby(), bitmapCreateScaledBitmap);
                }
            }
        }
    }

    public jc(Context context) {
        super(context);
        this.ycx = new HashMap();
    }

    public void fby() {
        if (TextUtils.isEmpty(this.f23557zb)) {
            return;
        }
        setProgress(0.0f);
        ycx(true);
        setAnimationFromUrl(this.f23557zb);
        setImageAssetDelegate(new com.bytedance.adsdk.zb.dj() { // from class: com.bytedance.sdk.component.adexpress.lt.jc.1
            @Override // com.bytedance.adsdk.zb.dj
            public Bitmap ycx(final com.bytedance.adsdk.zb.jc jcVar) {
                final String strFby = jcVar.fby();
                String strJc = jcVar.jc();
                String strJw = jcVar.jw();
                if (TextUtils.equals(strFby, "image_0") && TextUtils.equals(strJw, "Lark20201123-180048_2.png")) {
                    strJw = "hand.png";
                }
                Bitmap bitmap = (Bitmap) jc.this.ycx.get(strFby);
                if (bitmap != null) {
                    return bitmap;
                }
                if (TextUtils.isEmpty(strJc) || !TextUtils.isEmpty(strJw)) {
                    strJc = (TextUtils.isEmpty(strJw) || !TextUtils.isEmpty(strJc)) ? (TextUtils.isEmpty(strJw) || TextUtils.isEmpty(strJc)) ? b.f42142b : c0.E(strJc, strJw) : strJw;
                }
                if (TextUtils.isEmpty(strJc)) {
                    return null;
                }
                com.bytedance.sdk.component.lud.jc jcVarYcx = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().lud().ycx(strJc).sya(2).ycx(new com.bytedance.sdk.component.lud.fby() { // from class: com.bytedance.sdk.component.adexpress.lt.jc.1.1
                    @Override // com.bytedance.sdk.component.lud.fby
                    public Bitmap ycx(Bitmap bitmap2) {
                        Bitmap bitmapCreateScaledBitmap = Bitmap.createScaledBitmap(bitmap2, jcVar.ycx(), jcVar.zb(), false);
                        jc.this.ycx.put(strFby, bitmapCreateScaledBitmap);
                        return bitmapCreateScaledBitmap;
                    }
                });
                jc jcVar2 = jc.this;
                jcVarYcx.ycx(new ycx(jcVar2, jcVar, strFby, jcVar2.ycx));
                return (Bitmap) jc.this.ycx.get(strFby);
            }
        });
        ycx();
    }

    public void setAnimationsLoop(boolean z11) {
    }

    public void setData(Map<String, String> map) {
    }

    public void setImageLottieTosPath(String str) {
        this.f23557zb = str;
    }

    public void setLottieAdDescMaxLength(int i5) {
    }

    public void setLottieAdTitleMaxLength(int i5) {
    }

    public void setLottieAppNameMaxLength(int i5) {
    }
}
