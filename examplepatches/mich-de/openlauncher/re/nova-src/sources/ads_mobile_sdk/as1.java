package ads_mobile_sdk;

import b.c0;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class as1 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f1075a;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f1076j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ as1(String str, int i5) {
        super(0);
        this.f1076j = i5;
        this.f1075a = str;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f1076j) {
            case 0:
                return c0.k("Requested mraid ", this.f1075a);
            default:
                return c0.k("Ad Request Signals: ", this.f1075a);
        }
    }
}
