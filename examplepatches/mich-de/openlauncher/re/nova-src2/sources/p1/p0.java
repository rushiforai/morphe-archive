package p1;

import androidx.compose.runtime.internal.PlatformOptimizedCancellationException;

/* loaded from: classes2.dex */
public final class p0 extends PlatformOptimizedCancellationException {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p0(int i5) {
        super("rememberCoroutineScope left the composition");
        switch (i5) {
            case 1:
                super("The coroutine scope left the composition");
                break;
            default:
                break;
        }
    }
}
