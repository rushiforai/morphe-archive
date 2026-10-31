package kotlinx.serialization.internal;

import java.util.ArrayList;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.InternalSerializationApi;
import kotlinx.serialization.MissingFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000 \n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0015\n\u0002\b\u0002\u001a \u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00032\u0006\u0010\u0005\u001a\u00020\u0006H\u0007\u001a \u0010\u0007\u001a\u00020\u00012\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u0005\u001a\u00020\u0006H\u0007¨\u0006\u000b"}, d2 = {"throwMissingFieldException", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "seen", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "goldenMask", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "throwArrayMissingFieldException", "seenArray", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "goldenMaskArray", "kotlinx-serialization-core"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class PluginExceptionsKt {
    @InternalSerializationApi
    public static final void throwArrayMissingFieldException(@NotNull int[] seenArray, @NotNull int[] goldenMaskArray, @NotNull SerialDescriptor descriptor) {
        Intrinsics.g(seenArray, "seenArray");
        Intrinsics.g(goldenMaskArray, "goldenMaskArray");
        Intrinsics.g(descriptor, "descriptor");
        ArrayList arrayList = new ArrayList();
        int length = goldenMaskArray.length;
        for (int i5 = 0; i5 < length; i5++) {
            int i11 = goldenMaskArray[i5] & (~seenArray[i5]);
            if (i11 != 0) {
                for (int i12 = 0; i12 < 32; i12++) {
                    if ((i11 & 1) != 0) {
                        arrayList.add(descriptor.getElementName((i5 * 32) + i12));
                    }
                    i11 >>>= 1;
                }
            }
        }
        throw new MissingFieldException(arrayList, descriptor.getSerialName());
    }

    @InternalSerializationApi
    public static final void throwMissingFieldException(int i5, int i11, @NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        ArrayList arrayList = new ArrayList();
        int i12 = (~i5) & i11;
        for (int i13 = 0; i13 < 32; i13++) {
            if ((i12 & 1) != 0) {
                arrayList.add(descriptor.getElementName(i13));
            }
            i12 >>>= 1;
        }
        throw new MissingFieldException(arrayList, descriptor.getSerialName());
    }
}
