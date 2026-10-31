package kotlin;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.RestrictsSuspension;

@SinceKotlin
@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u0000*\u0004\b\u0000\u0010\u0001*\u0004\b\u0001\u0010\u00022\u00020\u0003B\t\b\u0004¢\u0006\u0004\b\u0004\u0010\u0005\u0082\u0001\u0001\u0006¨\u0006\u0007"}, d2 = {"Lkotlin/DeepRecursiveScope;", "T", "R", b.f42142b, "<init>", "()V", "La70/a;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@RestrictsSuspension
@WasExperimental
/* loaded from: classes4.dex */
public abstract class DeepRecursiveScope<T, R> {
    public /* synthetic */ DeepRecursiveScope(int i5) {
        this();
    }

    public abstract void c(Object obj, Continuation continuation);

    private DeepRecursiveScope() {
    }
}
