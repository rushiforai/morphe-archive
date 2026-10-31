package q6;

import b0.z0;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class u extends Lambda implements Function1 {

    /* renamed from: k, reason: collision with root package name */
    public static final u f83732k;

    /* renamed from: l, reason: collision with root package name */
    public static final u f83733l;

    /* renamed from: m, reason: collision with root package name */
    public static final u f83734m;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f83735j;

    static {
        int i5 = 1;
        f83732k = new u(i5, 0);
        f83733l = new u(i5, 1);
        f83734m = new u(i5, 2);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ u(int i5, int i11) {
        super(i5);
        this.f83735j = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f83735j) {
            case 0:
                return ((p6.n) obj).f82196f;
            case 1:
                return z0.d(c0.f.i(Sdk.SDKError.Reason.DNS_OVER_HTTP_FAILED_VALUE, 0, null, 6), 2);
            default:
                return z0.e(c0.f.i(Sdk.SDKError.Reason.DNS_OVER_HTTP_FAILED_VALUE, 0, null, 6), 2);
        }
    }
}
