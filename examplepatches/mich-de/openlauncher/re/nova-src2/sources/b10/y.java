package b10;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.android.launcher3.views.DoubleShadowBubbleTextView;
import com.teslacoilsw.launcher.onboarding.FirstRunActivityCompose;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class y implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16965a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f16966b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f16967c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f16968d;

    public /* synthetic */ y(int i5, t70.j0 j0Var, p0.b bVar) {
        this.f16965a = 0;
        this.f16966b = i5;
        this.f16967c = j0Var;
        this.f16968d = bVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5 = this.f16965a;
        Object[] objArr = 0;
        int i11 = 1;
        int i12 = this.f16966b;
        Object obj2 = this.f16968d;
        Object obj3 = this.f16967c;
        switch (i5) {
            case 0:
                t70.j0 j0Var = (t70.j0) obj3;
                p0.b bVar = (p0.b) obj2;
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                int i13 = FirstRunActivityCompose.f45937s;
                if (zBooleanValue && i12 == 0) {
                    t70.m0.t(j0Var, null, null, new e0(bVar, objArr == true ? 1 : 0, i11), 3);
                }
                return Unit.f71706a;
            case 1:
                e0.x1 x1Var = (e0.x1) obj3;
                z2.i1 i1Var = (z2.i1) obj2;
                z2.h1 h1Var = (z2.h1) obj;
                int iH = x1Var.f50160a.h();
                if (iH < 0) {
                    iH = 0;
                }
                if (iH <= i12) {
                    i12 = iH;
                }
                int i14 = -i12;
                boolean z11 = x1Var.f50161b;
                int i15 = z11 ? 0 : i14;
                if (!z11) {
                    i14 = 0;
                }
                h1Var.f98075a = true;
                z2.h1.n(h1Var, i1Var, i15, i14);
                Unit unit = Unit.f71706a;
                h1Var.f98075a = false;
                return Unit.f71706a;
            case 2:
                t0.c2 c2Var = (t0.c2) obj3;
                z2.i1 i1Var2 = (z2.i1) obj2;
                z2.h1 h1Var2 = (z2.h1) obj;
                int i16 = c2Var.f87957b;
                t0.u1 u1Var = c2Var.f87956a;
                r3.f0 f0Var = c2Var.f87958c;
                t0.w1 w1Var = (t0.w1) c2Var.f87959d.invoke();
                u1Var.b(g0.d1.f56493a, t0.t0.m(h1Var2, i16, f0Var, w1Var != null ? w1Var.f88262a : null, false, i1Var2.f98081a), i12, i1Var2.f98082b);
                z2.h1.m(h1Var2, i1Var2, 0, Math.round(-u1Var.a()));
                return Unit.f71706a;
            case 3:
                View viewInflate = LayoutInflater.from((Context) obj).inflate(2131624043, (ViewGroup) null);
                Intrinsics.e(viewInflate, "null cannot be cast to non-null type com.teslacoilsw.launcher.NovaBubbleTextView");
                DoubleShadowBubbleTextView doubleShadowBubbleTextView = (DoubleShadowBubbleTextView) viewInflate;
                doubleShadowBubbleTextView.r((mx.f) obj3);
                doubleShadowBubbleTextView.setPadding(i12, doubleShadowBubbleTextView.getPaddingTop(), i12, doubleShadowBubbleTextView.getPaddingBottom());
                doubleShadowBubbleTextView.setText((String) obj2);
                doubleShadowBubbleTextView.B = false;
                return doubleShadowBubbleTextView;
            default:
                List list = (List) obj3;
                ((m0.g) ((m0.u) obj)).h(list.size(), new e00.v1(new t00.s(i11), list, 11), new e00.v1(12, list), new x1.e(new t00.x(i12, list, (t00.y) obj2), true, 2039820996));
                return Unit.f71706a;
        }
    }

    public /* synthetic */ y(Object obj, int i5, Object obj2, int i11) {
        this.f16965a = i11;
        this.f16967c = obj;
        this.f16966b = i5;
        this.f16968d = obj2;
    }

    public /* synthetic */ y(Object obj, Object obj2, int i5, int i11) {
        this.f16965a = i11;
        this.f16967c = obj;
        this.f16968d = obj2;
        this.f16966b = i5;
    }
}
