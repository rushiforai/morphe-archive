package lw;

import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final /* synthetic */ class f implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75127a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ l f75128b;

    public /* synthetic */ f(l lVar, int i5) {
        this.f75127a = i5;
        this.f75128b = lVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        boolean zC;
        switch (this.f75127a) {
            case 0:
                zC = this.f75128b.f75147a.c();
                break;
            default:
                zC = this.f75128b.f75147a.c();
                break;
        }
        return Boolean.valueOf(zC);
    }
}
