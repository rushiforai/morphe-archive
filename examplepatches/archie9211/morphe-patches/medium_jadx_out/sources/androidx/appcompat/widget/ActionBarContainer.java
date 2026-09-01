package androidx.appcompat.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.ActionMode;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import com.medium.reader.R;
import defpackage.esa;
import defpackage.t5;
import defpackage.xsb;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ActionBarContainer extends FrameLayout {
    public boolean a;
    public View b;
    public View c;
    public Drawable d;
    public Drawable e;
    public Drawable f;
    public final boolean g;
    public boolean h;
    public final int i;

    public ActionBarContainer(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        boolean z = false;
        setBackground(new t5(0, this));
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, esa.a);
        this.d = typedArrayObtainStyledAttributes.getDrawable(0);
        this.e = typedArrayObtainStyledAttributes.getDrawable(2);
        this.i = typedArrayObtainStyledAttributes.getDimensionPixelSize(13, -1);
        if (getId() == R.id.split_action_bar) {
            this.g = true;
            this.f = typedArrayObtainStyledAttributes.getDrawable(1);
        }
        typedArrayObtainStyledAttributes.recycle();
        if (!this.g ? !(this.d != null || this.e != null) : this.f == null) {
            z = true;
        }
        setWillNotDraw(z);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        Drawable drawable = this.d;
        if (drawable != null && drawable.isStateful()) {
            this.d.setState(getDrawableState());
        }
        Drawable drawable2 = this.e;
        if (drawable2 != null && drawable2.isStateful()) {
            this.e.setState(getDrawableState());
        }
        Drawable drawable3 = this.f;
        if (drawable3 == null || !drawable3.isStateful()) {
            return;
        }
        this.f.setState(getDrawableState());
    }

    public View getTabContainer() {
        return null;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        Drawable drawable = this.d;
        if (drawable != null) {
            drawable.jumpToCurrentState();
        }
        Drawable drawable2 = this.e;
        if (drawable2 != null) {
            drawable2.jumpToCurrentState();
        }
        Drawable drawable3 = this.f;
        if (drawable3 != null) {
            drawable3.jumpToCurrentState();
        }
    }

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        this.b = findViewById(R.id.action_bar);
        this.c = findViewById(R.id.action_context_bar);
    }

    @Override // android.view.View
    public final boolean onHoverEvent(MotionEvent motionEvent) {
        super.onHoverEvent(motionEvent);
        return true;
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        return this.a || super.onInterceptTouchEvent(motionEvent);
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        boolean z2 = true;
        if (this.g) {
            Drawable drawable = this.f;
            if (drawable != null) {
                drawable.setBounds(0, 0, getMeasuredWidth(), getMeasuredHeight());
            } else {
                z2 = false;
            }
        } else {
            if (this.d == null) {
                z2 = false;
            } else if (this.b.getVisibility() == 0) {
                this.d.setBounds(this.b.getLeft(), this.b.getTop(), this.b.getRight(), this.b.getBottom());
            } else {
                View view = this.c;
                if (view == null || view.getVisibility() != 0) {
                    this.d.setBounds(0, 0, 0, 0);
                } else {
                    this.d.setBounds(this.c.getLeft(), this.c.getTop(), this.c.getRight(), this.c.getBottom());
                }
            }
            this.h = false;
        }
        if (z2) {
            invalidate();
        }
    }

    @Override // android.widget.FrameLayout, android.view.View
    public final void onMeasure(int i, int i2) {
        int i3;
        if (this.b == null && View.MeasureSpec.getMode(i2) == Integer.MIN_VALUE && (i3 = this.i) >= 0) {
            i2 = View.MeasureSpec.makeMeasureSpec(Math.min(i3, View.MeasureSpec.getSize(i2)), Integer.MIN_VALUE);
        }
        super.onMeasure(i, i2);
        if (this.b == null) {
            return;
        }
        View.MeasureSpec.getMode(i2);
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        super.onTouchEvent(motionEvent);
        return true;
    }

    public void setPrimaryBackground(Drawable drawable) {
        Drawable drawable2 = this.d;
        if (drawable2 != null) {
            drawable2.setCallback(null);
            unscheduleDrawable(this.d);
        }
        this.d = drawable;
        if (drawable != null) {
            drawable.setCallback(this);
            View view = this.b;
            if (view != null) {
                this.d.setBounds(view.getLeft(), this.b.getTop(), this.b.getRight(), this.b.getBottom());
            }
        }
        boolean z = false;
        if (!this.g ? !(this.d != null || this.e != null) : this.f == null) {
            z = true;
        }
        setWillNotDraw(z);
        invalidate();
        invalidateOutline();
    }

    public void setSplitBackground(Drawable drawable) {
        Drawable drawable2;
        Drawable drawable3 = this.f;
        if (drawable3 != null) {
            drawable3.setCallback(null);
            unscheduleDrawable(this.f);
        }
        this.f = drawable;
        boolean z = this.g;
        boolean z2 = false;
        if (drawable != null) {
            drawable.setCallback(this);
            if (z && (drawable2 = this.f) != null) {
                drawable2.setBounds(0, 0, getMeasuredWidth(), getMeasuredHeight());
            }
        }
        if (!z ? !(this.d != null || this.e != null) : this.f == null) {
            z2 = true;
        }
        setWillNotDraw(z2);
        invalidate();
        invalidateOutline();
    }

    public void setStackedBackground(Drawable drawable) {
        Drawable drawable2 = this.e;
        if (drawable2 != null) {
            drawable2.setCallback(null);
            unscheduleDrawable(this.e);
        }
        this.e = drawable;
        if (drawable != null) {
            drawable.setCallback(this);
            if (this.h && this.e != null) {
                throw null;
            }
        }
        boolean z = false;
        if (!this.g ? !(this.d != null || this.e != null) : this.f == null) {
            z = true;
        }
        setWillNotDraw(z);
        invalidate();
        invalidateOutline();
    }

    public void setTransitioning(boolean z) {
        this.a = z;
        setDescendantFocusability(z ? 393216 : 262144);
    }

    @Override // android.view.View
    public void setVisibility(int i) {
        super.setVisibility(i);
        boolean z = i == 0;
        Drawable drawable = this.d;
        if (drawable != null) {
            drawable.setVisible(z, false);
        }
        Drawable drawable2 = this.e;
        if (drawable2 != null) {
            drawable2.setVisible(z, false);
        }
        Drawable drawable3 = this.f;
        if (drawable3 != null) {
            drawable3.setVisible(z, false);
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final ActionMode startActionModeForChild(View view, ActionMode.Callback callback, int i) {
        if (i != 0) {
            return super.startActionModeForChild(view, callback, i);
        }
        return null;
    }

    @Override // android.view.View
    public final boolean verifyDrawable(Drawable drawable) {
        Drawable drawable2 = this.d;
        boolean z = this.g;
        if (drawable == drawable2 && !z) {
            return true;
        }
        if (drawable == this.e && this.h) {
            return true;
        }
        return (drawable == this.f && z) || super.verifyDrawable(drawable);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final ActionMode startActionModeForChild(View view, ActionMode.Callback callback) {
        return null;
    }

    public void setTabContainer(xsb xsbVar) {
    }

    public ActionBarContainer(Context context) {
        this(context, null);
    }
}
