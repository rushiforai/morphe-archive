package kotlinx.serialization.json.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Set;
import kotlin.Metadata;
import kotlin.UByte;
import kotlin.UInt;
import kotlin.ULong;
import kotlin.UShort;
import kotlin.collections.c;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.json.JsonElementKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0000\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\"\u0014\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u0018\u0010\u0003\u001a\u00020\u0004*\u00020\u00028@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u0003\u0010\u0005\"\u0018\u0010\u0006\u001a\u00020\u0004*\u00020\u00028@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u0006\u0010\u0005¨\u0006\u0007"}, d2 = {"unsignedNumberDescriptors", b.f42142b, "Lkotlinx/serialization/descriptors/SerialDescriptor;", "isUnsignedNumber", b.f42142b, "(Lkotlinx/serialization/descriptors/SerialDescriptor;)Z", "isUnquotedLiteral", "kotlinx-serialization-json"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class StreamingJsonEncoderKt {

    @NotNull
    private static final Set<SerialDescriptor> unsignedNumberDescriptors = c.f1(new SerialDescriptor[]{BuiltinSerializersKt.serializer(UInt.f71696b).getDescriptor(), BuiltinSerializersKt.serializer(ULong.f71699b).getDescriptor(), BuiltinSerializersKt.serializer(UByte.f71693b).getDescriptor(), BuiltinSerializersKt.serializer(UShort.f71703b).getDescriptor()});

    public static final boolean isUnquotedLiteral(@NotNull SerialDescriptor serialDescriptor) {
        Intrinsics.g(serialDescriptor, "<this>");
        return serialDescriptor.getIsInline() && serialDescriptor.equals(JsonElementKt.getJsonUnquotedLiteralDescriptor());
    }

    public static final boolean isUnsignedNumber(@NotNull SerialDescriptor serialDescriptor) {
        Intrinsics.g(serialDescriptor, "<this>");
        return serialDescriptor.getIsInline() && unsignedNumberDescriptors.contains(serialDescriptor);
    }
}
