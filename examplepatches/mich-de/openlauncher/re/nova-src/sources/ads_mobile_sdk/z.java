package ads_mobile_sdk;

import android.app.Activity;
import b.l7;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class z extends Lambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Activity f12350a;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f12351j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ z(Activity activity, int i5) {
        super(1);
        this.f12351j = i5;
        this.f12350a = activity;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f12351j) {
            case 0:
                l7 it = (l7) obj;
                Intrinsics.g(it, "it");
                it.onActivityDestroyed(this.f12350a);
                break;
            case 1:
                l7 it2 = (l7) obj;
                Intrinsics.g(it2, "it");
                it2.onActivityPaused(this.f12350a);
                break;
            case 2:
                l7 it3 = (l7) obj;
                Intrinsics.g(it3, "it");
                it3.onActivityResumed(this.f12350a);
                break;
            default:
                l7 it4 = (l7) obj;
                Intrinsics.g(it4, "it");
                it4.onActivityStopped(this.f12350a);
                break;
        }
        return Unit.f71706a;
    }
}
