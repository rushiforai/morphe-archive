package nova.branch.engage.sesame_lite.internal;

import java.util.Collection;
import java.util.EnumSet;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Ref;

/* loaded from: classes5.dex */
public final /* synthetic */ class b implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78391a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f78392b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f78393c;

    public /* synthetic */ b(int i5, Object obj, Object obj2) {
        this.f78391a = i5;
        this.f78392b = obj;
        this.f78393c = obj2;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f78391a) {
            case 0:
                return DataImporters.ingestPersistableSearchAliases$lambda$5((Collection) this.f78392b, (DataImporters) this.f78393c, (DbView) obj);
            case 1:
                return DataImporters.markPackageIgnored$lambda$18((String) this.f78392b, (long[]) this.f78393c, (DbView) obj);
            case 2:
                return Boolean.valueOf(DataImporters.syncIgnoredPackages$lambda$22((Collection) this.f78392b, (long[]) this.f78393c, (DbView) obj));
            case 3:
                return SesameLiteImpl.getAll$lambda$65((long[]) this.f78392b, (EnumSet) this.f78393c, (DbView) obj);
            default:
                return SesameLiteImpl.deleteLink$lambda$100((IdHash) this.f78392b, (Ref.BooleanRef) this.f78393c, (DbView) obj);
        }
    }
}
