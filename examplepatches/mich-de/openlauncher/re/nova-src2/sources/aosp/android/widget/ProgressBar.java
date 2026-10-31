package aosp.android.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.AlphaAnimation;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import android.view.animation.Transformation;
import android.widget.RemoteViews;
import androidx.annotation.Keep;
import i8.b;
import i8.c;
import java.util.ArrayList;
import lx.e;
import o9.u2;
import p10.y1;

@RemoteViews.RemoteView
/* loaded from: classes2.dex */
public class ProgressBar extends View {
    public boolean A;
    public final boolean B;
    public final ArrayList C;
    public i8.a D;

    /* renamed from: a, reason: collision with root package name */
    public final int f15373a;

    /* renamed from: b, reason: collision with root package name */
    public final int f15374b;

    /* renamed from: c, reason: collision with root package name */
    public final int f15375c;

    /* renamed from: d, reason: collision with root package name */
    public int f15376d;

    /* renamed from: e, reason: collision with root package name */
    public int f15377e;

    /* renamed from: f, reason: collision with root package name */
    public int f15378f;

    /* renamed from: g, reason: collision with root package name */
    public int f15379g;

    /* renamed from: h, reason: collision with root package name */
    public final int f15380h;

    /* renamed from: i, reason: collision with root package name */
    public final int f15381i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f15382j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f15383k;

    /* renamed from: l, reason: collision with root package name */
    public Transformation f15384l;

    /* renamed from: m, reason: collision with root package name */
    public AlphaAnimation f15385m;
    public boolean n;
    public Drawable o;

    /* renamed from: p, reason: collision with root package name */
    public Drawable f15386p;

    /* renamed from: q, reason: collision with root package name */
    public Drawable f15387q;

    /* renamed from: r, reason: collision with root package name */
    public final b f15388r;

    /* renamed from: s, reason: collision with root package name */
    public final boolean f15389s;

    /* renamed from: t, reason: collision with root package name */
    public Interpolator f15390t;

    /* renamed from: u, reason: collision with root package name */
    public i8.a f15391u;

    /* renamed from: v, reason: collision with root package name */
    public final long f15392v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f15393w;

    /* renamed from: x, reason: collision with root package name */
    public float f15394x;

    /* renamed from: y, reason: collision with root package name */
    public boolean f15395y;

    /* renamed from: z, reason: collision with root package name */
    public boolean f15396z;

    public static class SavedState extends View.BaseSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public int f15397a;

