package nova.branch.engage.sesame_lite.internal;

import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final /* synthetic */ class d implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78399a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f78400b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ DataImporters f78401c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ List f78402d;

    public /* synthetic */ d(long j11, List list, DataImporters dataImporters, int i5) {
        this.f78399a = i5;
        this.f78400b = j11;
        this.f78402d = list;
        this.f78401c = dataImporters;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f78399a) {
            case 0:
                return DataImporters.ingestAndPurgeOrphans$lambda$2(this.f78400b, this.f78402d, this.f78401c, (DbView) obj);
            default:
                return DataImporters.pullStaticNavigations$lambda$32$lambda$31(this.f78400b, (ArrayList) this.f78402d, this.f78401c, (DbView) obj);
        }
    }
}
