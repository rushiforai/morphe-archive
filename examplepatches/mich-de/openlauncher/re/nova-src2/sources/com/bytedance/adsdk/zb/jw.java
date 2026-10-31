package com.bytedance.adsdk.zb;

import android.animation.Animator;
import android.animation.ValueAnimator;
import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ImageView;
import b.c0;
import com.amplitude.core.events.Identify;
import com.bytedance.adsdk.zb.lud.wwx;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes2.dex */
public class jw extends Drawable implements Animatable, Drawable.Callback {
    private RectF aeu;

    /* renamed from: av, reason: collision with root package name */
    private Canvas f22855av;
    private Bitmap bhi;
    private boolean dc;

    /* renamed from: dj, reason: collision with root package name */
    private ul f22856dj;

    /* renamed from: dv, reason: collision with root package name */
    private boolean f22857dv;
    private Matrix dwi;

    /* renamed from: dy, reason: collision with root package name */
    private Map<String, Typeface> f22858dy;

    /* renamed from: ea, reason: collision with root package name */
    private final ValueAnimator.AnimatorUpdateListener f22859ea;
    private boolean fby;

    /* renamed from: hf, reason: collision with root package name */
    private boolean f22860hf;
    private com.bytedance.adsdk.zb.sya.sya.zb htf;
    private RectF ifb;

    /* renamed from: jc, reason: collision with root package name */
    private final ArrayList<ycx> f22861jc;

    /* renamed from: jw, reason: collision with root package name */
    private zb f22862jw;
    private Rect kgy;

    /* renamed from: lt, reason: collision with root package name */
    private boolean f22863lt;
    private final com.bytedance.adsdk.zb.lt.sya lud;
    private View nji;
    private Matrix oby;

    /* renamed from: ok, reason: collision with root package name */
    private com.bytedance.adsdk.zb.zb.zb f22864ok;
    private uh oty;
    private boolean pmi;
    private Rect rmf;
    private Rect rmy;

    /* renamed from: ry, reason: collision with root package name */
    private String f22865ry;
    htf sya;
    private com.bytedance.adsdk.zb.zb.ycx syc;
    private int thx;

    /* renamed from: tn, reason: collision with root package name */
    private boolean f22866tn;
    private final Matrix tru;

    /* renamed from: uh, reason: collision with root package name */
    private boolean f22867uh;

    /* renamed from: ul, reason: collision with root package name */
    private boolean f22868ul;
    private boolean wie;
    private boolean wwx;
    private dj xkz;

    /* renamed from: xz, reason: collision with root package name */
    private Paint f22869xz;
    String ycx;
    private RectF yzp;

    /* renamed from: zb, reason: collision with root package name */
    sya f22870zb;

    public interface ycx {
        void ycx(ul ulVar);
    }

    public enum zb {
        NONE,
        PLAY,
        RESUME
    }

