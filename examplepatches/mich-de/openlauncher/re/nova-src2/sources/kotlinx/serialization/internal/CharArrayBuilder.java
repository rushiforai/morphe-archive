package kotlinx.serialization.internal;

import java.util.Arrays;
import kotlin.Metadata;
import kotlin.PublishedApi;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0019\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0010\f\n\u0002\b\u0004\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0011\b\u0000\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0015\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\bH\u0010¢\u0006\u0002\b\u000fJ\u0015\u0010\u0010\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\u0012H\u0000¢\u0006\u0002\b\u0013J\r\u0010\u0014\u001a\u00020\u0002H\u0010¢\u0006\u0002\b\u0015R\u000e\u0010\u0006\u001a\u00020\u0002X\u0082\u000e¢\u0006\u0002\n\u0000R\u001e\u0010\t\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\b@RX\u0090\u000e¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0016"}, d2 = {"Lkotlinx/serialization/internal/CharArrayBuilder;", "Lkotlinx/serialization/internal/PrimitiveArrayBuilder;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "bufferWithData", "<init>", "([C)V", "buffer", "value", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "position", "getPosition$kotlinx_serialization_core", "()I", "ensureCapacity", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "requiredCapacity", "ensureCapacity$kotlinx_serialization_core", "append", "c", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "append$kotlinx_serialization_core", "build", "build$kotlinx_serialization_core", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@PublishedApi
/* loaded from: classes5.dex */
public final class CharArrayBuilder extends PrimitiveArrayBuilder<char[]> {

    @NotNull
    private char[] buffer;
    private int position;

    public CharArrayBuilder(@NotNull char[] bufferWithData) {
        Intrinsics.g(bufferWithData, "bufferWithData");
        this.buffer = bufferWithData;
        this.position = bufferWithData.length;
        ensureCapacity$kotlinx_serialization_core(10);
    }

    public final void append$kotlinx_serialization_core(char c11) {
        PrimitiveArrayBuilder.ensureCapacity$kotlinx_serialization_core$default(this, 0, 1, null);
        char[] cArr = this.buffer;
        int position = getPosition();
        this.position = position + 1;
        cArr[position] = c11;
    }

    @Override // kotlinx.serialization.internal.PrimitiveArrayBuilder
    public void ensureCapacity$kotlinx_serialization_core(int requiredCapacity) {
        char[] cArr = this.buffer;
        if (cArr.length < requiredCapacity) {
            int length = cArr.length * 2;
            if (requiredCapacity < length) {
                requiredCapacity = length;
            }
            char[] cArrCopyOf = Arrays.copyOf(cArr, requiredCapacity);
            Intrinsics.f(cArrCopyOf, "copyOf(...)");
            this.buffer = cArrCopyOf;
        }
    }

    @Override // kotlinx.serialization.internal.PrimitiveArrayBuilder
    /* renamed from: getPosition$kotlinx_serialization_core, reason: from getter */
    public int getPosition() {
        return this.position;
    }

    @Override // kotlinx.serialization.internal.PrimitiveArrayBuilder
    @NotNull
    public char[] build$kotlinx_serialization_core() {
        char[] cArrCopyOf = Arrays.copyOf(this.buffer, getPosition());
        Intrinsics.f(cArrCopyOf, "copyOf(...)");
        return cArrCopyOf;
    }
}
