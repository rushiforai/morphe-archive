package nova.branch.engage.sesame_lite.internal;

import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final /* synthetic */ class a implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f78388a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f78389b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f78390c;

    public /* synthetic */ a(Object obj, long j11, int i5) {
        this.f78388a = i5;
        this.f78390c = obj;
        this.f78389b = j11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f78388a) {
            case 0:
                return AppUsageUpdater.updateUsageStats$lambda$0((AppUsageUpdater) this.f78390c, this.f78389b, (DbView) obj);
            default:
                return SesameLiteImpl.ingestIntegration$lambda$96((s80.c) this.f78390c, this.f78389b, (DbView) obj);
        }
    }
}
