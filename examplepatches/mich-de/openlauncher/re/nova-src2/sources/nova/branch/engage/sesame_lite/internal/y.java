package nova.branch.engage.sesame_lite.internal;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Set;
import kotlin.jvm.functions.Function1;
import nova.branch.engage.sesame_lite.internal.SesameLiteImpl;

/* loaded from: classes5.dex */
public final /* synthetic */ class y implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78481a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f78482b;

    public /* synthetic */ y(Object obj, int i5) {
        this.f78481a = i5;
        this.f78482b = obj;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f78481a) {
            case 0:
                return SesameLiteImpl.AnonymousClass2.invokeSuspend$lambda$1((Set) this.f78482b, (DbView) obj);
            case 1:
                return DataImporters.unmarkPackageIgnored$lambda$20((String) this.f78482b, (DbView) obj);
            case 2:
                return Boolean.valueOf(SesameLiteImpl.zeroState$lambda$30$lambda$6((SesameLiteImpl.JoinedResult) this.f78482b, (SesameLiteImpl.JoinedResult) obj));
            case 3:
                return Boolean.valueOf(SesameLiteImpl.zeroState$lambda$30$lambda$17((LinkedHashMap) this.f78482b, (LinkEntity) obj));
            case 4:
                return Boolean.valueOf(SesameLiteImpl.zeroState$lambda$30$lambda$27$lambda$24((ArrayList) this.f78482b, (LinkEntity) obj));
            case 5:
                return SesameLiteImpl.getPerfStats$lambda$94((SesameLiteImpl) this.f78482b, (DbView) obj);
            case 6:
                return SesameLiteImpl.insertExternalLink$lambda$98((LinkEntity) this.f78482b, (DbView) obj);
            default:
                return SesameLiteImpl.get$lambda$61((IdHash[]) this.f78482b, (DbView) obj);
        }
    }
}
