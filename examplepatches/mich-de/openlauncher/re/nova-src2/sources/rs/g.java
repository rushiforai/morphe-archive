package rs;

import kotlin.coroutines.jvm.internal.SuspendFunction;
import kotlin.jvm.functions.Function5;
import kotlin.jvm.internal.AdaptedFunctionReference;

/* loaded from: classes4.dex */
public final /* synthetic */ class g extends AdaptedFunctionReference implements Function5, SuspendFunction {
    @Override // kotlin.jvm.functions.Function5
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4, Object obj5) {
        boolean zBooleanValue = ((Boolean) obj4).booleanValue();
        return ((com.stripe.android.link.ui.inline.a) this.receiver).g((String) obj, (String) obj2, (String) obj3, zBooleanValue);
    }
}
