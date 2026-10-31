package com.bytedance.adsdk.ugeno.jc.dj;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.net.Uri;
import android.util.Log;
import android.view.MotionEvent;
import android.widget.ImageView;
import com.bytedance.adsdk.ugeno.core.IAnimation;
import com.bytedance.adsdk.ugeno.lud;
import com.bytedance.adsdk.ugeno.ycx.fby;
import com.bytedance.adsdk.ugeno.ycx.ul;
import h6.c1;
import java.util.HashMap;

/* loaded from: classes2.dex */
public class ycx extends ImageView implements IAnimation, ul {

    /* renamed from: zb, reason: collision with root package name */
    static final /* synthetic */ boolean f22297zb = true;

    /* renamed from: av, reason: collision with root package name */
    private Bitmap f22298av;
    private Canvas bhi;

    /* renamed from: dv, reason: collision with root package name */
    private Path f22299dv;

    /* renamed from: dy, reason: collision with root package name */
    private int f22300dy;

    /* renamed from: ea, reason: collision with root package name */
    private Drawable f22301ea;
    private float fby;

    /* renamed from: hf, reason: collision with root package name */
    private float f22302hf;
    private lud htf;

    /* renamed from: jc, reason: collision with root package name */
    private boolean f22303jc;

    /* renamed from: jw, reason: collision with root package name */
    private ColorFilter f22304jw;

    /* renamed from: lt, reason: collision with root package name */
    private Drawable f22305lt;
    private final float[] lud;

    /* renamed from: ok, reason: collision with root package name */
    private boolean f22306ok;
    private Paint oty;
    private Shader.TileMode pmi;
    private final RectF rmf;

    /* renamed from: ry, reason: collision with root package name */
    private boolean f22307ry;
    private float sya;
    private int syc;
    private fby thx;

    /* renamed from: tn, reason: collision with root package name */
    private float f22308tn;
    private float tru;

    /* renamed from: uh, reason: collision with root package name */
    private Shader.TileMode f22309uh;

    /* renamed from: ul, reason: collision with root package name */
    private ColorStateList f22310ul;
    private ImageView.ScaleType wie;
    private boolean wwx;
    private boolean xkz;
    public static final Shader.TileMode ycx = Shader.TileMode.CLAMP;

    /* renamed from: dj, reason: collision with root package name */
    private static final ImageView.ScaleType[] f22296dj = {ImageView.ScaleType.MATRIX, ImageView.ScaleType.FIT_XY, ImageView.ScaleType.FIT_START, ImageView.ScaleType.FIT_CENTER, ImageView.ScaleType.FIT_END, ImageView.ScaleType.CENTER, ImageView.ScaleType.CENTER_CROP, ImageView.ScaleType.CENTER_INSIDE};

