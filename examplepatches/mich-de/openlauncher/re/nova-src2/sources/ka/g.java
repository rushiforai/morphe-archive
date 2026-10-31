package ka;

import com.android.launcher3.model.WidgetItem;
import java.util.function.Predicate;
import ya.g0;

/* loaded from: classes2.dex */
public final /* synthetic */ class g implements Predicate {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f71278a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ g0 f71279b;

    public /* synthetic */ g(g0 g0Var, int i5) {
        this.f71278a = i5;
        this.f71279b = g0Var;
    }

    @Override // java.util.function.Predicate
    public final boolean test(Object obj) {
        switch (this.f71278a) {
            case 0:
                db.c cVar = (db.c) obj;
                return (cVar instanceof db.d) && cVar.f49120a.f57319x.equals(this.f71279b.f97138a);
            case 1:
                return this.f71279b.f97140c.equals(((WidgetItem) obj).f21252b);
            default:
                return this.f71279b.equals((g0) obj);
        }
    }
}
