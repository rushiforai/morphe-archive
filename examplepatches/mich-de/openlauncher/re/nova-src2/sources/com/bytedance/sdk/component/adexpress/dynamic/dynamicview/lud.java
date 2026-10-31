package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.text.TextUtils;
import android.util.Pair;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import b.c9;
import com.bytedance.sdk.component.adexpress.dynamic.animation.view.IAnimation;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public abstract class lud extends FrameLayout implements IAnimation, kgy, rmy {

    /* renamed from: dj, reason: collision with root package name */
    protected float f23407dj;

    /* renamed from: dy, reason: collision with root package name */
    protected boolean f23408dy;

    /* renamed from: ea, reason: collision with root package name */
    protected Context f23409ea;
    protected int fby;
    private float htf;

    /* renamed from: jc, reason: collision with root package name */
    protected int f23410jc;

    /* renamed from: jw, reason: collision with root package name */
    protected int f23411jw;

    /* renamed from: lt, reason: collision with root package name */
    protected float f23412lt;
    protected float lud;

    /* renamed from: ok, reason: collision with root package name */
    protected com.bytedance.sdk.component.adexpress.dynamic.dj.ul f23413ok;
    com.bytedance.sdk.component.adexpress.dynamic.animation.view.sya pmi;

    /* renamed from: ry, reason: collision with root package name */
    protected com.bytedance.sdk.component.adexpress.dynamic.dj.fby f23414ry;
    protected float sya;
    protected View syc;
    private com.bytedance.sdk.component.utils.dv thx;

    /* renamed from: uh, reason: collision with root package name */
    private float f23415uh;

    /* renamed from: ul, reason: collision with root package name */
    protected int f23416ul;
    protected com.bytedance.sdk.component.adexpress.dynamic.animation.ycx.zb wie;
    protected DynamicRootView xkz;
    private float ycx;

    /* renamed from: zb, reason: collision with root package name */
    private float f23417zb;
    private static final View.OnTouchListener wwx = new View.OnTouchListener() { // from class: com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud.2
        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View view, MotionEvent motionEvent) {
            return true;
        }
    };

    /* renamed from: tn, reason: collision with root package name */
    private static final View.OnClickListener f23406tn = new View.OnClickListener() { // from class: com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud.3
        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
        }
    };

    public lud(Context context, DynamicRootView dynamicRootView, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        super(context);
        this.f23409ea = context;
        this.xkz = dynamicRootView;
        this.f23414ry = fbyVar;
        this.sya = fbyVar.lt();
        this.f23407dj = fbyVar.ul();
        this.lud = fbyVar.fby();
        this.f23412lt = fbyVar.jw();
        this.f23411jw = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.sya);
        this.f23410jc = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23407dj);
        this.f23416ul = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.lud);
        this.fby = (int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23412lt);
        com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar = new com.bytedance.sdk.component.adexpress.dynamic.dj.ul(fbyVar.jc());
        this.f23413ok = ulVar;
        if (ulVar.pmi() > 0) {
            this.f23416ul = (this.f23413ok.pmi() * 2) + this.f23416ul;
            this.fby = (this.f23413ok.pmi() * 2) + this.fby;
            this.f23411jw -= this.f23413ok.pmi();
            this.f23410jc -= this.f23413ok.pmi();
            List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> listEa = fbyVar.ea();
            if (listEa != null) {
                for (com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar2 : listEa) {
                    fbyVar2.sya(fbyVar2.lt() + com.bytedance.sdk.component.adexpress.dj.ul.zb(this.f23409ea, this.f23413ok.pmi()));
                    fbyVar2.dj(fbyVar2.ul() + com.bytedance.sdk.component.adexpress.dj.ul.zb(this.f23409ea, this.f23413ok.pmi()));
                    fbyVar2.ycx(com.bytedance.sdk.component.adexpress.dj.ul.zb(this.f23409ea, this.f23413ok.pmi()));
                    fbyVar2.zb(com.bytedance.sdk.component.adexpress.dj.ul.zb(this.f23409ea, this.f23413ok.pmi()));
                }
            }
        }
        this.f23408dy = this.f23413ok.xkz() > 0.0d;
        this.pmi = new com.bytedance.sdk.component.adexpress.dynamic.animation.view.sya();
    }

    public boolean dj() throws JSONException {
        View.OnTouchListener onTouchListener;
        View.OnClickListener onClickListener;
        View view = this.syc;
        if (view == null) {
            view = this;
        }
        if (lud()) {
            onTouchListener = (View.OnTouchListener) getDynamicClickListener();
            onClickListener = (View.OnClickListener) getDynamicClickListener();
        } else {
            onTouchListener = wwx;
            onClickListener = f23406tn;
        }
        if (onTouchListener != null && onClickListener != null) {
            view.setOnTouchListener(onTouchListener);
            view.setOnClickListener(onClickListener);
            int iYcx = com.bytedance.sdk.component.adexpress.dynamic.zb.ycx.ycx(this.f23413ok);
            if (iYcx == 2 || iYcx == 3) {
                view.setOnClickListener(f23406tn);
            } else {
                view.setOnClickListener(onClickListener);
            }
        }
        ycx(view);
        zb(view);
        return true;
    }

    public boolean fby() {
        com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar = this.f23414ry;
        return fbyVar == null || fbyVar.jc() == null || this.f23414ry.jc().lud() == null || this.f23414ry.jc().lud().vbt() == null;
    }

    public Drawable getBackgroundDrawable() {
        return ycx(false, b.f42142b);
    }

    public boolean getBeginInvisibleAndShow() {
        return this.f23408dy;
    }

    public int getClickArea() {
        return this.f23413ok.tru();
    }

    public GradientDrawable getDrawable() {
        return new GradientDrawable();
    }

    public com.bytedance.sdk.component.adexpress.dynamic.lt.ycx getDynamicClickListener() {
        return this.xkz.getDynamicClickListener();
    }

    public int getDynamicHeight() {
        return this.fby;
    }

    public com.bytedance.sdk.component.adexpress.dynamic.dj.lt getDynamicLayoutBrickValue() {
        com.bytedance.sdk.component.adexpress.dynamic.dj.lud ludVarJc;
        com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar = this.f23414ry;
        if (fbyVar == null || (ludVarJc = fbyVar.jc()) == null) {
            return null;
        }
        return ludVarJc.lud();
    }

    public int getDynamicWidth() {
        return this.f23416ul;
    }

    public String getImageObjectFit() {
        return this.f23413ok.duz();
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.view.IAnimation
    public float getMarqueeValue() {
        return this.f23415uh;
    }

    public Drawable getMutilBackgroundDrawable() {
        try {
            return new LayerDrawable(ycx(zb(this.f23413ok.ifb().replaceAll("/\\*.*\\*/", b.f42142b))));
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6QxVe8gnACqYMKX", "f/cjlA61auWBWdJqhRWnLU8=", "XOs5uBaoYMuiS9RWiwOvPVXqCYcCq2jFjE8=", 394);
            return null;
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.view.IAnimation
    public float getRippleValue() {
        return this.ycx;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.view.IAnimation
    public float getShineValue() {
        return this.f23417zb;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.view.IAnimation
    public float getStretchValue() {
        return this.htf;
    }

    public void lt() {
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(this.f23416ul, this.fby);
        layoutParams.topMargin = this.f23410jc;
        int i5 = this.f23411jw;
        layoutParams.leftMargin = i5;
        layoutParams.setMarginStart(i5);
        layoutParams.setMarginEnd(layoutParams.rightMargin);
        setLayoutParams(layoutParams);
    }

    public boolean lud() {
        com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar = this.f23413ok;
        return (ulVar == null || ulVar.tru() == 0) ? false : true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        ul();
        ycx();
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        zb();
        super.onDetachedFromWindow();
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        this.pmi.ycx(canvas, this, this);
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        com.bytedance.sdk.component.adexpress.dynamic.animation.view.sya syaVar = this.pmi;
        View view = this.syc;
        if (view == null) {
            view = this;
        }
        syaVar.ycx(view, i5, i11);
    }

    @Override // android.view.View
    public void onWindowFocusChanged(boolean z11) {
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.view.IAnimation
    public void setMarqueeValue(float f11) {
        this.f23415uh = f11;
        postInvalidate();
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.view.IAnimation
    public void setRippleValue(float f11) {
        this.ycx = f11;
        postInvalidate();
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.view.IAnimation
    public void setShineValue(float f11) {
        this.f23417zb = f11;
        postInvalidate();
    }

    public void setShouldInvisible(boolean z11) {
        this.f23408dy = z11;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.animation.view.IAnimation
    public void setStretchValue(float f11) {
        this.htf = f11;
        this.pmi.ycx(this, f11);
    }

    public boolean sya() {
        jw();
        lt();
        dj();
        return true;
    }

    public void ul() {
        if (fby()) {
            return;
        }
        View view = this.syc;
        if (view == null) {
            view = this;
        }
        this.wie = new com.bytedance.sdk.component.adexpress.dynamic.animation.ycx.zb(view, this.f23414ry.jc().lud().vbt());
        post(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud.1
            @Override // java.lang.Runnable
            public void run() {
                com.bytedance.sdk.component.adexpress.dynamic.animation.ycx.zb zbVar = lud.this.wie;
                if (zbVar != null) {
                    zbVar.ycx();
                }
            }
        });
    }

    public void ycx(View view) throws JSONException {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("width", this.f23414ry.fby());
            jSONObject.put("height", this.f23414ry.jw());
            if (com.bytedance.sdk.component.adexpress.dj.zb()) {
                view.setTag(com.bytedance.sdk.component.adexpress.dynamic.ycx.htf, this.f23413ok.yzp());
                view.setTag(com.bytedance.sdk.component.adexpress.dynamic.ycx.thx, this.f23414ry.jc().zb());
                view.setTag(com.bytedance.sdk.component.adexpress.dynamic.ycx.wwx, this.f23414ry.sya());
                view.setTag(com.bytedance.sdk.component.adexpress.dynamic.ycx.f23522tn, jSONObject.toString());
                return;
            }
            view.setTag(2097610717, this.f23413ok.yzp());
            view.setTag(2097610715, this.f23414ry.jc().zb());
            view.setTag(2097610714, this.f23414ry.sya());
            view.setTag(2097610713, jSONObject.toString());
            int iYcx = com.bytedance.sdk.component.adexpress.dynamic.zb.ycx.ycx(this.f23413ok);
            if (iYcx == 1) {
                view.setTag(2097610707, new Pair(this.f23413ok.oty(), Long.valueOf(this.f23413ok.hf())));
                view.setTag(2097610708, Integer.valueOf(iYcx));
            }
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6QxVe8gnACqYMKX", "f/cjlA61auWBWdJqhRWnLU8=", "WuoptgyxZMiOftZa", 228);
        }
    }

    public void zb(View view) {
        com.bytedance.sdk.component.adexpress.dynamic.dj.lt ltVarLud;
        com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar = this.f23414ry;
        if (fbyVar == null || (ltVarLud = fbyVar.jc().lud()) == null) {
            return;
        }
        view.setTag(2097610716, Boolean.valueOf(ltVarLud.kh()));
    }

    private List<String> zb(String str) {
        ArrayList arrayList = new ArrayList();
        int i5 = 0;
        boolean z11 = false;
        int i11 = 0;
        for (int i12 = 0; i12 < str.length(); i12++) {
            if (str.charAt(i12) == '(') {
                i5++;
                z11 = true;
            } else if (str.charAt(i12) == ')' && i5 - 1 == 0 && z11) {
                int i13 = i12 + 1;
                arrayList.add(str.substring(i11, i13));
                i11 = i13;
                z11 = false;
            }
        }
        return arrayList;
    }

    public void zb() {
        com.bytedance.sdk.component.adexpress.dynamic.animation.ycx.zb zbVar = this.wie;
        if (zbVar != null) {
            zbVar.zb();
        }
    }

    public Drawable ycx(boolean z11, String str) {
        String[] strArrSplit;
        int[] iArr;
        int iBhi;
        if (!TextUtils.isEmpty(this.f23413ok.ifb())) {
            try {
                String strIfb = this.f23413ok.ifb();
                String strSubstring = strIfb.substring(strIfb.indexOf("(") + 1, strIfb.length() - 1);
                if (strSubstring.contains("rgba") && strSubstring.contains("%")) {
                    strArrSplit = new String[]{strSubstring.substring(0, strSubstring.indexOf(",")).trim(), strSubstring.substring(strSubstring.indexOf(",") + 1, strSubstring.indexOf("%") + 1).trim(), strSubstring.substring(strSubstring.indexOf("%") + 2).trim()};
                    iArr = new int[]{com.bytedance.sdk.component.adexpress.dynamic.dj.ul.ycx(strArrSplit[1]), com.bytedance.sdk.component.adexpress.dynamic.dj.ul.ycx(strArrSplit[2])};
                } else {
                    strArrSplit = strSubstring.split(", ");
                    iArr = new int[]{com.bytedance.sdk.component.adexpress.dynamic.dj.ul.ycx(strArrSplit[1].substring(0, 7)), com.bytedance.sdk.component.adexpress.dynamic.dj.ul.ycx(strArrSplit[2].substring(0, 7))};
                }
                int[] iArr2 = iArr;
                String[] strArr = strArrSplit;
                try {
                    double d5 = Double.parseDouble(strSubstring.substring(strSubstring.indexOf("linear-gradient(") + 1, strSubstring.indexOf("deg")));
                    if (d5 > 225.0d && d5 < 315.0d) {
                        int i5 = iArr2[1];
                        iArr2[1] = iArr2[0];
                        iArr2[0] = i5;
                    }
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6QxVe8gnACqYMKX", "f/cjlA61auWBWdJqhRWnLU8=", "XOs5twK/YsCSRcJTiDWyKUzvL5kG", Sdk.SDKError.Reason.ASSET_FAILED_TO_DELETE_VALUE);
                }
                GradientDrawable gradientDrawableYcx = ycx(ycx(strArr[0]), iArr2);
                gradientDrawableYcx.setShape(0);
                gradientDrawableYcx.setCornerRadius(com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23413ok.syc()));
                return gradientDrawableYcx;
            } catch (Exception e11) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6QxVe8gnACqYMKX", "f/cjlA61auWBWdJqhRWnLU8=", "XOs5twK/YsCSRcJTiDWyKUzvL5kG", Sdk.SDKError.Reason.AD_CLOSED_TEMPLATE_ERROR_VALUE);
                Drawable mutilBackgroundDrawable = getMutilBackgroundDrawable();
                if (mutilBackgroundDrawable != null) {
                    return mutilBackgroundDrawable;
                }
            }
        }
        GradientDrawable drawable = getDrawable();
        drawable.setShape(0);
        float fYcx = com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23413ok.syc());
        drawable.setCornerRadius(fYcx);
        if (fYcx < 1.0f) {
            float fYcx2 = com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23413ok.rmf());
            float fYcx3 = com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23413ok.aeu());
            float fYcx4 = com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23413ok.xz());
            float fYcx5 = com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23413ok.rmy());
            float[] fArr = new float[8];
            if (fYcx2 > 0.0f) {
                fArr[0] = fYcx2;
                fArr[1] = fYcx2;
            }
            if (fYcx3 > 0.0f) {
                fArr[2] = fYcx3;
                fArr[3] = fYcx3;
            }
            if (fYcx4 > 0.0f) {
                fArr[4] = fYcx4;
                fArr[5] = fYcx4;
            }
            if (fYcx5 > 0.0f) {
                fArr[6] = fYcx5;
                fArr[7] = fYcx5;
            }
            drawable.setCornerRadii(fArr);
        }
        if (z11) {
            iBhi = Color.parseColor(str);
        } else {
            iBhi = this.f23413ok.bhi();
        }
        drawable.setColor(iBhi);
        if (this.f23413ok.wie() > 0.0f) {
            drawable.setStroke((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23413ok.wie()), this.f23413ok.dy());
            return drawable;
        }
        if (this.f23413ok.pmi() <= 0) {
            return drawable;
        }
        drawable.setStroke(this.f23413ok.pmi(), this.f23413ok.dy());
        drawable.setAlpha(50);
        if (!c9.u(this.f23414ry, "video-vd")) {
            return drawable;
        }
        setLayerType(1, null);
        return new uh((int) fYcx, this.f23413ok.pmi());
    }

    public zb ycx(Bitmap bitmap) {
        return new ycx(bitmap, null);
    }

    private Drawable[] ycx(List<String> list) {
        Drawable[] drawableArr = new Drawable[list.size()];
        for (int i5 = 0; i5 < list.size(); i5++) {
            String str = list.get(i5);
            if (str.contains("linear-gradient")) {
                String[] strArrSplit = str.substring(str.indexOf("(") + 1, str.length() - 1).split(", ");
                int length = strArrSplit.length - 1;
                int[] iArr = new int[length];
                int i11 = 0;
                while (i11 < length) {
                    int i12 = i11 + 1;
                    iArr[i11] = com.bytedance.sdk.component.adexpress.dynamic.dj.ul.ycx(strArrSplit[i12].substring(0, 7));
                    i11 = i12;
                }
                GradientDrawable gradientDrawableYcx = ycx(ycx(strArrSplit[0]), iArr);
                gradientDrawableYcx.setShape(0);
                gradientDrawableYcx.setCornerRadius(com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23409ea, this.f23413ok.syc()));
                drawableArr[(list.size() - 1) - i5] = gradientDrawableYcx;
            }
        }
        return drawableArr;
    }

    public GradientDrawable ycx(GradientDrawable.Orientation orientation, int[] iArr) {
        if (iArr != null && iArr.length != 0) {
            if (iArr.length == 1) {
                GradientDrawable gradientDrawable = new GradientDrawable();
                gradientDrawable.setColor(iArr[0]);
                return gradientDrawable;
            }
            return new GradientDrawable(orientation, iArr);
        }
        return new GradientDrawable();
    }

    public GradientDrawable.Orientation ycx(String str) {
        try {
            int i5 = (int) Float.parseFloat(str.substring(0, str.length() - 3));
            if (i5 <= 90) {
                return GradientDrawable.Orientation.LEFT_RIGHT;
            }
            if (i5 <= 180) {
                return GradientDrawable.Orientation.TOP_BOTTOM;
            }
            if (i5 <= 270) {
                return GradientDrawable.Orientation.RIGHT_LEFT;
            }
            return GradientDrawable.Orientation.BOTTOM_TOP;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6QxVe8gnACqYMKX", "f/cjlA61auWBWdJqhRWnLU8=", "XOs5uhG1fcaUQ9hT", 473);
            return GradientDrawable.Orientation.LEFT_RIGHT;
        }
    }

    private void ycx() {
        if (isShown()) {
            int iYcx = com.bytedance.sdk.component.adexpress.dynamic.zb.ycx.ycx(this.f23413ok);
            if (iYcx == 2) {
                if (this.thx == null) {
                    this.thx = new com.bytedance.sdk.component.utils.dv(getContext().getApplicationContext(), 1);
                }
                new Object() { // from class: com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud.4
                };
                com.bytedance.sdk.component.adexpress.zb.ry renderRequest = this.xkz.getRenderRequest();
                if (renderRequest != null) {
                    renderRequest.syc();
                    renderRequest.thx();
                    renderRequest.uh();
                    return;
                }
                return;
            }
            if (iYcx == 3) {
                if (this.thx == null) {
                    this.thx = new com.bytedance.sdk.component.utils.dv(getContext().getApplicationContext(), 2);
                }
                new Object() { // from class: com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud.5
                };
                com.bytedance.sdk.component.adexpress.zb.ry renderRequest2 = this.xkz.getRenderRequest();
                if (renderRequest2 != null) {
                    renderRequest2.wie();
                    renderRequest2.wwx();
                    renderRequest2.pmi();
                    renderRequest2.htf();
                }
            }
        }
    }
}
