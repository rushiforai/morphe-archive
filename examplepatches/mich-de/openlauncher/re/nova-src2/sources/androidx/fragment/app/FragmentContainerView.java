package androidx.fragment.app;

import a5.h2;
import android.animation.LayoutTransition;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.WeakHashMap;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Landroidx/fragment/app/FragmentContainerView;", "Landroid/widget/FrameLayout;", "g90/k", "fragment_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class FragmentContainerView extends FrameLayout {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f14452a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f14453b;

    /* renamed from: c, reason: collision with root package name */
    public View.OnApplyWindowInsetsListener f14454c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f14455d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public FragmentContainerView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        String str;
        super(context, attributeSet, 0);
        Intrinsics.g(context, "context");
        this.f14452a = new ArrayList();
        this.f14453b = new ArrayList();
        this.f14455d = true;
        if (attributeSet != null) {
            String classAttribute = attributeSet.getClassAttribute();
            TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, d6.a.f48998b, 0, 0);
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
            throw new UnsupportedOperationException("FragmentContainerView must be within a FragmentActivity to use " + str + "=\"" + classAttribute + AbstractJsonLexerKt.STRING);
        }
    }

    public final void a(View view) {
        if (this.f14453b.contains(view)) {
            this.f14452a.add(view);
        }
    }

    @Override // android.view.ViewGroup
    public final void addView(View child, int i5, ViewGroup.LayoutParams layoutParams) {
        Intrinsics.g(child, "child");
        Object tag = child.getTag(2131428093);
        if ((tag instanceof h0 ? (h0) tag : null) != null) {
            super.addView(child, i5, layoutParams);
            return;
        }
        throw new IllegalStateException(("Views added to a FragmentContainerView must be associated with a Fragment. View " + child + " is not associated with a Fragment.").toString());
    }

    @Override // android.view.ViewGroup, android.view.View
    public final WindowInsets dispatchApplyWindowInsets(WindowInsets insets) {
        h2 h2VarG;
        Intrinsics.g(insets, "insets");
        h2 h2VarG2 = h2.g(null, insets);
        View.OnApplyWindowInsetsListener onApplyWindowInsetsListener = this.f14454c;
        if (onApplyWindowInsetsListener != null) {
            h2VarG = h2.g(null, g90.k.b0(onApplyWindowInsetsListener, this, insets));
        } else {
            WeakHashMap weakHashMap = a5.a1.f250a;
            WindowInsets windowInsetsF = h2VarG2.f();
            if (windowInsetsF != null) {
                WindowInsets windowInsetsB = a5.q0.b(this, windowInsetsF);
                if (!windowInsetsB.equals(windowInsetsF)) {
                    h2VarG2 = h2.g(this, windowInsetsB);
                }
            }
            h2VarG = h2VarG2;
        }
        if (!h2VarG.f296a.o()) {
            int childCount = getChildCount();
            for (int i5 = 0; i5 < childCount; i5++) {
                View childAt = getChildAt(i5);
                WeakHashMap weakHashMap2 = a5.a1.f250a;
                WindowInsets windowInsetsF2 = h2VarG.f();
                if (windowInsetsF2 != null) {
                    WindowInsets windowInsetsA = a5.q0.a(childAt, windowInsetsF2);
                    if (!windowInsetsA.equals(windowInsetsF2)) {
                        h2.g(childAt, windowInsetsA);
                    }
                }
            }
        }
        return insets;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchDraw(Canvas canvas) {
        Intrinsics.g(canvas, "canvas");
        if (this.f14455d) {
            Iterator it = this.f14452a.iterator();
            while (it.hasNext()) {
                super.drawChild(canvas, (View) it.next(), getDrawingTime());
            }
        }
        super.dispatchDraw(canvas);
    }

    @Override // android.view.ViewGroup
    public final boolean drawChild(Canvas canvas, View child, long j11) {
        Intrinsics.g(canvas, "canvas");
        Intrinsics.g(child, "child");
        if (this.f14455d) {
            ArrayList arrayList = this.f14452a;
            if (!arrayList.isEmpty() && arrayList.contains(child)) {
                return false;
            }
        }
        return super.drawChild(canvas, child, j11);
    }

    @Override // android.view.ViewGroup
    public final void endViewTransition(View view) {
        Intrinsics.g(view, "view");
        this.f14453b.remove(view);
        if (this.f14452a.remove(view)) {
            this.f14455d = true;
        }
        super.endViewTransition(view);
    }

    @Override // android.view.View
    public final WindowInsets onApplyWindowInsets(WindowInsets insets) {
        Intrinsics.g(insets, "insets");
        return insets;
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
                View view = getChildAt(childCount);
                Intrinsics.f(view, "view");
                a(view);
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public final void removeView(View view) {
        Intrinsics.g(view, "view");
        a(view);
        super.removeView(view);
    }

    @Override // android.view.ViewGroup
    public final void removeViewAt(int i5) {
        View view = getChildAt(i5);
        Intrinsics.f(view, "view");
        a(view);
        super.removeViewAt(i5);
    }

    @Override // android.view.ViewGroup
    public final void removeViewInLayout(View view) {
        Intrinsics.g(view, "view");
        a(view);
        super.removeViewInLayout(view);
    }

    @Override // android.view.ViewGroup
    public final void removeViews(int i5, int i11) {
        int i12 = i5 + i11;
        for (int i13 = i5; i13 < i12; i13++) {
            View view = getChildAt(i13);
            Intrinsics.f(view, "view");
            a(view);
        }
        super.removeViews(i5, i11);
    }

    @Override // android.view.ViewGroup
    public final void removeViewsInLayout(int i5, int i11) {
        int i12 = i5 + i11;
        for (int i13 = i5; i13 < i12; i13++) {
            View view = getChildAt(i13);
            Intrinsics.f(view, "view");
            a(view);
        }
        super.removeViewsInLayout(i5, i11);
    }

    @Override // android.view.ViewGroup
    public final void setLayoutTransition(LayoutTransition layoutTransition) {
        throw new UnsupportedOperationException("FragmentContainerView does not support Layout Transitions or animateLayoutChanges=\"true\".");
    }

    @Override // android.view.View
    public final void setOnApplyWindowInsetsListener(View.OnApplyWindowInsetsListener onApplyWindowInsetsListener) {
        this.f14454c = onApplyWindowInsetsListener;
    }

    @Override // android.view.ViewGroup
    public final void startViewTransition(View view) {
        Intrinsics.g(view, "view");
        if (view.getParent() == this) {
            this.f14453b.add(view);
        }
        super.startViewTransition(view);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FragmentContainerView(Context context, AttributeSet attrs, h1 h1Var) {
        View view;
        super(context, attrs);
        Intrinsics.g(context, "context");
        Intrinsics.g(attrs, "attrs");
        this.f14452a = new ArrayList();
        this.f14453b = new ArrayList();
        this.f14455d = true;
        String classAttribute = attrs.getClassAttribute();
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attrs, d6.a.f48998b, 0, 0);
        classAttribute = classAttribute == null ? typedArrayObtainStyledAttributes.getString(0) : classAttribute;
        String string = typedArrayObtainStyledAttributes.getString(1);
        typedArrayObtainStyledAttributes.recycle();
        int id2 = getId();
        h0 h0VarD = h1Var.D(id2);
        if (classAttribute != null && h0VarD == null) {
            if (id2 == -1) {
                throw new IllegalStateException(b.c0.l("FragmentContainerView must have an android:id to add Fragment ", classAttribute, string != null ? " with tag ".concat(string) : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b));
            }
            h0 h0VarInstantiate = h1Var.I().instantiate(context.getClassLoader(), classAttribute);
            Intrinsics.f(h0VarInstantiate, "fm.fragmentFactory.insta…ontext.classLoader, name)");
            h0VarInstantiate.mFragmentId = id2;
            h0VarInstantiate.mContainerId = id2;
            h0VarInstantiate.mTag = string;
            h0VarInstantiate.mFragmentManager = h1Var;
            h0VarInstantiate.mHost = h1Var.f14589w;
            h0VarInstantiate.onInflate(context, attrs, (Bundle) null);
            a aVar = new a(h1Var);
            aVar.h();
            aVar.b(this, h0VarInstantiate, string);
            aVar.m();
        }
        Iterator it = h1Var.f14571c.d().iterator();
        while (it.hasNext()) {
            n1 n1Var = (n1) it.next();
            h0 h0VarI = n1Var.i();
            if (h0VarI.mContainerId == getId() && (view = h0VarI.mView) != null && view.getParent() == null) {
                h0VarI.mContainer = this;
                n1Var.a();
                n1Var.j();
            }
        }
    }
}