    /* renamed from: com.bytedance.adsdk.ugeno.jc.dj.ycx$1, reason: invalid class name */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] ycx;

        static {
            int[] iArr = new int[ImageView.ScaleType.values().length];
            ycx = iArr;
            try {
                iArr[ImageView.ScaleType.FIT_CENTER.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                ycx[ImageView.ScaleType.FIT_START.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                ycx[ImageView.ScaleType.FIT_END.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                ycx[ImageView.ScaleType.FIT_XY.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                ycx[ImageView.ScaleType.CENTER.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                ycx[ImageView.ScaleType.CENTER_CROP.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                ycx[ImageView.ScaleType.CENTER_INSIDE.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
        }
    }

    public ycx(Context context) {
        super(context);
        this.lud = new float[]{0.0f, 0.0f, 0.0f, 0.0f};
        this.f22310ul = ColorStateList.valueOf(-16777216);
        this.fby = 0.0f;
        this.f22304jw = null;
        this.f22303jc = false;
        this.f22306ok = false;
        this.f22307ry = false;
        this.xkz = false;
        Shader.TileMode tileMode = ycx;
        this.pmi = tileMode;
        this.f22309uh = tileMode;
        this.wwx = false;
        this.f22308tn = 50.0f;
        this.rmf = new RectF();
        this.thx = new fby(this);
    }

    private void dj() {
        Drawable drawable = this.f22301ea;
        if (drawable == null || !this.f22303jc) {
            return;
        }
        Drawable drawableMutate = drawable.mutate();
        this.f22301ea = drawableMutate;
        if (this.f22306ok) {
            drawableMutate.setColorFilter(this.f22304jw);
        }
    }

    private void sya() {
        ycx(this.f22301ea, this.wie);
    }

    private Drawable ycx() throws Resources.NotFoundException {
        Resources resources = getResources();
        Drawable drawable = null;
        if (resources == null) {
            return null;
        }
        int i5 = this.syc;
        if (i5 != 0) {
            try {
                drawable = resources.getDrawable(i5);
            } catch (Exception e3) {
                Log.w("RoundedImageView", "Unable to find resource: " + this.syc, e3);
                this.syc = 0;
            }
        }
        return zb.ycx(drawable);
    }

    private Drawable zb() throws Resources.NotFoundException {
        Resources resources = getResources();
        Drawable drawable = null;
        if (resources == null) {
            return null;
        }
        int i5 = this.f22300dy;
        if (i5 != 0) {
            try {
                drawable = resources.getDrawable(i5);
            } catch (Exception e3) {
                Log.w("RoundedImageView", "Unable to find resource: " + this.f22300dy, e3);
                this.f22300dy = 0;
            }
        }
        return zb.ycx(drawable);
    }

    @Override // android.view.View
    public void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        lud ludVar = this.htf;
        if (ludVar != null) {
            ludVar.zb(canvas);
        }
    }

    @Override // android.widget.ImageView, android.view.View
    public void drawableStateChanged() {
        super.drawableStateChanged();
        invalidate();
    }

    public int getBorderColor() {
        return this.f22310ul.getDefaultColor();
    }

    public ColorStateList getBorderColors() {
        return this.f22310ul;
    }

    public float getBorderRadius() {
        return this.thx.ycx();
    }

    public float getBorderWidth() {
        return this.fby;
    }

    public float getCornerRadius() {
        return getMaxCornerRadius();
    }

    public float getMaxCornerRadius() {
        float fMax = 0.0f;
        for (float f11 : this.lud) {
            fMax = Math.max(f11, fMax);
        }
        return fMax;
    }

    @Override // com.bytedance.adsdk.ugeno.core.IAnimation, com.bytedance.adsdk.ugeno.ycx.ul
    public float getRipple() {
        return this.sya;
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ul
    public float getRubIn() {
        return this.thx.getRubIn();
    }

    @Override // android.widget.ImageView
    public ImageView.ScaleType getScaleType() {
        return this.wie;
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ul
    public float getShine() {
        return this.thx.getShine();
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.ul
    public float getStretch() {
        return this.thx.getStretch();
    }

    public Shader.TileMode getTileModeX() {
        return this.pmi;
    }

    public Shader.TileMode getTileModeY() {
        return this.f22309uh;
    }

    @Override // android.widget.ImageView, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        lud ludVar = this.htf;
        if (ludVar != null) {
            ludVar.ul();
        }
    }

    @Override // android.widget.ImageView, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        lud ludVar = this.htf;
        if (ludVar != null) {
            ludVar.fby();
        }
        Canvas canvas = this.bhi;
        if (canvas != null) {
            canvas.setBitmap(null);
        }
        Bitmap bitmap = this.f22298av;
        if (bitmap != null) {
            bitmap.recycle();
            this.bhi = null;
        }
    }

    @Override // android.widget.ImageView, android.view.View
    public void onDraw(Canvas canvas) {
        Canvas canvas2;
        if (!this.wwx || (canvas2 = this.bhi) == null || this.f22298av == null) {
            super.onDraw(canvas);
        } else {
            super.onDraw(canvas2);
            this.bhi.drawPath(this.f22299dv, this.oty);
            canvas.drawBitmap(this.f22298av, 0.0f, 0.0f, (Paint) null);
        }
        lud ludVar = this.htf;
        if (ludVar != null) {
            ludVar.ycx(canvas, this);
            this.htf.ycx(canvas);
        }
    }

    @Override // android.view.View
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        lud ludVar = this.htf;
        if (ludVar != null) {
            ludVar.ycx(i5, i11, i12, i13);
        }
        super.onLayout(z11, i5, i11, i12, i13);
    }

    @Override // android.widget.ImageView, android.view.View
    public void onMeasure(int i5, int i11) {
        lud ludVar = this.htf;
        if (ludVar == null) {
            super.onMeasure(i5, i11);
        } else {
            int[] iArrYcx = ludVar.ycx(i5, i11);
            super.onMeasure(iArrYcx[0], iArrYcx[1]);
        }
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        lud ludVar = this.htf;
        if (ludVar != null) {
            ludVar.zb(i5, i11, i12, i12);
        }
        if (i5 <= 0 || i11 <= 0 || !this.wwx) {
            return;
        }
        this.f22298av = Bitmap.createBitmap(i5, i11, Bitmap.Config.ARGB_8888);
        this.bhi = new Canvas(this.f22298av);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        int iWidth;
        if (!this.wwx) {
            return super.onTouchEvent(motionEvent);
        }
        this.htf.ul();
        float x11 = motionEvent.getX();
        float y11 = motionEvent.getY();
        int action = motionEvent.getAction();
        if (action == 0) {
            this.f22299dv.moveTo(x11, y11);
            this.f22302hf = x11;
            this.tru = y11;
            HashMap map = new HashMap();
            map.put("state", 1);
            this.htf.ycx("eraseState", map);
        } else if (action == 1) {
            this.f22299dv.computeBounds(this.rmf, true);
            try {
                iWidth = (int) (((this.rmf.width() * this.rmf.height()) / (getWidth() * getHeight())) * 100.0f);
            } catch (Exception unused) {
                iWidth = 0;
            }
            HashMap map2 = new HashMap();
            c1.x(2, map2, "state", iWidth, "percent");
            this.htf.ycx("eraseState", map2);
        } else if (action == 2 && x11 > 0.0f && x11 < getWidth() && y11 > 0.0f && y11 < getHeight()) {
            float f11 = this.f22302hf;
            float f12 = this.tru;
            this.f22299dv.quadTo(f11, f12, (f11 + x11) / 2.0f, (f12 + y11) / 2.0f);
            this.f22302hf = x11;
            this.tru = y11;
        }
        postInvalidate();
        return true;
    }

    @Override // android.view.View
    public void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        lud ludVar = this.htf;
        if (ludVar != null) {
            ludVar.ycx(z11);
        }
    }

    @Override // android.view.View
    public void setBackground(Drawable drawable) {
        setBackgroundDrawable(drawable);
    }

    @Override // android.view.View
    public void setBackgroundColor(int i5) {
        ColorDrawable colorDrawable = new ColorDrawable(i5);
        this.f22305lt = colorDrawable;
        setBackgroundDrawable(colorDrawable);
    }

    @Override // android.view.View
    @Deprecated
    public void setBackgroundDrawable(Drawable drawable) {
        this.f22305lt = drawable;
        ycx(true);
        super.setBackgroundDrawable(this.f22305lt);
    }

    @Override // android.view.View
    public void setBackgroundResource(int i5) throws Resources.NotFoundException {
        if (this.f22300dy != i5) {
            this.f22300dy = i5;
            Drawable drawableZb = zb();
            this.f22305lt = drawableZb;
            setBackgroundDrawable(drawableZb);
        }
    }

    public void setBorderColor(int i5) {
        setBorderColor(ColorStateList.valueOf(i5));
    }

    public void setBorderRadius(float f11) {
        fby fbyVar = this.thx;
        if (fbyVar != null) {
            fbyVar.ycx(f11);
        }
    }

    public void setBorderWidth(int i5) {
        setBorderWidth(getResources().getDimension(i5));
    }

    @Override // android.widget.ImageView
    public void setColorFilter(ColorFilter colorFilter) {
        if (this.f22304jw != colorFilter) {
            this.f22304jw = colorFilter;
            this.f22306ok = true;
            this.f22303jc = true;
            dj();
            invalidate();
        }
    }

    public void setCornerRadius(float f11) {
        ycx(f11, f11, f11, f11);
    }

    public void setCornerRadiusDimen(int i5) throws Resources.NotFoundException {
        float dimension = getResources().getDimension(i5);
        ycx(dimension, dimension, dimension, dimension);
    }

    public void setEraseEnabled(boolean z11) {
        if (z11) {
            this.f22299dv = new Path();
            Paint paint = new Paint();
            this.oty = paint;
            paint.setAntiAlias(true);
            this.oty.setDither(true);
            this.oty.setStyle(Paint.Style.STROKE);
            this.oty.setStrokeWidth(this.f22308tn * 2.0f);
            this.oty.setStrokeCap(Paint.Cap.ROUND);
            this.oty.setStrokeJoin(Paint.Join.ROUND);
            this.oty.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
            this.oty.setColor(0);
            this.wwx = true;
        } else {
            this.wwx = false;
        }
        postInvalidate();
    }

    public void setEraseRadius(float f11) {
        this.f22308tn = f11;
        Paint paint = this.oty;
        if (paint != null) {
            paint.setStrokeWidth(f11 * 2.0f);
        }
    }

    @Override // android.widget.ImageView
    public void setImageBitmap(Bitmap bitmap) {
        this.syc = 0;
        this.f22301ea = zb.ycx(bitmap);
        sya();
        super.setImageDrawable(this.f22301ea);
    }

    @Override // android.widget.ImageView
    public void setImageDrawable(Drawable drawable) {
        this.syc = 0;
        this.f22301ea = zb.ycx(drawable);
        sya();
        super.setImageDrawable(drawable);
    }

    @Override // android.widget.ImageView
    public void setImageResource(int i5) {
        if (this.syc != i5) {
            this.syc = i5;
            this.f22301ea = ycx();
            sya();
            super.setImageDrawable(this.f22301ea);
        }
    }

    @Override // android.widget.ImageView
    public void setImageURI(Uri uri) {
        super.setImageURI(uri);
        setImageDrawable(getDrawable());
    }

    public void setOval(boolean z11) {
        this.f22307ry = z11;
        sya();
        ycx(false);
        invalidate();
    }

    @Override // com.bytedance.adsdk.ugeno.core.IAnimation
    public void setRipple(float f11) {
        this.sya = f11;
        fby fbyVar = this.thx;
        if (fbyVar != null) {
            fbyVar.zb(f11);
        }
        postInvalidate();
    }

    public void setRubIn(float f11) {
        fby fbyVar = this.thx;
        if (fbyVar != null) {
            fbyVar.lud(f11);
        }
    }

    @Override // android.widget.ImageView
    public void setScaleType(ImageView.ScaleType scaleType) {
        if (!f22297zb && scaleType == null) {
            throw new AssertionError();
        }
        if (this.wie != scaleType) {
            this.wie = scaleType;
            int i5 = AnonymousClass1.ycx[scaleType.ordinal()];
            if (i5 == 1 || i5 == 2 || i5 == 3 || i5 == 4) {
                super.setScaleType(scaleType);
            } else {
                super.setScaleType(ImageView.ScaleType.FIT_XY);
            }
            sya();
            ycx(false);
            invalidate();
        }
    }

    public void setShine(float f11) {
        fby fbyVar = this.thx;
        if (fbyVar != null) {
            fbyVar.sya(f11);
        }
    }

    public void setStretch(float f11) {
        fby fbyVar = this.thx;
        if (fbyVar != null) {
            fbyVar.dj(f11);
        }
    }

    public void setTileModeX(Shader.TileMode tileMode) {
        if (this.pmi == tileMode) {
            return;
        }
        this.pmi = tileMode;
        sya();
        ycx(false);
        invalidate();
    }

    public void setTileModeY(Shader.TileMode tileMode) {
        if (this.f22309uh == tileMode) {
            return;
        }
        this.f22309uh = tileMode;
        sya();
        ycx(false);
        invalidate();
    }

    public void setBorderColor(ColorStateList colorStateList) {
        if (this.f22310ul.equals(colorStateList)) {
            return;
        }
        if (colorStateList == null) {
            colorStateList = ColorStateList.valueOf(-16777216);
        }
        this.f22310ul = colorStateList;
        sya();
        ycx(false);
        if (this.fby > 0.0f) {
            invalidate();
        }
    }

    public void setBorderWidth(float f11) {
        if (this.fby == f11) {
            return;
        }
        this.fby = f11;
        sya();
        ycx(false);
        invalidate();
    }

    private void ycx(boolean z11) {
        if (this.xkz) {
            if (z11) {
                this.f22305lt = zb.ycx(this.f22305lt);
            }
            ycx(this.f22305lt, ImageView.ScaleType.FIT_XY);
        }
    }

    private void ycx(Drawable drawable, ImageView.ScaleType scaleType) {
        if (drawable == null) {
            return;
        }
        if (drawable instanceof zb) {
            zb zbVar = (zb) drawable;
            zbVar.ycx(scaleType).ycx(this.fby).ycx(this.f22310ul).ycx(this.f22307ry).ycx(this.pmi).zb(this.f22309uh);
            float[] fArr = this.lud;
            if (fArr != null) {
                zbVar.ycx(fArr[0], fArr[1], fArr[2], fArr[3]);
            }
            dj();
            return;
        }
        if (drawable instanceof LayerDrawable) {
            LayerDrawable layerDrawable = (LayerDrawable) drawable;
            int numberOfLayers = layerDrawable.getNumberOfLayers();
            for (int i5 = 0; i5 < numberOfLayers; i5++) {
                ycx(layerDrawable.getDrawable(i5), scaleType);
            }
        }
    }

    public void ycx(float f11, float f12, float f13, float f14) {
        float[] fArr = this.lud;
        if (fArr[0] == f11 && fArr[1] == f12 && fArr[2] == f14 && fArr[3] == f13) {
            return;
        }
        fArr[0] = f11;
        fArr[1] = f12;
        fArr[3] = f13;
        fArr[2] = f14;
        sya();
        ycx(false);
        invalidate();
    }

    public void ycx(lud ludVar) {
        this.htf = ludVar;
    }
}
