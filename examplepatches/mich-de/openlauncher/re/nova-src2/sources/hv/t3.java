package hv;

import android.view.View;
import com.teslacoilsw.launcher.search.AppSearchResultsView;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;

/* loaded from: classes4.dex */
public final /* synthetic */ class t3 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f60604a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f60605b;

    public /* synthetic */ t3(boolean z11, int i5) {
        this.f60604a = i5;
        this.f60605b = z11;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0032  */
    @Override // kotlin.jvm.functions.Function1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj) {
        boolean z11;
        int i5 = this.f60604a;
        boolean z12 = this.f60605b;
        switch (i5) {
            case 0:
                j3.b0 semantics = (j3.b0) obj;
                Intrinsics.g(semantics, "$this$semantics");
                if (!z12) {
                    KProperty[] kPropertyArr = j3.y.f68878a;
                    ((j3.k) semantics).f(j3.w.f68865p, Unit.f71706a);
                }
                return Unit.f71706a;
            case 1:
                qw.y targetState = (qw.y) obj;
                Intrinsics.g(targetState, "targetState");
                return z12 ? Boolean.TRUE : targetState;
            case 2:
                Object tag = ((View) obj).getTag();
                r10.s0 s0Var = tag instanceof r10.s0 ? (r10.s0) tag : null;
                r10.q0 q0Var = s0Var != null ? s0Var.f85238a : null;
                b3.h0 h0Var = AppSearchResultsView.f46177o0;
                if (!z12 && q0Var != null) {
                    z11 = q0Var.e();
                }
                return Boolean.valueOf(z11);
            default:
                s2 s2Var = (s2) obj;
                if (s2Var != null) {
                    return s2.a(s2Var, z12);
                }
                return null;
        }
    }
}
