package eb;

import java.util.function.Predicate;
import ya.g0;

/* loaded from: classes2.dex */
public final /* synthetic */ class i implements Predicate {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f52479a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ l f52480b;

    public /* synthetic */ i(l lVar, int i5) {
        this.f52479a = i5;
        this.f52480b = lVar;
    }

    @Override // java.util.function.Predicate
    public final boolean test(Object obj) {
        db.c cVar = (db.c) obj;
        switch (this.f52479a) {
            case 0:
                l lVar = this.f52480b;
                Predicate predicate = lVar.f52494i;
                if (((predicate == null || predicate.test(cVar)) && lVar.f52493h.test(cVar)) || (cVar instanceof db.a)) {
                }
                break;
            default:
                l lVar2 = this.f52480b;
                lVar2.getClass();
                if ((cVar instanceof db.f) || (cVar instanceof db.g) || g0.b(cVar.f49120a).equals(lVar2.f52492g)) {
                }
                break;
        }
        return true;
    }
}
