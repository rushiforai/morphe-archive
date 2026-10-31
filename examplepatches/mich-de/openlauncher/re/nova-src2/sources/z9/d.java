package z9;

import aa.i0;
import aa.n;
import aa.p;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PathMeasure;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.Pair;
import android.util.SparseArray;
import android.view.ContextThemeWrapper;
import com.android.launcher3.icons.BitmapInfo;
import fz.r;
import java.lang.ref.WeakReference;
import java.util.regex.Pattern;
import o9.g3;
import o9.t1;
import s9.k;

/* loaded from: classes2.dex */
public final class d extends n {
    public static final jz.b J = new jz.b(9, Float.TYPE, "internalStateProgress");
    public static final SparseArray K = new SparseArray();
    public int A;
    public float B;
    public float C;
    public boolean D;
    public float E;
    public ObjectAnimator F;
    public final boolean G;
    public final Drawable H;
    public final int I;
    public final Matrix o;

    /* renamed from: p, reason: collision with root package name */
    public final PathMeasure f98356p;

    /* renamed from: q, reason: collision with root package name */
    public final ga.f f98357q;

    /* renamed from: r, reason: collision with root package name */
    public final Path f98358r;

    /* renamed from: s, reason: collision with root package name */
    public final Path f98359s;

    /* renamed from: t, reason: collision with root package name */
    public final Path f98360t;

    /* renamed from: u, reason: collision with root package name */
    public final Paint f98361u;

    /* renamed from: v, reason: collision with root package name */
    public Bitmap f98362v;

    /* renamed from: w, reason: collision with root package name */
    public final int f98363w;

    /* renamed from: x, reason: collision with root package name */
    public final int f98364x;

    /* renamed from: y, reason: collision with root package name */
    public final int f98365y;

    /* renamed from: z, reason: collision with root package name */
    public final boolean f98366z;

    public d(ga.f fVar, int i5, int[] iArr, boolean z11) {
        super(fVar.f57304r);
        this.o = new Matrix();
        this.f98356p = new PathMeasure();
        this.f98357q = fVar;
        this.f98358r = p.c();
        this.f98359s = new Path();
        this.f98360t = new Path();
        Paint paint = new Paint(3);
        this.f98361u = paint;
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeCap(Paint.Cap.ROUND);
        this.f98363w = i5;
        this.f98364x = iArr[0];
        this.f98365y = iArr[1];
        this.f98366z = z11;
        setLevel(fVar.f0());
        if (fVar.f57304r.e()) {
            Context context = t1.d().f80132a;
            this.H = context.getDrawable(2131231448);
            this.I = context.getColor(2131099684);
        }
        boolean zP0 = fVar.p0();
        if (this.G != zP0) {
            this.G = zP0;
            j(!zP0);
        }
    }

    public static d m(Context context, ga.f fVar) {
        int iHSVToColor;
        float[] fArr = new float[3];
        Color.colorToHSV(fVar.f57304r.f21152b, fArr);
        if (fArr[1] < 0.2f) {
            iHSVToColor = p.b(context, 16843829);
        } else {
            fArr[2] = Math.max(0.6f, fArr[2]);
            iHSVToColor = Color.HSVToColor(fArr);
        }
        ContextThemeWrapper contextThemeWrapper = new ContextThemeWrapper(context, 16974563);
        int[] iArr = {p.b(contextThemeWrapper, 16843829), p.b(contextThemeWrapper, 16844002)};
        Pattern pattern = g3.f79846a;
        return new d(fVar, iHSVToColor, iArr, (context.getResources().getConfiguration().uiMode & 48) == 32);
    }

    @Override // aa.n
    public final void f(Canvas canvas, Rect rect) {
        Drawable drawable;
        if (this.D) {
            super.f(canvas, rect);
            return;
        }
        float f11 = this.E;
        if (f11 == 0.0f && this.f627b != BitmapInfo.f21149c) {
            super.f(canvas, rect);
            return;
        }
        if (f11 > 0.0f) {
            int i5 = this.G ? this.f98363w : this.f98364x;
            Paint paint = this.f98361u;
            paint.setColor(i5);
            paint.setAlpha(this.A);
            Bitmap bitmap = this.f98362v;
            if (bitmap != null) {
                canvas.drawBitmap(bitmap, rect.left, rect.top, paint);
            }
        }
        int iSave = canvas.save();
        Bitmap bitmap2 = this.f627b;
        Bitmap bitmap3 = BitmapInfo.f21149c;
        Paint paint2 = this.f626a;
        if (bitmap2 != bitmap3 || (drawable = this.H) == null) {
            float f12 = this.C;
            canvas.scale(f12, f12, rect.exactCenterX(), rect.exactCenterY());
            canvas.drawBitmap(this.f627b, (Rect) null, rect, paint2);
        } else {
            paint2.setColorFilter(null);
            paint2.setColor(this.I);
            float f13 = r.f56352b;
            canvas.scale(f13, f13, rect.exactCenterX(), rect.exactCenterY());
            if (this.E > 0.0f) {
                float f14 = this.C;
                canvas.scale(f14, f14, rect.exactCenterX(), rect.exactCenterY());
            }
            Matrix matrix = this.o;
            matrix.setScale(rect.width() / 100.0f, rect.height() / 100.0f);
            matrix.postTranslate(rect.left, rect.top);
            Path path = this.f98358r;
            Path path2 = this.f98359s;
            path.transform(matrix, path2);
            canvas.drawPath(path2, paint2);
            if (this.E <= 0.0f) {
                float f15 = this.C;
                canvas.scale(f15, f15, rect.exactCenterX(), rect.exactCenterY());
            }
            drawable.draw(canvas);
        }
        canvas.restoreToCount(iSave);
    }

