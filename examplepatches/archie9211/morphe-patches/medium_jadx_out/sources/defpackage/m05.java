package defpackage;

import androidx.compose.runtime.internal.PlatformOptimizedCancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m05 extends PlatformOptimizedCancellationException {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m05(int i) {
        super("rememberCoroutineScope left the composition");
        switch (i) {
            case 1:
                super("The coroutine scope left the composition");
                break;
            default:
                break;
        }
    }
}
