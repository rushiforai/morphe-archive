package p6;

import android.os.Bundle;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class y extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f82297j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Bundle f82298k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ y(int i5, Bundle bundle) {
        super(1);
        this.f82297j = i5;
        this.f82298k = bundle;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f82297j) {
            case 0:
                String argName = (String) obj;
                Intrinsics.g(argName, "argName");
                return Boolean.valueOf(!this.f82298k.containsKey(argName));
            default:
                String key = (String) obj;
                Intrinsics.g(key, "key");
                return Boolean.valueOf(!this.f82298k.containsKey(key));
        }
    }
}
