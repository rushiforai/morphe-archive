package m00;

import e00.v1;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class g implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75545a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ List f75546b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function2 f75547c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ boolean f75548d;

    public /* synthetic */ g(List list, Function2 function2, boolean z11, int i5) {
        this.f75545a = i5;
        this.f75546b = list;
        this.f75547c = function2;
        this.f75548d = z11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        m0.u uVar = (m0.u) obj;
        switch (this.f75545a) {
            case 0:
                List list = this.f75546b;
                ((m0.g) uVar).h(list.size(), null, new v1(7, list), new x1.e(new j(list, this.f75547c, list, this.f75548d), true, 2039820996));
                break;
            default:
                List list2 = this.f75546b;
                ((m0.g) uVar).h(list2.size(), null, new v1(8, list2), new x1.e(new n(list2, this.f75547c, this.f75548d, 1), true, 2039820996));
                break;
        }
        return Unit.f71706a;
    }
}
