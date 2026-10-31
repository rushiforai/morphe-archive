package ou;

import java.util.List;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import w70.i2;

/* loaded from: classes4.dex */
public final class x1 implements w70.n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f81004a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ g2 f81005b;

    public /* synthetic */ x1(g2 g2Var, int i5) {
        this.f81004a = i5;
        this.f81005b = g2Var;
    }

    @Override // w70.n
    public final Object emit(Object obj, Continuation continuation) {
        switch (this.f81004a) {
            case 0:
                if (!((Boolean) obj).booleanValue()) {
                    g2 g2Var = this.f81005b;
                    if (((Boolean) g2Var.f80895q.getValue()).booleanValue()) {
                        i2 i2Var = g2Var.f80894p;
                        Boolean bool = Boolean.FALSE;
                        i2Var.getClass();
                        i2Var.k(null, bool);
                    }
                }
                break;
            case 1:
                if (((List) obj).isEmpty()) {
                    g2 g2Var2 = this.f81005b;
                    if (((Boolean) g2Var2.f80895q.getValue()).booleanValue()) {
                        i2 i2Var2 = g2Var2.f80894p;
                        Boolean bool2 = Boolean.FALSE;
                        i2Var2.getClass();
                        i2Var2.k(null, bool2);
                    }
                }
                break;
            default:
                if (((xu.v) obj) instanceof xu.t) {
                    i2 i2Var3 = this.f81005b.f80894p;
                    Boolean bool3 = Boolean.FALSE;
                    i2Var3.getClass();
                    i2Var3.k(null, bool3);
                }
                break;
        }
        return Unit.f71706a;
    }
}
