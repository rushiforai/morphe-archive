package c3;

import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.AndroidComposeView;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class p extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f19395j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ AndroidComposeView f19396k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ p(AndroidComposeView androidComposeView, int i5) {
        super(1);
        this.f19395j = i5;
        this.f19396k = androidComposeView;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        g2.d dVarA;
        int i5 = this.f19395j;
        AndroidComposeView androidComposeView = this.f19396k;
        switch (i5) {
            case 0:
                int i11 = ((r2.a) obj).f85330a;
                if (i11 == 1) {
                    zRequestFocusFromTouch = androidComposeView.isInTouchMode();
                } else if (i11 != 2) {
                    zRequestFocusFromTouch = false;
                } else if (androidComposeView.isInTouchMode()) {
                    zRequestFocusFromTouch = androidComposeView.requestFocusFromTouch();
                }
                return Boolean.valueOf(zRequestFocusFromTouch);
            case 1:
                KeyEvent keyEventB = ((t2.b) obj).b();
                long jV = t2.c.v(keyEventB);
                int i12 = t2.a.f88473p;
                if (t2.a.a(jV, p10.y1.M())) {
                    dVarA = g2.d.a(2);
                } else if (t2.a.a(jV, p10.y1.L())) {
                    dVarA = g2.d.a(1);
                } else if (t2.a.a(jV, p10.y1.S())) {
                    dVarA = g2.d.a(t2.c.F(keyEventB) ? 2 : 1);
                } else {
                    dVarA = t2.a.a(jV, p10.y1.H()) ? g2.d.a(4) : t2.a.a(jV, p10.y1.G()) ? g2.d.a(3) : (t2.a.a(jV, p10.y1.I()) || t2.a.a(jV, p10.y1.P())) ? g2.d.a(5) : (t2.a.a(jV, p10.y1.F()) || t2.a.a(jV, p10.y1.O())) ? g2.d.a(6) : (t2.a.a(jV, p10.y1.E()) || t2.a.a(jV, p10.y1.J()) || t2.a.a(jV, p10.y1.N())) ? g2.d.a(7) : (t2.a.a(jV, p10.y1.D()) || t2.a.a(jV, p10.y1.K())) ? g2.d.a(8) : null;
                }
                if (dVarA == null || !p3.i.t(t2.c.x(keyEventB), 2)) {
                    return Boolean.FALSE;
                }
                Integer numH0 = u90.b.h0(dVarA.d());
                h2.c embeddedViewFocusRect = androidComposeView.getEmbeddedViewFocusRect();
                Boolean boolH = ((g2.l) androidComposeView.getFocusOwner()).h(dVarA.d(), embeddedViewFocusRect, new w(dVarA, 1));
                if (boolH != null ? boolH.booleanValue() : true) {
                    return Boolean.TRUE;
                }
                if (!g2.g.j(dVarA.d())) {
                    return Boolean.FALSE;
                }
                if (numH0 != null) {
                    View viewFindNextNonChildView = androidComposeView.findNextNonChildView(numH0.intValue());
                    if (Intrinsics.b(viewFindNextNonChildView, androidComposeView)) {
                        viewFindNextNonChildView = null;
                    }
                    if (viewFindNextNonChildView != null) {
                        Rect rectK0 = embeddedViewFocusRect != null ? g90.k.k0(embeddedViewFocusRect) : null;
                        if (rectK0 == null) {
                            throw new IllegalStateException("Invalid rect");
                        }
                        View rootView = androidComposeView.getRootView();
                        Intrinsics.e(rootView, "null cannot be cast to non-null type android.view.ViewGroup");
                        ViewGroup viewGroup = (ViewGroup) rootView;
                        viewGroup.offsetDescendantRectToMyCoords(androidComposeView, rectK0);
                        viewGroup.offsetRectIntoDescendantCoords(viewFindNextNonChildView, rectK0);
                        if (u90.b.Z(viewFindNextNonChildView, numH0, rectK0)) {
                            return Boolean.TRUE;
                        }
                    }
                }
                if (!((g2.l) androidComposeView.getFocusOwner()).d(dVarA.d(), false, false)) {
                    return Boolean.TRUE;
                }
                Boolean boolH2 = ((g2.l) androidComposeView.getFocusOwner()).h(dVarA.d(), null, new w(dVarA, 0));
                return Boolean.valueOf(boolH2 != null ? boolH2.booleanValue() : true);
            default:
                Function0 function0 = (Function0) obj;
                Handler handler = androidComposeView.getHandler();
                if ((handler != null ? handler.getLooper() : null) == Looper.myLooper()) {
                    function0.invoke();
                } else {
                    Handler handler2 = androidComposeView.getHandler();
                    if (handler2 != null) {
                        handler2.post(new b2.b(function0, 2));
                    }
                }
                return Unit.f71706a;
        }
    }
}
