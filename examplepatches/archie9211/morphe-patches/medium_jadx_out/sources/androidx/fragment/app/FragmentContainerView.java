package androidx.fragment.app;

import android.animation.LayoutTransition;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import com.medium.reader.R;
import defpackage.asa;
import defpackage.ev6;
import defpackage.f25;
import defpackage.j15;
import defpackage.km0;
import defpackage.m15;
import defpackage.rd6;
import defpackage.s25;
import defpackage.ute;
import defpackage.w15;
import defpackage.ygf;
import defpackage.z4f;
import defpackage.z72;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class FragmentContainerView extends FrameLayout {
    public final ArrayList a;
    public final ArrayList b;
    public View.OnApplyWindowInsetsListener c;
    public boolean d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FragmentContainerView(Context context, AttributeSet attributeSet, f25 f25Var) {
        View view;
        super(context, attributeSet);
        context.getClass();
        attributeSet.getClass();
        this.a = new ArrayList();
        this.b = new ArrayList();
        this.d = true;
        String classAttribute = attributeSet.getClassAttribute();
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, asa.b, 0, 0);
        classAttribute = classAttribute == null ? typedArrayObtainStyledAttributes.getString(0) : classAttribute;
        String string = typedArrayObtainStyledAttributes.getString(1);
        typedArrayObtainStyledAttributes.recycle();
        int id = getId();
        j15 j15VarC = f25Var.C(id);
        if (classAttribute != null && j15VarC == null) {
            if (id == -1) {
                ygf.f(ev6.x("FragmentContainerView must have an android:id to add Fragment ", classAttribute, string != null ? " with tag ".concat(string) : ""));
                throw null;
            }
            w15 w15VarF = f25Var.F();
            context.getClassLoader();
            j15 j15VarA = w15VarF.a(classAttribute);
            j15VarA.getClass();
            j15VarA.w = id;
            j15VarA.x = id;
            j15VarA.y = string;
            j15VarA.s = f25Var;
            j15VarA.t = f25Var.v;
            j15VarA.G(context, attributeSet, null);
            km0 km0Var = new km0(f25Var);
            km0Var.p = true;
            j15VarA.F = this;
            km0Var.e(getId(), j15VarA, string, 1);
            if (km0Var.g) {
                ygf.f("This transaction is already being added to the back stack");
                throw null;
            }
            km0Var.h = false;
            km0Var.q.z(km0Var, true);
        }
        for (s25 s25Var : f25Var.c.J()) {
            j15 j15Var = s25Var.c;
            if (j15Var.x == getId() && (view = j15Var.G) != null && view.getParent() == null) {
                j15Var.F = this;
                s25Var.b();
            }
        }
    }

    public final void a(View view) {
        if (this.b.contains(view)) {
            this.a.add(view);
        }
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i, ViewGroup.LayoutParams layoutParams) {
        view.getClass();
        Object tag = view.getTag(R.id.fragment_container_view_tag);
        if ((tag instanceof j15 ? (j15) tag : null) != null) {
            super.addView(view, i, layoutParams);
        } else {
            z72.e("Views added to a FragmentContainerView must be associated with a Fragment. View ", view, " is not associated with a Fragment.");
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final WindowInsets dispatchApplyWindowInsets(WindowInsets windowInsets) {
        z4f z4fVarJ;
        windowInsets.getClass();
        z4f z4fVarH = z4f.h(windowInsets, null);
        View.OnApplyWindowInsetsListener onApplyWindowInsetsListener = this.c;
        if (onApplyWindowInsetsListener != null) {
            onApplyWindowInsetsListener.getClass();
            WindowInsets windowInsetsOnApplyWindowInsets = onApplyWindowInsetsListener.onApplyWindowInsets(this, windowInsets);
            windowInsetsOnApplyWindowInsets.getClass();
            z4fVarJ = z4f.h(windowInsetsOnApplyWindowInsets, null);
        } else {
            z4fVarJ = ute.j(this, z4fVarH);
        }
        if (!z4fVarJ.a.s()) {
            int childCount = getChildCount();
            for (int i = 0; i < childCount; i++) {
                ute.b(getChildAt(i), z4fVarJ);
            }
        }
        return windowInsets;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchDraw(Canvas canvas) {
        canvas.getClass();
        if (this.d) {
            Iterator it2 = this.a.iterator();
            while (it2.hasNext()) {
                super.drawChild(canvas, (View) it2.next(), getDrawingTime());
            }
        }
        super.dispatchDraw(canvas);
    }

    @Override // android.view.ViewGroup
    public final boolean drawChild(Canvas canvas, View view, long j) {
        canvas.getClass();
        view.getClass();
        if (this.d) {
            ArrayList arrayList = this.a;
            if (!arrayList.isEmpty() && arrayList.contains(view)) {
                return false;
            }
        }
        return super.drawChild(canvas, view, j);
    }

    @Override // android.view.ViewGroup
    public final void endViewTransition(View view) {
        view.getClass();
        this.b.remove(view);
        if (this.a.remove(view)) {
            this.d = true;
        }
        super.endViewTransition(view);
    }

    public final <F extends j15> F getFragment() {
        j15 j15Var;
        m15 m15Var;
        f25 f25VarM;
        View view = this;
        while (true) {
            if (view == null) {
                j15Var = null;
                break;
            }
            Object tag = view.getTag(R.id.fragment_container_view_tag);
            j15Var = tag instanceof j15 ? (j15) tag : null;
            if (j15Var != null) {
                break;
            }
            Object parent = view.getParent();
            view = parent instanceof View ? (View) parent : null;
        }
        if (j15Var == null) {
            Context context = getContext();
            while (true) {
                if (!(context instanceof ContextWrapper)) {
                    m15Var = null;
                    break;
                }
                if (context instanceof m15) {
                    m15Var = (m15) context;
                    break;
                }
                context = ((ContextWrapper) context).getBaseContext();
            }
            if (m15Var == null) {
                rd6.w("View ", this, " is not within a subclass of FragmentActivity.");
                return null;
            }
            f25VarM = m15Var.m();
        } else {
            if (!j15Var.t()) {
                throw new IllegalStateException("The Fragment " + j15Var + " that owns View " + this + " has already been destroyed. Nested fragments should always use the child FragmentManager.");
            }
            f25VarM = j15Var.h();
        }
        return (F) f25VarM.C(getId());
    }

    @Override // android.view.View
    public final WindowInsets onApplyWindowInsets(WindowInsets windowInsets) {
        windowInsets.getClass();
        return windowInsets;
    }

    @Override // android.view.ViewGroup
    public final void removeAllViewsInLayout() {
        int childCount = getChildCount();
        while (true) {
            childCount--;
            if (-1 >= childCount) {
                super.removeAllViewsInLayout();
                return;
            } else {
                View childAt = getChildAt(childCount);
                childAt.getClass();
                a(childAt);
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public final void removeView(View view) {
        view.getClass();
        a(view);
        super.removeView(view);
    }

    @Override // android.view.ViewGroup
    public final void removeViewAt(int i) {
        View childAt = getChildAt(i);
        childAt.getClass();
        a(childAt);
        super.removeViewAt(i);
    }

    @Override // android.view.ViewGroup
    public final void removeViewInLayout(View view) {
        view.getClass();
        a(view);
        super.removeViewInLayout(view);
    }

    @Override // android.view.ViewGroup
    public final void removeViews(int i, int i2) {
        int i3 = i + i2;
        for (int i4 = i; i4 < i3; i4++) {
            View childAt = getChildAt(i4);
            childAt.getClass();
            a(childAt);
        }
        super.removeViews(i, i2);
    }

    @Override // android.view.ViewGroup
    public final void removeViewsInLayout(int i, int i2) {
        int i3 = i + i2;
        for (int i4 = i; i4 < i3; i4++) {
            View childAt = getChildAt(i4);
            childAt.getClass();
            a(childAt);
        }
        super.removeViewsInLayout(i, i2);
    }

    public final void setDrawDisappearingViewsLast(boolean z) {
        this.d = z;
    }

    @Override // android.view.ViewGroup
    public void setLayoutTransition(LayoutTransition layoutTransition) {
        throw new UnsupportedOperationException("FragmentContainerView does not support Layout Transitions or animateLayoutChanges=\"true\".");
    }

    @Override // android.view.View
    public void setOnApplyWindowInsetsListener(View.OnApplyWindowInsetsListener onApplyWindowInsetsListener) {
        onApplyWindowInsetsListener.getClass();
        this.c = onApplyWindowInsetsListener;
    }

    @Override // android.view.ViewGroup
    public final void startViewTransition(View view) {
        view.getClass();
        if (view.getParent() == this) {
            this.b.add(view);
        }
        super.startViewTransition(view);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FragmentContainerView(Context context, AttributeSet attributeSet) {
        String str;
        super(context, attributeSet, 0);
        context.getClass();
        this.a = new ArrayList();
        this.b = new ArrayList();
        this.d = true;
        if (attributeSet != null) {
            String classAttribute = attributeSet.getClassAttribute();
            TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, asa.b, 0, 0);
            if (classAttribute == null) {
                classAttribute = typedArrayObtainStyledAttributes.getString(0);
                str = "android:name";
            } else {
                str = "class";
            }
            typedArrayObtainStyledAttributes.recycle();
            if (classAttribute == null || isInEditMode()) {
                return;
            }
            throw new UnsupportedOperationException("FragmentContainerView must be within a FragmentActivity to use " + str + "=\"" + classAttribute + '\"');
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FragmentContainerView(Context context) {
        super(context);
        context.getClass();
        this.a = new ArrayList();
        this.b = new ArrayList();
        this.d = true;
    }
}
