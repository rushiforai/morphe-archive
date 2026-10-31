package kotlinx.serialization.internal;

import kotlin.Metadata;
import kotlin.PublishedApi;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0006\b!\u0018\u0000*\u0004\b\u0000\u0010\u00012\u00020\u0002B\t\b\u0000¢\u0006\u0004\b\u0003\u0010\u0004J\u0017\u0010\t\u001a\u00020\n2\b\b\u0002\u0010\u000b\u001a\u00020\u0006H ¢\u0006\u0002\b\fJ\u000f\u0010\r\u001a\u00028\u0000H ¢\u0006\u0004\b\u000e\u0010\u000fR\u0012\u0010\u0005\u001a\u00020\u0006X \u0004¢\u0006\u0006\u001a\u0004\b\u0007\u0010\b¨\u0006\u0010"}, d2 = {"Lkotlinx/serialization/internal/PrimitiveArrayBuilder;", "Array", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "position", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getPosition$kotlinx_serialization_core", "()I", "ensureCapacity", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "requiredCapacity", "ensureCapacity$kotlinx_serialization_core", "build", "build$kotlinx_serialization_core", "()Ljava/lang/Object;", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@PublishedApi
/* loaded from: classes5.dex */
public abstract class PrimitiveArrayBuilder<Array> {
    public static /* synthetic */ void ensureCapacity$kotlinx_serialization_core$default(PrimitiveArrayBuilder primitiveArrayBuilder, int i5, int i11, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: ensureCapacity");
        }
        if ((i11 & 1) != 0) {
            i5 = primitiveArrayBuilder.getPosition$kotlinx_serialization_core() + 1;
        }
        primitiveArrayBuilder.ensureCapacity$kotlinx_serialization_core(i5);
    }

    public abstract Array build$kotlinx_serialization_core();

    public abstract void ensureCapacity$kotlinx_serialization_core(int requiredCapacity);

    public abstract int getPosition$kotlinx_serialization_core();
}