    @Override // aa.n, android.graphics.drawable.Drawable
    public final Drawable.ConstantState getConstantState() {
        return new c(this.f627b, this.f628c, !this.f98357q.p0(), this.f98357q, this.f98363w, new int[]{this.f98364x, this.f98365y}, this.f98366z);
    }

    public final void l() {
        if (this.E == 0.0f) {
            this.E = 1.0f;
        }
        o(1.3f, true, true);
    }

    public final void n(float f11) {
        this.E = f11;
        Path path = this.f98359s;
        if (f11 <= 0.0f) {
            this.C = 0.6f;
            path.reset();
            this.A = 255;
        }
        Path path2 = this.f98360t;
        if (f11 < 1.0f && f11 > 0.0f) {
            this.f98356p.getSegment(0.0f, f11 * this.B, path2, true);
            this.C = 0.6f;
            this.A = 255;
        } else if (f11 >= 1.0f) {
            j(this.f98357q.m());
            path.set(path2);
            float f12 = (f11 - 1.0f) / 0.3f;
            if (f12 >= 1.0f) {
                this.C = 1.0f;
                this.A = 0;
            } else {
                this.A = Math.round((1.0f - f12) * 255.0f);
                this.C = (f12 * 0.39999998f) + 0.6f;
            }
        }
        invalidateSelf();
    }

    public final void o(float f11, boolean z11, boolean z12) {
        ObjectAnimator objectAnimator = this.F;
        if (objectAnimator != null) {
            objectAnimator.cancel();
            this.F = null;
        }
        if (Float.compare(f11, this.E) == 0) {
            return;
        }
        if (f11 < this.E) {
            z11 = false;
        }
        if (!z11 || this.D) {
            n(f11);
            return;
        }
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this, J, f11);
        this.F = objectAnimatorOfFloat;
        objectAnimatorOfFloat.setDuration((long) ((f11 - this.E) * 500.0f));
        this.F.setInterpolator(k.f86788a);
        if (z12) {
            this.F.addListener(new i0(this, 25));
        }
        this.F.start();
    }

    @Override // android.graphics.drawable.Drawable
    public final void onBoundsChange(Rect rect) {
        super.onBoundsChange(rect);
        Matrix matrix = this.o;
        matrix.setScale(((rect.width() - 14.0f) - 4.0f) / 100.0f, ((rect.height() - 14.0f) - 4.0f) / 100.0f);
        matrix.postTranslate(rect.left + 7.0f + 2.0f, rect.top + 7.0f + 2.0f);
        Path path = this.f98358r;
        Path path2 = this.f98359s;
        path.transform(matrix, path2);
        float fWidth = rect.width() / 100;
        Paint paint = this.f98361u;
        paint.setStrokeWidth(7.0f * fWidth);
        int iWidth = rect.width();
        int iHeight = rect.height();
        float f11 = fWidth * 2.0f;
        int i5 = ((iWidth << 16) | iHeight) * (this.f98366z ? -1 : 1);
        SparseArray sparseArray = K;
        WeakReference weakReference = (WeakReference) sparseArray.get(i5);
        Pair pair = weakReference != null ? (Pair) weakReference.get() : null;
        Bitmap bitmapCreateBitmap = (pair == null || !((Path) pair.first).equals(path)) ? null : (Bitmap) pair.second;
        if (bitmapCreateBitmap == null) {
            bitmapCreateBitmap = Bitmap.createBitmap(iWidth, iHeight, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bitmapCreateBitmap);
            paint.setShadowLayer(f11, 0.0f, 0.0f, this.G ? 1426063360 : this.f98364x);
            paint.setColor(this.G ? 2012147438 : this.f98365y);
            paint.setAlpha(255);
            canvas.drawPath(path2, paint);
            paint.clearShadowLayer();
            canvas.setBitmap(null);
            sparseArray.put(i5, new WeakReference(Pair.create(path, bitmapCreateBitmap)));
        }
        this.f98362v = bitmapCreateBitmap;
        PathMeasure pathMeasure = this.f98356p;
        pathMeasure.setPath(path2, true);
        this.B = pathMeasure.getLength();
        n(this.E);
        Drawable drawable = this.H;
        if (drawable != null) {
            drawable.setBounds(rect);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean onLevelChange(int i5) {
        o(i5 * 0.01f, getBounds().width() > 0, false);
        return true;
    }
}