    public jw() {
        com.bytedance.adsdk.zb.lt.sya syaVar = new com.bytedance.adsdk.zb.lt.sya();
        this.lud = syaVar;
        this.f22863lt = true;
        this.f22868ul = false;
        this.fby = false;
        this.f22862jw = zb.NONE;
        this.f22861jc = new ArrayList<>();
        ValueAnimator.AnimatorUpdateListener animatorUpdateListener = new ValueAnimator.AnimatorUpdateListener() { // from class: com.bytedance.adsdk.zb.jw.1
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                if (jw.this.htf != null) {
                    jw.this.htf.ycx(jw.this.lud.lt());
                }
            }
        };
        this.f22859ea = animatorUpdateListener;
        this.pmi = false;
        this.f22867uh = true;
        this.thx = 255;
        this.oty = uh.AUTOMATIC;
        this.f22860hf = false;
        this.tru = new Matrix();
        this.dc = false;
        syaVar.addUpdateListener(animatorUpdateListener);
    }

    private void aeu() {
        ul ulVar = this.f22856dj;
        if (ulVar == null) {
            return;
        }
        this.f22860hf = this.oty.ycx(Build.VERSION.SDK_INT, ulVar.ycx(), ulVar.zb());
    }

    private boolean dwi() {
        Drawable.Callback callback = getCallback();
        if (!(callback instanceof View)) {
            return false;
        }
        ViewParent parent = ((View) callback).getParent();
        return (parent instanceof ViewGroup) && !((ViewGroup) parent).getClipChildren();
    }

    private Context ifb() {
        Drawable.Callback callback = getCallback();
        if (callback != null && (callback instanceof View)) {
            return ((View) callback).getContext();
        }
        return null;
    }

    private com.bytedance.adsdk.zb.zb.ycx kgy() {
        if (getCallback() == null) {
            return null;
        }
        if (this.syc == null) {
            com.bytedance.adsdk.zb.zb.ycx ycxVar = new com.bytedance.adsdk.zb.zb.ycx(getCallback(), this.f22870zb);
            this.syc = ycxVar;
            String str = this.ycx;
            if (str != null) {
                ycxVar.ycx(str);
            }
        }
        return this.syc;
    }

    private com.bytedance.adsdk.zb.zb.zb rmy() {
        com.bytedance.adsdk.zb.zb.zb zbVar = this.f22864ok;
        if (zbVar != null && !zbVar.ycx(ifb())) {
            this.f22864ok = null;
        }
        if (this.f22864ok == null) {
            this.f22864ok = new com.bytedance.adsdk.zb.zb.zb(getCallback(), this.f22865ry, this.xkz, this.f22856dj.dy());
        }
        return this.f22864ok;
    }

    private boolean xz() {
        return this.f22863lt || this.f22868ul;
    }

    private void yzp() {
        if (this.f22855av != null) {
            return;
        }
        this.f22855av = new Canvas();
        this.yzp = new RectF();
        this.dwi = new Matrix();
        this.oby = new Matrix();
        this.rmf = new Rect();
        this.aeu = new RectF();
        this.f22869xz = new com.bytedance.adsdk.zb.ycx.ycx();
        this.rmy = new Rect();
        this.kgy = new Rect();
        this.ifb = new RectF();
    }

    public float av() {
        return this.lud.lt();
    }

    public void bhi() {
        this.f22861jc.clear();
        this.lud.ry();
        if (isVisible()) {
            return;
        }
        this.f22862jw = zb.NONE;
    }

    public String dj() {
        return this.f22865ry;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        lud.ycx("Drawable#draw");
        try {
            if (this.f22860hf) {
                ycx(canvas, this.htf);
            } else {
                ycx(canvas);
            }
        } catch (Throwable unused) {
        }
        this.dc = false;
        lud.zb("Drawable#draw");
    }

    public htf dv() {
        return this.sya;
    }

    public float dy() {
        return this.lud.jc();
    }

    public void ea() {
        if (this.htf == null) {
            this.f22861jc.add(new ycx() { // from class: com.bytedance.adsdk.zb.jw.6
                @Override // com.bytedance.adsdk.zb.jw.ycx
                public void ycx(ul ulVar) {
                    jw.this.ea();
                }
            });
            return;
        }
        aeu();
        if (xz() || thx() == 0) {
            if (isVisible()) {
                this.lud.ea();
                this.f22862jw = zb.NONE;
            } else {
                this.f22862jw = zb.PLAY;
            }
        }
        if (xz()) {
            return;
        }
        sya((int) (dy() < 0.0f ? xkz() : syc()));
        this.lud.ok();
        if (isVisible()) {
            return;
        }
        this.f22862jw = zb.NONE;
    }

    public pmi fby() {
        ul ulVar = this.f22856dj;
        if (ulVar != null) {
            return ulVar.sya();
        }
        return null;
    }

    @Override // android.graphics.drawable.Drawable
    public int getAlpha() {
        return this.thx;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        ul ulVar = this.f22856dj;
        if (ulVar == null) {
            return -1;
        }
        return ulVar.dj().height();
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        ul ulVar = this.f22856dj;
        if (ulVar == null) {
            return -1;
        }
        return ulVar.dj().width();
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    public ul hf() {
        return this.f22856dj;
    }

    @SuppressLint({"WrongConstant"})
    public int htf() {
        return this.lud.getRepeatMode();
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public void invalidateDrawable(Drawable drawable) {
        Drawable.Callback callback = getCallback();
        if (callback == null) {
            return;
        }
        callback.invalidateDrawable(this);
    }

    @Override // android.graphics.drawable.Drawable
    public void invalidateSelf() {
        if (this.dc) {
            return;
        }
        this.dc = true;
        Drawable.Callback callback = getCallback();
        if (callback != null) {
            callback.invalidateDrawable(this);
        }
    }

    @Override // android.graphics.drawable.Animatable
    public boolean isRunning() {
        return wwx();
    }

    public void jc() {
        if (this.lud.isRunning()) {
            this.lud.cancel();
            if (!isVisible()) {
                this.f22862jw = zb.NONE;
            }
        }
        this.f22856dj = null;
        this.htf = null;
        this.f22864ok = null;
        this.lud.fby();
        invalidateSelf();
    }

    public boolean jw() {
        return this.f22857dv;
    }

    public uh lt() {
        return this.f22860hf ? uh.SOFTWARE : uh.HARDWARE;
    }

    public boolean lud() {
        return this.pmi;
    }

    public void ok() {
        this.f22861jc.clear();
        this.lud.ok();
        if (isVisible()) {
            return;
        }
        this.f22862jw = zb.NONE;
    }

    public boolean oty() {
        return this.f22858dy == null && this.sya == null && this.f22856dj.xkz().size() > 0;
    }

    public void pmi() {
        this.lud.removeAllListeners();
    }

    public RectF rmf() {
        return this.yzp;
    }

    public void ry() {
        if (this.htf == null) {
            this.f22861jc.add(new ycx() { // from class: com.bytedance.adsdk.zb.jw.7
                @Override // com.bytedance.adsdk.zb.jw.ycx
                public void ycx(ul ulVar) {
                    jw.this.ry();
                }
            });
            return;
        }
        aeu();
        if (xz() || thx() == 0) {
            if (isVisible()) {
                this.lud.xkz();
                this.f22862jw = zb.NONE;
            } else {
                this.f22862jw = zb.RESUME;
            }
        }
        if (xz()) {
            return;
        }
        sya((int) (dy() < 0.0f ? xkz() : syc()));
        this.lud.ok();
        if (isVisible()) {
            return;
        }
        this.f22862jw = zb.NONE;
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public void scheduleDrawable(Drawable drawable, Runnable runnable, long j11) {
        Drawable.Callback callback = getCallback();
        if (callback == null) {
            return;
        }
        callback.scheduleDrawable(this, runnable, j11);
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int i5) {
        this.thx = i5;
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
    }

    @Override // android.graphics.drawable.Drawable
    public boolean setVisible(boolean z11, boolean z12) {
        boolean zIsVisible = isVisible();
        boolean visible = super.setVisible(z11, z12);
        if (z11) {
            zb zbVar = this.f22862jw;
            if (zbVar == zb.PLAY) {
                ea();
                return visible;
            }
            if (zbVar == zb.RESUME) {
                ry();
                return visible;
            }
        } else {
            if (this.lud.isRunning()) {
                bhi();
                this.f22862jw = zb.RESUME;
                return visible;
            }
            if (zIsVisible) {
                this.f22862jw = zb.NONE;
            }
        }
        return visible;
    }

    @Override // android.graphics.drawable.Animatable
    public void start() {
        Drawable.Callback callback = getCallback();
        if ((callback instanceof View) && ((View) callback).isInEditMode()) {
            return;
        }
        ea();
    }

    @Override // android.graphics.drawable.Animatable
    public void stop() {
        ok();
    }

    public boolean sya() {
        return this.f22867uh;
    }

    public float syc() {
        return this.lud.dy();
    }

    public int thx() {
        return this.lud.getRepeatCount();
    }

    public boolean tn() {
        if (isVisible()) {
            return this.lud.isRunning();
        }
        zb zbVar = this.f22862jw;
        return zbVar == zb.PLAY || zbVar == zb.RESUME;
    }

    public void tru() {
        this.f22861jc.clear();
        this.lud.cancel();
        if (isVisible()) {
            return;
        }
        this.f22862jw = zb.NONE;
    }

    public int uh() {
        return (int) this.lud.ul();
    }

    public boolean ul() {
        return this.f22860hf;
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public void unscheduleDrawable(Drawable drawable, Runnable runnable) {
        Drawable.Callback callback = getCallback();
        if (callback == null) {
            return;
        }
        callback.unscheduleDrawable(this, runnable);
    }

    public void wie() {
        this.lud.removeAllUpdateListeners();
        this.lud.addUpdateListener(this.f22859ea);
    }

    public boolean wwx() {
        com.bytedance.adsdk.zb.lt.sya syaVar = this.lud;
        if (syaVar == null) {
            return false;
        }
        return syaVar.isRunning();
    }

    public float xkz() {
        return this.lud.syc();
    }

    public void dj(boolean z11) {
        if (this.f22866tn == z11) {
            return;
        }
        this.f22866tn = z11;
        com.bytedance.adsdk.zb.sya.sya.zb zbVar = this.htf;
        if (zbVar != null) {
            zbVar.ycx(z11);
        }
    }

    public void lt(boolean z11) {
        this.fby = z11;
    }

    public void lud(boolean z11) {
        this.f22857dv = z11;
    }

    public void sya(boolean z11) {
        this.wwx = z11;
        ul ulVar = this.f22856dj;
        if (ulVar != null) {
            ulVar.zb(z11);
        }
    }

    public void ul(boolean z11) {
        this.f22868ul = z11;
    }

    public void ycx(View view) {
        this.nji = view;
    }

    public com.bytedance.adsdk.zb.sya.sya.zb zb() {
        return this.htf;
    }

    public void fby(boolean z11) {
        this.lud.sya(z11);
    }

    public jc lt(String str) {
        ul ulVar = this.f22856dj;
        if (ulVar == null) {
            return null;
        }
        return ulVar.dy().get(str);
    }

    public void lud(int i5) {
        this.lud.setRepeatCount(i5);
    }

    public void ul(String str) {
        this.ycx = str;
        com.bytedance.adsdk.zb.zb.ycx ycxVarKgy = kgy();
        if (ycxVarKgy != null) {
            ycxVarKgy.ycx(str);
        }
    }

    public View ycx() {
        return this.nji;
    }

    public void zb(boolean z11) {
        this.pmi = z11;
    }

    public Bitmap lud(String str) {
        com.bytedance.adsdk.zb.zb.zb zbVarRmy = rmy();
        if (zbVarRmy != null) {
            return zbVarRmy.ycx(str);
        }
        return null;
    }

    public void ycx(boolean z11, Context context) {
        if (this.wie == z11) {
            return;
        }
        this.wie = z11;
        if (this.f22856dj != null) {
            ycx(context);
        }
    }

    public void zb(final int i5) {
        if (this.f22856dj == null) {
            this.f22861jc.add(new ycx() { // from class: com.bytedance.adsdk.zb.jw.10
                @Override // com.bytedance.adsdk.zb.jw.ycx
                public void ycx(ul ulVar) {
                    jw.this.zb(i5);
                }
            });
        } else {
            this.lud.zb(i5 + 0.99f);
        }
    }

    public void sya(final String str) {
        ul ulVar = this.f22856dj;
        if (ulVar == null) {
            this.f22861jc.add(new ycx() { // from class: com.bytedance.adsdk.zb.jw.13
                @Override // com.bytedance.adsdk.zb.jw.ycx
                public void ycx(ul ulVar2) {
                    jw.this.sya(str);
                }
            });
            return;
        }
        com.bytedance.adsdk.zb.sya.lt ltVarSya = ulVar.sya(str);
        if (ltVarSya != null) {
            zb((int) (ltVarSya.ycx + ltVarSya.f22945zb));
            return;
        }
        throw new IllegalArgumentException(c0.l("Cannot find marker with name ", str, "."));
    }

    public void dj(final String str) {
        ul ulVar = this.f22856dj;
        if (ulVar == null) {
            this.f22861jc.add(new ycx() { // from class: com.bytedance.adsdk.zb.jw.2
                @Override // com.bytedance.adsdk.zb.jw.ycx
                public void ycx(ul ulVar2) {
                    jw.this.dj(str);
                }
            });
            return;
        }
        com.bytedance.adsdk.zb.sya.lt ltVarSya = ulVar.sya(str);
        if (ltVarSya != null) {
            int i5 = (int) ltVarSya.ycx;
            ycx(i5, ((int) ltVarSya.f22945zb) + i5);
            return;
        }
        throw new IllegalArgumentException(c0.l("Cannot find marker with name ", str, "."));
    }

    public void zb(final float f11) {
        ul ulVar = this.f22856dj;
        if (ulVar == null) {
            this.f22861jc.add(new ycx() { // from class: com.bytedance.adsdk.zb.jw.11
                @Override // com.bytedance.adsdk.zb.jw.ycx
                public void ycx(ul ulVar2) {
                    jw.this.zb(f11);
                }
            });
        } else {
            this.lud.zb(com.bytedance.adsdk.zb.lt.lud.ycx(ulVar.lt(), this.f22856dj.ul(), f11));
        }
    }

    public void ycx(boolean z11) {
        if (z11 != this.f22867uh) {
            this.f22867uh = z11;
            com.bytedance.adsdk.zb.sya.sya.zb zbVar = this.htf;
            if (zbVar != null) {
                zbVar.zb(z11);
            }
            invalidateSelf();
        }
    }

    public void zb(final String str) {
        ul ulVar = this.f22856dj;
        if (ulVar == null) {
            this.f22861jc.add(new ycx() { // from class: com.bytedance.adsdk.zb.jw.12
                @Override // com.bytedance.adsdk.zb.jw.ycx
                public void ycx(ul ulVar2) {
                    jw.this.zb(str);
                }
            });
            return;
        }
        com.bytedance.adsdk.zb.sya.lt ltVarSya = ulVar.sya(str);
        if (ltVarSya != null) {
            ycx((int) ltVarSya.ycx);
            return;
        }
        throw new IllegalArgumentException(c0.l("Cannot find marker with name ", str, "."));
    }

    public void ycx(String str) {
        this.f22865ry = str;
    }

    public boolean ycx(ul ulVar, Context context) {
        if (this.f22856dj == ulVar) {
            return false;
        }
        this.dc = true;
        jc();
        this.f22856dj = ulVar;
        ycx(context);
        this.lud.ycx(ulVar);
        dj(this.lud.getAnimatedFraction());
        Iterator it = new ArrayList(this.f22861jc).iterator();
        while (it.hasNext()) {
            ycx ycxVar = (ycx) it.next();
            if (ycxVar != null) {
                ycxVar.ycx(ulVar);
            }
            it.remove();
        }
        this.f22861jc.clear();
        ulVar.zb(this.wwx);
        aeu();
        Drawable.Callback callback = getCallback();
        if (callback instanceof ImageView) {
            ImageView imageView = (ImageView) callback;
            imageView.setImageDrawable(null);
            imageView.setImageDrawable(this);
        }
        return true;
    }

    public void sya(float f11) {
        this.lud.sya(f11);
    }

    public void sya(final int i5) {
        if (this.f22856dj == null) {
            this.f22861jc.add(new ycx() { // from class: com.bytedance.adsdk.zb.jw.4
                @Override // com.bytedance.adsdk.zb.jw.ycx
                public void ycx(ul ulVar) {
                    jw.this.sya(i5);
                }
            });
        } else {
            this.lud.ycx(i5);
        }
    }

    public void dj(final float f11) {
        if (this.f22856dj == null) {
            this.f22861jc.add(new ycx() { // from class: com.bytedance.adsdk.zb.jw.5
                @Override // com.bytedance.adsdk.zb.jw.ycx
                public void ycx(ul ulVar) {
                    jw.this.dj(f11);
                }
            });
            return;
        }
        lud.ycx("Drawable#setProgress");
        this.lud.ycx(this.f22856dj.ycx(f11));
        lud.zb("Drawable#setProgress");
    }

    public void zb(ValueAnimator.AnimatorUpdateListener animatorUpdateListener) {
        this.lud.removeUpdateListener(animatorUpdateListener);
    }

    public void zb(Animator.AnimatorListener animatorListener) {
        this.lud.removeListener(animatorListener);
    }

    private void zb(int i5, int i11) {
        Bitmap bitmap = this.bhi;
        if (bitmap != null && bitmap.getWidth() >= i5 && this.bhi.getHeight() >= i11) {
            if (this.bhi.getWidth() > i5 || this.bhi.getHeight() > i11) {
                Bitmap bitmapCreateBitmap = Bitmap.createBitmap(this.bhi, 0, 0, i5, i11);
                this.bhi = bitmapCreateBitmap;
                this.f22855av.setBitmap(bitmapCreateBitmap);
                this.dc = true;
                return;
            }
            return;
        }
        Bitmap bitmapCreateBitmap2 = Bitmap.createBitmap(i5, i11, Bitmap.Config.ARGB_8888);
        this.bhi = bitmapCreateBitmap2;
        this.f22855av.setBitmap(bitmapCreateBitmap2);
        this.dc = true;
    }

    public void dj(int i5) {
        this.lud.setRepeatMode(i5);
    }

    public void ycx(uh uhVar) {
        this.oty = uhVar;
        aeu();
    }

    private void ycx(Context context) {
        ul ulVar = this.f22856dj;
        if (ulVar == null) {
            return;
        }
        com.bytedance.adsdk.zb.sya.sya.zb zbVar = new com.bytedance.adsdk.zb.sya.sya.zb(this, wwx.ycx(ulVar), ulVar.ry(), ulVar, context);
        this.htf = zbVar;
        if (this.f22866tn) {
            zbVar.ycx(true);
        }
        this.htf.zb(this.f22867uh);
    }

    public void ycx(final int i5) {
        if (this.f22856dj == null) {
            this.f22861jc.add(new ycx() { // from class: com.bytedance.adsdk.zb.jw.8
                @Override // com.bytedance.adsdk.zb.jw.ycx
                public void ycx(ul ulVar) {
                    jw.this.ycx(i5);
                }
            });
        } else {
            this.lud.ycx(i5);
        }
    }

    public void ycx(final float f11) {
        ul ulVar = this.f22856dj;
        if (ulVar == null) {
            this.f22861jc.add(new ycx() { // from class: com.bytedance.adsdk.zb.jw.9
                @Override // com.bytedance.adsdk.zb.jw.ycx
                public void ycx(ul ulVar2) {
                    jw.this.ycx(f11);
                }
            });
        } else {
            ycx((int) com.bytedance.adsdk.zb.lt.lud.ycx(ulVar.lt(), this.f22856dj.ul(), f11));
        }
    }

    public void ycx(final int i5, final int i11) {
        if (this.f22856dj == null) {
            this.f22861jc.add(new ycx() { // from class: com.bytedance.adsdk.zb.jw.3
                @Override // com.bytedance.adsdk.zb.jw.ycx
                public void ycx(ul ulVar) {
                    jw.this.ycx(i5, i11);
                }
            });
        } else {
            this.lud.ycx(i5, i11 + 0.99f);
        }
    }

    public void ycx(ValueAnimator.AnimatorUpdateListener animatorUpdateListener) {
        this.lud.addUpdateListener(animatorUpdateListener);
    }

    public void ycx(Animator.AnimatorListener animatorListener) {
        this.lud.addListener(animatorListener);
    }

    public void ycx(Boolean bool) {
        this.f22863lt = bool.booleanValue();
    }

    public void ycx(dj djVar) {
        this.xkz = djVar;
        com.bytedance.adsdk.zb.zb.zb zbVar = this.f22864ok;
        if (zbVar != null) {
            zbVar.ycx(djVar);
        }
    }

    public void ycx(sya syaVar) {
        this.f22870zb = syaVar;
        com.bytedance.adsdk.zb.zb.ycx ycxVar = this.syc;
        if (ycxVar != null) {
            ycxVar.ycx(syaVar);
        }
    }

    public void ycx(Map<String, Typeface> map) {
        if (map == this.f22858dy) {
            return;
        }
        this.f22858dy = map;
        invalidateSelf();
    }

    public void ycx(htf htfVar) {
        this.sya = htfVar;
    }

    public Bitmap ycx(String str, Bitmap bitmap) {
        com.bytedance.adsdk.zb.zb.zb zbVarRmy = rmy();
        if (zbVarRmy == null) {
            return null;
        }
        Bitmap bitmapYcx = zbVarRmy.ycx(str, bitmap);
        invalidateSelf();
        return bitmapYcx;
    }

    public Typeface ycx(com.bytedance.adsdk.zb.sya.sya syaVar) {
        Map<String, Typeface> map = this.f22858dy;
        if (map != null) {
            String strYcx = syaVar.ycx();
            if (map.containsKey(strYcx)) {
                return map.get(strYcx);
            }
            String strZb = syaVar.zb();
            if (map.containsKey(strZb)) {
                return map.get(strZb);
            }
            String str = syaVar.ycx() + Identify.UNSET_VALUE + syaVar.sya();
            if (map.containsKey(str)) {
                return map.get(str);
            }
        }
        com.bytedance.adsdk.zb.zb.ycx ycxVarKgy = kgy();
        if (ycxVarKgy != null) {
            return ycxVarKgy.ycx(syaVar);
        }
        return null;
    }

    private void ycx(Canvas canvas) {
        com.bytedance.adsdk.zb.sya.sya.zb zbVar = this.htf;
        ul ulVar = this.f22856dj;
        if (zbVar == null || ulVar == null) {
            return;
        }
        this.tru.reset();
        if (!getBounds().isEmpty()) {
            this.tru.preScale(r2.width() / ulVar.dj().width(), r2.height() / ulVar.dj().height());
            this.tru.preTranslate(r2.left, r2.top);
        }
        zbVar.ycx(canvas, this.tru, this.thx);
    }

    private void ycx(Canvas canvas, com.bytedance.adsdk.zb.sya.sya.zb zbVar) {
        if (this.f22856dj == null || zbVar == null) {
            return;
        }
        yzp();
        canvas.getMatrix(this.dwi);
        canvas.getClipBounds(this.rmf);
        ycx(this.rmf, this.aeu);
        this.dwi.mapRect(this.aeu);
        ycx(this.aeu, this.rmf);
        if (this.f22867uh) {
            this.yzp.set(0.0f, 0.0f, getIntrinsicWidth(), getIntrinsicHeight());
        } else {
            zbVar.ycx(this.yzp, (Matrix) null, false);
        }
        this.dwi.mapRect(this.yzp);
        Rect bounds = getBounds();
        float fWidth = bounds.width() / getIntrinsicWidth();
        float fHeight = bounds.height() / getIntrinsicHeight();
        ycx(this.yzp, fWidth, fHeight);
        if (!dwi()) {
            RectF rectF = this.yzp;
            Rect rect = this.rmf;
            rectF.intersect(rect.left, rect.top, rect.right, rect.bottom);
        }
        int iCeil = (int) Math.ceil(this.yzp.width());
        int iCeil2 = (int) Math.ceil(this.yzp.height());
        if (iCeil == 0 || iCeil2 == 0) {
            return;
        }
        zb(iCeil, iCeil2);
        if (this.dc) {
            this.tru.set(this.dwi);
            this.tru.preScale(fWidth, fHeight);
            Matrix matrix = this.tru;
            RectF rectF2 = this.yzp;
            matrix.postTranslate(-rectF2.left, -rectF2.top);
            this.bhi.eraseColor(0);
            zbVar.ycx(this.f22855av, this.tru, this.thx);
            this.dwi.invert(this.oby);
            this.oby.mapRect(this.ifb, this.yzp);
            ycx(this.ifb, this.kgy);
        }
        this.rmy.set(0, 0, iCeil, iCeil2);
        canvas.drawBitmap(this.bhi, this.rmy, this.kgy, this.f22869xz);
    }

    private void ycx(RectF rectF, Rect rect) {
        rect.set((int) Math.floor(rectF.left), (int) Math.floor(rectF.top), (int) Math.ceil(rectF.right), (int) Math.ceil(rectF.bottom));
    }

    private void ycx(Rect rect, RectF rectF) {
        rectF.set(rect.left, rect.top, rect.right, rect.bottom);
    }

    private void ycx(RectF rectF, float f11, float f12) {
        rectF.set(rectF.left * f11, rectF.top * f12, rectF.right * f11, rectF.bottom * f12);
    }
}
