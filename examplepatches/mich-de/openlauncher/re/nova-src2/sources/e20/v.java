package e20;

import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class v {

    @NotNull
    public static final u Companion = new u();

    /* renamed from: a, reason: collision with root package name */
    public final long f52087a;

    /* renamed from: b, reason: collision with root package name */
    public final String f52088b;

    public /* synthetic */ v(int i5, long j11, String str) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, t.f52086a.getDescriptor());
        }
        this.f52087a = j11;
        this.f52088b = str;
    }

    public v(long j11, String str) {
        this.f52087a = j11;
        this.f52088b = str;
    }
}
