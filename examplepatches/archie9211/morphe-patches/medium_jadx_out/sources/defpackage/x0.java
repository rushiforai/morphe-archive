package defpackage;

import android.content.Context;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Trace;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import com.medium.reader.R;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class x0 extends ViewGroup {
    public WeakReference a;
    public IBinder b;
    public a9f c;
    public l22 d;
    public u12 e;
    public m45 f;
    public boolean g;
    public boolean h;
    public boolean i;

    public x0(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        setClipChildren(false);
        setClipToPadding(false);
        setImportantForAccessibility(1);
        pp ppVar = new pp(6, this);
        addOnAttachStateChangeListener(ppVar);
        xte xteVar = new xte(this);
        rr7.z(this).a.add(xteVar);
        this.f = new k62(this, ppVar, xteVar, 2);
    }

    private final void setParentContext(l22 l22Var) {
        if (this.d != l22Var) {
            this.d = l22Var;
            if (l22Var != null) {
                this.a = null;
            }
            a9f a9fVar = this.c;
            if (a9fVar != null) {
                a9fVar.a();
                this.c = null;
                if (isAttachedToWindow()) {
                    f();
                }
            }
        }
    }

    private final void setPreviousAttachedWindowToken(IBinder iBinder) {
        if (this.b != iBinder) {
            this.b = iBinder;
            this.a = null;
        }
    }

    public abstract void a(x12 x12Var, int i);

    @Override // android.view.ViewGroup
    public final void addView(View view) {
        c();
        super.addView(view);
    }

    @Override // android.view.ViewGroup
    public final boolean addViewInLayout(View view, int i, ViewGroup.LayoutParams layoutParams) {
        c();
        return super.addViewInLayout(view, i, layoutParams);
    }

    public final void b() {
        if (isAttachedToWindow()) {
            setPreviousAttachedWindowToken(getWindowToken());
            if (this.e == null) {
                mn mnVar = null;
                if (getChildCount() != 0) {
                    View childAt = getChildAt(0);
                    if (childAt instanceof mn) {
                        mnVar = (mn) childAt;
                    }
                }
                if (mnVar != null) {
                    mnVar.setComposeViewContext(k(kng.x(this), mnVar.getComposeViewContext()));
                }
            }
            if (getShouldCreateCompositionOnAttachedToWindow()) {
                f();
            }
        }
    }

    public final void c() {
        if (this.h) {
            return;
        }
        throw new UnsupportedOperationException("Cannot add views to " + getClass().getSimpleName() + "; only Compose content is supported");
    }

    public final void d() {
        u12 u12Var;
        if (this.d != null || isAttachedToWindow() || ((u12Var = this.e) != null && u12Var.a.isAttachedToWindow())) {
            f();
        } else {
            ygf.f("createComposition requires a previous call to createComposition(ComposeViewContext), a parent reference, or the View to be attached to a window. Attach the View or call setParentCompositionReference.");
        }
    }

    public final void e() {
        View childAt = getChildAt(0);
        mn mnVar = childAt instanceof mn ? (mn) childAt : null;
        if (mnVar != null && mnVar.Y0) {
            mnVar.getComposeViewContext().b();
            mnVar.Y0 = false;
        }
        a9f a9fVar = this.c;
        if (a9fVar != null) {
            a9fVar.a();
        }
        this.c = null;
        requestLayout();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void f() {
        if (this.c == null) {
            boolean z = false;
            Object[] objArr = 0;
            try {
                this.h = true;
                Trace.beginSection("Compose:initializeView");
                try {
                    u12 u12VarI = this.e;
                    if (u12VarI == null) {
                        u12VarI = i();
                    }
                    this.c = d9f.a(this, u12VarI, new mz1(new w0(objArr == true ? 1 : 0, this), true, 1003123809));
                    Trace.endSection();
                } catch (Throwable th) {
                    Trace.endSection();
                    throw th;
                }
            } finally {
                this.h = false;
            }
        }
    }

    public void g(boolean z, int i, int i2, int i3, int i4) {
        View childAt = getChildAt(0);
        if (childAt != null) {
            childAt.layout(getPaddingLeft(), getPaddingTop(), (i3 - i) - getPaddingRight(), (i4 - i2) - getPaddingBottom());
        }
    }

    /* JADX INFO: renamed from: getAutoClearFocusBehavior-4UtRPd4, reason: not valid java name */
    public final int m178getAutoClearFocusBehavior4UtRPd4() {
        Object tag = getTag(R.id.auto_clear_focus_behavior_tag);
        tf0 tf0Var = tag instanceof tf0 ? (tf0) tag : null;
        if (tf0Var != null) {
            return tf0Var.a;
        }
        return 1;
    }

    public final u12 getComposeViewContext$ui() {
        return this.e;
    }

    public final boolean getHasComposition() {
        return this.c != null;
    }

    public boolean getShouldCreateCompositionOnAttachedToWindow() {
        return true;
    }

    public final boolean getShowLayoutBounds() {
        return this.g;
    }

    public void h(int i, int i2) {
        View childAt = getChildAt(0);
        if (childAt == null) {
            super.onMeasure(i, i2);
            return;
        }
        childAt.measure(View.MeasureSpec.makeMeasureSpec(Math.max(0, (View.MeasureSpec.getSize(i) - getPaddingLeft()) - getPaddingRight()), View.MeasureSpec.getMode(i)), View.MeasureSpec.makeMeasureSpec(Math.max(0, (View.MeasureSpec.getSize(i2) - getPaddingTop()) - getPaddingBottom()), View.MeasureSpec.getMode(i2)));
        setMeasuredDimension(getPaddingRight() + getPaddingLeft() + childAt.getMeasuredWidth(), getPaddingBottom() + getPaddingTop() + childAt.getMeasuredHeight());
    }

    /* JADX WARN: Removed duplicated region for block: B:4:0x0007  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.u12 i() {
        /*
            r9 = this;
            int r0 = r9.getChildCount()
            r1 = 0
            if (r0 != 0) goto L9
        L7:
            r0 = r1
            goto L1c
        L9:
            r0 = 0
            android.view.View r0 = r9.getChildAt(r0)
            boolean r2 = r0 instanceof defpackage.mn
            if (r2 == 0) goto L15
            mn r0 = (defpackage.mn) r0
            goto L16
        L15:
            r0 = r1
        L16:
            if (r0 == 0) goto L7
            u12 r0 = r0.getComposeViewContext()
        L1c:
            android.view.View r4 = defpackage.kng.x(r9)
            u12 r2 = defpackage.kng.E(r4)
            if (r2 != 0) goto L7c
            l22 r5 = r9.j()
            iy6 r9 = defpackage.fp7.k(r4)
            if (r9 != 0) goto L38
            if (r0 == 0) goto L35
            iy6 r9 = r0.c
            goto L36
        L35:
            r9 = r1
        L36:
            if (r9 == 0) goto L3a
        L38:
            r6 = r9
            goto L40
        L3a:
            java.lang.String r9 = "Composed into the View which doesn't propagate ViewTreeLifecycleOwner!"
            defpackage.ygf.f(r9)
            return r1
        L40:
            hpb r9 = defpackage.gp7.k(r4)
            if (r9 != 0) goto L4e
            if (r0 == 0) goto L4b
            hpb r9 = r0.d
            goto L4c
        L4b:
            r9 = r1
        L4c:
            if (r9 == 0) goto L50
        L4e:
            r7 = r9
            goto L56
        L50:
            java.lang.String r9 = "Composed into the View which doesn't propagate ViewTreeSavedStateRegistryOwner!"
            defpackage.ygf.f(r9)
            return r1
        L56:
            wue r9 = defpackage.hp7.z(r4)
            if (r9 != 0) goto L62
            if (r0 == 0) goto L60
            wue r1 = r0.e
        L60:
            r8 = r1
            goto L63
        L62:
            r8 = r9
        L63:
            u12 r2 = new u12
            android.view.View r9 = defpackage.kng.x(r4)
            u12 r3 = defpackage.kng.E(r9)
            r2.<init>(r3, r4, r5, r6, r7, r8)
            java.lang.ref.WeakReference r9 = new java.lang.ref.WeakReference
            r9.<init>(r2)
            r0 = 2131361889(0x7f0a0061, float:1.8343543E38)
            r4.setTag(r0, r9)
            return r2
        L7c:
            u12 r9 = r9.k(r4, r2)
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.x0.i():u12");
    }

    @Override // android.view.ViewGroup
    public final boolean isTransitionGroup() {
        return !this.i || super.isTransitionGroup();
    }

    public final l22 j() {
        swa swaVar;
        ib2 ib2Var;
        ft ftVar;
        l22 l22VarA = this.d;
        if (l22VarA == null) {
            l22VarA = t5f.a(this);
            if (l22VarA == null) {
                Object parent = getParent();
                while (l22VarA == null && (parent instanceof View)) {
                    View view = (View) parent;
                    l22VarA = t5f.a(view);
                    parent = ep7.u(view);
                }
            }
            boolean z = false;
            if (l22VarA != null) {
                l22 l22Var = (!(l22VarA instanceof swa) || ((pwa) ((swa) l22VarA).u.getValue()).compareTo(pwa.ShuttingDown) > 0) ? l22VarA : null;
                if (l22Var != null) {
                    this.a = new WeakReference(l22Var);
                }
            } else {
                l22VarA = null;
            }
            if (l22VarA == null) {
                WeakReference weakReference = this.a;
                if (weakReference == null || (l22VarA = (l22) weakReference.get()) == null || ((l22VarA instanceof swa) && ((pwa) ((swa) l22VarA).u.getValue()).compareTo(pwa.ShuttingDown) <= 0)) {
                    l22VarA = null;
                }
                if (l22VarA == null) {
                    if (!isAttachedToWindow()) {
                        b26.b("Cannot locate windowRecomposer; View " + this + " is not attached to a window");
                    }
                    View view2 = this;
                    Object parent2 = ep7.u(this);
                    while (parent2 instanceof View) {
                        View view3 = (View) parent2;
                        if (view3.getId() == 16908290) {
                            break;
                        }
                        view2 = view3;
                        parent2 = view3.getParent();
                    }
                    l22 l22VarA2 = t5f.a(view2);
                    if (l22VarA2 == null) {
                        ((p5f) q5f.a.get()).getClass();
                        ib2 ib2Var2 = zx3.a;
                        w5d w5dVar = dt.m;
                        if (Looper.myLooper() == Looper.getMainLooper()) {
                            ib2Var = (ib2) dt.m.getValue();
                        } else {
                            ib2Var = (ib2) dt.n.get();
                            if (ib2Var == null) {
                                ygf.f("no AndroidUiDispatcher for this thread");
                                return null;
                            }
                        }
                        ib2 ib2VarJ0 = ib2Var.j0(ib2Var2);
                        ft ftVar2 = (ft) ib2VarJ0.o0(tz7.j);
                        if (ftVar2 != null) {
                            ftVar = new ft(ftVar2);
                            zf3 zf3Var = (zf3) ftVar.c;
                            synchronized (zf3Var.d) {
                                zf3Var.c = false;
                            }
                        } else {
                            ftVar = null;
                        }
                        rya ryaVar = new rya();
                        ib2 b48Var = (a48) ib2VarJ0.o0(wz7.f);
                        if (b48Var == null) {
                            b48Var = new b48(view2.getContext().getApplicationContext());
                            ryaVar.a = b48Var;
                        }
                        if (ftVar != null) {
                            ib2Var2 = ftVar;
                        }
                        ib2 ib2VarJ02 = ib2VarJ0.j0(ib2Var2).j0(b48Var);
                        swaVar = new swa(ib2VarJ02);
                        swaVar.J();
                        k92 k92VarC = o7f.c(ib2VarJ02);
                        iy6 iy6VarK = fp7.k(view2);
                        wx6 lifecycle = iy6VarK != null ? iy6VarK.getLifecycle() : null;
                        if (lifecycle == null) {
                            b26.c("ViewTreeLifecycleOwner not found from " + view2);
                            z72.b();
                            return null;
                        }
                        view2.addOnAttachStateChangeListener(new q15(3, view2, swaVar));
                        lifecycle.a(new x15(k92VarC, ftVar, swaVar, ryaVar));
                        view2.setTag(R.id.androidx_compose_ui_view_composition_context, swaVar);
                        qd5 qd5Var = qd5.a;
                        Handler handler = view2.getHandler();
                        int i = fi5.a;
                        view2.addOnAttachStateChangeListener(new pp(7, vx0.c0(qd5Var, new ei5(handler, "windowRecomposer cleanup", false).f, null, new cfd(swaVar, view2, z ? 1 : 0, 27), 2)));
                    } else {
                        if (!(l22VarA2 instanceof swa)) {
                            ygf.f("root viewTreeParentCompositionContext is not a Recomposer");
                            return null;
                        }
                        swaVar = (swa) l22VarA2;
                    }
                    swa swaVar2 = ((pwa) swaVar.u.getValue()).compareTo(pwa.ShuttingDown) > 0 ? swaVar : null;
                    if (swaVar2 != null) {
                        this.a = new WeakReference(swaVar2);
                    }
                    return swaVar;
                }
            }
        }
        return l22VarA;
    }

    public final u12 k(View view, u12 u12Var) {
        l22 l22VarJ = j();
        iy6 iy6VarK = fp7.k(view);
        wue wueVarZ = hp7.z(view);
        hpb hpbVarK = gp7.k(view);
        l22 l22Var = u12Var.b;
        hpb hpbVar = u12Var.d;
        iy6 iy6Var = u12Var.c;
        if (l22VarJ == l22Var && iy6VarK == iy6Var && wueVarZ == u12Var.e && hpbVarK == hpbVar) {
            return u12Var;
        }
        if (l22VarJ.j() != u12Var.b.j()) {
            e();
        }
        if (iy6VarK == null) {
            iy6VarK = iy6Var;
        }
        u12 u12Var2 = new u12(u12Var, view, l22VarJ, iy6VarK, hpbVarK == null ? hpbVar : hpbVarK, wueVarZ);
        view.setTag(R.id.androidx_compose_ui_view_compose_view_context, new WeakReference(u12Var2));
        return u12Var2;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        f78 f78Var = t5f.a;
        Object objU = ep7.u(this);
        View view = this;
        while (objU instanceof View) {
            View view2 = (View) objU;
            if (view2.getId() == 16908290) {
                break;
            }
            view = view2;
            objU = view2.getParent();
        }
        if (view.getParent() == null) {
            getHandler().postAtFrontOfQueue(new v0(0, this));
        } else {
            b();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        g(z, i, i2, i3, i4);
    }

    @Override // android.view.View
    public final void onMeasure(int i, int i2) {
        f();
        h(i, i2);
    }

    @Override // android.view.View
    public final void onRtlPropertiesChanged(int i) {
        View childAt = getChildAt(0);
        if (childAt != null) {
            childAt.setLayoutDirection(i);
        }
    }

    /* JADX INFO: renamed from: setAutoClearFocusBehavior-17tfJxM, reason: not valid java name */
    public final void m179setAutoClearFocusBehavior17tfJxM(int i) {
        setTag(R.id.auto_clear_focus_behavior_tag, new tf0(i));
    }

    public final void setComposeViewContext$ui(u12 u12Var) {
        if (this.e != u12Var) {
            if (u12Var == null) {
                e();
            } else if (getChildCount() != 0) {
                View childAt = getChildAt(0);
                mn mnVar = childAt instanceof mn ? (mn) childAt : null;
                if (mnVar != null) {
                    if (mnVar.getCoroutineContext() != u12Var.b.j()) {
                        e();
                    }
                    mnVar.setComposeViewContext(u12Var);
                }
            }
            this.e = u12Var;
        }
    }

    public final void setParentCompositionContext(l22 l22Var) {
        setParentContext(l22Var);
    }

    public final void setShowLayoutBounds(boolean z) {
        this.g = z;
        KeyEvent.Callback childAt = getChildAt(0);
        if (childAt != null) {
            ((mn) ((mx8) childAt)).setShowLayoutBounds(z);
        }
    }

    @Override // android.view.ViewGroup
    public void setTransitionGroup(boolean z) {
        super.setTransitionGroup(z);
        this.i = true;
    }

    public final void setViewCompositionStrategy(yte yteVar) {
        m45 m45Var = this.f;
        if (m45Var != null) {
            m45Var.invoke();
        }
        this.f = yteVar.b(this);
    }

    @Override // android.view.ViewGroup
    public final boolean shouldDelayChildPressedState() {
        return false;
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i) {
        c();
        super.addView(view, i);
    }

    @Override // android.view.ViewGroup
    public final boolean addViewInLayout(View view, int i, ViewGroup.LayoutParams layoutParams, boolean z) {
        c();
        return super.addViewInLayout(view, i, layoutParams, z);
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i, int i2) {
        c();
        super.addView(view, i, i2);
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public final void addView(View view, ViewGroup.LayoutParams layoutParams) {
        c();
        super.addView(view, layoutParams);
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i, ViewGroup.LayoutParams layoutParams) {
        c();
        super.addView(view, i, layoutParams);
    }

    public static /* synthetic */ void getComposeViewContext$ui$annotations() {
    }

    private static /* synthetic */ void getDisposeViewCompositionStrategy$annotations() {
    }

    public static /* synthetic */ void getShowLayoutBounds$annotations() {
    }
}
