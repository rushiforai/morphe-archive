package b20;

import android.graphics.Point;
import gy.n0;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import p1.e1;

/* loaded from: classes4.dex */
public final /* synthetic */ class u implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f17114a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f17115b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ e1 f17116c;

    public /* synthetic */ u(Function1 function1, e1 e1Var, int i5) {
        this.f17114a = i5;
        this.f17115b = function1;
        this.f17116c = e1Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f17114a) {
            case 0:
                Function1 function1 = this.f17115b;
                if (function1 != null) {
                    function1.invoke((Point) this.f17116c.getValue());
                }
                break;
            case 1:
                this.f17115b.invoke((String) this.f17116c.getValue());
                break;
            default:
                this.f17115b.invoke((n0) this.f17116c.getValue());
                break;
        }
        return Unit.f71706a;
    }
}
