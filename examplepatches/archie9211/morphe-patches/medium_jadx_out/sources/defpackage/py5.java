package defpackage;

import android.R;
import android.animation.AnimatorSet;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PointF;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.GestureDetector;
import android.view.ScaleGestureDetector;
import android.view.ViewConfiguration;
import android.view.animation.DecelerateInterpolator;
import android.widget.ImageView;
import androidx.core.widget.nRCC.nGxjfIr;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class py5 extends ImageView {
    public static final /* synthetic */ int z = 0;
    public final Matrix a;
    public final Matrix b;
    public Matrix c;
    public p0g d;
    public boolean e;
    public float f;
    public float g;
    public boolean h;
    public boolean i;
    public final Matrix j;
    public final float[] k;
    public my5 l;
    public boolean m;
    public boolean n;
    public final int o;
    public final int p;
    public final int q;
    public final PointF r;
    public final RectF s;
    public final RectF t;
    public final RectF u;
    public final PointF v;
    public final RectF w;
    public final RectF x;
    public AnimatorSet y;

    public py5(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        this.a = new Matrix();
        this.b = new Matrix();
        this.d = null;
        this.e = false;
        this.f = -1.0f;
        this.g = -1.0f;
        this.j = new Matrix();
        this.k = new float[9];
        this.l = my5.FIT_IF_BIGGER;
        this.r = new PointF();
        this.s = new RectF();
        this.t = new RectF();
        this.u = new RectF();
        this.v = new PointF();
        this.w = new RectF();
        this.x = new RectF();
        ImageViewTouch imageViewTouch = (ImageViewTouch) this;
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        imageViewTouch.p = viewConfiguration.getScaledMinimumFlingVelocity();
        imageViewTouch.q = viewConfiguration.getScaledMaximumFlingVelocity();
        imageViewTouch.o = imageViewTouch.getResources().getInteger(R.integer.config_shortAnimTime);
        imageViewTouch.setScaleType(ImageView.ScaleType.MATRIX);
        ViewConfiguration.get(imageViewTouch.getContext()).getScaledTouchSlop();
        imageViewTouch.D = imageViewTouch.getGestureListener();
        imageViewTouch.E = imageViewTouch.getScaleListener();
        imageViewTouch.B = new ScaleGestureDetector(imageViewTouch.getContext(), imageViewTouch.E);
        imageViewTouch.C = new GestureDetector(imageViewTouch.getContext(), imageViewTouch.D, null, true);
        imageViewTouch.setQuickScaleEnabled(false);
    }

    public final void a() {
        if (getDrawable() == null) {
            return;
        }
        RectF rectFB = b(this.b);
        float f = rectFB.left;
        if (f == 0.0f && rectFB.top == 0.0f) {
            return;
        }
        g(f, rectFB.top);
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x006e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.graphics.RectF b(android.graphics.Matrix r8) {
        /*
            r7 = this;
            android.graphics.drawable.Drawable r0 = r7.getDrawable()
            r1 = 0
            if (r0 != 0) goto Ld
            android.graphics.RectF r7 = new android.graphics.RectF
            r7.<init>(r1, r1, r1, r1)
            return r7
        Ld:
            android.graphics.RectF r0 = r7.u
            r0.set(r1, r1, r1, r1)
            android.graphics.Matrix r2 = r7.a
            android.graphics.Matrix r3 = r7.j
            r3.set(r2)
            r3.postConcat(r8)
            android.graphics.RectF r8 = r7.s
            android.graphics.RectF r2 = r7.t
            r3.mapRect(r2, r8)
            float r8 = r2.height()
            float r3 = r2.width()
            android.graphics.RectF r7 = r7.w
            float r4 = r7.height()
            int r4 = (r8 > r4 ? 1 : (r8 == r4 ? 0 : -1))
            r5 = 1073741824(0x40000000, float:2.0)
            if (r4 >= 0) goto L44
            float r4 = r7.height()
            float r4 = r4 - r8
            float r4 = r4 / r5
            float r8 = r2.top
            float r6 = r7.top
            float r8 = r8 - r6
        L42:
            float r4 = r4 - r8
            goto L59
        L44:
            float r8 = r2.top
            float r4 = r7.top
            int r6 = (r8 > r4 ? 1 : (r8 == r4 ? 0 : -1))
            if (r6 <= 0) goto L4f
            float r8 = r8 - r4
            float r4 = -r8
            goto L59
        L4f:
            float r8 = r2.bottom
            float r4 = r7.bottom
            int r6 = (r8 > r4 ? 1 : (r8 == r4 ? 0 : -1))
            if (r6 >= 0) goto L58
            goto L42
        L58:
            r4 = r1
        L59:
            float r8 = r7.width()
            int r8 = (r3 > r8 ? 1 : (r3 == r8 ? 0 : -1))
            if (r8 >= 0) goto L6e
            float r8 = r7.width()
            float r8 = r8 - r3
            float r8 = r8 / r5
            float r2 = r2.left
            float r7 = r7.left
            float r2 = r2 - r7
            float r8 = r8 - r2
            goto L85
        L6e:
            float r8 = r2.left
            float r3 = r7.left
            int r5 = (r8 > r3 ? 1 : (r8 == r3 ? 0 : -1))
            if (r5 <= 0) goto L79
            float r8 = r8 - r3
            float r8 = -r8
            goto L85
        L79:
            float r8 = r2.right
            float r7 = r7.right
            int r2 = (r8 > r7 ? 1 : (r8 == r7 ? 0 : -1))
            if (r2 >= 0) goto L84
            float r8 = r7 - r8
            goto L85
        L84:
            r8 = r1
        L85:
            r0.set(r8, r4, r1, r1)
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.py5.b(android.graphics.Matrix):android.graphics.RectF");
    }

    public final float c(my5 my5Var) {
        float width;
        float fD;
        float fWidth;
        if (my5Var == my5.FIT_TO_SCREEN) {
            return 1.0f;
        }
        my5 my5Var2 = my5.FIT_IF_BIGGER;
        Matrix matrix = this.a;
        if (my5Var == my5Var2) {
            return Math.min(1.0f, 1.0f / d(matrix, 0));
        }
        my5 my5Var3 = my5.FIT_HEIGHT;
        RectF rectF = this.s;
        if (my5Var == my5Var3) {
            width = getHeight();
            fD = d(matrix, 4);
            fWidth = rectF.height();
        } else {
            if (my5Var != my5.FIT_WIDTH) {
                return 1.0f / d(matrix, 0);
            }
            width = getWidth();
            fD = d(matrix, 0);
            fWidth = rectF.width();
        }
        return width / (fWidth * fD);
    }

    public final float d(Matrix matrix, int i) {
        float[] fArr = this.k;
        matrix.getValues(fArr);
        return fArr[i];
    }

    public abstract void e();

    public final void f(double d, double d2) {
        getBitmapRect();
        float f = (float) d2;
        PointF pointF = this.v;
        pointF.set((float) d, f);
        float f2 = pointF.x;
        if (f2 == 0.0f && pointF.y == 0.0f) {
            return;
        }
        g(f2, pointF.y);
        a();
    }

    public final void g(float f, float f2) {
        if (f == 0.0f && f2 == 0.0f) {
            return;
        }
        this.b.postTranslate(f, f2);
        setImageMatrix(getImageViewMatrix());
    }

    public float getBaseScale() {
        return d(this.a, 0);
    }

    public boolean getBitmapChanged() {
        return this.n;
    }

    public RectF getBitmapRect() {
        Matrix matrix = this.a;
        Matrix matrix2 = this.j;
        matrix2.set(matrix);
        matrix2.postConcat(this.b);
        RectF rectF = this.s;
        RectF rectF2 = this.t;
        matrix2.mapRect(rectF2, rectF);
        return rectF2;
    }

    public PointF getCenter() {
        return this.r;
    }

    public Matrix getDisplayMatrix() {
        return new Matrix(this.b);
    }

    public my5 getDisplayType() {
        return this.l;
    }

    public Matrix getImageViewMatrix() {
        Matrix matrix = this.a;
        Matrix matrix2 = this.j;
        matrix2.set(matrix);
        matrix2.postConcat(this.b);
        return matrix2;
    }

    public float getMaxScale() {
        float fMax = this.f;
        if (fMax == -1.0f) {
            if (getDrawable() == null) {
                fMax = 1.0f;
            } else {
                RectF rectF = this.s;
                float fWidth = rectF.width();
                RectF rectF2 = this.w;
                fMax = Math.max(fWidth / rectF2.width(), rectF.height() / rectF2.height()) * 4.0f;
            }
            this.f = fMax;
        }
        return fMax;
    }

    public float getMinScale() {
        float fMin = this.g;
        if (fMin == -1.0f) {
            fMin = getDrawable() == null ? 1.0f : Math.min(1.0f, 1.0f / d(this.a, 0));
            this.g = fMin;
        }
        return fMin;
    }

    @Override // android.view.View
    public float getRotation() {
        return 0.0f;
    }

    public float getScale() {
        return d(this.b, 0);
    }

    public final void h(Drawable drawable) {
        boolean z2 = false;
        if (getWidth() <= 0) {
            this.d = new p0g(this, drawable, z2, 7);
            return;
        }
        this.a.reset();
        super.setImageDrawable(drawable);
        this.g = -1.0f;
        this.f = -1.0f;
        this.i = false;
        this.h = false;
        this.n = true;
        RectF rectF = this.s;
        if (drawable != null) {
            rectF.set(0.0f, 0.0f, drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight());
        } else {
            rectF.setEmpty();
        }
        requestLayout();
    }

    public final void i(float f) {
        if (f > getMaxScale()) {
            f = getMaxScale();
        }
        if (f < getMinScale()) {
            f = getMinScale();
        }
        PointF center = getCenter();
        j(f, center.x, center.y);
    }

    public final void j(float f, float f2, float f3) {
        if (f > getMaxScale()) {
            f = getMaxScale();
        }
        float scale = f / getScale();
        this.b.postScale(scale, scale, f2, f3);
        setImageMatrix(getImageViewMatrix());
        getScale();
        a();
    }

    public final void k(float f, float f2, float f3, long j) {
        if (f > getMaxScale()) {
            f = getMaxScale();
        }
        float scale = getScale();
        Matrix matrix = new Matrix(this.b);
        matrix.postScale(f, f, f2, f3);
        RectF rectFB = b(matrix);
        float f4 = (rectFB.left * f) + f2;
        float f5 = (rectFB.top * f) + f3;
        AnimatorSet animatorSet = this.y;
        if (animatorSet != null) {
            animatorSet.cancel();
            this.y = null;
        }
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(scale, f);
        valueAnimatorOfFloat.setDuration(j);
        valueAnimatorOfFloat.setInterpolator(new DecelerateInterpolator(1.0f));
        valueAnimatorOfFloat.addUpdateListener(new ly5(this, f4, f5));
        valueAnimatorOfFloat.start();
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (this.e) {
            this.e = Math.abs(getScale() - getMinScale()) > 0.1f;
        }
    }

    @Override // android.widget.ImageView, android.view.View
    public final void onDraw(Canvas canvas) {
        if (getScaleType() != ImageView.ScaleType.FIT_XY) {
            super.onDraw(canvas);
            return;
        }
        Drawable drawable = getDrawable();
        if (drawable != null) {
            drawable.draw(canvas);
        }
    }

    public void setDisplayType(my5 my5Var) {
        if (my5Var != this.l) {
            this.e = false;
            this.l = my5Var;
            this.m = true;
            requestLayout();
        }
    }

    @Override // android.widget.ImageView
    public void setImageBitmap(Bitmap bitmap) {
        if (bitmap == null) {
            h(null);
            return;
        }
        r94 r94Var = new r94();
        r94Var.a = bitmap;
        r94Var.c = bitmap.getWidth();
        r94Var.d = bitmap.getHeight();
        Paint paint = new Paint();
        r94Var.b = paint;
        paint.setDither(true);
        paint.setFilterBitmap(true);
        h(r94Var);
    }

    @Override // android.widget.ImageView
    public void setImageDrawable(Drawable drawable) {
        h(drawable);
    }

    @Override // android.widget.ImageView
    public void setImageMatrix(Matrix matrix) {
        Matrix imageMatrix = getImageMatrix();
        if ((matrix != null || imageMatrix.isIdentity()) && matrix != null) {
            imageMatrix.equals(matrix);
        }
        super.setImageMatrix(matrix);
    }

    @Override // android.widget.ImageView
    public void setImageResource(int i) {
        setImageDrawable(getContext().getResources().getDrawable(i));
    }

    public void setMaxScale(float f) {
        this.f = f;
    }

    public void setMinScale(float f) {
        this.g = f;
    }

    public void setOnDrawableChangedListener(ny5 ny5Var) {
    }

    public void setOnLayoutChangeListener(oy5 oy5Var) {
    }

    @Override // android.view.View
    public final void onLayout(boolean z2, int i, int i2, int i3, int i4) {
        float fWidth;
        float fHeight;
        boolean z3;
        float fC;
        float f;
        boolean z4;
        RectF rectF = this.w;
        if (z2) {
            RectF rectF2 = this.x;
            rectF2.set(rectF);
            rectF.set(i, i2, i3, i4);
            float fCenterX = rectF.centerX();
            PointF pointF = this.r;
            pointF.x = fCenterX;
            pointF.y = rectF.centerY();
            fWidth = rectF.width() - rectF2.width();
            fHeight = rectF.height() - rectF2.height();
        } else {
            fWidth = 0.0f;
            fHeight = 0.0f;
        }
        super.onLayout(z2, i, i2, i3, i4);
        p0g p0gVar = this.d;
        if (p0gVar != null) {
            this.d = null;
            p0gVar.run();
        }
        if (getDrawable() == null) {
            boolean z5 = this.n;
            if (z2 || z5 || this.m) {
                e();
            }
            if (this.n) {
                z3 = false;
                this.n = false;
            } else {
                z3 = false;
            }
            if (this.m) {
                this.m = z3;
                return;
            }
            return;
        }
        if (z2 || this.m || this.n) {
            boolean z6 = this.n;
            Matrix matrix = this.a;
            if (z6) {
                this.e = false;
                matrix.reset();
                if (!this.i) {
                    this.g = -1.0f;
                }
                if (!this.h) {
                    this.f = -1.0f;
                }
            }
            c(getDisplayType());
            float fD = d(matrix, 0);
            float scale = getScale();
            float fMin = Math.min(1.0f, 1.0f / fD);
            RectF rectF3 = this.s;
            float fWidth2 = rectF3.width();
            float fHeight2 = rectF3.height();
            matrix.reset();
            float fMin2 = Math.min(rectF.width() / fWidth2, rectF.height() / fHeight2);
            matrix.postScale(fMin2, fMin2);
            matrix.postTranslate(rectF.left, rectF.top);
            matrix.postTranslate((rectF.width() - (fWidth2 * fMin2)) / 2.0f, (rectF.height() - (fHeight2 * fMin2)) / 2.0f);
            float[] fArr = this.k;
            matrix.getValues(fArr);
            float f2 = fArr[0];
            matrix.getValues(fArr);
            float f3 = fArr[4];
            matrix.getValues(fArr);
            float f4 = fArr[2];
            matrix.getValues(fArr);
            Log.d("ImageViewTouchBase", "matrix: { x: " + f4 + ", y: " + fArr[5] + ", scalex: " + f2 + ", scaley: " + f3 + nGxjfIr.UvJyhQaDIE);
            matrix.getValues(fArr);
            float f5 = fArr[0];
            if (this.n || this.m) {
                Matrix matrix2 = this.c;
                Matrix matrix3 = this.b;
                if (matrix2 != null) {
                    matrix3.set(matrix2);
                    this.c = null;
                    fC = getScale();
                } else {
                    matrix3.reset();
                    fC = c(getDisplayType());
                }
                f = fC;
                setImageMatrix(getImageViewMatrix());
                if (f != getScale()) {
                    i(f);
                }
            } else if (z2) {
                if (!this.i) {
                    this.g = -1.0f;
                }
                if (!this.h) {
                    this.f = -1.0f;
                }
                setImageMatrix(getImageViewMatrix());
                g(-fWidth, -fHeight);
                if (this.e) {
                    f = Math.abs(scale - fMin) > 0.1f ? (fD / f5) * scale : 1.0f;
                    i(f);
                } else {
                    float fC2 = c(getDisplayType());
                    i(fC2);
                    f = fC2;
                }
            } else {
                f = 1.0f;
            }
            if (f > getMaxScale() || f < getMinScale()) {
                i(f);
            }
            a();
            boolean z7 = this.n;
            if (z2 || z7 || this.m) {
                e();
            }
            if (this.m) {
                z4 = false;
                this.m = false;
            } else {
                z4 = false;
            }
            if (this.n) {
                this.n = z4;
            }
        }
    }
}
