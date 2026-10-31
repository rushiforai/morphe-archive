package nova.branch.engage.sesame_lite.internal;

import android.content.pm.PackageManager;
import java.util.HashSet;
import kotlin.jvm.functions.Function1;
import nova.branch.engage.sesame_lite.internal.DataImporters;
import nova.branch.engage.sesame_lite.internal.ingest.IngestibleAndroidApp;
import nova.branch.engage.sesame_lite.internal.stores.LinkStore;

/* loaded from: classes.dex */
public final /* synthetic */ class i implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78420a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f78421b;

    public /* synthetic */ i(Object obj, int i5) {
        this.f78420a = i5;
        this.f78421b = obj;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        boolean zInvokeSuspend$lambda$9$lambda$5;
        switch (this.f78420a) {
            case 0:
                zInvokeSuspend$lambda$9$lambda$5 = DataImporters.AnonymousClass2.invokeSuspend$lambda$9$lambda$5((LinkStore) this.f78421b, (LinkUsage) obj);
                break;
            case 1:
                zInvokeSuspend$lambda$9$lambda$5 = DataImporters.pullStaticNavigations$lambda$32$lambda$29((PackageManager) this.f78421b, (DataImporters.StaticNav) obj);
                break;
            case 2:
                zInvokeSuspend$lambda$9$lambda$5 = DataImporters.ingestAndPurgeOrphans$lambda$2$lambda$1((IngestibleAndroidApp) this.f78421b, (LinkEntity) obj);
                break;
            default:
                zInvokeSuspend$lambda$9$lambda$5 = DataImporters.Companion.mergeAndRefreshContacts$lambda$5((HashSet) this.f78421b, (LinkEntity) obj);
                break;
        }
        return Boolean.valueOf(zInvokeSuspend$lambda$9$lambda$5);
    }
}
