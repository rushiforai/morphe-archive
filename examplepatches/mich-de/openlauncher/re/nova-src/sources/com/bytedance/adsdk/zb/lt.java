package com.bytedance.adsdk.zb;

import android.animation.Animator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.widget.ImageView;
import com.bytedance.adsdk.zb.ul;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Callable;
import org.json.JSONArray;

/* loaded from: classes2.dex */
public class lt extends ImageView {
    private static final String ycx = "lt";

    /* renamed from: zb, reason: collision with root package name */
    private static final ea<Throwable> f22883zb = new ea<Throwable>() { // from class: com.bytedance.adsdk.zb.lt.1
        @Override // com.bytedance.adsdk.zb.ea
        public void ycx(Throwable th2) {
            com.bytedance.adsdk.zb.lt.lt.ycx(th2);
        }
    };

    /* renamed from: av, reason: collision with root package name */
    private zb f22884av;
    private final Runnable bhi;

    /* renamed from: dj, reason: collision with root package name */
    private final ea<Throwable> f22885dj;

    /* renamed from: dv, reason: collision with root package name */
    private int f22886dv;

    /* renamed from: dy, reason: collision with root package name */
    private ul f22887dy;

    /* renamed from: ea, reason: collision with root package name */
    private boolean f22888ea;
    private String fby;

    /* renamed from: hf, reason: collision with root package name */
    private String f22889hf;
    private long htf;

    /* renamed from: jc, reason: collision with root package name */
    private boolean f22890jc;

    /* renamed from: jw, reason: collision with root package name */
    private int f22891jw;

    /* renamed from: lt, reason: collision with root package name */
    private int f22892lt;
    private ea<Throwable> lud;

    /* renamed from: ok, reason: collision with root package name */
    private boolean f22893ok;
    private int oty;
    private int pmi;
    private ycx rmf;

    /* renamed from: ry, reason: collision with root package name */
    private final Set<dj> f22894ry;
    private final ea<ul> sya;
    private ry<ul> syc;
    private com.bytedance.adsdk.zb.sya.sya.sya thx;

    /* renamed from: tn, reason: collision with root package name */
    private int f22895tn;
    private JSONArray tru;

    /* renamed from: uh, reason: collision with root package name */
    private Handler f22896uh;

    /* renamed from: ul, reason: collision with root package name */
    private final jw f22897ul;
    private final Handler wie;
    private int wwx;
    private final Set<Object> xkz;

