package hv;

import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final class n1 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Function1 f60421a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ List f60422b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f60423c;

    public n1(int i5, List list, Function1 function1) {
        this.f60421a = function1;
        this.f60422b = list;
        this.f60423c = i5;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        this.f60421a.invoke(this.f60422b.get(this.f60423c));
        return Unit.f71706a;
    }
}
