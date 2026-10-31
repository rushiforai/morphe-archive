package nova.branch.engage.sesame_lite.internal;

import kotlin.jvm.functions.Function1;
import nova.branch.engage.sesame_lite.internal.DataImporters;
import nova.branch.engage.sesame_lite.internal.ingest.IngestibleAndroidApp;

/* loaded from: classes.dex */
public final /* synthetic */ class h implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78417a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ DataImporters f78418b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f78419c;

    public /* synthetic */ h(DataImporters dataImporters, IngestibleAndroidApp ingestibleAndroidApp) {
        this.f78418b = dataImporters;
        this.f78419c = ingestibleAndroidApp;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f78417a) {
            case 0:
                return DataImporters.AnonymousClass2.invokeSuspend$lambda$9((r80.d[]) this.f78419c, this.f78418b, (DbView) obj);
            default:
                return DataImporters.ingestAndroidApp$lambda$0(this.f78418b, (IngestibleAndroidApp) this.f78419c, (DbView) obj);
        }
    }

    public /* synthetic */ h(r80.d[] dVarArr, DataImporters dataImporters) {
        this.f78419c = dVarArr;
        this.f78418b = dataImporters;
    }
}
