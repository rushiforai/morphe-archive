package e5;

import a5.a1;
import ai.h;
import android.content.res.Resources;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AnimationUtils;
import java.util.WeakHashMap;
import r.g1;

/* loaded from: classes2.dex */
public final class e implements View.OnTouchListener {

    /* renamed from: r, reason: collision with root package name */
    public static final int f52175r = ViewConfiguration.getTapTimeout();

    /* renamed from: a, reason: collision with root package name */
    public final a f52176a;

    /* renamed from: b, reason: collision with root package name */
    public final AccelerateInterpolator f52177b;

    /* renamed from: c, reason: collision with root package name */
    public final g1 f52178c;

    /* renamed from: d, reason: collision with root package name */
    public h f52179d;

    /* renamed from: e, reason: collision with root package name */
    public final float[] f52180e;

    /* renamed from: f, reason: collision with root package name */
    public final float[] f52181f;

    /* renamed from: g, reason: collision with root package name */
    public final int f52182g;

    /* renamed from: h, reason: collision with root package name */
    public final int f52183h;

    /* renamed from: i, reason: collision with root package name */
    public final float[] f52184i;

    /* renamed from: j, reason: collision with root package name */
    public final float[] f52185j;

    /* renamed from: k, reason: collision with root package name */
    public final float[] f52186k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f52187l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f52188m;
    public boolean n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f52189p;

    /* renamed from: q, reason: collision with root package name */
    public final g1 f52190q;

    public e(g1 g1Var) {
        a aVar = new a();
        aVar.f52170d = Long.MIN_VALUE;
        aVar.f52172f = -1L;
        aVar.f52171e = 0L;
        this.f52176a = aVar;
        this.f52177b = new AccelerateInterpolator();
        float[] fArr = {0.0f, 0.0f};
        this.f52180e = fArr;
        float[] fArr2 = {Float.MAX_VALUE, Float.MAX_VALUE};
        this.f52181f = fArr2;
        float[] fArr3 = {0.0f, 0.0f};
        this.f52184i = fArr3;
        float[] fArr4 = {0.0f, 0.0f};
        this.f52185j = fArr4;
        float[] fArr5 = {Float.MAX_VALUE, Float.MAX_VALUE};
        this.f52186k = fArr5;
        this.f52178c = g1Var;
        float f11 = Resources.getSystem().getDisplayMetrics().density;
        float f12 = ((int) ((1575.0f * f11) + 0.5f)) / 1000.0f;
        fArr5[0] = f12;
        fArr5[1] = f12;
        float f13 = ((int) ((f11 * 315.0f) + 0.5f)) / 1000.0f;
        fArr4[0] = f13;
        fArr4[1] = f13;
        this.f52182g = 1;
        fArr2[0] = Float.MAX_VALUE;
        fArr2[1] = Float.MAX_VALUE;
        fArr[0] = 0.2f;
        fArr[1] = 0.2f;
        fArr3[0] = 0.001f;
        fArr3[1] = 0.001f;
        this.f52183h = f52175r;
        aVar.f52167a = 500;
        aVar.f52168b = 500;
        this.f52190q = g1Var;
    }

    public static float b(float f11, float f12, float f13) {
        return f11 > f13 ? f13 : f11 < f12 ? f12 : f11;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x003b A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:13:0x003c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final float a(float f11, float f12, float f13, int i5) {
        float fB;
        float interpolation;
        float fB2 = b(this.f52180e[i5] * f12, 0.0f, this.f52181f[i5]);
        float fC = c(f12 - f11, fB2) - c(f11, fB2);
        AccelerateInterpolator accelerateInterpolator = this.f52177b;
        if (fC < 0.0f) {
            interpolation = -accelerateInterpolator.getInterpolation(-fC);
        } else {
            if (fC <= 0.0f) {
                fB = 0.0f;
                if (fB != 0.0f) {
                    return 0.0f;
                }
                float f14 = this.f52184i[i5];
                float f15 = this.f52185j[i5];
                float f16 = this.f52186k[i5];
                float f17 = f14 * f13;
                return fB > 0.0f ? b(fB * f17, f15, f16) : -b((-fB) * f17, f15, f16);
            }
            interpolation = accelerateInterpolator.getInterpolation(fC);
        }
        fB = b(interpolation, -1.0f, 1.0f);
        if (fB != 0.0f) {
        }
    }

    public final float c(float f11, float f12) {
        if (f12 != 0.0f) {
            int i5 = this.f52182g;
            if (i5 == 0 || i5 == 1) {
                if (f11 < f12) {
                    if (f11 >= 0.0f) {
                        return 1.0f - (f11 / f12);
                    }
                    if (this.o && i5 == 1) {
                        return 1.0f;
                    }
                }
            } else if (i5 == 2 && f11 < 0.0f) {
                return f11 / (-f12);
            }
        }
        return 0.0f;
    }

    public final void d() {
        int i5 = 0;
        if (this.f52188m) {
            this.o = false;
            return;
        }
        long jCurrentAnimationTimeMillis = AnimationUtils.currentAnimationTimeMillis();
        a aVar = this.f52176a;
        int i11 = (int) (jCurrentAnimationTimeMillis - aVar.f52170d);
        int i12 = aVar.f52168b;
        if (i11 > i12) {
            i5 = i12;
        } else if (i11 >= 0) {
            i5 = i11;
        }
        aVar.f52174h = i5;
        aVar.f52173g = aVar.a(jCurrentAnimationTimeMillis);
        aVar.f52172f = jCurrentAnimationTimeMillis;
    }

    public final boolean e() {
        g1 g1Var;
        int count;
        float f11 = this.f52176a.f52169c;
        int iAbs = (int) (f11 / Math.abs(f11));
        if (iAbs != 0 && (count = (g1Var = this.f52190q).getCount()) != 0) {
            int childCount = g1Var.getChildCount();
            int firstVisiblePosition = g1Var.getFirstVisiblePosition();
            int i5 = firstVisiblePosition + childCount;
            if (iAbs <= 0 ? !(iAbs >= 0 || (firstVisiblePosition <= 0 && g1Var.getChildAt(0).getTop() >= 0)) : !(i5 >= count && g1Var.getChildAt(childCount - 1).getBottom() <= g1Var.getHeight())) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0014, code lost:
    
        if (r0 != 3) goto L30;
     */
    @Override // android.view.View.OnTouchListener
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        int i5;
        if (this.f52189p) {
            int actionMasked = motionEvent.getActionMasked();
            if (actionMasked != 0) {
                if (actionMasked != 1) {
                    if (actionMasked != 2) {
                    }
                }
                d();
                return false;
            }
            this.n = true;
            this.f52187l = false;
            float x11 = motionEvent.getX();
            float width = view.getWidth();
            g1 g1Var = this.f52178c;
            a(x11, width, g1Var.getWidth(), 0);
            this.f52176a.f52169c = a(motionEvent.getY(), view.getHeight(), g1Var.getHeight(), 1);
            if (!this.o && e()) {
                if (this.f52179d == null) {
                    this.f52179d = new h(this, 14);
                }
                this.o = true;
                this.f52188m = true;
                if (this.f52187l || (i5 = this.f52183h) <= 0) {
                    this.f52179d.run();
                } else {
                    h hVar = this.f52179d;
                    long j11 = i5;
                    WeakHashMap weakHashMap = a1.f250a;
                    g1Var.postOnAnimationDelayed(hVar, j11);
                }
                this.f52187l = true;
            }
        }
        return false;
    }
}
