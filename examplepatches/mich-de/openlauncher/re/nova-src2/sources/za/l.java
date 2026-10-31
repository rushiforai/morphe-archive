package za;

import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import o9.g3;

/* loaded from: classes2.dex */
public final class l extends View implements m {

    /* renamed from: q, reason: collision with root package name */
    public static final Rect f98446q = new Rect();

    /* renamed from: r, reason: collision with root package name */
    public static final wj.i f98447r = new wj.i(2);

    /* renamed from: s, reason: collision with root package name */
    public static final wj.i f98448s = new wj.i(3);

    /* renamed from: a, reason: collision with root package name */
    public final int f98449a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f98450b;

    /* renamed from: c, reason: collision with root package name */
    public Drawable f98451c;

    /* renamed from: d, reason: collision with root package name */
    public Drawable f98452d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f98453e;

    /* renamed from: f, reason: collision with root package name */
    public ValueAnimator f98454f;

    /* renamed from: g, reason: collision with root package name */
    public final Rect f98455g;

    /* renamed from: h, reason: collision with root package name */
    public final Rect f98456h;

    /* renamed from: i, reason: collision with root package name */
    public Path f98457i;

    /* renamed from: j, reason: collision with root package name */
    public float f98458j;

    /* renamed from: k, reason: collision with root package name */
    public final Rect f98459k;

    /* renamed from: l, reason: collision with root package name */
    public final Rect f98460l;

    /* renamed from: m, reason: collision with root package name */
    public final z5.c f98461m;
    public float n;
    public final z5.c o;

    /* renamed from: p, reason: collision with root package name */
    public float f98462p;

    public l(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        this.f98453e = false;
        this.f98455g = new Rect();
        this.f98456h = new Rect();
        this.f98459k = new Rect();
        this.f98460l = new Rect();
        this.f98449a = getResources().getDimensionPixelSize(2131165314);
        this.f98450b = g3.p(getResources());
        z5.c cVar = new z5.c(this, f98448s);
        z5.d dVar = new z5.d();
        dVar.a(0.75f);
        dVar.b(200.0f);
        cVar.f98238m = dVar;
        this.o = cVar;
        z5.c cVar2 = new z5.c(this, f98447r);
        z5.d dVar2 = new z5.d();
        dVar2.a(0.75f);
        dVar2.b(200.0f);
        cVar2.f98238m = dVar2;
        this.f98461m = cVar2;
    }

    @Override // za.m
    public final void A(Path path) {
        this.f98457i = path;
        invalidate();
    }

    public final void a(float f11, boolean z11) {
        Rect rect = f98446q;
        rect.set(this.f98460l);
        g3.t(f11, rect);
        if (z11) {
            rect.offsetTo((int) (r1.left * f11), rect.top);
        } else {
            rect.offsetTo(rect.left, (int) (r1.top * f11));
        }
        this.f98452d.setBounds(rect);
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        int iSave = canvas.save();
        Path path = this.f98457i;
        if (path != null) {
            canvas.clipPath(path);
        }
        super.draw(canvas);
        Drawable drawable = this.f98452d;
        if (drawable != null) {
            drawable.draw(canvas);
        }
        if (this.f98451c != null) {
            int iSave2 = canvas.save();
            canvas.translate(this.f98462p, this.n);
            this.f98451c.draw(canvas);
            canvas.restoreToCount(iSave2);
        }
        canvas.restoreToCount(iSave);
    }
}
