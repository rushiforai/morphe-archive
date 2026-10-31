package kotlinx.serialization.internal;

import java.lang.Enum;
import java.util.Arrays;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.PublishedApi;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializationException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0010\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0011\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u0000*\u000e\b\u0000\u0010\u0001*\b\u0012\u0004\u0012\u0002H\u00010\u00022\b\u0012\u0004\u0012\u0002H\u00010\u0003B\u001d\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00028\u00000\u0007¢\u0006\u0004\b\b\u0010\tB'\b\u0010\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00028\u00000\u0007\u0012\u0006\u0010\n\u001a\u00020\u000b¢\u0006\u0004\b\b\u0010\fJ\u0010\u0010\u0013\u001a\u00020\u000b2\u0006\u0010\u0004\u001a\u00020\u0005H\u0002J\u001d\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00028\u0000H\u0016¢\u0006\u0002\u0010\u0019J\u0015\u0010\u001a\u001a\u00028\u00002\u0006\u0010\u001b\u001a\u00020\u001cH\u0016¢\u0006\u0002\u0010\u001dJ\b\u0010\u001e\u001a\u00020\u0005H\u0016R\u0016\u0010\u0006\u001a\b\u0012\u0004\u0012\u00028\u00000\u0007X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\rR\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R\u001b\u0010\n\u001a\u00020\u000b8VX\u0096\u0084\u0002¢\u0006\f\n\u0004\b\u0011\u0010\u0012\u001a\u0004\b\u000f\u0010\u0010¨\u0006\u001f"}, d2 = {"Lkotlinx/serialization/internal/EnumSerializer;", "T", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlinx/serialization/KSerializer;", "serialName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "values", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;[Ljava/lang/Enum;)V", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "(Ljava/lang/String;[Ljava/lang/Enum;Lkotlinx/serialization/descriptors/SerialDescriptor;)V", "[Ljava/lang/Enum;", "overriddenDescriptor", "getDescriptor", "()Lkotlinx/serialization/descriptors/SerialDescriptor;", "descriptor$delegate", "Lkotlin/Lazy;", "createUnmarkedDescriptor", "serialize", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "encoder", "Lkotlinx/serialization/encoding/Encoder;", "value", "(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Enum;)V", "deserialize", "decoder", "Lkotlinx/serialization/encoding/Decoder;", "(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Enum;", "toString", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@PublishedApi
@SourceDebugExtension
/* loaded from: classes.dex */
public final class EnumSerializer<T extends Enum<T>> implements KSerializer<T> {

    /* renamed from: descriptor$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy descriptor;

    @Nullable
    private SerialDescriptor overriddenDescriptor;

    @NotNull
    private final T[] values;

    public EnumSerializer(@NotNull String serialName, @NotNull T[] values) {
        Intrinsics.g(serialName, "serialName");
        Intrinsics.g(values, "values");
        this.values = values;
        this.descriptor = LazyKt.a(new b00.c(5, this, serialName));
    }

    private final SerialDescriptor createUnmarkedDescriptor(String serialName) {
        EnumDescriptor enumDescriptor = new EnumDescriptor(serialName, this.values.length);
        for (T t6 : this.values) {
            PluginGeneratedSerialDescriptor.addElement$default(enumDescriptor, t6.name(), false, 2, null);
        }
        return enumDescriptor;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final SerialDescriptor descriptor_delegate$lambda$0(EnumSerializer enumSerializer, String str) {
        SerialDescriptor serialDescriptor = enumSerializer.overriddenDescriptor;
        return serialDescriptor == null ? enumSerializer.createUnmarkedDescriptor(str) : serialDescriptor;
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    @NotNull
    public SerialDescriptor getDescriptor() {
        return (SerialDescriptor) this.descriptor.getValue();
    }

    @NotNull
    public String toString() {
        return "kotlinx.serialization.internal.EnumSerializer<" + getDescriptor().getSerialName() + '>';
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    @NotNull
    public T deserialize(@NotNull Decoder decoder) {
        Intrinsics.g(decoder, "decoder");
        int iDecodeEnum = decoder.decodeEnum(getDescriptor());
        if (iDecodeEnum >= 0) {
            T[] tArr = this.values;
            if (iDecodeEnum < tArr.length) {
                return tArr[iDecodeEnum];
            }
        }
        throw new SerializationException(iDecodeEnum + " is not among valid " + getDescriptor().getSerialName() + " enum values, values size is " + this.values.length);
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public void serialize(@NotNull Encoder encoder, @NotNull T value) {
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        int iF0 = kotlin.collections.c.F0(value, this.values);
        if (iF0 != -1) {
            encoder.encodeEnum(getDescriptor(), iF0);
            return;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(value);
        sb2.append(" is not a valid enum ");
        sb2.append(getDescriptor().getSerialName());
        sb2.append(", must be one of ");
        String string = Arrays.toString(this.values);
        Intrinsics.f(string, "toString(...)");
        sb2.append(string);
        throw new SerializationException(sb2.toString());
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public EnumSerializer(@NotNull String serialName, @NotNull T[] values, @NotNull SerialDescriptor descriptor) {
        this(serialName, values);
        Intrinsics.g(serialName, "serialName");
        Intrinsics.g(values, "values");
        Intrinsics.g(descriptor, "descriptor");
        this.overriddenDescriptor = descriptor;
    }
}
