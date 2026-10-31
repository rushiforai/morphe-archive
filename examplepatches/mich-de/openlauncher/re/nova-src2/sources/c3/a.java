package c3;

import android.content.Context;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.node.Owner;
import java.lang.ref.WeakReference;
import kotlin.KotlinNothingValueException;
import kotlin.Unit;
import kotlin.coroutines.ContinuationInterceptor;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Ref;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public abstract class a extends ViewGroup {
    public static final int $stable = 8;

    @Nullable
    private WeakReference<p1.w> cachedViewTreeCompositionContext;

    @Nullable
    private p1.v composition;
    private boolean creatingComposition;

    @Nullable
    private Function0<Unit> disposeViewCompositionStrategy;
    private boolean isTransitionGroupSet;

    @Nullable
    private p1.w parentContext;

    @Nullable
    private IBinder previousAttachedWindowToken;
    private boolean showLayoutBounds;

    public /* synthetic */ a(Context context) {
        this(context, null, 0);
    }

    public static /* synthetic */ void getShowLayoutBounds$annotations() {
    }

    public abstract void Content(p1.o oVar, int i5);

    public final void a() {
        if (this.creatingComposition) {
            return;
        }
        throw new UnsupportedOperationException("Cannot add views to " + getClass().getSimpleName() + "; only Compose content is supported");
    }

    @Override // android.view.ViewGroup
    public void addView(@Nullable View view) {
        a();
        super.addView(view);
    }

    @Override // android.view.ViewGroup
    public boolean addViewInLayout(@Nullable View view, int i5, @Nullable ViewGroup.LayoutParams layoutParams) {
        a();
        return super.addViewInLayout(view, i5, layoutParams);
    }

    public final void b() {
        if (this.composition == null) {
            try {
                this.creatingComposition = true;
                this.composition = f4.a(this, c(), new x1.e(new b2.p(this, 1), true, -656146368));
            } finally {
                this.creatingComposition = false;
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final p1.w c() {
        p1.y1 y1Var;
        CoroutineContext coroutineContext;
        p1.k1 k1Var;
        p1.w wVarB = this.parentContext;
        if (wVarB == null) {
            wVarB = b4.b(this);
            if (wVarB == null) {
                Object parent = getParent();
                while (wVarB == null && (parent instanceof View)) {
                    View view = (View) parent;
                    wVarB = b4.b(view);
                    parent = view.getParent();
                }
            }
            if (wVarB != null) {
                p1.w wVar = (!(wVarB instanceof p1.y1) || ((p1.w1) ((p1.y1) wVarB).f81663t.getValue()).compareTo(p1.w1.f81614b) > 0) ? wVarB : null;
                if (wVar != null) {
                    this.cachedViewTreeCompositionContext = new WeakReference<>(wVar);
                }
            } else {
                wVarB = null;
            }
            if (wVarB == null) {
                WeakReference<p1.w> weakReference = this.cachedViewTreeCompositionContext;
                if (weakReference == null || (wVarB = weakReference.get()) == null || ((wVarB instanceof p1.y1) && ((p1.w1) ((p1.y1) wVarB).f81663t.getValue()).compareTo(p1.w1.f81614b) <= 0)) {
                    wVarB = null;
                }
                if (wVarB == null) {
                    if (!isAttachedToWindow()) {
                        y2.a.b("Cannot locate windowRecomposer; View " + this + " is not attached to a window");
                    }
                    Object parent2 = getParent();
                    View view2 = this;
                    while (parent2 instanceof View) {
                        View view3 = (View) parent2;
                        if (view3.getId() == 16908290) {
                            break;
                        }
                        view2 = view3;
                        parent2 = view3.getParent();
                    }
                    p1.w wVarB2 = b4.b(view2);
                    if (wVarB2 == null) {
                        ((t3) v3.f19451a.get()).getClass();
                        EmptyCoroutineContext emptyCoroutineContext = EmptyCoroutineContext.f71803a;
                        emptyCoroutineContext.get(ContinuationInterceptor.f71801cp);
                        a70.d dVar = g1.f19287m;
                        if (Looper.myLooper() == Looper.getMainLooper()) {
                            coroutineContext = (CoroutineContext) g1.f19287m.getValue();
                        } else {
                            coroutineContext = (CoroutineContext) g1.n.get();
                            if (coroutineContext == null) {
                                throw new IllegalStateException("no AndroidUiDispatcher for this thread");
                            }
                        }
                        CoroutineContext coroutineContextPlus = coroutineContext.plus(emptyCoroutineContext);
                        p1.a1 a1Var = (p1.a1) coroutineContextPlus.get(p1.z0.f81690a);
                        if (a1Var != null) {
                            p1.k1 k1Var2 = new p1.k1(a1Var);
                            androidx.room.h hVar = k1Var2.f81464b;
                            synchronized (hVar.f15219b) {
                                hVar.f15218a = false;
                                Unit unit = Unit.f71706a;
                                k1Var = k1Var2;
                            }
                        } else {
                            k1Var = 0;
                        }
                        Ref.ObjectRef objectRef = new Ref.ObjectRef();
                        CoroutineContext t2Var = (b2.v) coroutineContextPlus.get(b2.u.f17025a);
                        if (t2Var == null) {
                            t2Var = new t2();
                            objectRef.f71863a = t2Var;
                        }
                        if (k1Var != 0) {
                            emptyCoroutineContext = k1Var;
                        }
                        CoroutineContext coroutineContextPlus2 = coroutineContextPlus.plus(emptyCoroutineContext).plus(t2Var);
                        p1.y1 y1Var2 = new p1.y1(coroutineContextPlus2);
                        synchronized (y1Var2.f81647b) {
                            y1Var2.f81662s = true;
                            Unit unit2 = Unit.f71706a;
                        }
                        y70.d dVarA = t70.k0.a(coroutineContextPlus2);
                        h6.a0 a0VarC = h6.y0.c(view2);
                        h6.u lifecycle = a0VarC != null ? a0VarC.getLifecycle() : null;
                        if (lifecycle == null) {
                            y2.a.c("ViewTreeLifecycleOwner not found from " + view2);
                            throw new KotlinNothingValueException();
                        }
                        view2.addOnAttachStateChangeListener(new w3(view2, y1Var2));
                        lifecycle.a(new z3(dVarA, k1Var, y1Var2, objectRef, view2));
                        view2.setTag(2131427488, y1Var2);
                        t70.l1 l1Var = t70.l1.f88818a;
                        Handler handler = view2.getHandler();
                        int i5 = u70.e.f90674a;
                        view2.addOnAttachStateChangeListener(new e0(t70.m0.t(l1Var, new u70.d(handler, "windowRecomposer cleanup", false).f90673f, null, new b00.e(y1Var2, view2, continuation, 24), 2), 2));
                        y1Var = y1Var2;
                    } else {
                        if (!(wVarB2 instanceof p1.y1)) {
                            throw new IllegalStateException("root viewTreeParentCompositionContext is not a Recomposer");
                        }
                        y1Var = (p1.y1) wVarB2;
                    }
                    continuation = ((p1.w1) y1Var.f81663t.getValue()).compareTo(p1.w1.f81614b) > 0 ? y1Var : null;
                    if (continuation != null) {
                        this.cachedViewTreeCompositionContext = new WeakReference<>(continuation);
                    }
                    return y1Var;
                }
            }
        }
        return wVarB;
    }

    public final void createComposition() {
        if (this.parentContext == null && !isAttachedToWindow()) {
            throw new IllegalStateException("createComposition requires either a parent reference or the View to be attachedto a window. Attach the View or call setParentCompositionReference.");
        }
        b();
    }

    public final void disposeComposition() {
        p1.v vVar = this.composition;
        if (vVar != null) {
            vVar.dispose();
        }
        this.composition = null;
        requestLayout();
    }

    public final boolean getHasComposition() {
        return this.composition != null;
    }

    public abstract boolean getShouldCreateCompositionOnAttachedToWindow();

    public final boolean getShowLayoutBounds() {
        return this.showLayoutBounds;
    }

    public void internalOnLayout$ui_release(boolean z11, int i5, int i11, int i12, int i13) {
        View childAt = getChildAt(0);
        if (childAt != null) {
            childAt.layout(getPaddingLeft(), getPaddingTop(), (i12 - i5) - getPaddingRight(), (i13 - i11) - getPaddingBottom());
        }
    }

    public void internalOnMeasure$ui_release(int i5, int i11) {
        View childAt = getChildAt(0);
        if (childAt == null) {
            super.onMeasure(i5, i11);
            return;
        }
        childAt.measure(View.MeasureSpec.makeMeasureSpec(Math.max(0, (View.MeasureSpec.getSize(i5) - getPaddingLeft()) - getPaddingRight()), View.MeasureSpec.getMode(i5)), View.MeasureSpec.makeMeasureSpec(Math.max(0, (View.MeasureSpec.getSize(i11) - getPaddingTop()) - getPaddingBottom()), View.MeasureSpec.getMode(i11)));
        setMeasuredDimension(getPaddingRight() + getPaddingLeft() + childAt.getMeasuredWidth(), getPaddingBottom() + getPaddingTop() + childAt.getMeasuredHeight());
    }

    @Override // android.view.ViewGroup
    public boolean isTransitionGroup() {
        return !this.isTransitionGroupSet || super.isTransitionGroup();
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        IBinder windowToken = getWindowToken();
        if (this.previousAttachedWindowToken != windowToken) {
            this.previousAttachedWindowToken = windowToken;
            this.cachedViewTreeCompositionContext = null;
        }
        if (getShouldCreateCompositionOnAttachedToWindow()) {
            b();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        internalOnLayout$ui_release(z11, i5, i11, i12, i13);
    }

    @Override // android.view.View
    public final void onMeasure(int i5, int i11) {
        b();
        internalOnMeasure$ui_release(i5, i11);
    }

    @Override // android.view.View
    public void onRtlPropertiesChanged(int i5) {
        View childAt = getChildAt(0);
        if (childAt != null) {
            childAt.setLayoutDirection(i5);
        }
    }

    public final void setParentCompositionContext(@Nullable p1.w wVar) {
        if (this.parentContext != wVar) {
            this.parentContext = wVar;
            if (wVar != null) {
                this.cachedViewTreeCompositionContext = null;
            }
            p1.v vVar = this.composition;
            if (vVar != null) {
                vVar.dispose();
                this.composition = null;
                if (isAttachedToWindow()) {
                    b();
                }
            }
        }
    }

    public final void setShowLayoutBounds(boolean z11) {
        this.showLayoutBounds = z11;
        KeyEvent.Callback childAt = getChildAt(0);
        if (childAt != null) {
            ((Owner) childAt).setShowLayoutBounds(z11);
        }
    }

    @Override // android.view.ViewGroup
    public void setTransitionGroup(boolean z11) {
        super.setTransitionGroup(z11);
        this.isTransitionGroupSet = true;
    }

    public final void setViewCompositionStrategy(@NotNull l3 l3Var) {
        Function0<Unit> function0 = this.disposeViewCompositionStrategy;
        if (function0 != null) {
            function0.invoke();
        }
        this.disposeViewCompositionStrategy = l3Var.a(this);
    }

    @Override // android.view.ViewGroup
    public boolean shouldDelayChildPressedState() {
        return false;
    }

    public a(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        setClipChildren(false);
        setClipToPadding(false);
        setImportantForAccessibility(1);
        e0 e0Var = new e0(this, 1);
        addOnAttachStateChangeListener(e0Var);
        h3 h3Var = new h3(this);
        fg.a.x(this).f82085a.add(h3Var);
        this.disposeViewCompositionStrategy = new b90.l(1, this, e0Var, h3Var);
    }

    @Override // android.view.ViewGroup
    public void addView(@Nullable View view, int i5) {
        a();
        super.addView(view, i5);
    }

    @Override // android.view.ViewGroup
    public boolean addViewInLayout(@Nullable View view, int i5, @Nullable ViewGroup.LayoutParams layoutParams, boolean z11) {
        a();
        return super.addViewInLayout(view, i5, layoutParams, z11);
    }

    @Override // android.view.ViewGroup
    public void addView(@Nullable View view, int i5, int i11) {
        a();
        super.addView(view, i5, i11);
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public void addView(@Nullable View view, @Nullable ViewGroup.LayoutParams layoutParams) {
        a();
        super.addView(view, layoutParams);
    }

    @Override // android.view.ViewGroup
    public void addView(@Nullable View view, int i5, @Nullable ViewGroup.LayoutParams layoutParams) {
        a();
        super.addView(view, i5, layoutParams);
    }
}
