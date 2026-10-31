package cu;

import android.os.Build;
import androidx.compose.foundation.MagnifierElement;
import com.stripe.android.paymentelement.embedded.manage.ManageActivity;
import e0.s1;
import e0.u1;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import p1.e1;

/* loaded from: classes4.dex */
public final /* synthetic */ class m implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f47955a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ y3.c f47956b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ e1 f47957c;

    public /* synthetic */ m(y3.c cVar, e1 e1Var, int i5) {
        this.f47955a = i5;
        this.f47956b = cVar;
        this.f47957c = e1Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5 = this.f47955a;
        e1 e1Var = this.f47957c;
        y3.c cVar = this.f47956b;
        switch (i5) {
            case 0:
                z2.y it = (z2.y) obj;
                int i11 = ManageActivity.f44222u;
                Intrinsics.g(it, "it");
                e1Var.setValue(new y3.f(cVar.mo99toDpu2uoSUM((int) (it.g() & 4294967295L))));
                return Unit.f71706a;
            case 1:
                dv.z zVar = new dv.z((Function0) obj, 3);
                m mVar = new m(cVar, e1Var, 2);
                if (e0.e1.a()) {
                    return e0.e1.a() ? new MagnifierElement(zVar, mVar, Build.VERSION.SDK_INT == 28 ? s1.f50124a : u1.f50143a) : b2.r.f17024a;
                }
                throw new UnsupportedOperationException("Magnifier is only supported on API level 28 and higher.");
            case 2:
                y3.i iVar = (y3.i) obj;
                e1Var.setValue(new y3.m((cVar.mo96roundToPx0680j_4(y3.i.b(iVar.f96604a)) << 32) | (4294967295L & cVar.mo96roundToPx0680j_4(y3.i.a(iVar.f96604a)))));
                return Unit.f71706a;
            default:
                z2.y it2 = (z2.y) obj;
                Intrinsics.g(it2, "it");
                e1Var.setValue(new y3.f(cVar.mo99toDpu2uoSUM((int) (it2.g() & 4294967295L))));
                return Unit.f71706a;
        }
    }
}
