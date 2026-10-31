package t1;

import java.util.Collection;
import java.util.List;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final /* synthetic */ class b implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f88433a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Collection f88434b;

    public /* synthetic */ b(int i5, Collection collection) {
        this.f88433a = i5;
        this.f88434b = collection;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        boolean zContains;
        switch (this.f88433a) {
            case 0:
                zContains = this.f88434b.contains(obj);
                break;
            case 1:
                zContains = this.f88434b.contains(obj);
                break;
            default:
                zContains = ((List) obj).retainAll(this.f88434b);
                break;
        }
        return Boolean.valueOf(zContains);
    }
}
