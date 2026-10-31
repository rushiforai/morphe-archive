package x9;

import aa.i0;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Path;
import android.graphics.Picture;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.PictureDrawable;
import android.util.FloatProperty;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import o9.n1;
import o9.p1;

/* loaded from: classes.dex */
public abstract class n extends FrameLayout {
    public static final /* synthetic */ int C = 0;
    public Path A;
    public Drawable B;

    /* renamed from: a, reason: collision with root package name */
    public final View f95669a;

    /* renamed from: b, reason: collision with root package name */
    public final ViewGroup.LayoutParams f95670b;

    /* renamed from: c, reason: collision with root package name */
    public ViewGroup f95671c;

    /* renamed from: d, reason: collision with root package name */
    public int f95672d;

    /* renamed from: e, reason: collision with root package name */
    public final int f95673e;

    /* renamed from: f, reason: collision with root package name */
    public final int f95674f;

    /* renamed from: g, reason: collision with root package name */
    public final int f95675g;

    /* renamed from: h, reason: collision with root package name */
    public final int f95676h;

    /* renamed from: i, reason: collision with root package name */
    public final int f95677i;

    /* renamed from: j, reason: collision with root package name */
    public final float f95678j;

    /* renamed from: k, reason: collision with root package name */
    public final float f95679k;

    /* renamed from: l, reason: collision with root package name */
    public final int[] f95680l;

    /* renamed from: m, reason: collision with root package name */
    public final aa.h f95681m;
    public Rect n;
    public final Context o;

    /* renamed from: p, reason: collision with root package name */
    public final za.j f95682p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f95683q;

    /* renamed from: r, reason: collision with root package name */
    public final ValueAnimator f95684r;

    /* renamed from: s, reason: collision with root package name */
    public int f95685s;

    /* renamed from: t, reason: collision with root package name */
    public int f95686t;

    /* renamed from: u, reason: collision with root package name */
    public int f95687u;

    /* renamed from: v, reason: collision with root package name */
    public int f95688v;

    /* renamed from: w, reason: collision with root package name */
    public Drawable f95689w;

    /* renamed from: x, reason: collision with root package name */
    public Drawable f95690x;

    /* renamed from: y, reason: collision with root package name */
    public m f95691y;

    /* renamed from: z, reason: collision with root package name */
    public m f95692z;

