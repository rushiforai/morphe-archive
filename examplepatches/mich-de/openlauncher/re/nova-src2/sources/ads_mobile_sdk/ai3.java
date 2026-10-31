package ads_mobile_sdk;

import b.c0;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class ai3 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Throwable f1000a;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f1001j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ai3(int i5, Throwable th2) {
        super(0);
        this.f1001j = i5;
        this.f1000a = th2;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f1001j) {
            case 0:
                return "Untrapped exception: " + this.f1000a;
            default:
                return c0.k("Non-fatal error closing resources: ", this.f1000a.getMessage());
        }
    }
}
