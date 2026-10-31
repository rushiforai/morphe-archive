package pp;

import kotlinx.serialization.SerialName;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@SerialName("ActivityStopEvent")
@Serializable
/* loaded from: classes4.dex */
public final class c extends a0 {

    @NotNull
    public static final b Companion = new b();

    /* renamed from: b, reason: collision with root package name */
    public final long f82701b;

    public c(long j11) {
        this.f82701b = j11;
    }

    public /* synthetic */ c(int i5, long j11) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, a.f82686a.getDescriptor());
        }
        this.f82701b = j11;
    }
}
