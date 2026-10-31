package androidx.appcompat.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.ActionMode;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;

/* loaded from: classes2.dex */
public class ActionBarContainer extends FrameLayout {

    /* renamed from: a, reason: collision with root package name */
    public boolean f13691a;

    /* renamed from: b, reason: collision with root package name */
    public View f13692b;

    /* renamed from: c, reason: collision with root package name */
    public View f13693c;

    /* renamed from: d, reason: collision with root package name */
    public Drawable f13694d;

    /* renamed from: e, reason: collision with root package name */
    public final Drawable f13695e;

    /* renamed from: f, reason: collision with root package name */
    public final Drawable f13696f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f13697g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f13698h;

    /* renamed from: i, reason: collision with root package name */
    public final int f13699i;

    public ActionBarContainer(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setBackground(new r.a(this));
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, l.a.f72888a);
        boolean z11 = false;
        this.f13694d = typedArrayObtainStyledAttributes.getDrawable(0);
        Drawable drawable = typedArrayObtainStyledAttributes.getDrawable(2);
        this.f13695e = drawable;
        this.f13699i = typedArrayObtainStyledAttributes.getDimensionPixelSize(13, -1);
        if (getId() == 2131428898) {
            this.f13697g = true;
            this.f13696f = typedArrayObtainStyledAttributes.getDrawable(1);
        }
        typedArrayObtainStyledAttributes.recycle();
        if (!this.f13697g ? !(this.f13694d != null || drawable != null) : this.f13696f == null) {
            z11 = true;
        }
        setWillNotDraw(z11);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        Drawable drawable = this.f13694d;
        if (drawable != null && drawable.isStateful()) {
            this.f13694d.setState(getDrawableState());
        }
        Drawable drawable2 = this.f13695e;
        if (drawable2 != null && drawable2.isStateful()) {
            drawable2.setState(getDrawableState());
        }
        Drawable drawable3 = this.f13696f;
        if (drawable3 == null || !drawable3.isStateful()) {
            return;
        }
        drawable3.setState(getDrawableState());
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        Drawable drawable = this.f13694d;
        if (drawable != null) {
            drawable.jumpToCurrentState();
        }
        Drawable drawable2 = this.f13695e;
        if (drawable2 != null) {
            drawable2.jumpToCurrentState();
        }
        Drawable drawable3 = this.f13696f;
        if (drawable3 != null) {
            drawable3.jumpToCurrentState();
        }
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        this.f13692b = findViewById(2131427397);
        this.f13693c = findViewById(2131427408);
    }

    @Override // android.view.View
    public final boolean onHoverEvent(MotionEvent motionEvent) {
        super.onHoverEvent(motionEvent);
        return true;
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        return this.f13691a || super.onInterceptTouchEvent(motionEvent);
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        boolean z12 = true;
        if (this.f13697g) {
            Drawable drawable = this.f13696f;
            if (drawable != null) {
                drawable.setBounds(0, 0, getMeasuredWidth(), getMeasuredHeight());
            } else {
                z12 = false;
            }
        } else {
            if (this.f13694d == null) {
                z12 = false;
            } else if (this.f13692b.getVisibility() == 0) {
                this.f13694d.setBounds(this.f13692b.getLeft(), this.f13692b.getTop(), this.f13692b.getRight(), this.f13692b.getBottom());
            } else {
                View view = this.f13693c;
                if (view == null || view.getVisibility() != 0) {
                    this.f13694d.setBounds(0, 0, 0, 0);
                } else {
                    this.f13694d.setBounds(this.f13693c.getLeft(), this.f13693c.getTop(), this.f13693c.getRight(), this.f13693c.getBottom());
                }
            }
            this.f13698h = false;
        }
        if (z12) {
            invalidate();
        }
    }

    @Override // android.widget.FrameLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        int i12;
        if (this.f13692b == null && View.MeasureSpec.getMode(i11) == Integer.MIN_VALUE && (i12 = this.f13699i) >= 0) {
            i11 = View.MeasureSpec.makeMeasureSpec(Math.min(i12, View.MeasureSpec.getSize(i11)), Integer.MIN_VALUE);
        }
        super.onMeasure(i5, i11);
        if (this.f13692b == null) {
            return;
        }
        View.MeasureSpec.getMode(i11);
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        super.onTouchEvent(motionEvent);
        return true;
    }

    @Override // android.view.View
    public final void setVisibility(int i5) {
        super.setVisibility(i5);
        boolean z11 = i5 == 0;
        Drawable drawable = this.f13694d;
        if (drawable != null) {
            drawable.setVisible(z11, false);
        }
        Drawable drawable2 = this.f13695e;
        if (drawable2 != null) {
            drawable2.setVisible(z11, false);
        }
        Drawable drawable3 = this.f13696f;
        if (drawable3 != null) {
            drawable3.setVisible(z11, false);
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final ActionMode startActionModeForChild(View view, ActionMode.Callback callback) {
        return null;
    }

    @Override // android.view.View
    public final boolean verifyDrawable(Drawable drawable) {
        Drawable drawable2 = this.f13694d;
        boolean z11 = this.f13697g;
        if (drawable == drawable2 && !z11) {
            return true;
        }
        if (drawable == this.f13695e && this.f13698h) {
            return true;
        }
        return (drawable == this.f13696f && z11) || super.verifyDrawable(drawable);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final ActionMode startActionModeForChild(View view, ActionMode.Callback callback, int i5) {
        if (i5 != 0) {
            return super.startActionModeForChild(view, callback, i5);
        }
        return null;
    }
}
