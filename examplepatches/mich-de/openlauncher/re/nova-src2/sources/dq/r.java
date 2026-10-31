package dq;

import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final /* synthetic */ class r implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f49363a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f49364b;

    public /* synthetic */ r(String str, int i5) {
        this.f49363a = i5;
        this.f49364b = str;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f49363a) {
            case 0:
                return this.f49364b;
            case 1:
                return this.f49364b;
            case 2:
                return new t00.c0(0, 0, this.f49364b, false);
            default:
                return new t00.a0(0, 0, this.f49364b, false);
        }
    }
}
