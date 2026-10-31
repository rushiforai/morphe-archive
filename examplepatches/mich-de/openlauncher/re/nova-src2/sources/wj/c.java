package wj;

import a5.a1;
import ai.u1;
import android.content.ContentResolver;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.provider.Settings;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ProgressBar;
import com.google.android.gms.internal.consent_sdk.k0;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.WeakHashMap;

/* loaded from: classes3.dex */
public abstract class c extends ProgressBar {

    /* renamed from: a, reason: collision with root package name */
    public final d f94402a;

    /* renamed from: b, reason: collision with root package name */
    public int f94403b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f94404c;

    /* renamed from: d, reason: collision with root package name */
    public final int f94405d;

    /* renamed from: e, reason: collision with root package name */
    public final w6.b f94406e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f94407f;

    /* renamed from: g, reason: collision with root package name */
    public final int f94408g;

    /* renamed from: h, reason: collision with root package name */
    public final a f94409h;

    /* renamed from: i, reason: collision with root package name */
    public final a f94410i;

    /* renamed from: j, reason: collision with root package name */
    public final b f94411j;

    /* renamed from: k, reason: collision with root package name */
    public final b f94412k;

    public c(Context context, AttributeSet attributeSet, int i5, int i11) {
        super(hk.a.a(context, attributeSet, i5, 2132084026), attributeSet, i5);
        this.f94407f = false;
        this.f94408g = 4;
        this.f94409h = new a(this, 0);
        this.f94410i = new a(this, 1);
        this.f94411j = new b(this, 0);
        this.f94412k = new b(this, 1);
        Context context2 = getContext();
        this.f94402a = b(context2, attributeSet);
        tj.i.a(context2, attributeSet, i5, i11);
        int[] iArr = bj.a.f17916c;
        tj.i.b(context2, attributeSet, iArr, i5, i11, new int[0]);
        TypedArray typedArrayObtainStyledAttributes = context2.obtainStyledAttributes(attributeSet, iArr, i5, i11);
        typedArrayObtainStyledAttributes.getInt(6, -1);
        this.f94405d = Math.min(typedArrayObtainStyledAttributes.getInt(4, -1), 1000);
        typedArrayObtainStyledAttributes.recycle();
        this.f94406e = new w6.b();
        this.f94404c = true;
    }

    public static void a(c cVar) {
        ((l) cVar.getCurrentDrawable()).c(false, false, true);
        if (((j) super.getProgressDrawable()) == null || !((j) super.getProgressDrawable()).isVisible()) {
            if (((n) super.getIndeterminateDrawable()) == null || !((n) super.getIndeterminateDrawable()).isVisible()) {
                cVar.setVisibility(4);
            }
        }
    }

    public abstract d b(Context context, AttributeSet attributeSet);

    public final n c() {
        return (n) super.getIndeterminateDrawable();
    }

    public final j d() {
        return (j) super.getProgressDrawable();
    }

    public final void e(int... iArr) {
        if (iArr.length == 0) {
            iArr = new int[]{k0.n(getContext(), 2130968963, -1)};
        }
        d dVar = this.f94402a;
        if (Arrays.equals(dVar.f94415c, iArr)) {
            return;
        }
        dVar.f94415c = iArr;
        ((n) super.getIndeterminateDrawable()).f94464m.r();
        invalidate();
    }

    public void f(int i5) {
        if (!isIndeterminate()) {
            super.setProgress(i5);
            if (((j) super.getProgressDrawable()) != null) {
                ((j) super.getProgressDrawable()).jumpToCurrentState();
                return;
            }
            return;
        }
        if (((j) super.getProgressDrawable()) != null) {
            this.f94403b = i5;
            this.f94407f = true;
            if (((n) super.getIndeterminateDrawable()).isVisible()) {
                ContentResolver contentResolver = getContext().getContentResolver();
                this.f94406e.getClass();
                if (Settings.Global.getFloat(contentResolver, "animator_duration_scale", 1.0f) != 0.0f) {
                    ((n) super.getIndeterminateDrawable()).f94464m.A();
                    return;
                }
            }
            this.f94411j.a((n) super.getIndeterminateDrawable());
        }
    }

    public final boolean g() {
        WeakHashMap weakHashMap = a1.f250a;
        if (!isAttachedToWindow() || getWindowVisibility() != 0) {
            return false;
        }
        View view = this;
        while (view.getVisibility() == 0) {
            Object parent = view.getParent();
            if (parent == null) {
                return getWindowVisibility() == 0;
            }
            if (!(parent instanceof View)) {
                return true;
            }
            view = (View) parent;
        }
        return false;
    }

    @Override // android.widget.ProgressBar
    public final Drawable getCurrentDrawable() {
        return isIndeterminate() ? (n) super.getIndeterminateDrawable() : (j) super.getProgressDrawable();
    }

    @Override // android.widget.ProgressBar
    public final Drawable getIndeterminateDrawable() {
        return (n) super.getIndeterminateDrawable();
    }

    @Override // android.widget.ProgressBar
    public final Drawable getProgressDrawable() {
        return (j) super.getProgressDrawable();
    }

    @Override // android.view.View
    public final void invalidate() {
        super.invalidate();
        if (getCurrentDrawable() != null) {
            getCurrentDrawable().invalidateSelf();
        }
    }

