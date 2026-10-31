package ads_mobile_sdk;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class as extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public static final as f1073a;
    public static final as a$1;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f1074j;

    static {
        int i5 = 0;
        f1073a = new as(i5, 0);
        a$1 = new as(i5, 1);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ as(int i5, int i11) {
        super(i5);
        this.f1074j = i11;
    }

    @Override // kotlin.jvm.functions.Function0
    public final /* bridge */ /* synthetic */ Object invoke() {
        switch (this.f1074j) {
            case 0:
                return "variations header is blank";
            default:
                return "Native Cronet engine initialization skipped as requested. Falling back to Java provider.";
        }
    }
}
