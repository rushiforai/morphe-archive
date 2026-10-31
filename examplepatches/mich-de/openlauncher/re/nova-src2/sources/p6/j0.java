package p6;

import android.os.Bundle;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class j0 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f82185j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j0(Ref.ObjectRef objectRef) {
        super(1);
        this.f82185j = objectRef;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        String key = (String) obj;
        Intrinsics.g(key, "key");
        Object obj2 = this.f82185j.f71863a;
        boolean z11 = true;
        if (obj2 != null && ((Bundle) obj2).containsKey(key)) {
            z11 = false;
        }
        return Boolean.valueOf(z11);
    }
}
