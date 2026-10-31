package fc0;

import java.util.function.BinaryOperator;

/* loaded from: classes5.dex */
public final /* synthetic */ class b implements BinaryOperator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54601a;

    public /* synthetic */ b(int i5) {
        this.f54601a = i5;
    }

    @Override // java.util.function.BiFunction
    public final Object apply(Object obj, Object obj2) {
        switch (this.f54601a) {
            case 0:
                return ((e) obj).l((e) obj2);
            case 1:
                return Integer.valueOf(Integer.sum(((Integer) obj).intValue(), ((Integer) obj2).intValue()));
            default:
                return new d((e) obj, (e) obj2);
        }
    }
}
