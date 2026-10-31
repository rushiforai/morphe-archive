package kotlinx.coroutines;

import java.util.concurrent.CancellationException;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import t70.c2;
import t70.x1;
import t70.y;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u00002\u00060\u0001j\u0002`\u00022\b\u0012\u0004\u0012\u00020\u00000\u0003¨\u0006\u0004"}, d2 = {"Lkotlinx/coroutines/JobCancellationException;", "Ljava/util/concurrent/CancellationException;", "Lkotlinx/coroutines/CancellationException;", "Lt70/y;", "kotlinx-coroutines-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class JobCancellationException extends CancellationException implements y {

    /* renamed from: a, reason: collision with root package name */
    public final transient x1 f72060a;

    public JobCancellationException(String str, Throwable th2, x1 x1Var) {
        super(str);
        this.f72060a = x1Var;
        if (th2 != null) {
            initCause(th2);
        }
    }

    @Override // t70.y
    public final /* bridge */ /* synthetic */ Throwable a() {
        return null;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof JobCancellationException)) {
            return false;
        }
        JobCancellationException jobCancellationException = (JobCancellationException) obj;
        if (!Intrinsics.b(jobCancellationException.getMessage(), getMessage())) {
            return false;
        }
        Object obj2 = jobCancellationException.f72060a;
        if (obj2 == null) {
            obj2 = c2.f88780b;
        }
        Object obj3 = this.f72060a;
        if (obj3 == null) {
            obj3 = c2.f88780b;
        }
        return Intrinsics.b(obj2, obj3) && Intrinsics.b(jobCancellationException.getCause(), getCause());
    }

    @Override // java.lang.Throwable
    public final Throwable fillInStackTrace() {
        setStackTrace(new StackTraceElement[0]);
        return this;
    }

    public final int hashCode() {
        String message = getMessage();
        Intrinsics.d(message);
        int iHashCode = message.hashCode() * 31;
        Object obj = this.f72060a;
        if (obj == null) {
            obj = c2.f88780b;
        }
        int iHashCode2 = (iHashCode + (obj != null ? obj.hashCode() : 0)) * 31;
        Throwable cause = getCause();
        return iHashCode2 + (cause != null ? cause.hashCode() : 0);
    }

    @Override // java.lang.Throwable
    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(super.toString());
        sb2.append("; job=");
        Object obj = this.f72060a;
        if (obj == null) {
            obj = c2.f88780b;
        }
        sb2.append(obj);
        return sb2.toString();
    }
}
