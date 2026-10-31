package l2;

import com.vungle.ads.internal.protos.Sdk;
import i2.s;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class a extends Lambda implements Function1 {

    /* renamed from: k, reason: collision with root package name */
    public static final a f74498k;

    /* renamed from: l, reason: collision with root package name */
    public static final a f74499l;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f74500j;

    static {
        int i5 = 1;
        f74498k = new a(i5, 0);
        f74499l = new a(i5, 1);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ a(int i5, int i11) {
        super(i5);
        this.f74500j = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f74500j) {
            case 0:
                break;
            default:
                k2.f.s((k2.f) obj, s.f61146l, 0L, 0L, 0.0f, null, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE);
                break;
        }
        return Unit.f71706a;
    }
}
