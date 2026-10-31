package zv;

import h6.f1;
import h6.j1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h implements j1 {

    /* renamed from: a, reason: collision with root package name */
    public final wv.b f98702a;

    /* renamed from: b, reason: collision with root package name */
    public final wv.p f98703b;

    /* renamed from: c, reason: collision with root package name */
    public final tv.d f98704c;

    public h(wv.b challengeActionHandler, wv.p transactionTimer, tv.d errorReporter) {
        Intrinsics.g(challengeActionHandler, "challengeActionHandler");
        Intrinsics.g(transactionTimer, "transactionTimer");
        Intrinsics.g(errorReporter, "errorReporter");
        this.f98702a = challengeActionHandler;
        this.f98703b = transactionTimer;
        this.f98704c = errorReporter;
    }

    @Override // h6.j1
    public final f1 create(Class cls) {
        return new k(this.f98702a, this.f98703b, this.f98704c);
    }
}