    @Override // android.widget.ProgressBar, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (((j) super.getProgressDrawable()) != null && ((n) super.getIndeterminateDrawable()) != null) {
            ((n) super.getIndeterminateDrawable()).f94464m.z(this.f94411j);
        }
        j jVar = (j) super.getProgressDrawable();
        b bVar = this.f94412k;
        if (jVar != null) {
            j jVar2 = (j) super.getProgressDrawable();
            if (jVar2.f94454f == null) {
                jVar2.f94454f = new ArrayList();
            }
            if (!jVar2.f94454f.contains(bVar)) {
                jVar2.f94454f.add(bVar);
            }
        }
        if (((n) super.getIndeterminateDrawable()) != null) {
            n nVar = (n) super.getIndeterminateDrawable();
            if (nVar.f94454f == null) {
                nVar.f94454f = new ArrayList();
            }
            if (!nVar.f94454f.contains(bVar)) {
                nVar.f94454f.add(bVar);
            }
        }
        if (g()) {
            if (this.f94405d > 0) {
                SystemClock.uptimeMillis();
            }
            setVisibility(0);
        }
    }

    @Override // android.widget.ProgressBar, android.view.View
    public final void onDetachedFromWindow() {
        removeCallbacks(this.f94410i);
        removeCallbacks(this.f94409h);
        ((l) getCurrentDrawable()).c(false, false, false);
        n nVar = (n) super.getIndeterminateDrawable();
        b bVar = this.f94412k;
        if (nVar != null) {
            ((n) super.getIndeterminateDrawable()).e(bVar);
            ((n) super.getIndeterminateDrawable()).f94464m.D();
        }
        if (((j) super.getProgressDrawable()) != null) {
            ((j) super.getProgressDrawable()).e(bVar);
        }
        super.onDetachedFromWindow();
    }

    @Override // android.widget.ProgressBar, android.view.View
    public final synchronized void onDraw(Canvas canvas) {
        try {
            int iSave = canvas.save();
            if (getPaddingLeft() != 0 || getPaddingTop() != 0) {
                canvas.translate(getPaddingLeft(), getPaddingTop());
            }
            if (getPaddingRight() != 0 || getPaddingBottom() != 0) {
                canvas.clipRect(0, 0, getWidth() - (getPaddingLeft() + getPaddingRight()), getHeight() - (getPaddingTop() + getPaddingBottom()));
            }
            getCurrentDrawable().draw(canvas);
            canvas.restoreToCount(iSave);
        } catch (Throwable th2) {
            throw th2;
        }
    }

    @Override // android.widget.ProgressBar, android.view.View
    public final synchronized void onMeasure(int i5, int i11) {
        try {
            u1 u1Var = null;
            if (isIndeterminate()) {
                if (((n) super.getIndeterminateDrawable()) != null) {
                    u1Var = ((n) super.getIndeterminateDrawable()).f94463l;
                }
            } else if (((j) super.getProgressDrawable()) != null) {
                u1Var = ((j) super.getProgressDrawable()).f94443l;
            }
            if (u1Var == null) {
                return;
            }
            setMeasuredDimension(u1Var.q() < 0 ? View.getDefaultSize(getSuggestedMinimumWidth(), i5) : u1Var.q() + getPaddingLeft() + getPaddingRight(), u1Var.p() < 0 ? View.getDefaultSize(getSuggestedMinimumHeight(), i11) : u1Var.p() + getPaddingTop() + getPaddingBottom());
        } finally {
        }
    }

    @Override // android.view.View
    public final void onVisibilityChanged(View view, int i5) {
        super.onVisibilityChanged(view, i5);
        boolean z11 = i5 == 0;
        if (this.f94404c) {
            ((l) getCurrentDrawable()).c(g(), false, z11);
        }
    }

    @Override // android.view.View
    public final void onWindowVisibilityChanged(int i5) {
        super.onWindowVisibilityChanged(i5);
        if (this.f94404c) {
            ((l) getCurrentDrawable()).c(g(), false, false);
        }
    }

    @Override // android.widget.ProgressBar
    public final synchronized void setIndeterminate(boolean z11) {
        try {
            if (z11 == isIndeterminate()) {
                return;
            }
            l lVar = (l) getCurrentDrawable();
            if (lVar != null) {
                lVar.c(false, false, false);
            }
            super.setIndeterminate(z11);
            l lVar2 = (l) getCurrentDrawable();
            if (lVar2 != null) {
                lVar2.c(g(), false, false);
            }
            if ((lVar2 instanceof n) && g()) {
                ((n) lVar2).f94464m.C();
            }
            this.f94407f = false;
        } catch (Throwable th2) {
            throw th2;
        }
    }

    @Override // android.widget.ProgressBar
    public final void setIndeterminateDrawable(Drawable drawable) {
        if (drawable == null) {
            super.setIndeterminateDrawable(null);
        } else {
            if (!(drawable instanceof n)) {
                throw new IllegalArgumentException("Cannot set framework drawable as indeterminate drawable.");
            }
            ((l) drawable).c(false, false, false);
            super.setIndeterminateDrawable(drawable);
        }
    }

    @Override // android.widget.ProgressBar
    public final synchronized void setProgress(int i5) {
        if (isIndeterminate()) {
            return;
        }
        f(i5);
    }

    @Override // android.widget.ProgressBar
    public final void setProgressDrawable(Drawable drawable) {
        if (drawable == null) {
            super.setProgressDrawable(null);
        } else {
            if (!(drawable instanceof j)) {
                throw new IllegalArgumentException("Cannot set framework drawable as progress drawable.");
            }
            j jVar = (j) drawable;
            jVar.c(false, false, false);
            super.setProgressDrawable(jVar);
            jVar.setLevel((int) ((getProgress() / getMax()) * 10000.0f));
        }
    }
}
