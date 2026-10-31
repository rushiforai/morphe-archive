package t00;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.math.MathKt;

/* loaded from: classes4.dex */
public final /* synthetic */ class i implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f88359a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f88360b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ mx.j f88361c;

    public /* synthetic */ i(Function1 function1, mx.j jVar, int i5) {
        this.f88359a = i5;
        this.f88360b = function1;
        this.f88361c = jVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f88359a) {
            case 0:
                this.f88360b.invoke(mx.j.a(this.f88361c, 0.0f, ((Boolean) obj).booleanValue(), 0.0f, false, null, false, false, 253));
                break;
            case 1:
                this.f88360b.invoke(mx.j.a(this.f88361c, ((Float) obj).floatValue(), false, 0.0f, false, null, false, false, 254));
                break;
            case 2:
                this.f88360b.invoke(mx.j.a(this.f88361c, 0.0f, false, 0.0f, false, null, false, ((Boolean) obj).booleanValue(), Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE));
                break;
            case 3:
                int iB = MathKt.b(((Float) obj).floatValue());
                this.f88360b.invoke(mx.j.a(this.f88361c, 0.0f, false, iB != 0 ? iB != 1 ? iB != 2 ? iB != 3 ? iB != 4 ? iB != 5 ? 21.0f : 18.0f : 16.0f : 14.4f : 13.0f : 12.0f : 11.0f, false, null, false, false, 251));
                break;
            case 4:
                this.f88360b.invoke(mx.j.a(this.f88361c, 0.0f, false, 0.0f, false, (String) ((gy.v) obj).f58561a, false, false, Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE));
                break;
            case 5:
                this.f88360b.invoke(mx.j.a(this.f88361c, 0.0f, false, 0.0f, ((Boolean) obj).booleanValue(), null, false, false, 239));
                break;
            default:
                this.f88360b.invoke(mx.j.a(this.f88361c, 0.0f, false, 0.0f, false, null, ((Boolean) obj).booleanValue(), false, 191));
                break;
        }
        return Unit.f71706a;
    }
}
