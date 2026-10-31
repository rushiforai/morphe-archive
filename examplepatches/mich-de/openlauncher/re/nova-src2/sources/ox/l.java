package ox;

import android.content.Context;
import android.widget.FrameLayout;
import com.google.android.gms.internal.consent_sdk.e0;
import com.google.android.gms.internal.consent_sdk.k0;
import dx.b0;
import dx.w;
import e10.d0;
import e10.s2;
import e10.y2;
import h10.a1;
import h10.y0;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function2;
import p1.e1;
import p1.o0;
import p1.t1;

/* loaded from: classes4.dex */
public final class l extends FrameLayout {

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ int f81088c = 0;

    /* renamed from: a, reason: collision with root package name */
    public final e1 f81089a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f81090b;

    public l(Context context) {
        super(context, null);
        this.f81089a = androidx.compose.runtime.d.k(Boolean.FALSE);
        setVisibility(8);
    }

    public final void a(y0 y0Var, p1.o oVar, int i5) {
        l lVar = this;
        y0 y0Var2 = y0Var;
        p1.t tVar = (p1.t) oVar;
        tVar.d0(-274572728);
        int i11 = (tVar.h(y0Var2) ? 4 : 2) | i5 | (tVar.h(lVar) ? 32 : 16);
        if ((i11 & 19) == 18 && tVar.E()) {
            tVar.V();
        } else {
            dx.t.a("app_drawer");
            w wVarB = k0.B("app_drawer", tVar, 6);
            e1 e1VarG = p7.u.G(wVarB.f49809c, tVar, 0);
            b0 b0Var = (b0) e1VarG.getValue();
            tVar.b0(-511854362);
            boolean zF = ((i11 & 14) == 4) | tVar.f(e1VarG) | tVar.h(lVar);
            Object objP = tVar.P();
            if (zF || objP == p1.n.f81514a) {
                b10.k kVar = new b10.k(28, lVar, y0Var2, (Continuation) null, e1VarG);
                tVar.m0(kVar);
                objP = kVar;
            }
            tVar.p(false);
            o0.f(b0Var, (Function2) objP, tVar);
            s2 s2VarW = y2.f51877a.W();
            tVar.b0(-1180187305);
            e1 e1VarA = androidx.compose.runtime.d.a(s2VarW.c(), s2VarW.l(), null, tVar, 0, 2);
            tVar.p(false);
            lVar = this;
            y0Var2 = y0Var;
            e0.f(wVarB, androidx.compose.foundation.layout.d.l(androidx.compose.foundation.layout.e.e(b2.r.f17024a, 1.0f), 10, 0.0f, 2), qx.k.b(qx.l.f84545g, (d0) e1VarA.getValue(), 4), null, null, tVar, 56, 24);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new a1(lVar, y0Var2, i5, 18);
        }
    }

    @Override // android.view.View, android.view.ViewParent
    public final void requestLayout() {
        if (this.f81090b) {
            return;
        }
        super.requestLayout();
    }
}
