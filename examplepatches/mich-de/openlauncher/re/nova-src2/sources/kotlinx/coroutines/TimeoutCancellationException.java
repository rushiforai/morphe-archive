package kotlinx.coroutines;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.concurrent.CancellationException;
import kotlin.Metadata;
import kotlin.jvm.internal.SourceDebugExtension;
import t70.r1;
import t70.y;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00060\u0001j\u0002`\u00022\b\u0012\u0004\u0012\u00020\u00000\u0003¨\u0006\u0004"}, d2 = {"Lkotlinx/coroutines/TimeoutCancellationException;", "Ljava/util/concurrent/CancellationException;", "Lkotlinx/coroutines/CancellationException;", "Lt70/y;", "kotlinx-coroutines-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class TimeoutCancellationException extends CancellationException implements y {

    /* renamed from: a, reason: collision with root package name */
    public final transient r1 f72061a;

    public TimeoutCancellationException(String str, r1 r1Var) {
        super(str);
        this.f72061a = r1Var;
    }

    @Override // t70.y
    public final Throwable a() {
        String message = getMessage();
        if (message == null) {
            message = b.f42142b;
        }
        TimeoutCancellationException timeoutCancellationException = new TimeoutCancellationException(message, this.f72061a);
        timeoutCancellationException.initCause(this);
        return timeoutCancellationException;
    }
}
