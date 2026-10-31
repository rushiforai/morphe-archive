package f00;

import java.util.Arrays;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class f0 {

    @NotNull
    public static final e0 Companion = new e0();

    /* renamed from: a, reason: collision with root package name */
    public final double f53268a;

    /* renamed from: b, reason: collision with root package name */
    public final double f53269b;

    public /* synthetic */ f0(int i5, double d5, double d11) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, d0.f53256a.getDescriptor());
        }
        this.f53268a = d5;
        this.f53269b = d11;
    }

    public final String toString() {
        return String.format("[%.4f, %.4f]", Arrays.copyOf(new Object[]{Double.valueOf(this.f53268a), Double.valueOf(this.f53269b)}, 2));
    }

    public f0(double d5, double d11) {
        this.f53268a = d5;
        this.f53269b = d11;
    }
}