        /* renamed from: b, reason: collision with root package name */
        public int f15398b;

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            super.writeToParcel(parcel, i5);
            parcel.writeInt(this.f15397a);
            parcel.writeInt(this.f15398b);
        }
    }

    public ProgressBar(Context context, AttributeSet attributeSet) throws Throwable {
        super(context, attributeSet, 2130969918);
        this.B = false;
        this.C = new ArrayList();
        this.f15392v = Thread.currentThread().getId();
        this.f15379g = 100;
        this.f15377e = 0;
        this.f15378f = 0;
        this.f15382j = false;
        this.f15383k = false;
        this.f15381i = 4000;
        this.f15380h = 1;
        this.f15373a = 24;
        this.f15374b = 48;
        this.f15375c = 24;
        this.f15376d = 48;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.J, 2130969918, 0);
        this.f15389s = true;
        Drawable drawable = typedArrayObtainStyledAttributes.getDrawable(8);
        if (drawable != null) {
            n(drawable);
        }
        this.f15381i = typedArrayObtainStyledAttributes.getInt(9, this.f15381i);
        this.f15373a = typedArrayObtainStyledAttributes.getDimensionPixelSize(11, this.f15373a);
        this.f15374b = typedArrayObtainStyledAttributes.getDimensionPixelSize(0, this.f15374b);
        this.f15375c = typedArrayObtainStyledAttributes.getDimensionPixelSize(12, this.f15375c);
        this.f15376d = typedArrayObtainStyledAttributes.getDimensionPixelSize(1, this.f15376d);
        this.f15380h = typedArrayObtainStyledAttributes.getInt(10, this.f15380h);
        int resourceId = typedArrayObtainStyledAttributes.getResourceId(13, 17432587);
        if (resourceId > 0) {
            this.f15390t = AnimationUtils.loadInterpolator(context, resourceId);
        }
        l(typedArrayObtainStyledAttributes.getInt(2, this.f15379g));
        int i5 = typedArrayObtainStyledAttributes.getInt(3, this.f15377e);
        synchronized (this) {
            m(i5, false);
        }
        o(typedArrayObtainStyledAttributes.getInt(4, this.f15378f));
        Drawable drawable2 = typedArrayObtainStyledAttributes.getDrawable(7);
        if (drawable2 != null) {
            if (drawable2 instanceof AnimationDrawable) {
                AnimationDrawable animationDrawable = (AnimationDrawable) drawable2;
                int numberOfFrames = animationDrawable.getNumberOfFrames();
                AnimationDrawable animationDrawable2 = new AnimationDrawable();
                animationDrawable2.setOneShot(animationDrawable.isOneShot());
                for (int i11 = 0; i11 < numberOfFrames; i11++) {
                    Drawable frame = animationDrawable.getFrame(i11);
                    frame.setLevel(10000);
                    animationDrawable2.addFrame(frame, animationDrawable.getDuration(i11));
                }
                animationDrawable2.setLevel(10000);
                drawable2 = animationDrawable2;
            }
            Drawable drawable3 = this.o;
            if (drawable3 != drawable2) {
                if (drawable3 != null) {
                    drawable3.setCallback(null);
                    unscheduleDrawable(this.o);
                }
                this.o = drawable2;
                drawable2.setCallback(this);
                if (v30.a.f92038b) {
                    k(-1);
                }
                if (drawable2.isStateful()) {
                    drawable2.setState(getDrawableState());
                }
                a();
                if (this.f15382j) {
                    this.f15387q = drawable2;
                    postInvalidate();
                }
            }
        }
        boolean z11 = typedArrayObtainStyledAttributes.getBoolean(6, this.f15383k);
        this.f15383k = z11;
        this.f15389s = false;
        boolean z12 = z11 || typedArrayObtainStyledAttributes.getBoolean(5, this.f15382j);
        synchronized (this) {
            try {
                if (!this.f15383k || !this.f15382j) {
                    if (z12 != this.f15382j) {
                        this.f15382j = z12;
                        if (z12) {
                            this.f15387q = this.o;
                            p();
                        } else {
                            this.f15387q = this.f15386p;
                            q();
                        }
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        this.B = typedArrayObtainStyledAttributes.getBoolean(14, this.B);
        if (typedArrayObtainStyledAttributes.hasValue(22)) {
            if (this.f15388r == null) {
                this.f15388r = new b();
            }
            this.f15388r.f61443f = y1.X(typedArrayObtainStyledAttributes.getInt(20, -1));
            this.f15388r.f61445h = true;
        }
        if (typedArrayObtainStyledAttributes.hasValue(21)) {
            if (this.f15388r == null) {
                this.f15388r = new b();
            }
            this.f15388r.f61442e = typedArrayObtainStyledAttributes.getColorStateList(21);
            this.f15388r.f61444g = true;
        }
        if (typedArrayObtainStyledAttributes.hasValue(20)) {
            if (this.f15388r == null) {
                this.f15388r = new b();
            }
            this.f15388r.f61447j = y1.X(typedArrayObtainStyledAttributes.getInt(22, -1));
            this.f15388r.f61449l = true;
        }
        if (typedArrayObtainStyledAttributes.hasValue(19)) {
            if (this.f15388r == null) {
                this.f15388r = new b();
            }
            this.f15388r.f61446i = typedArrayObtainStyledAttributes.getColorStateList(19);
            this.f15388r.f61448k = true;
        }
        if (typedArrayObtainStyledAttributes.hasValue(24)) {
            if (this.f15388r == null) {
                this.f15388r = new b();
            }
            this.f15388r.n = y1.X(typedArrayObtainStyledAttributes.getInt(24, -1));
            this.f15388r.f61451p = true;
        }
        if (typedArrayObtainStyledAttributes.hasValue(23)) {
            if (this.f15388r == null) {
                this.f15388r = new b();
            }
            this.f15388r.f61450m = typedArrayObtainStyledAttributes.getColorStateList(23);
            this.f15388r.o = true;
        }
        if (typedArrayObtainStyledAttributes.hasValue(17)) {
            if (this.f15388r == null) {
                this.f15388r = new b();
            }
            this.f15388r.f61439b = y1.X(typedArrayObtainStyledAttributes.getInt(18, -1));
            this.f15388r.f61441d = true;
        }
        if (typedArrayObtainStyledAttributes.hasValue(17)) {
            if (this.f15388r == null) {
                this.f15388r = new b();
            }
            this.f15388r.f61438a = typedArrayObtainStyledAttributes.getColorStateList(17);
            this.f15388r.f61440c = true;
        }
        typedArrayObtainStyledAttributes.recycle();
        b();
        a();
        if (getImportantForAccessibility() == 0) {
            setImportantForAccessibility(1);
        }
    }

    public final void a() {
        b bVar;
        Drawable drawable = this.o;
        if (drawable == null || (bVar = this.f15388r) == null) {
            return;
        }
        if (bVar.f61440c || bVar.f61441d) {
            Drawable drawableMutate = drawable.mutate();
            this.o = drawableMutate;
            if (bVar.f61440c) {
                drawableMutate.setTintList(bVar.f61438a);
            }
            if (bVar.f61441d) {
                this.o.setTintMode(bVar.f61439b);
            }
        }
    }

    public final void b() {
        b bVar;
        Drawable drawableG;
        Drawable drawableG2;
        Drawable drawableG3;
        if (this.f15386p == null || (bVar = this.f15388r) == null) {
            return;
        }
        if ((bVar.f61444g || bVar.f61445h) && (drawableG = g(16908301, true)) != null) {
            if (bVar.f61444g) {
                drawableG.setTintList(bVar.f61442e);
            }
            if (bVar.f61445h) {
                drawableG.setTintMode(bVar.f61443f);
            }
        }
        if ((bVar.f61448k || bVar.f61449l) && (drawableG2 = g(16908288, false)) != null) {
            if (bVar.f61448k) {
                drawableG2.setTintList(bVar.f61446i);
            }
            if (bVar.f61449l) {
                drawableG2.setTintMode(bVar.f61447j);
            }
        }
        if ((bVar.o || bVar.f61451p) && (drawableG3 = g(16908303, false)) != null) {
            if (bVar.o) {
                drawableG3.setTintList(bVar.f61450m);
            }
            if (bVar.f61451p) {
                drawableG3.setTintMode(bVar.n);
            }
        }
    }

    public final synchronized void c(int i5, float f11, boolean z11, boolean z12, boolean z13) {
        Drawable drawableFindDrawableByLayerId;
        try {
            int i11 = this.f15379g;
            float f12 = i11 > 0 ? f11 / i11 : 0.0f;
            Drawable drawable = this.f15387q;
            if (drawable != null) {
                if (drawable instanceof LayerDrawable) {
                    drawableFindDrawableByLayerId = ((LayerDrawable) drawable).findDrawableByLayerId(i5);
                    if (drawableFindDrawableByLayerId != null && v30.a.f92040d && canResolveLayoutDirection()) {
                        k(getLayoutDirection());
                    }
                } else {
                    drawableFindDrawableByLayerId = null;
                }
                int i12 = (int) (10000.0f * f12);
                if (drawableFindDrawableByLayerId != null) {
                    drawable = drawableFindDrawableByLayerId;
                }
                drawable.setLevel(i12);
            } else {
                invalidate();
            }
            if (i5 == 16908301) {
                if (z13) {
                    h(f12);
                } else if (z12) {
                    i(f12, z11);
                }
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void d(Canvas canvas) {
        Drawable drawable = this.f15387q;
        if (drawable != 0) {
            int iSave = canvas.save();
            if (e.c(this) && this.B) {
                canvas.translate(getWidth() - getPaddingRight(), getPaddingTop());
                canvas.scale(-1.0f, 1.0f);
            } else {
                canvas.translate(getPaddingLeft(), getPaddingTop());
            }
            long drawingTime = getDrawingTime();
            if (this.n) {
                this.f15385m.getTransformation(drawingTime, this.f15384l);
                float alpha = this.f15384l.getAlpha();
                try {
                    this.f15395y = true;
                    drawable.setLevel((int) (alpha * 10000.0f));
                    this.f15395y = false;
                    postInvalidateOnAnimation();
                } catch (Throwable th2) {
                    this.f15395y = false;
                    throw th2;
                }
            }
            drawable.draw(canvas);
            canvas.restoreToCount(iSave);
            if (this.f15393w && (drawable instanceof Animatable)) {
                ((Animatable) drawable).start();
                this.f15393w = false;
            }
        }
    }

    @Override // android.view.View
    public void drawableHotspotChanged(float f11, float f12) {
        super.drawableHotspotChanged(f11, f12);
        if (v30.a.f92041e) {
            Drawable drawable = this.f15386p;
            if (drawable != null) {
                drawable.setHotspot(f11, f12);
            }
            Drawable drawable2 = this.o;
            if (drawable2 != null) {
                drawable2.setHotspot(f11, f12);
            }
        }
    }

    @Override // android.view.View
    public void drawableStateChanged() {
        super.drawableStateChanged();
        s();
    }

    public final synchronized int e() {
        return this.f15379g;
    }

    public final synchronized int f() {
        return this.f15382j ? 0 : this.f15377e;
    }

    public final Drawable g(int i5, boolean z11) {
        Drawable drawable = this.f15386p;
        if (drawable != null) {
            this.f15386p = drawable.mutate();
            drawableFindDrawableByLayerId = drawable instanceof LayerDrawable ? ((LayerDrawable) drawable).findDrawableByLayerId(i5) : null;
            if (z11 && drawableFindDrawableByLayerId == null) {
                return drawable;
            }
        }
        return drawableFindDrawableByLayerId;
    }

    @Keep
    public float getAnimationPosition() {
        return this.f15394x;
    }

    public void h(float f11) {
    }

    public void i(float f11, boolean z11) {
        if (((AccessibilityManager) getContext().getSystemService("accessibility")).isEnabled()) {
            i8.a aVar = this.D;
            if (aVar == null) {
                this.D = new i8.a(this, 0);
            } else {
                removeCallbacks(aVar);
            }
            postDelayed(this.D, 200L);
        }
    }

    @Override // android.view.View, android.graphics.drawable.Drawable.Callback
    public final void invalidateDrawable(Drawable drawable) {
        if (this.f15395y) {
            return;
        }
        if (!verifyDrawable(drawable)) {
            super.invalidateDrawable(drawable);
            return;
        }
        Rect bounds = drawable.getBounds();
        int paddingLeft = getPaddingLeft() + getScrollX();
        int paddingTop = getPaddingTop() + getScrollY();
        invalidate(bounds.left + paddingLeft, bounds.top + paddingTop, bounds.right + paddingLeft, bounds.bottom + paddingTop);
    }

    public final synchronized void j(float f11, int i5, boolean z11, boolean z12) throws Throwable {
        try {
            try {
                if (this.f15392v == Thread.currentThread().getId()) {
                    c(i5, f11, z11, true, z12);
                } else {
                    if (this.f15391u == null) {
                        this.f15391u = new i8.a(this, 1);
                    }
                    c cVar = (c) c.f61452e.a();
                    if (cVar == null) {
                        cVar = new c();
                    }
                    cVar.f61453a = i5;
                    cVar.f61454b = f11;
                    cVar.f61455c = z11;
                    cVar.f61456d = z12;
                    this.C.add(cVar);
                    if (this.f15396z && !this.A) {
                        post(this.f15391u);
                        this.A = true;
                    }
                }
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            throw th;
        }
    }

    @Override // android.view.View
    public void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        Drawable drawable = this.f15386p;
        if (drawable != null) {
            drawable.jumpToCurrentState();
        }
        Drawable drawable2 = this.o;
        if (drawable2 != null) {
            drawable2.jumpToCurrentState();
        }
    }

    public final void k(int i5) {
        if (v30.a.f92038b && i5 == -1) {
            getLayoutDirection();
        }
    }

    public synchronized void l(int i5) {
        if (i5 < 0) {
            i5 = 0;
        }
        try {
            if (i5 != this.f15379g) {
                this.f15379g = i5;
                postInvalidate();
                if (this.f15377e > i5) {
                    this.f15377e = i5;
                }
                float f11 = this.f15377e;
                synchronized (this) {
                    j(f11, 16908301, false, false);
                }
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public synchronized void m(int i5, boolean z11) {
        if (this.f15382j) {
            return;
        }
        if (i5 < 0) {
            i5 = 0;
        }
        int i11 = this.f15379g;
        if (i5 > i11) {
            i5 = i11;
        }
        if (i5 != this.f15377e) {
            this.f15377e = i5;
            float f11 = i5;
            synchronized (this) {
                j(f11, 16908301, z11, false);
            }
        }
    }

    public final void n(Drawable drawable) throws Throwable {
        Drawable drawable2 = this.f15386p;
        if (drawable2 != drawable) {
            if (drawable2 != null) {
                drawable2.setCallback(null);
                unscheduleDrawable(this.f15386p);
            }
            this.f15386p = drawable;
            if (drawable != null) {
                drawable.setCallback(this);
                k(-1);
                if (drawable.isStateful()) {
                    drawable.setState(getDrawableState());
                }
                int minimumHeight = drawable.getMinimumHeight();
                if (this.f15376d < minimumHeight) {
                    this.f15376d = minimumHeight;
                    requestLayout();
                }
                b();
            }
            if (!this.f15382j) {
                this.f15387q = drawable;
                postInvalidate();
            }
            r(getWidth(), getHeight());
            s();
            float f11 = this.f15377e;
            synchronized (this) {
                c(16908301, f11, false, false, false);
            }
            float f12 = this.f15378f;
            synchronized (this) {
                try {
                    c(16908303, f12, false, false, false);
                } catch (Throwable th2) {
                    th = th2;
                    while (true) {
                        try {
                            throw th;
                        } catch (Throwable th3) {
                            th = th3;
                        }
                    }
                }
            }
        }
    }

    public final synchronized void o(int i5) {
        if (this.f15382j) {
            return;
        }
        if (i5 < 0) {
            i5 = 0;
        }
        int i11 = this.f15379g;
        if (i5 > i11) {
            i5 = i11;
        }
        if (i5 != this.f15378f) {
            this.f15378f = i5;
            float f11 = i5;
            synchronized (this) {
                j(f11, 16908303, false, false);
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x002f, code lost:
    
        i8.c.f61452e.n(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0034, code lost:
    
        r1 = r1 + 1;
     */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onAttachedToWindow() throws Throwable {
        ProgressBar progressBar;
        super.onAttachedToWindow();
        if (this.f15382j) {
            p();
        }
        if (this.C != null) {
            synchronized (this) {
                try {
                    try {
                        int size = this.C.size();
                        int i5 = 0;
                        while (i5 < size) {
                            c cVar = (c) this.C.get(i5);
                            int i11 = cVar.f61453a;
                            float f11 = cVar.f61454b;
                            boolean z11 = cVar.f61455c;
                            boolean z12 = cVar.f61456d;
                            synchronized (this) {
                                c(i11, f11, z11, z12, false);
                            }
                        }
                        progressBar = this;
                        progressBar.C.clear();
                    } catch (Throwable th2) {
                        th = th2;
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    throw th;
                }
            }
        } else {
            progressBar = this;
        }
        progressBar.f15396z = true;
    }

    @Override // android.view.View
    public final void onDetachedFromWindow() {
        if (this.f15382j) {
            q();
        }
        i8.a aVar = this.f15391u;
        if (aVar != null) {
            removeCallbacks(aVar);
        }
        i8.a aVar2 = this.f15391u;
        if (aVar2 != null && this.A) {
            removeCallbacks(aVar2);
        }
        i8.a aVar3 = this.D;
        if (aVar3 != null) {
            removeCallbacks(aVar3);
        }
        super.onDetachedFromWindow();
        this.f15396z = false;
    }

    @Override // android.view.View
    public synchronized void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        d(canvas);
    }

    @Override // android.view.View
    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(accessibilityEvent);
        accessibilityEvent.setClassName(ProgressBar.class.getName());
        accessibilityEvent.setItemCount(this.f15379g);
        accessibilityEvent.setCurrentItemIndex(this.f15377e);
    }

    @Override // android.view.View
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        accessibilityNodeInfo.setClassName(ProgressBar.class.getName());
    }

    @Override // android.view.View
    public synchronized void onMeasure(int i5, int i11) {
        int iMax;
        int iMax2;
        try {
            Drawable drawable = this.f15387q;
            if (drawable != null) {
                iMax2 = Math.max(this.f15373a, Math.min(this.f15374b, drawable.getIntrinsicWidth()));
                iMax = Math.max(this.f15375c, Math.min(this.f15376d, drawable.getIntrinsicHeight()));
            } else {
                iMax = 0;
                iMax2 = 0;
            }
            s();
            setMeasuredDimension(View.resolveSizeAndState(getPaddingLeft() + getPaddingRight() + iMax2, i5, 0), View.resolveSizeAndState(getPaddingTop() + getPaddingBottom() + iMax, i11, 0));
        } catch (Throwable th2) {
            throw th2;
        }
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.getSuperState());
        int i5 = savedState.f15397a;
        synchronized (this) {
            m(i5, false);
        }
        o(savedState.f15398b);
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        savedState.f15397a = this.f15377e;
        savedState.f15398b = this.f15378f;
        return savedState;
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        r(i5, i11);
    }

    @Override // android.view.View
    public final void onVisibilityChanged(View view, int i5) {
        super.onVisibilityChanged(view, i5);
        if (this.f15382j) {
            if (i5 == 8 || i5 == 4) {
                q();
            } else {
                p();
            }
        }
    }

    public final void p() {
        if (getVisibility() != 0) {
            return;
        }
        if (this.o instanceof Animatable) {
            this.f15393w = true;
            this.n = false;
        } else {
            this.n = true;
            if (this.f15390t == null) {
                this.f15390t = new LinearInterpolator();
            }
            Transformation transformation = this.f15384l;
            if (transformation == null) {
                this.f15384l = new Transformation();
            } else {
                transformation.clear();
            }
            AlphaAnimation alphaAnimation = this.f15385m;
            if (alphaAnimation == null) {
                this.f15385m = new AlphaAnimation(0.0f, 1.0f);
            } else {
                alphaAnimation.reset();
            }
            this.f15385m.setRepeatMode(this.f15380h);
            this.f15385m.setRepeatCount(-1);
            this.f15385m.setDuration(this.f15381i);
            this.f15385m.setInterpolator(this.f15390t);
            this.f15385m.setStartTime(-1L);
        }
        postInvalidate();
    }

    @Override // android.view.View
    public final void postInvalidate() {
        if (this.f15389s) {
            return;
        }
        super.postInvalidate();
    }

    public final void q() {
        this.n = false;
        Object obj = this.o;
        if (obj instanceof Animatable) {
            ((Animatable) obj).stop();
            this.f15393w = false;
        }
        postInvalidate();
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0066  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void r(int i5, int i11) {
        int i12;
        int i13;
        int i14;
        int paddingLeft = i5 - (getPaddingLeft() + getPaddingRight());
        int paddingBottom = i11 - (getPaddingBottom() + getPaddingTop());
        Drawable drawable = this.o;
        if (drawable != null) {
            if (!this.f15383k || (drawable instanceof AnimationDrawable)) {
                i12 = paddingLeft;
                i13 = 0;
                i14 = 0;
                if (e.c(this) || !this.B) {
                    paddingLeft = i12;
                } else {
                    int i15 = paddingLeft - i12;
                    paddingLeft -= i14;
                    i14 = i15;
                }
                this.o.setBounds(i14, i13, paddingLeft, paddingBottom);
            } else {
                float intrinsicWidth = drawable.getIntrinsicWidth() / this.o.getIntrinsicHeight();
                float f11 = paddingLeft;
                float f12 = paddingBottom;
                float f13 = f11 / f12;
                if (intrinsicWidth != f13) {
                    if (f13 > intrinsicWidth) {
                        int i16 = (int) (f12 * intrinsicWidth);
                        int i17 = (paddingLeft - i16) / 2;
                        i14 = i17;
                        i12 = i16 + i17;
                        i13 = 0;
                    } else {
                        int i18 = (int) ((1.0f / intrinsicWidth) * f11);
                        int i19 = (paddingBottom - i18) / 2;
                        int i21 = i18 + i19;
                        i13 = i19;
                        paddingBottom = i21;
                        i12 = paddingLeft;
                        i14 = 0;
                    }
                }
                if (e.c(this)) {
                    paddingLeft = i12;
                    this.o.setBounds(i14, i13, paddingLeft, paddingBottom);
                }
            }
        }
        Drawable drawable2 = this.f15386p;
        if (drawable2 != null) {
            drawable2.setBounds(0, 0, paddingLeft, paddingBottom);
        }
    }

    public final void s() {
        int[] drawableState = getDrawableState();
        Drawable drawable = this.f15386p;
        if (drawable != null && drawable.isStateful()) {
            this.f15386p.setState(drawableState);
        }
        Drawable drawable2 = this.o;
        if (drawable2 == null || !drawable2.isStateful()) {
            return;
        }
        this.o.setState(drawableState);
    }

    @Keep
    public void setAnimationPosition(float f11) throws Throwable {
        this.f15394x = f11;
        j(f11, 16908301, true, true);
    }

    @Override // android.view.View
    public final void setVisibility(int i5) {
        if (getVisibility() != i5) {
            super.setVisibility(i5);
            if (this.f15382j) {
                if (i5 == 8 || i5 == 4) {
                    q();
                } else {
                    p();
                }
            }
        }
    }

    @Override // android.view.View
    public boolean verifyDrawable(Drawable drawable) {
        return drawable == this.f15386p || drawable == this.o || super.verifyDrawable(drawable);
    }
}
