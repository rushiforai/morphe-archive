package nova.branch.engage.sesame_lite.internal;

import kotlin.jvm.functions.Function1;

/* loaded from: classes5.dex */
public final /* synthetic */ class e implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78403a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f78404b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f78405c;

    public /* synthetic */ e(String str, long j11, int i5) {
        this.f78403a = i5;
        this.f78404b = str;
        this.f78405c = j11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f78403a) {
            case 0:
                return DataImporters.ingestApiLinks$lambda$71(this.f78404b, this.f78405c, (DbView) obj);
            default:
                return SesameLiteImpl.recordAppOpen$lambda$68(this.f78404b, this.f78405c, (DbView) obj);
        }
    }
}
