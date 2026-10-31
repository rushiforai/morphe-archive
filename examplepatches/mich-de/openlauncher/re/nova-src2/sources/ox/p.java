package ox;

import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;
import androidx.compose.ui.platform.ComposeView;
import c3.k3;
import com.teslacoilsw.launcher.NovaLauncher;
import dx.i0;
import h6.a0;
import h6.y0;
import java.lang.ref.WeakReference;
import kl.q0;
import kotlin.Result;
import kotlin.ResultKt;
import mx.h1;
import o9.n1;

/* loaded from: classes4.dex */
public final class p extends FrameLayout {

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ int f81095f = 0;

    /* renamed from: a, reason: collision with root package name */
    public ComposeView f81096a;

    /* renamed from: b, reason: collision with root package name */
    public i0 f81097b;

    /* renamed from: c, reason: collision with root package name */
    public String f81098c;

    /* renamed from: d, reason: collision with root package name */
    public mx.f f81099d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f81100e;

    public p(Context context) {
        super(context);
        this.f81100e = true;
        setVisibility(8);
    }

    public final void a() {
        Object objA;
        String str = this.f81098c;
        if (str == null) {
            return;
        }
        boolean zB = h1.b();
        boolean zD = fy.a.d();
        if (zB || zD) {
            View view = this.f81096a;
            if (view != null) {
                removeView(view);
            }
            this.f81096a = null;
            i0 i0Var = this.f81097b;
            if (i0Var != null) {
                i0Var.a();
            }
            this.f81097b = null;
            setVisibility(8);
            return;
        }
        if (!px.c.f83110a.e(getContext())) {
            setVisibility(8);
            return;
        }
        if (this.f81096a != null) {
            return;
        }
        mx.f fVar = this.f81099d;
        if (fVar == null) {
            try {
                int i5 = Result.f71687b;
                Context context = getContext();
                q0 q0Var = n1.C0;
                objA = ((NovaLauncher) o9.k.Y(context)).f79934x.E0;
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                objA = ResultKt.a(th2);
            }
            if (objA instanceof Result.Failure) {
                objA = null;
            }
            fVar = (mx.f) objA;
        }
        hx.c cVar = fVar != null ? new hx.c(fVar.f77071d, fVar.f77076i, fVar.f77075h, fVar.f77074g) : null;
        a0 a0VarC = y0.c(this);
        if (a0VarC == null) {
            Object context2 = getContext();
            a0VarC = context2 instanceof a0 ? (a0) context2 : null;
        }
        i0 i0Var2 = a0VarC != null ? new i0(a0VarC) : null;
        this.f81097b = i0Var2;
        if (i0Var2 != null) {
            i0Var2.b(this.f81100e);
        }
        WeakReference weakReference = new WeakReference(this);
        ComposeView composeView = new ComposeView(getContext(), null, 0, 6, null);
        addView(composeView, new FrameLayout.LayoutParams(-1, -2));
        composeView.setViewCompositionStrategy(k3.f19374a);
        composeView.setContent(new x1.e(new a1.i(i0Var2, str, weakReference, cVar, 10), true, -1856203316));
        this.f81096a = composeView;
    }

    public final void b() {
        c("drawer_suggestions", null);
    }

    public final void c(String str, mx.f fVar) {
        this.f81098c = str;
        this.f81099d = fVar;
        a();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        a();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        ComposeView composeView = this.f81096a;
        if (composeView != null) {
            removeView(composeView);
        }
        this.f81096a = null;
        i0 i0Var = this.f81097b;
        if (i0Var != null) {
            i0Var.a();
        }
        this.f81097b = null;
    }
}