    /* renamed from: com.bytedance.adsdk.zb.lt$3, reason: invalid class name */
    public static /* synthetic */ class AnonymousClass3 {
        static final /* synthetic */ int[] ycx;

        static {
            int[] iArr = new int[ImageView.ScaleType.values().length];
            ycx = iArr;
            try {
                iArr[ImageView.ScaleType.CENTER_CROP.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                ycx[ImageView.ScaleType.CENTER_INSIDE.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                ycx[ImageView.ScaleType.CENTER.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                ycx[ImageView.ScaleType.FIT_CENTER.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
        }
    }

    public enum dj {
        SET_ANIMATION,
        SET_PROGRESS,
        SET_REPEAT_MODE,
        SET_REPEAT_COUNT,
        SET_IMAGE_ASSETS,
        PLAY_OPTION
    }

    /* renamed from: com.bytedance.adsdk.zb.lt$lt, reason: collision with other inner class name */
    public static class C0026lt implements ea<ul> {
        private final WeakReference<lt> ycx;

        public C0026lt(lt ltVar) {
            this.ycx = new WeakReference<>(ltVar);
        }

        @Override // com.bytedance.adsdk.zb.ea
        public void ycx(ul ulVar) {
            lt ltVar = this.ycx.get();
            if (ltVar == null) {
                return;
            }
            ltVar.setComposition(ulVar);
        }
    }

    public static class lud implements ea<Throwable> {
        private final WeakReference<lt> ycx;

        public lud(lt ltVar) {
            this.ycx = new WeakReference<>(ltVar);
        }

        @Override // com.bytedance.adsdk.zb.ea
        public void ycx(Throwable th2) {
            lt ltVar = this.ycx.get();
            if (ltVar == null) {
                return;
            }
            if (ltVar.f22892lt != 0) {
                ltVar.setImageResource(ltVar.f22892lt);
            }
            (ltVar.lud == null ? lt.f22883zb : ltVar.lud).ycx(th2);
        }
    }

    public static class sya extends View.BaseSavedState {
        public static final Parcelable.Creator<sya> CREATOR = new Parcelable.Creator<sya>() { // from class: com.bytedance.adsdk.zb.lt.sya.1
            @Override // android.os.Parcelable.Creator
            /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
            public sya createFromParcel(Parcel parcel) {
                return new sya(parcel);
            }

            @Override // android.os.Parcelable.Creator
            /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
            public sya[] newArray(int i5) {
                return new sya[i5];
            }
        };

        /* renamed from: dj, reason: collision with root package name */
        boolean f22912dj;

        /* renamed from: lt, reason: collision with root package name */
        int f22913lt;
        String lud;
        float sya;

        /* renamed from: ul, reason: collision with root package name */
        int f22914ul;
        String ycx;

        /* renamed from: zb, reason: collision with root package name */
        int f22915zb;

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i5) {
            super.writeToParcel(parcel, i5);
            parcel.writeString(this.ycx);
            parcel.writeFloat(this.sya);
            parcel.writeInt(this.f22912dj ? 1 : 0);
            parcel.writeString(this.lud);
            parcel.writeInt(this.f22913lt);
            parcel.writeInt(this.f22914ul);
        }

        public sya(Parcelable parcelable) {
            super(parcelable);
        }

        private sya(Parcel parcel) {
            super(parcel);
            this.ycx = parcel.readString();
            this.sya = parcel.readFloat();
            this.f22912dj = parcel.readInt() == 1;
            this.lud = parcel.readString();
            this.f22913lt = parcel.readInt();
            this.f22914ul = parcel.readInt();
        }
    }

    public interface ycx {
    }

    public interface zb {
    }

    public lt(Context context) {
        super(context);
        this.sya = new C0026lt(this);
        this.f22885dj = new lud(this);
        this.f22892lt = 0;
        this.f22897ul = new jw();
        this.f22890jc = false;
        this.f22888ea = false;
        this.f22893ok = true;
        this.f22894ry = new HashSet();
        this.xkz = new HashSet();
        this.wie = new Handler(Looper.getMainLooper());
        this.pmi = 0;
        this.htf = 0L;
        this.bhi = new Runnable() { // from class: com.bytedance.adsdk.zb.lt.2
            @Override // java.lang.Runnable
            public void run() {
                Log.i("TMe", "--==--- timer callback, timer: " + lt.this.wwx + ", " + lt.this.f22895tn);
                if (lt.this.wwx > lt.this.f22895tn) {
                    lt.pmi(lt.this);
                    com.bytedance.adsdk.zb.sya.sya.sya syaVar = lt.this.thx;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append(lt.this.wwx);
                    syaVar.ycx(sb2.toString());
                    lt.this.invalidate();
                    lt.this.syc();
                    return;
                }
                if (lt.this.f22886dv < 0 || lt.this.oty < 0) {
                    Log.i("TMe", "--==--- timer end, frame invalid: " + lt.this.f22886dv + "," + lt.this.oty);
                } else {
                    Log.i("TMe", "--==--- timer end, play anim, startframe: " + lt.this.f22886dv);
                    lt.this.ycx();
                    lt ltVar = lt.this;
                    ltVar.setFrame(ltVar.f22886dv);
                    lt.this.ycx(new ValueAnimator.AnimatorUpdateListener() { // from class: com.bytedance.adsdk.zb.lt.2.1
                        @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                        public void onAnimationUpdate(ValueAnimator valueAnimator) {
                            if (lt.this.getFrame() < lt.this.oty - 1 || lt.this.getFrame() >= lt.this.oty + 2) {
                                return;
                            }
                            Log.i("TMe", "--==--- timer end, play anim, endframe: " + lt.this.oty);
                            lt.this.zb(this);
                            lt.this.lt();
                        }
                    });
                }
                if ((!TextUtils.isEmpty(lt.this.f22889hf) || (lt.this.tru != null && lt.this.tru.length() > 0)) && lt.this.f22884av != null) {
                    zb unused = lt.this.f22884av;
                    String unused2 = lt.this.f22889hf;
                    JSONArray unused3 = lt.this.tru;
                }
            }
        };
        fby();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ul.ycx getGlobalConfig() {
        ul ulVarHf;
        jw jwVar = this.f22897ul;
        if (jwVar == null || (ulVarHf = jwVar.hf()) == null) {
            return null;
        }
        return ulVarHf.ea();
    }

    private ul.zb getGlobalEvent() {
        ul ulVarHf;
        jw jwVar = this.f22897ul;
        if (jwVar == null || (ulVarHf = jwVar.hf()) == null) {
            return null;
        }
        return ulVarHf.jc();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getPlayDelayedELExpressTimeS() {
        ul ulVarHf;
        jw jwVar = this.f22897ul;
        if (jwVar == null || (ulVarHf = jwVar.hf()) == null) {
            return null;
        }
        return ulVarHf.jw();
    }

    public static /* synthetic */ int lud(lt ltVar) {
        int i5 = ltVar.pmi;
        ltVar.pmi = i5 + 1;
        return i5;
    }

    public static /* synthetic */ int pmi(lt ltVar) {
        int i5 = ltVar.wwx;
        ltVar.wwx = i5 - 1;
        return i5;
    }

    private void setCompositionTask(ry<ul> ryVar) {
        this.f22894ry.add(dj.SET_ANIMATION);
        wie();
        ry();
        this.syc = ryVar.ycx(this.sya).sya(this.f22885dj);
    }

    public boolean getClipToCompositionBounds() {
        return this.f22897ul.sya();
    }

    public ul getComposition() {
        return this.f22887dy;
    }

    public long getDuration() {
        ul ulVar = this.f22887dy;
        if (ulVar != null) {
            return (long) ulVar.lud();
        }
        return 0L;
    }

    public int getFrame() {
        return this.f22897ul.uh();
    }

    public String getImageAssetsFolder() {
        return this.f22897ul.dj();
    }

    public boolean getMaintainOriginalImageBounds() {
        return this.f22897ul.lud();
    }

    public float getMaxFrame() {
        return this.f22897ul.syc();
    }

    public float getMinFrame() {
        return this.f22897ul.xkz();
    }

    public pmi getPerformanceTracker() {
        return this.f22897ul.fby();
    }

    public float getProgress() {
        return this.f22897ul.av();
    }

    public uh getRenderMode() {
        return this.f22897ul.lt();
    }

    public int getRepeatCount() {
        return this.f22897ul.thx();
    }

    public int getRepeatMode() {
        return this.f22897ul.htf();
    }

    public float getSpeed() {
        return this.f22897ul.dy();
    }

    @Override // android.view.View
    public void invalidate() {
        super.invalidate();
        Drawable drawable = getDrawable();
        if ((drawable instanceof jw) && ((jw) drawable).lt() == uh.SOFTWARE) {
            this.f22897ul.invalidateSelf();
        }
    }

    @Override // android.widget.ImageView, android.view.View, android.graphics.drawable.Drawable.Callback
    public void invalidateDrawable(Drawable drawable) {
        Drawable drawable2 = getDrawable();
        jw jwVar = this.f22897ul;
        if (drawable2 == jwVar) {
            super.invalidateDrawable(jwVar);
        } else {
            super.invalidateDrawable(drawable);
        }
    }

    @Override // android.widget.ImageView, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (isInEditMode() || !this.f22888ea) {
            return;
        }
        this.f22897ul.ea();
    }

    @Override // android.widget.ImageView, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        dy();
        Handler handler = this.f22896uh;
        if (handler != null) {
            handler.removeCallbacksAndMessages(null);
        }
        sya();
        zb();
    }

    @Override // android.view.View
    public void onRestoreInstanceState(Parcelable parcelable) {
        int i5;
        if (!(parcelable instanceof sya)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        sya syaVar = (sya) parcelable;
        super.onRestoreInstanceState(syaVar.getSuperState());
        this.fby = syaVar.ycx;
        Set<dj> set = this.f22894ry;
        dj djVar = dj.SET_ANIMATION;
        if (!set.contains(djVar) && !TextUtils.isEmpty(this.fby)) {
            setAnimation(this.fby);
        }
        this.f22891jw = syaVar.f22915zb;
        if (!this.f22894ry.contains(djVar) && (i5 = this.f22891jw) != 0) {
            setAnimation(i5);
        }
        if (!this.f22894ry.contains(dj.SET_PROGRESS)) {
            ycx(syaVar.sya, false);
        }
        if (!this.f22894ry.contains(dj.PLAY_OPTION) && syaVar.f22912dj) {
            ycx();
        }
        if (!this.f22894ry.contains(dj.SET_IMAGE_ASSETS)) {
            setImageAssetsFolder(syaVar.lud);
        }
        if (!this.f22894ry.contains(dj.SET_REPEAT_MODE)) {
            setRepeatMode(syaVar.f22913lt);
        }
        if (this.f22894ry.contains(dj.SET_REPEAT_COUNT)) {
            return;
        }
        setRepeatCount(syaVar.f22914ul);
    }

    @Override // android.view.View
    public Parcelable onSaveInstanceState() {
        sya syaVar = new sya(super.onSaveInstanceState());
        syaVar.ycx = this.fby;
        syaVar.f22915zb = this.f22891jw;
        syaVar.sya = this.f22897ul.av();
        syaVar.f22912dj = this.f22897ul.tn();
        syaVar.lud = this.f22897ul.dj();
        syaVar.f22913lt = this.f22897ul.htf();
        syaVar.f22914ul = this.f22897ul.thx();
        return syaVar;
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        int[][] iArr;
        com.bytedance.adsdk.zb.sya.sya.ycx ycxVarYcx = ycx(motionEvent);
        if (ycxVarYcx == null) {
            if (getGlobalConfig() == null || getGlobalConfig().ycx != 1) {
                return super.onTouchEvent(motionEvent);
            }
            return false;
        }
        String strJw = ycxVarYcx.jw();
        if (ycxVarYcx instanceof com.bytedance.adsdk.zb.sya.sya.zb) {
            if (getGlobalConfig() == null || getGlobalConfig().ycx != 1) {
                return super.onTouchEvent(motionEvent);
            }
            return false;
        }
        if (strJw != null && strJw.startsWith("CSJCLOSE")) {
            dy();
        }
        jc jcVarYcx = ycx(ycxVarYcx.lud());
        if (jcVarYcx != null && motionEvent.getAction() == 1) {
            ycx(strJw, jcVarYcx.lud(), jcVarYcx.ul());
            int[][] iArrLt = jcVarYcx.lt();
            if (iArrLt != null) {
                ycx(iArrLt);
            } else if (getGlobalEvent() != null && (iArr = getGlobalEvent().f23139zb) != null) {
                ycx(iArr);
            }
        }
        if (strJw == null || !strJw.startsWith("CSJNTP")) {
            return super.onTouchEvent(motionEvent);
        }
        return false;
    }

    public void setAnimation(int i5) {
        this.f22891jw = i5;
        this.fby = null;
        setCompositionTask(ycx(i5));
    }

    public void setAnimationFromJson(String str) {
        ycx(str, (String) null);
    }

    public void setAnimationFromUrl(String str) {
        setCompositionTask(this.f22893ok ? fby.ycx(getContext(), str) : fby.ycx(getContext(), str, (String) null));
    }

    public void setApplyingOpacityToLayersEnabled(boolean z11) {
        this.f22897ul.lud(z11);
    }

    public void setCacheComposition(boolean z11) {
        this.f22893ok = z11;
    }

    public void setClipToCompositionBounds(boolean z11) {
        this.f22897ul.ycx(z11);
    }

    public void setComposition(ul ulVar) {
        this.f22897ul.setCallback(this);
        this.f22887dy = ulVar;
        this.f22890jc = true;
        boolean zYcx = this.f22897ul.ycx(ulVar, getContext().getApplicationContext());
        this.f22890jc = false;
        if (getDrawable() != this.f22897ul || zYcx) {
            if (!zYcx) {
                pmi();
            }
            onVisibilityChanged(this, getVisibility());
            requestLayout();
            Iterator<Object> it = this.xkz.iterator();
            while (it.hasNext()) {
                it.next();
            }
        }
    }

    public void setDefaultFontFileExtension(String str) {
        this.f22897ul.ul(str);
    }

    public void setFailureListener(ea<Throwable> eaVar) {
        this.lud = eaVar;
    }

    public void setFallbackResource(int i5) {
        this.f22892lt = i5;
    }

    public void setFontAssetDelegate(com.bytedance.adsdk.zb.sya syaVar) {
        this.f22897ul.ycx(syaVar);
    }

    public void setFontMap(Map<String, Typeface> map) {
        this.f22897ul.ycx(map);
    }

    public void setFrame(int i5) {
        this.f22897ul.sya(i5);
    }

    public void setIgnoreDisabledSystemAnimations(boolean z11) {
        this.f22897ul.ul(z11);
    }

    public void setImageAssetDelegate(com.bytedance.adsdk.zb.dj djVar) {
        this.f22897ul.ycx(djVar);
    }

    public void setImageAssetsFolder(String str) {
        this.f22897ul.ycx(str);
    }

    @Override // android.widget.ImageView
    public void setImageBitmap(Bitmap bitmap) {
        ry();
        super.setImageBitmap(bitmap);
    }

    @Override // android.widget.ImageView
    public void setImageDrawable(Drawable drawable) {
        ry();
        super.setImageDrawable(drawable);
    }

    @Override // android.widget.ImageView
    public void setImageResource(int i5) {
        ry();
        super.setImageResource(i5);
    }

    public void setLottieAnimListener(ycx ycxVar) {
        this.rmf = ycxVar;
    }

    public void setLottieClicklistener(zb zbVar) {
        this.f22884av = zbVar;
    }

    public void setMaintainOriginalImageBounds(boolean z11) {
        this.f22897ul.zb(z11);
    }

    public void setMaxFrame(int i5) {
        this.f22897ul.zb(i5);
    }

    public void setMaxProgress(float f11) {
        this.f22897ul.zb(f11);
    }

    public void setMinAndMaxFrame(String str) {
        this.f22897ul.dj(str);
    }

    public void setMinFrame(int i5) {
        this.f22897ul.ycx(i5);
    }

    public void setMinProgress(float f11) {
        this.f22897ul.ycx(f11);
    }

    public void setOutlineMasksAndMattes(boolean z11) {
        this.f22897ul.dj(z11);
    }

    public void setPerformanceTrackingEnabled(boolean z11) {
        this.f22897ul.sya(z11);
    }

    public void setProgress(float f11) {
        ycx(f11, true);
    }

    public void setRenderMode(uh uhVar) {
        this.f22897ul.ycx(uhVar);
    }

    public void setRepeatCount(int i5) {
        this.f22894ry.add(dj.SET_REPEAT_COUNT);
        this.f22897ul.lud(i5);
    }

    public void setRepeatMode(int i5) {
        this.f22894ry.add(dj.SET_REPEAT_MODE);
        this.f22897ul.dj(i5);
    }

    public void setSafeMode(boolean z11) {
        this.f22897ul.lt(z11);
    }

    public void setSpeed(float f11) {
        this.f22897ul.sya(f11);
    }

    public void setTextDelegate(htf htfVar) {
        this.f22897ul.ycx(htfVar);
    }

    public void setUseCompositionFrameRate(boolean z11) {
        this.f22897ul.fby(z11);
    }

    public void setView(View view) {
        this.f22897ul.ycx(view);
    }

    @Override // android.view.View
    public void unscheduleDrawable(Drawable drawable) {
        jw jwVar;
        if (!this.f22890jc && drawable == (jwVar = this.f22897ul) && jwVar.wwx()) {
            lt();
        } else if (!this.f22890jc && (drawable instanceof jw)) {
            jw jwVar2 = (jw) drawable;
            if (jwVar2.wwx()) {
                jwVar2.bhi();
            }
        }
        super.unscheduleDrawable(drawable);
    }

    private void dj(Matrix matrix, float f11, float f12, float f13, float f14) {
        if (f13 >= f11 || f14 >= f12) {
            if (f13 / f14 >= f11 / f12) {
                float f15 = f11 / f13;
                matrix.preScale(f15, f15);
                matrix.postTranslate(0.0f, (f12 - (f14 * f15)) / 2.0f);
                return;
            } else {
                float f16 = f12 / f14;
                matrix.preScale(f16, f16);
                matrix.postTranslate((f11 - (f13 * f16)) / 2.0f, 0.0f);
                return;
            }
        }
        if (f13 / f14 >= f11 / f12) {
            float f17 = f11 / f13;
            matrix.preScale(f17, f17);
            matrix.postTranslate(0.0f, (f12 - (f14 * f17)) / 2.0f);
        } else {
            float f18 = f12 / f14;
            matrix.preScale(f18, f18);
            matrix.postTranslate((f11 - (f13 * f18)) / 2.0f, 0.0f);
        }
    }

    private void dy() {
        this.wie.removeCallbacksAndMessages(null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ea() {
        final ul.ycx globalConfig = getGlobalConfig();
        if (globalConfig == null || globalConfig.lud <= 0) {
            return;
        }
        if (TextUtils.isEmpty(globalConfig.f23126lt) && globalConfig.f23127ul == null) {
            return;
        }
        int maxFrame = globalConfig.lud;
        if (maxFrame > getMaxFrame()) {
            maxFrame = (int) getMaxFrame();
        }
        final float maxFrame2 = maxFrame / getMaxFrame();
        ycx(new ValueAnimator.AnimatorUpdateListener() { // from class: com.bytedance.adsdk.zb.lt.6
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                Object animatedValue = valueAnimator.getAnimatedValue();
                if (!(animatedValue instanceof Float) || ((Float) animatedValue).floatValue() < maxFrame2) {
                    return;
                }
                lt.this.zb(this);
                if (lt.this.f22884av != null) {
                    zb unused = lt.this.f22884av;
                }
            }
        });
    }

    private void fby() {
        setSaveEnabled(false);
        this.f22893ok = true;
        setFallbackResource(0);
        setImageAssetsFolder(b.f42142b);
        ycx(0.0f, false);
        ycx(false, getContext().getApplicationContext());
        setIgnoreDisabledSystemAnimations(false);
        this.f22897ul.ycx(Boolean.valueOf(com.bytedance.adsdk.zb.lt.lt.ycx(getContext()) != 0.0f));
        jw();
        jc();
        ok();
    }

    private void jc() {
        ycx(new ValueAnimator.AnimatorUpdateListener() { // from class: com.bytedance.adsdk.zb.lt.5
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator valueAnimator) throws NumberFormatException {
                int i5;
                Object animatedValue = valueAnimator.getAnimatedValue();
                if (!(animatedValue instanceof Float) || ((Float) animatedValue).floatValue() < 0.98f) {
                    return;
                }
                lt.lud(lt.this);
                ul.ycx globalConfig = lt.this.getGlobalConfig();
                if (globalConfig != null && (i5 = globalConfig.f23125dj) > 0 && i5 > lt.this.pmi) {
                    lt.this.xkz();
                    lt.this.ycx();
                    lt.this.setProgress(0.0f);
                } else {
                    lt.this.zb(this);
                    if (lt.this.rmf != null) {
                        ycx unused = lt.this.rmf;
                    }
                }
            }
        });
    }

    private void jw() {
        ycx(new Animator.AnimatorListener() { // from class: com.bytedance.adsdk.zb.lt.4
            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationRepeat(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationStart(Animator animator) throws NumberFormatException {
                lt.this.zb(this);
                lt.this.xkz();
                lt.this.ea();
            }
        });
    }

    private void ok() {
        ycx(new Animator.AnimatorListener() { // from class: com.bytedance.adsdk.zb.lt.7
            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationRepeat(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationStart(Animator animator) {
                htf htfVarDv;
                final long jElapsedRealtime = SystemClock.elapsedRealtime() - lt.this.htf;
                lt.this.zb(this);
                String playDelayedELExpressTimeS = lt.this.getPlayDelayedELExpressTimeS();
                if (!TextUtils.isEmpty(playDelayedELExpressTimeS) && (htfVarDv = lt.this.f22897ul.dv()) != null) {
                    try {
                        int i5 = Integer.parseInt(htfVarDv.ycx(playDelayedELExpressTimeS)) * 1000;
                        if (lt.this.htf > 0) {
                            long jElapsedRealtime2 = (lt.this.htf + i5) - SystemClock.elapsedRealtime();
                            Log.i("TMe", "--==-- lottie delayed time: ".concat(String.valueOf(jElapsedRealtime2)));
                            if (jElapsedRealtime2 > 0) {
                                lt.this.lt();
                                lt.this.setVisibility(8);
                                if (lt.this.f22896uh == null) {
                                    lt.this.f22896uh = new Handler(Looper.getMainLooper());
                                }
                                lt.this.f22896uh.removeCallbacksAndMessages(null);
                                lt.this.f22896uh.postDelayed(new Runnable() { // from class: com.bytedance.adsdk.zb.lt.7.1
                                    @Override // java.lang.Runnable
                                    public void run() {
                                        Log.i("TMe", "--==-- lottie real start play");
                                        lt.this.setVisibility(0);
                                        lt.this.ycx();
                                        lt.this.ycx(jElapsedRealtime);
                                    }
                                }, jElapsedRealtime2);
                                return;
                            }
                        }
                    } catch (NumberFormatException unused) {
                    }
                }
                lt.this.ycx(jElapsedRealtime);
            }
        });
    }

    private void pmi() {
        boolean zDj = dj();
        setImageDrawable(null);
        setImageDrawable(this.f22897ul);
        if (zDj) {
            this.f22897ul.ry();
        }
    }

    private void ry() {
        ry<ul> ryVar = this.syc;
        if (ryVar != null) {
            ryVar.zb(this.sya);
            this.syc.dj(this.f22885dj);
        }
    }

    private void sya(Matrix matrix, float f11, float f12, float f13, float f14) {
        matrix.postTranslate((f11 - f13) / 2.0f, (f12 - f14) / 2.0f);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void syc() {
        this.wie.postDelayed(this.bhi, 1000L);
    }

    private void wie() {
        this.f22887dy = null;
        this.f22897ul.jc();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void xkz() throws NumberFormatException {
        jw jwVar;
        int i5;
        int i11;
        final int i12;
        if (this.f22887dy == null || (jwVar = this.f22897ul) == null) {
            return;
        }
        htf htfVarDv = jwVar.dv();
        ul.sya syaVarFby = this.f22887dy.fby();
        if (syaVarFby == null || htfVarDv == null) {
            return;
        }
        final int i13 = syaVarFby.ycx;
        if (i13 < 0) {
            Log.i("TMe", "--==--- timer fail, ke is invalid: ".concat(String.valueOf(i13)));
            return;
        }
        int[] iArr = syaVarFby.lud;
        final int i14 = -1;
        if (iArr == null || iArr.length < 2) {
            i5 = -1;
            i11 = -1;
        } else {
            i11 = iArr[0];
            i5 = iArr[1];
        }
        String strYcx = htfVarDv.ycx(syaVarFby.sya);
        String strYcx2 = htfVarDv.ycx(syaVarFby.f23120dj);
        try {
            i12 = Integer.parseInt(strYcx);
            try {
                i14 = Integer.parseInt(strYcx2);
            } catch (NumberFormatException unused) {
            }
        } catch (NumberFormatException unused2) {
            i12 = -1;
        }
        Log.i("TMe", "--==--- prepare timer, startS: " + i12 + ", lenS: " + i14);
        if (TextUtils.isEmpty(syaVarFby.f23123zb)) {
            Log.i("TMe", "--==--- timer fail, id is invalid: " + syaVarFby.f23123zb);
            return;
        }
        Log.i("TMe", "--==--- timer, id:" + syaVarFby.f23123zb);
        com.bytedance.adsdk.zb.sya.sya.sya syaVarSya = sya(syaVarFby.f23123zb);
        if (syaVarSya != null) {
            Log.i("TMe", "--==--- timer success");
            this.f22889hf = syaVarFby.f23121lt;
            this.tru = syaVarFby.f23122ul;
            this.thx = syaVarSya;
            this.wwx = i12;
            this.f22895tn = i12 - i14;
            this.f22886dv = i11;
            this.oty = i5;
            StringBuilder sb2 = new StringBuilder();
            sb2.append(this.wwx);
            syaVarSya.ycx(sb2.toString());
            ycx(new ValueAnimator.AnimatorUpdateListener() { // from class: com.bytedance.adsdk.zb.lt.11
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public void onAnimationUpdate(ValueAnimator valueAnimator) {
                    if (lt.this.getFrame() < i13 - 1 || lt.this.getFrame() >= i13 + 2) {
                        return;
                    }
                    Log.i("TMe", "--==--- enter timer point, frame: " + lt.this.getFrame());
                    lt.this.zb(this);
                    if (i12 < 0 || i14 < 0) {
                        Log.i("TMe", "--==--- enter timer callback, NOT start timer");
                    } else {
                        Log.i("TMe", "--==--- enter timer callback, start timer");
                        lt.this.syc();
                    }
                    lt.this.lt();
                }
            });
        }
    }

    private void zb(RectF rectF, RectF rectF2) {
        float width = getWidth();
        float height = getHeight();
        float fWidth = this.f22897ul.getBounds().width();
        float fHeight = this.f22897ul.getBounds().height();
        if (width == 0.0f || height == 0.0f || fWidth == 0.0f || fHeight == 0.0f) {
            return;
        }
        Matrix matrix = new Matrix();
        int i5 = AnonymousClass3.ycx[getScaleType().ordinal()];
        if (i5 == 1) {
            ycx(matrix, width, height, fWidth, fHeight);
        } else if (i5 == 2) {
            zb(matrix, width, height, fWidth, fHeight);
        } else if (i5 == 3) {
            sya(matrix, width, height, fWidth, fHeight);
        } else if (i5 == 4) {
            dj(matrix, width, height, fWidth, fHeight);
        }
        matrix.mapRect(rectF, rectF2);
    }

    public void lt() {
        this.f22888ea = false;
        this.f22897ul.bhi();
    }

    public void lud() {
        this.f22894ry.add(dj.PLAY_OPTION);
        this.f22897ul.tru();
    }

    public void setMaxFrame(String str) {
        this.f22897ul.sya(str);
    }

    public void setMinFrame(String str) {
        this.f22897ul.zb(str);
    }

    private com.bytedance.adsdk.zb.sya.sya.sya sya(String str) {
        com.bytedance.adsdk.zb.sya.sya.zb zbVarZb;
        jw jwVar = this.f22897ul;
        if (jwVar == null || (zbVarZb = jwVar.zb()) == null) {
            return null;
        }
        return ycx(zbVarZb, str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(long j11) {
        Map<String, Object> map;
        ul.ycx globalConfig = getGlobalConfig();
        if (this.rmf != null) {
            HashMap map2 = new HashMap();
            map2.put("duration", Long.valueOf(j11));
            if (globalConfig == null || (map = globalConfig.f23128zb) == null || map.isEmpty()) {
                return;
            }
            map2.putAll(globalConfig.f23128zb);
        }
    }

    public void setAnimation(String str) {
        this.fby = str;
        this.f22891jw = 0;
        setCompositionTask(zb(str));
    }

    public void sya() {
        this.f22897ul.pmi();
    }

    private jc ycx(String str) {
        jw jwVar;
        ul ulVarHf;
        Map<String, jc> mapDy;
        if (TextUtils.isEmpty(str) || (jwVar = this.f22897ul) == null || (ulVarHf = jwVar.hf()) == null || (mapDy = ulVarHf.dy()) == null) {
            return null;
        }
        return mapDy.get(str);
    }

    public boolean dj() {
        return this.f22897ul.wwx();
    }

    private void zb(Matrix matrix, float f11, float f12, float f13, float f14) {
        if (f13 < f11 && f14 < f12) {
            matrix.postTranslate((f11 - f13) / 2.0f, (f12 - f14) / 2.0f);
            return;
        }
        if (f13 / f14 >= f11 / f12) {
            float f15 = f11 / f13;
            matrix.preScale(f15, f15);
            matrix.postTranslate(0.0f, (f12 - (f14 * f15)) / 2.0f);
        } else {
            float f16 = f12 / f14;
            matrix.preScale(f16, f16);
            matrix.postTranslate((f11 - (f13 * f16)) / 2.0f, 0.0f);
        }
    }

    private void ycx(int[][] iArr) {
        if (iArr == null || iArr.length == 0) {
            return;
        }
        try {
            int[] iArr2 = iArr[0];
            int i5 = iArr2[0];
            final int i11 = iArr2[1];
            if (i5 < 0 || i11 < 0) {
                return;
            }
            Log.i("TMe", "--==--- inel enter, play anim, startframe: ".concat(String.valueOf(i5)));
            dy();
            ycx();
            setFrame(i5);
            ycx(new ValueAnimator.AnimatorUpdateListener() { // from class: com.bytedance.adsdk.zb.lt.8
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public void onAnimationUpdate(ValueAnimator valueAnimator) {
                    if (lt.this.getFrame() < i11 - 1 || lt.this.getFrame() >= i11 + 2) {
                        return;
                    }
                    Log.i("TMe", "--==--- inel enter, play anim end, endframe: " + i11 + ", realFrame: " + lt.this.getFrame());
                    lt.this.zb(this);
                    lt.this.lt();
                }
            });
        } catch (Throwable unused) {
        }
    }

    private ry<ul> zb(final String str) {
        if (isInEditMode()) {
            return new ry<>(new Callable<ok<ul>>() { // from class: com.bytedance.adsdk.zb.lt.10
                @Override // java.util.concurrent.Callable
                /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
                public ok<ul> call() throws Exception {
                    return lt.this.f22893ok ? fby.sya(lt.this.getContext(), str) : fby.sya(lt.this.getContext(), str, null);
                }
            }, true);
        }
        return this.f22893ok ? fby.zb(getContext(), str) : fby.zb(getContext(), str, (String) null);
    }

    public void zb(ValueAnimator.AnimatorUpdateListener animatorUpdateListener) {
        this.f22897ul.zb(animatorUpdateListener);
    }

    private void ycx(String str, String str2, JSONArray jSONArray) {
        ul.zb globalEvent = getGlobalEvent();
        if (globalEvent != null && str != null) {
            if (TextUtils.isEmpty(str2) && !str.contains("CSJNO")) {
                str2 = globalEvent.ycx;
            }
            if ((jSONArray == null || jSONArray.length() <= 0) && !str.contains("CSJLELNO")) {
                jSONArray = globalEvent.sya;
            }
        }
        if (!TextUtils.isEmpty(str2) || jSONArray == null) {
            return;
        }
        jSONArray.length();
    }

    public void zb() {
        this.f22897ul.wie();
    }

    public void zb(Animator.AnimatorListener animatorListener) {
        this.f22897ul.zb(animatorListener);
    }

    private com.bytedance.adsdk.zb.sya.sya.ycx ycx(MotionEvent motionEvent) {
        com.bytedance.adsdk.zb.sya.sya.zb zbVarZb;
        jw jwVar = this.f22897ul;
        if (jwVar == null || (zbVarZb = jwVar.zb()) == null) {
            return null;
        }
        return ycx(zbVarZb, motionEvent);
    }

    private com.bytedance.adsdk.zb.sya.sya.ycx ycx(com.bytedance.adsdk.zb.sya.sya.zb zbVar, MotionEvent motionEvent) {
        com.bytedance.adsdk.zb.sya.sya.ycx ycxVarYcx;
        for (com.bytedance.adsdk.zb.sya.sya.ycx ycxVar : zbVar.ok()) {
            if (ycxVar instanceof com.bytedance.adsdk.zb.sya.sya.zb) {
                if (ycxVar.fby() && ycxVar.lt() > 0.0f) {
                    RectF rectF = new RectF();
                    ycxVar.ycx(rectF, ycxVar.dj(), true);
                    if (rectF.width() >= 3.0f && rectF.height() >= 3.0f && (ycxVarYcx = ycx((com.bytedance.adsdk.zb.sya.sya.zb) ycxVar, motionEvent)) != null) {
                        return ycxVarYcx;
                    }
                }
            } else if (ycxVar.fby() && ycxVar.lt() > 0.0f) {
                RectF rectF2 = new RectF();
                jw jwVar = this.f22897ul;
                if (jwVar != null && jwVar.ul()) {
                    ycxVar.ycx(rectF2, ycxVar.dj(), true);
                    RectF rectFRmf = this.f22897ul.rmf();
                    if (rectFRmf != null) {
                        ycx(rectF2, rectFRmf);
                    }
                } else {
                    RectF rectF3 = new RectF();
                    ycxVar.ycx(rectF3, ycxVar.dj(), true);
                    zb(rectF2, rectF3);
                }
                if (ycx(motionEvent, rectF2)) {
                    return ycxVar;
                }
            }
        }
        return null;
    }

    private boolean ycx(MotionEvent motionEvent, RectF rectF) {
        if (motionEvent != null && rectF != null) {
            float x11 = motionEvent.getX();
            float y11 = motionEvent.getY();
            if (x11 >= rectF.left && x11 <= rectF.right && y11 >= rectF.top && y11 <= rectF.bottom) {
                return true;
            }
        }
        return false;
    }

    private void ycx(RectF rectF, RectF rectF2) {
        float width = getWidth();
        float height = getHeight();
        float fWidth = rectF2.width();
        float fHeight = rectF2.height();
        if (width == 0.0f || height == 0.0f || fWidth == 0.0f || fHeight == 0.0f) {
            return;
        }
        Matrix matrix = new Matrix();
        int i5 = AnonymousClass3.ycx[getScaleType().ordinal()];
        if (i5 == 1) {
            ycx(matrix, width, height, fWidth, fHeight);
        } else if (i5 == 2) {
            zb(matrix, width, height, fWidth, fHeight);
        } else if (i5 == 3) {
            sya(matrix, width, height, fWidth, fHeight);
        } else if (i5 == 4) {
            dj(matrix, width, height, fWidth, fHeight);
        }
        matrix.mapRect(rectF);
    }

    private void ycx(Matrix matrix, float f11, float f12, float f13, float f14) {
        if (f13 / f14 >= f11 / f12) {
            float f15 = f12 / f14;
            matrix.preScale(f15, f15);
            matrix.postTranslate(-(((f13 * f15) - f11) / 2.0f), 0.0f);
        } else {
            float f16 = f11 / f13;
            matrix.preScale(f16, f16);
            matrix.postTranslate(0.0f, -(((f14 * f16) - f12) / 2.0f));
        }
    }

    public void ycx(boolean z11, Context context) {
        this.f22897ul.ycx(z11, context);
    }

    private ry<ul> ycx(final int i5) {
        if (isInEditMode()) {
            return new ry<>(new Callable<ok<ul>>() { // from class: com.bytedance.adsdk.zb.lt.9
                @Override // java.util.concurrent.Callable
                /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
                public ok<ul> call() throws Exception {
                    return lt.this.f22893ok ? fby.zb(lt.this.getContext(), i5) : fby.zb(lt.this.getContext(), i5, (String) null);
                }
            }, true);
        }
        return this.f22893ok ? fby.ycx(getContext(), i5) : fby.ycx(getContext(), i5, (String) null);
    }

    public void ycx(String str, String str2) {
        ycx(new ByteArrayInputStream(str.getBytes()), str2);
    }

    public void ycx(InputStream inputStream, String str) {
        setCompositionTask(fby.ycx(inputStream, str));
    }

    private com.bytedance.adsdk.zb.sya.sya.sya ycx(com.bytedance.adsdk.zb.sya.sya.zb zbVar, String str) {
        for (com.bytedance.adsdk.zb.sya.sya.ycx ycxVar : zbVar.ok()) {
            if (ycxVar instanceof com.bytedance.adsdk.zb.sya.sya.zb) {
                com.bytedance.adsdk.zb.sya.sya.sya syaVarYcx = ycx((com.bytedance.adsdk.zb.sya.sya.zb) ycxVar, str);
                if (syaVarYcx != null) {
                    return syaVarYcx;
                }
            } else if (TextUtils.equals(str, ycxVar.jw()) && (ycxVar instanceof com.bytedance.adsdk.zb.sya.sya.sya)) {
                return (com.bytedance.adsdk.zb.sya.sya.sya) ycxVar;
            }
        }
        return null;
    }

    public void ycx() {
        if (this.htf == 0) {
            this.htf = SystemClock.elapsedRealtime();
        }
        this.f22894ry.add(dj.PLAY_OPTION);
        this.f22897ul.ea();
    }

    public void ycx(ValueAnimator.AnimatorUpdateListener animatorUpdateListener) {
        this.f22897ul.ycx(animatorUpdateListener);
    }

    public void ycx(Animator.AnimatorListener animatorListener) {
        this.f22897ul.ycx(animatorListener);
    }

    public void ycx(boolean z11) {
        this.f22897ul.lud(z11 ? -1 : 0);
    }

    public Bitmap ycx(String str, Bitmap bitmap) {
        return this.f22897ul.ycx(str, bitmap);
    }

    private void ycx(float f11, boolean z11) {
        if (z11) {
            this.f22894ry.add(dj.SET_PROGRESS);
        }
        this.f22897ul.dj(f11);
    }
}