    public n(n1 n1Var, View view, int i5, int i11, int i12, int i13, final float f11, float f12, float f13) {
        super(n1Var);
        this.f95672d = -1;
        this.f95680l = new int[2];
        this.f95681m = new aa.h();
        this.n = null;
        this.f95683q = false;
        this.o = n1Var;
        this.f95682p = n1Var.u();
        this.f95669a = view;
        this.f95673e = i5;
        this.f95674f = i11;
        this.f95670b = view.getLayoutParams();
        if (view.getParent() instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view.getParent();
            this.f95671c = viewGroup;
            this.f95672d = viewGroup.indexOfChild(view);
            this.f95671c.removeView(view);
        }
        addView(view, new FrameLayout.LayoutParams(i5, i11));
        if (view.getScaleX() != 1.0f || view.getScaleY() != 1.0f) {
            setClipChildren(false);
            setClipToPadding(false);
        }
        float f14 = i5;
        final float f15 = (f13 + f14) / f14;
        setScaleX(f11);
        setScaleY(f11);
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, 1.0f);
        this.f95684r = valueAnimatorOfFloat;
        valueAnimatorOfFloat.setDuration(150L);
        valueAnimatorOfFloat.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: x9.j
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                n nVar = this.f95654a;
                nVar.getClass();
                float fFloatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                float f16 = f15;
                float f17 = f11;
                float f18 = ((f16 - f17) * fFloatValue) + f17;
                nVar.setScaleX(f18);
                nVar.setScaleY(f18);
                if (nVar.isAttachedToWindow()) {
                    return;
                }
                valueAnimator.cancel();
            }
        });
        valueAnimatorOfFloat.addListener(new i0(this, 22));
        this.n = new Rect(0, 0, i5, i11);
        this.f95676h = i12;
        this.f95677i = i13;
        this.f95678j = f11;
        this.f95679k = f12;
        measure(View.MeasureSpec.makeMeasureSpec(i5, 1073741824), View.MeasureSpec.makeMeasureSpec(i11, 1073741824));
        this.f95675g = getResources().getDimensionPixelSize(2131165314);
        setElevation(getResources().getDimension(2131165435));
        setWillNotDraw(false);
    }

    public final void a() {
        setTranslationX((this.f95685s - this.f95676h) + this.f95687u);
        setTranslationY((this.f95686t - this.f95677i) + this.f95688v);
    }

    public final void b(aa.n nVar, int i5) {
        View view = this.f95669a;
        if (view.getParent() == null) {
            return;
        }
        ImageView imageView = new ImageView(getContext());
        imageView.setImageDrawable(nVar);
        int i11 = this.f95673e;
        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(i11, 1073741824);
        int i12 = this.f95674f;
        imageView.measure(iMakeMeasureSpec, View.MeasureSpec.makeMeasureSpec(i12, 1073741824));
        imageView.layout(0, 0, i11, i12);
        addViewInLayout(imageView, 0, new FrameLayout.LayoutParams(i11, i12));
        AnimatorSet animatorSet = new AnimatorSet();
        FloatProperty floatProperty = p1.f80067f;
        animatorSet.play(ObjectAnimator.ofFloat(imageView, floatProperty, 0.0f, 1.0f));
        animatorSet.play(ObjectAnimator.ofFloat(view, floatProperty, 0.0f));
        animatorSet.setDuration(i5).setInterpolator(s9.k.f86793f);
        animatorSet.start();
    }

    public final void c(boolean z11) {
        View view = this.f95669a;
        if (view == null || this.f95671c == null || this.f95672d < 0) {
            return;
        }
        Picture picture = new Picture();
        int i5 = this.f95673e;
        int i11 = this.f95674f;
        view.draw(picture.beginRecording(i5, i11));
        picture.endRecording();
        View view2 = new View(this.o);
        view2.setBackground(new PictureDrawable(picture));
        view2.measure(View.MeasureSpec.makeMeasureSpec(i5, 1073741824), View.MeasureSpec.makeMeasureSpec(i11, 1073741824));
        view2.layout(view.getLeft(), view.getTop(), view.getRight(), view.getBottom());
        setClipToOutline(view.getClipToOutline());
        setOutlineProvider(view.getOutlineProvider());
        addViewInLayout(view2, indexOfChild(view), view.getLayoutParams(), true);
        removeViewInLayout(view);
        view.setVisibility(4);
        view.setLayoutParams(this.f95670b);
        if (z11) {
            this.f95671c.addView(view, this.f95672d);
        }
        this.f95671c = null;
        this.f95672d = -1;
    }

    public final void d(int i5, int i11) {
        int i12;
        if (i5 > 0 && i11 > 0 && (i12 = this.f95685s) > 0 && this.f95686t > 0 && this.A != null) {
            this.f95691y.b(i12 - i5);
            this.f95692z.b(this.f95686t - i11);
        }
        this.f95685s = i5;
        this.f95686t = i11;
        a();
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        super.draw(canvas);
        this.f95683q = true;
        if (this.A != null) {
            int iSave = canvas.save();
            canvas.clipPath(this.A);
            this.f95689w.draw(canvas);
            canvas.translate(this.f95691y.f95668d, this.f95692z.f95668d);
            this.f95690x.draw(canvas);
            canvas.restoreToCount(iSave);
            this.B.draw(canvas);
        }
    }

    @Override // android.view.View
    public final boolean hasOverlappingRendering() {
        return false;
    }

    @Override // android.widget.FrameLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        super.onMeasure(View.MeasureSpec.makeMeasureSpec(this.f95673e, 1073741824), View.MeasureSpec.makeMeasureSpec(this.f95674f, 1073741824));
    }
}
