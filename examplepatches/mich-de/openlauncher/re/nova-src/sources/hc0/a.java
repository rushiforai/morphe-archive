package hc0;

import fc0.e;
import h60.i;
import java.util.function.BiPredicate;

/* loaded from: classes5.dex */
public final /* synthetic */ class a implements BiPredicate {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59608a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ i f59609b;

    public /* synthetic */ a(i iVar, int i5) {
        this.f59608a = i5;
        this.f59609b = iVar;
    }

    @Override // java.util.function.BiPredicate
    public final boolean test(Object obj, Object obj2) {
        e eVar = (e) obj;
        e eVar2 = (e) obj2;
        switch (this.f59608a) {
            case 0:
                return this.f59609b.b(eVar, eVar2);
            default:
                return this.f59609b.a(eVar, eVar2);
        }
    }
}
