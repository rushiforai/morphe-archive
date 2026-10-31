package bk;

import android.content.res.ColorStateList;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

/* loaded from: classes3.dex */
public class f extends Drawable.ConstantState {

    /* renamed from: a, reason: collision with root package name */
    public j f17964a;

    /* renamed from: b, reason: collision with root package name */
    public pj.a f17965b;

    /* renamed from: c, reason: collision with root package name */
    public ColorStateList f17966c;

    /* renamed from: d, reason: collision with root package name */
    public ColorStateList f17967d;

    /* renamed from: e, reason: collision with root package name */
    public ColorStateList f17968e;

    /* renamed from: f, reason: collision with root package name */
    public PorterDuff.Mode f17969f;

    /* renamed from: g, reason: collision with root package name */
    public Rect f17970g;

    /* renamed from: h, reason: collision with root package name */
    public final float f17971h;

    /* renamed from: i, reason: collision with root package name */
    public float f17972i;

    /* renamed from: j, reason: collision with root package name */
    public float f17973j;

    /* renamed from: k, reason: collision with root package name */
    public int f17974k;

    /* renamed from: l, reason: collision with root package name */
    public float f17975l;

    /* renamed from: m, reason: collision with root package name */
    public float f17976m;
    public int n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public final int f17977p;

    /* renamed from: q, reason: collision with root package name */
    public final Paint.Style f17978q;

    public f(j jVar) {
        this.f17966c = null;
        this.f17967d = null;
        this.f17968e = null;
        this.f17969f = PorterDuff.Mode.SRC_IN;
        this.f17970g = null;
        this.f17971h = 1.0f;
        this.f17972i = 1.0f;
        this.f17974k = 255;
        this.f17975l = 0.0f;
        this.f17976m = 0.0f;
        this.n = 0;
        this.o = 0;
        this.f17977p = 0;
        this.f17978q = Paint.Style.FILL_AND_STROKE;
        this.f17964a = jVar;
        this.f17965b = null;
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public final int getChangingConfigurations() {
        return 0;
    }

    @Override // android.graphics.drawable.Drawable.ConstantState
    public Drawable newDrawable() {
        g gVar = new g(this);
        gVar.f17984e = true;
        return gVar;
    }

    public f(f fVar) {
        this.f17966c = null;
        this.f17967d = null;
        this.f17968e = null;
        this.f17969f = PorterDuff.Mode.SRC_IN;
        this.f17970g = null;
        this.f17971h = 1.0f;
        this.f17972i = 1.0f;
        this.f17974k = 255;
        this.f17975l = 0.0f;
        this.f17976m = 0.0f;
        this.n = 0;
        this.o = 0;
        this.f17977p = 0;
        this.f17978q = Paint.Style.FILL_AND_STROKE;
        this.f17964a = fVar.f17964a;
        this.f17965b = fVar.f17965b;
        this.f17973j = fVar.f17973j;
        this.f17966c = fVar.f17966c;
        this.f17967d = fVar.f17967d;
        this.f17969f = fVar.f17969f;
        this.f17968e = fVar.f17968e;
        this.f17974k = fVar.f17974k;
        this.f17971h = fVar.f17971h;
        this.o = fVar.o;
        this.f17972i = fVar.f17972i;
        this.f17975l = fVar.f17975l;
        this.f17976m = fVar.f17976m;
        this.n = fVar.n;
        this.f17977p = fVar.f17977p;
        this.f17978q = fVar.f17978q;
        if (fVar.f17970g != null) {
            this.f17970g = new Rect(fVar.f17970g);
        }
    }
}
