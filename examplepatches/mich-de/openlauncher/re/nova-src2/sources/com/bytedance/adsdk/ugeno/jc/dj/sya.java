package com.bytedance.adsdk.ugeno.jc.dj;

import a5.k;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.TextUtils;
import android.view.View;
import android.widget.ImageView;
import com.bytedance.adsdk.ugeno.core.ea;
import com.bytedance.adsdk.ugeno.fby.dj;
import com.bytedance.adsdk.ugeno.fby.fby;
import com.bytedance.adsdk.ugeno.lt;
import com.bytedance.adsdk.ugeno.zb;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class sya extends com.bytedance.adsdk.ugeno.zb.sya<ycx> {

    /* renamed from: ci, reason: collision with root package name */
    private float f22287ci;

    /* renamed from: nc, reason: collision with root package name */
    protected String f22288nc;

    /* renamed from: pg, reason: collision with root package name */
    private float f22289pg;

    /* renamed from: qt, reason: collision with root package name */
    protected ImageView.ScaleType f22290qt;

    /* renamed from: sp, reason: collision with root package name */
    private int f22291sp;

    /* renamed from: te, reason: collision with root package name */
    protected boolean f22292te;
    private float tpg;
    private int vbt;
    protected String ycx;

    public sya(Context context) {
        super(context);
        this.f22290qt = ImageView.ScaleType.FIT_XY;
        this.vbt = -1;
        this.f22289pg = -1.0f;
        this.f22287ci = -1.0f;
        this.f22291sp = 0;
        this.tpg = 50.0f;
    }

    private void jc() {
        if (this.f22289pg > 0.0f) {
            lt.ycx().zb().ycx(this.f22665jw, this.ycx, new zb.ycx() { // from class: com.bytedance.adsdk.ugeno.jc.dj.sya.1
                @Override // com.bytedance.adsdk.ugeno.zb.ycx
                public void ycx(Bitmap bitmap) {
                    if (bitmap == null) {
                        if (((com.bytedance.adsdk.ugeno.zb.sya) sya.this).vyl != null) {
                            com.bytedance.adsdk.ugeno.core.lt unused = ((com.bytedance.adsdk.ugeno.zb.sya) sya.this).vyl;
                            return;
                        }
                        return;
                    }
                    if (((com.bytedance.adsdk.ugeno.zb.sya) sya.this).vyl != null) {
                        com.bytedance.adsdk.ugeno.core.lt unused2 = ((com.bytedance.adsdk.ugeno.zb.sya) sya.this).vyl;
                    }
                    final Bitmap bitmapYcx = fby.ycx(((com.bytedance.adsdk.ugeno.zb.sya) sya.this).f22701zb, bitmap, (int) sya.this.f22289pg);
                    if (bitmapYcx != null) {
                        fby.ycx(new Runnable() { // from class: com.bytedance.adsdk.ugeno.jc.dj.sya.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                ((ycx) ((com.bytedance.adsdk.ugeno.zb.sya) sya.this).lud).setImageBitmap(bitmapYcx);
                            }
                        });
                    }
                    sya syaVar = sya.this;
                    if (syaVar.f22292te || syaVar.f22287ci > 0.0f) {
                        Bitmap bitmapYcx2 = fby.ycx(((com.bytedance.adsdk.ugeno.zb.sya) sya.this).f22701zb, bitmap, sya.this.f22287ci > 0.0f ? (int) sya.this.f22287ci : 10);
                        if (bitmapYcx2 != null) {
                            final BitmapDrawable bitmapDrawable = new BitmapDrawable(((com.bytedance.adsdk.ugeno.zb.sya) sya.this).f22701zb.getResources(), bitmapYcx2);
                            fby.ycx(new Runnable() { // from class: com.bytedance.adsdk.ugeno.jc.dj.sya.1.2
                                @Override // java.lang.Runnable
                                public void run() {
                                    ((ycx) ((com.bytedance.adsdk.ugeno.zb.sya) sya.this).lud).setBackground(bitmapDrawable);
                                }
                            });
                        }
                    }
                }
            });
            return;
        }
        com.bytedance.adsdk.ugeno.zb zbVarZb = lt.ycx().zb();
        ea eaVar = this.f22665jw;
        String str = this.ycx;
        T t6 = this.lud;
        zbVarZb.ycx(eaVar, str, (ImageView) t6, ((ycx) t6).getWidth(), ((ycx) this.lud).getHeight(), new zb.ycx() { // from class: com.bytedance.adsdk.ugeno.jc.dj.sya.2
            @Override // com.bytedance.adsdk.ugeno.zb.ycx
            public void ycx(Bitmap bitmap) {
                if (bitmap == null) {
                    if (((com.bytedance.adsdk.ugeno.zb.sya) sya.this).vyl != null) {
                        com.bytedance.adsdk.ugeno.core.lt unused = ((com.bytedance.adsdk.ugeno.zb.sya) sya.this).vyl;
                    }
                } else if (((com.bytedance.adsdk.ugeno.zb.sya) sya.this).vyl != null) {
                    com.bytedance.adsdk.ugeno.core.lt unused2 = ((com.bytedance.adsdk.ugeno.zb.sya) sya.this).vyl;
                }
            }
        });
        if (this.f22292te || this.f22287ci > 0.0f) {
            lt.ycx().zb().ycx(this.f22665jw, this.ycx, new zb.ycx() { // from class: com.bytedance.adsdk.ugeno.jc.dj.sya.3
                @Override // com.bytedance.adsdk.ugeno.zb.ycx
                public void ycx(Bitmap bitmap) {
                    if (bitmap == null) {
                        return;
                    }
                    final Bitmap bitmapYcx = fby.ycx(((com.bytedance.adsdk.ugeno.zb.sya) sya.this).f22701zb, bitmap, sya.this.f22287ci > 0.0f ? (int) sya.this.f22287ci : 10);
                    fby.ycx(new Runnable() { // from class: com.bytedance.adsdk.ugeno.jc.dj.sya.3.1
                        @Override // java.lang.Runnable
                        public void run() {
                            if (bitmapYcx != null) {
                                ((ycx) ((com.bytedance.adsdk.ugeno.zb.sya) sya.this).lud).setBackground(new BitmapDrawable(((com.bytedance.adsdk.ugeno.zb.sya) sya.this).f22701zb.getResources(), bitmapYcx));
                            }
                        }
                    });
                }
            });
        }
    }

    private void jw() throws NumberFormatException {
        if (TextUtils.isEmpty(this.ycx)) {
            return;
        }
        ((ycx) this.lud).setImageDrawable(null);
        if (!this.ycx.startsWith("local://")) {
            if (!this.ycx.startsWith("@")) {
                jc();
                return;
            } else {
                ((ycx) this.lud).setImageResource(Integer.parseInt(this.ycx.substring(1)));
                return;
            }
        }
        try {
            String strReplace = this.ycx.replace("local://", b.f42142b);
            if (TextUtils.equals(sya(), "raw")) {
                ((ycx) this.lud).setImageResource(dj.ycx(this.f22701zb, strReplace));
            } else {
                ycx((ImageView) this.lud, strReplace);
            }
        } catch (Exception unused) {
        }
    }

    private ImageView.ScaleType ry(String str) {
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
            case "fit":
            case "fitCenter":
                return ImageView.ScaleType.FIT_CENTER;
            case "crop":
            case "centerCrop":
                return ImageView.ScaleType.CENTER_CROP;
            default:
                return scaleType;
        }
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    /* renamed from: dj, reason: merged with bridge method [inline-methods] */
    public ycx ycx() {
        ycx ycxVar = new ycx(this.f22701zb);
        ycxVar.ycx(this);
        return ycxVar;
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya, com.bytedance.adsdk.ugeno.lud
    public void fby() {
        super.fby();
        Drawable drawable = ((ycx) this.lud).getDrawable();
        if (Build.VERSION.SDK_INT < 28 || !k.u(drawable)) {
            return;
        }
        k.i(drawable).stop();
    }

    public String sya() {
        return this.f22288nc;
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya, com.bytedance.adsdk.ugeno.lud
    public void ul() {
        super.ul();
        ((ycx) this.lud).post(new Runnable() { // from class: com.bytedance.adsdk.ugeno.jc.dj.sya.4
            @Override // java.lang.Runnable
            public void run() {
                Drawable drawable = ((ycx) ((com.bytedance.adsdk.ugeno.zb.sya) sya.this).lud).getDrawable();
                if (Build.VERSION.SDK_INT < 28 || !k.u(drawable)) {
                    return;
                }
                k.i(drawable).start();
            }
        });
    }

    public void xkz(String str) {
        this.ycx = str;
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void zb() throws JSONException, NumberFormatException {
        super.zb();
        jw();
        ((ycx) this.lud).setScaleType(this.f22290qt);
        ((ycx) this.lud).setBorderColor(this.f22689ui);
        ((ycx) this.lud).setCornerRadius(this.f22698yi);
        ((ycx) this.lud).setBorderWidth(this.f22670lv);
        int i5 = this.vbt;
        if (i5 != -1) {
            ((ycx) this.lud).setColorFilter(i5);
        }
        ((ycx) this.lud).setEraseEnabled(this.f22291sp == 1);
        ((ycx) this.lud).setEraseRadius(this.tpg);
    }

    public void ycx(ImageView imageView, String str) {
        imageView.setImageResource(dj.zb(this.f22701zb, str));
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void ycx(String str, String str2) {
        T t6;
        if (TextUtils.isEmpty(str)) {
            return;
        }
        super.ycx(str, str2);
        str.getClass();
        switch (str) {
            case "scaleMode":
            case "scaleType":
                this.f22290qt = ry(str2);
                break;
            case "imageBlur":
                this.f22289pg = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, -1.0f);
                break;
            case "eraseRadius":
                float fYcx = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 50.0f);
                this.tpg = fYcx;
                T t9 = this.lud;
                if (t9 != 0) {
                    ((ycx) t9).setEraseRadius(fYcx);
                    break;
                }
                break;
            case "isBgGaussianBlur":
                this.f22292te = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, false);
                break;
            case "src":
                this.ycx = str2;
                break;
            case "erase":
                int iYcx = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0);
                this.f22291sp = iYcx;
                if (iYcx == 1 && (t6 = this.lud) != 0) {
                    ((ycx) t6).setEraseEnabled(true);
                    break;
                }
                break;
            case "tintColor":
                this.vbt = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2);
                break;
            case "imageBgBlur":
                this.f22287ci = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, -1.0f);
                break;
        }
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya, com.bytedance.adsdk.ugeno.lud
    public void ycx(String str, Map<String, Object> map) {
        this.f22690ul = (com.bytedance.adsdk.ugeno.zb.ycx) zb((com.bytedance.adsdk.ugeno.zb.sya) this);
        ArrayList arrayList = new ArrayList();
        arrayList.add(rmy());
        Iterator<Map.Entry<String, Object>> it = map.entrySet().iterator();
        while (it.hasNext()) {
            arrayList.add(it.next().getValue());
        }
        ycx(this.f22690ul, str, arrayList.toArray());
    }

    private void ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, String str, Object... objArr) {
        List<com.bytedance.adsdk.ugeno.zb.sya<View>> listJw;
        if (syaVar == null) {
            return;
        }
        syaVar.ycx(str, objArr);
        if (!(syaVar instanceof com.bytedance.adsdk.ugeno.zb.ycx) || (listJw = ((com.bytedance.adsdk.ugeno.zb.ycx) syaVar).jw()) == null || listJw.isEmpty()) {
            return;
        }
        Iterator<com.bytedance.adsdk.ugeno.zb.sya<View>> it = listJw.iterator();
        while (it.hasNext()) {
            ycx(it.next(), str, objArr);
        }
    }
}
