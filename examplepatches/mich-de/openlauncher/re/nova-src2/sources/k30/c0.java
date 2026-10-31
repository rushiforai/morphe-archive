package k30;

import com.teslacoilsw.launcher.search.AppSearchResultsView;
import java.util.Iterator;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.SerializersCacheKt;

/* loaded from: classes4.dex */
public final /* synthetic */ class c0 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70917a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ List f70918b;

    public /* synthetic */ c0(int i5, List list) {
        this.f70917a = i5;
        this.f70918b = list;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f70917a;
        List<Function1> list = this.f70918b;
        switch (i5) {
            case 0:
                for (Function1 function1 : list) {
                    x.Companion.getClass();
                    function1.invoke(x.f71082l);
                }
                return Unit.f71706a;
            case 1:
                return SerializersCacheKt.PARAMETRIZED_SERIALIZERS_CACHE$lambda$3$lambda$2(list);
            case 2:
                return SerializersCacheKt.PARAMETRIZED_SERIALIZERS_CACHE_NULLABLE$lambda$5$lambda$4(list);
            case 3:
                Object obj = list.get(2);
                Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.Int");
                return (Integer) obj;
            default:
                b3.h0 h0Var = AppSearchResultsView.f46177o0;
                Iterator it = list.iterator();
                while (it.hasNext() && !((ey.n) it.next()).a()) {
                }
                return Unit.f71706a;
        }
    }
}
