package ads_mobile_sdk;

import android.app.Activity;
import android.os.Bundle;
import b.l7;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class y extends Lambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Activity f11891a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Bundle f11892b;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f11893j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ y(Activity activity, Bundle bundle, int i5) {
        super(1);
        this.f11893j = i5;
        this.f11891a = activity;
        this.f11892b = bundle;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f11893j) {
            case 0:
                l7 it = (l7) obj;
                Intrinsics.g(it, "it");
                it.onActivityCreated(this.f11891a, this.f11892b);
                break;
            default:
                l7 it2 = (l7) obj;
                Intrinsics.g(it2, "it");
                it2.onActivitySaveInstanceState(this.f11891a, this.f11892b);
                break;
        }
        return Unit.f71706a;
    }
}
