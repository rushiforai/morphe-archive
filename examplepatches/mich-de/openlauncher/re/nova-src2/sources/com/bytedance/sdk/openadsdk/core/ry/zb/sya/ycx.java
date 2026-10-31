package com.bytedance.sdk.openadsdk.core.ry.zb.sya;

import android.animation.AnimatorListenerAdapter;
import android.content.Context;
import android.graphics.Bitmap;
import android.text.TextUtils;
import android.widget.ImageView;
import com.bytedance.adsdk.ugeno.fby.fby;
import com.bytedance.adsdk.ugeno.lt;
import com.bytedance.adsdk.ugeno.zb;
import com.bytedance.adsdk.ugeno.zb.sya;
import com.bytedance.adsdk.zb.dj;
import com.bytedance.adsdk.zb.jc;
import com.bytedance.sdk.openadsdk.core.ry.lud;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.HashMap;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class ycx extends sya<zb> {

    /* renamed from: ci, reason: collision with root package name */
    private boolean f26039ci;
    private boolean liq;

    /* renamed from: nc, reason: collision with root package name */
    protected ImageView.ScaleType f26040nc;

    /* renamed from: pg, reason: collision with root package name */
    private boolean f26041pg;

    /* renamed from: qt, reason: collision with root package name */
    protected HashMap<String, Bitmap> f26042qt;

    /* renamed from: sp, reason: collision with root package name */
    private int f26043sp;

    /* renamed from: te, reason: collision with root package name */
    protected ImageView.ScaleType f26044te;
    private boolean tpg;
    private String vbt;
    private float vy;
    protected String ycx;

    /* renamed from: yw, reason: collision with root package name */
    private float f26045yw;

    /* renamed from: com.bytedance.sdk.openadsdk.core.ry.zb.sya.ycx$1, reason: invalid class name */
    public class AnonymousClass1 implements dj {
        public AnonymousClass1() {
        }

        @Override // com.bytedance.adsdk.zb.dj
        public Bitmap ycx(final jc jcVar) {
            final String strYcx;
            if (jcVar == null) {
                return null;
            }
            String strJc = jcVar.jc();
            String strJw = jcVar.jw();
            if (!TextUtils.isEmpty(strJc) && TextUtils.isEmpty(strJw)) {
                strYcx = com.bytedance.adsdk.ugeno.dj.zb.ycx(strJc, ((sya) ycx.this).f22655dj);
            } else if (!TextUtils.isEmpty(strJw) && TextUtils.isEmpty(strJc)) {
                strYcx = com.bytedance.adsdk.ugeno.dj.zb.ycx(strJw, ((sya) ycx.this).f22655dj);
            } else if (TextUtils.isEmpty(strJw) || TextUtils.isEmpty(strJc)) {
                strYcx = null;
            } else {
                strYcx = com.bytedance.adsdk.ugeno.dj.zb.ycx(strJc, ((sya) ycx.this).f22655dj) + com.bytedance.adsdk.ugeno.dj.zb.ycx(strJw, ((sya) ycx.this).f22655dj);
            }
            if (TextUtils.isEmpty(strYcx)) {
                return null;
            }
            Bitmap bitmap = ycx.this.f26042qt.get(strYcx);
            if (bitmap != null) {
                return bitmap;
            }
            lt.ycx().zb().ycx(((sya) ycx.this).f22665jw, strYcx, new zb.ycx() { // from class: com.bytedance.sdk.openadsdk.core.ry.zb.sya.ycx.1.1
                @Override // com.bytedance.adsdk.ugeno.zb.ycx
                public void ycx(Bitmap bitmap2) {
                    if (bitmap2 != null) {
                        final Bitmap bitmapCreateScaledBitmap = Bitmap.createScaledBitmap(bitmap2, jcVar.ycx(), jcVar.zb(), false);
                        ycx.this.f26042qt.put(strYcx, bitmapCreateScaledBitmap);
                        fby.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.ry.zb.sya.ycx.1.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                ((zb) ((sya) ycx.this).lud).ycx(jcVar.fby(), bitmapCreateScaledBitmap);
                            }
                        });
                    }
                }
            });
            return ycx.this.f26042qt.get(strYcx);
        }
    }

    public ycx(Context context) {
        super(context);
        this.vbt = "images";
        this.liq = true;
        this.f26045yw = 1.0f;
        this.f26044te = ImageView.ScaleType.FIT_CENTER;
        this.f26040nc = ImageView.ScaleType.FIT_XY;
        this.f26042qt = new HashMap<>();
    }

    private String ry(String str) {
        return (!TextUtils.isEmpty(str) && str.contains("local")) ? str.contains("shake_phone") ? "lottie_json/shake_phone.json" : str.contains("swipe_right") ? "lottie_json/swipe_right.json" : b.f42142b : b.f42142b;
    }

    private ImageView.ScaleType syc(String str) {
        ImageView.ScaleType scaleType;
        scaleType = ImageView.ScaleType.FIT_XY;
        str.getClass();
        switch (str) {
            case "center":
            case "none":
                return ImageView.ScaleType.CENTER;
            case "fit":
                return ImageView.ScaleType.FIT_CENTER;
            case "crop":
                return ImageView.ScaleType.CENTER_CROP;
            default:
                return scaleType;
        }
    }

    private ImageView.ScaleType xkz(String str) {
        ImageView.ScaleType scaleType;
        scaleType = ImageView.ScaleType.FIT_XY;
        str.getClass();
        switch (str) {
            case "center":
                return ImageView.ScaleType.CENTER;
            case "fitEnd":
                return ImageView.ScaleType.FIT_END;
            case "fitStart":
                return ImageView.ScaleType.FIT_START;
            case "centerInside":
                return ImageView.ScaleType.CENTER_INSIDE;
            case "fitCenter":
                return ImageView.ScaleType.FIT_CENTER;
            case "centerCrop":
                return ImageView.ScaleType.CENTER_CROP;
            default:
                return scaleType;
        }
    }

    public void dj() {
        T t6 = this.lud;
        if (t6 != 0) {
            ((zb) t6).ycx();
        }
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    /* renamed from: sya, reason: merged with bridge method [inline-methods] */
    public zb ycx() {
        zb zbVar = new zb(this.f22701zb);
        zbVar.ycx(this);
        return zbVar;
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void zb() throws JSONException {
        super.zb();
        ((zb) this.lud).setProgress(this.vy);
        if (this.f26045yw <= 0.0f) {
            this.f26045yw = 1.0f;
        }
        ((zb) this.lud).setSpeed(this.f26045yw);
        if (this.ycx.startsWith("local")) {
            ((zb) this.lud).setAnimation(ry(this.ycx));
            ((zb) this.lud).setImageAssetsFolder(this.vbt);
        } else {
            ((zb) this.lud).setAnimationFromUrl(this.ycx);
        }
        ((zb) this.lud).setImageAssetDelegate(new AnonymousClass1());
        if (aeu()) {
            ((zb) this.lud).setScaleType(this.f26040nc);
        } else {
            ((zb) this.lud).setScaleType(this.f26044te);
        }
        if (aeu()) {
            ((zb) this.lud).setRepeatCount(this.f26043sp);
        } else {
            ((zb) this.lud).ycx(this.f26039ci);
        }
        if (!aeu()) {
            T t6 = this.lud;
            if (t6 != 0) {
                ((zb) t6).ycx();
                return;
            }
            return;
        }
        T t9 = this.lud;
        if (t9 == 0 || !this.liq) {
            return;
        }
        ((zb) t9).ycx();
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void ycx(String str, String str2) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        super.ycx(str, str2);
        str.getClass();
        switch (str) {
            case "scaleMode":
                this.f26040nc = syc(str2);
                break;
            case "scaleType":
                this.f26044te = xkz(str2);
                break;
            case "progress":
                this.vy = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f);
                break;
            case "imagePath":
                this.vbt = str2;
                break;
            case "autoReverse":
                this.f26041pg = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, false);
                break;
            case "src":
                this.ycx = lud.ycx(str2);
                break;
            case "loop":
                if (aeu()) {
                    this.f26043sp = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0);
                    break;
                } else {
                    this.f26039ci = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, false);
                    break;
                }
            case "speed":
                this.f26045yw = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 1.0f);
                break;
            case "autoPlay":
                this.tpg = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, false);
                break;
            case "autoplay":
                this.liq = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, true);
                break;
        }
    }

    public void ycx(AnimatorListenerAdapter animatorListenerAdapter) {
        ((zb) this.lud).ycx(animatorListenerAdapter);
    }
}
