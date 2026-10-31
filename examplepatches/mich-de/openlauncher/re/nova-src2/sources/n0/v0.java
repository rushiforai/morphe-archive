package n0;

import b.u4;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final /* synthetic */ class v0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f77510a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ x0 f77511b;

    public /* synthetic */ v0(x0 x0Var, int i5) {
        this.f77510a = i5;
        this.f77511b = x0Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f77510a) {
            case 0:
                d0 d0Var = (d0) this.f77511b.f77524a.invoke();
                int iA = d0Var.a();
                int i5 = 0;
                while (true) {
                    if (i5 >= iA) {
                        i5 = -1;
                    } else if (!d0Var.d(i5).equals(obj)) {
                        i5++;
                    }
                }
                return Integer.valueOf(i5);
            default:
                int iIntValue = ((Integer) obj).intValue();
                x0 x0Var = this.f77511b;
                d0 d0Var2 = (d0) x0Var.f77524a.invoke();
                if (iIntValue < 0 || iIntValue >= d0Var2.a()) {
                    StringBuilder sbJ = u4.j(iIntValue, "Can't scroll to index ", ", it is out of bounds [0, ");
                    sbJ.append(d0Var2.a());
                    sbJ.append(')');
                    j0.b.a(sbJ.toString());
                }
                t70.m0.t(x0Var.getCoroutineScope(), null, null, new io.h(x0Var, iIntValue, null, 3), 3);
                return Boolean.TRUE;
        }
    }
}
