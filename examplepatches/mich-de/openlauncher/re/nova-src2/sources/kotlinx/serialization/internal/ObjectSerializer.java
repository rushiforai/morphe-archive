package kotlinx.serialization.internal;

import b.c0;
import b00.t;
import java.lang.annotation.Annotation;
import java.util.List;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Metadata;
import kotlin.PublishedApi;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializationException;
import kotlinx.serialization.descriptors.ClassSerialDescriptorBuilder;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialDescriptorsKt;
import kotlinx.serialization.descriptors.StructureKind;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\u0011\n\u0002\u0010\u001b\n\u0002\b\u0003\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0001\u0018\u0000*\b\b\u0000\u0010\u0001*\u00020\u00022\b\u0012\u0004\u0012\u0002H\u00010\u0003B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00028\u0000¢\u0006\u0004\b\u0007\u0010\bB'\b\u0011\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00028\u0000\u0012\f\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u000b0\n¢\u0006\u0004\b\u0007\u0010\fJ\u001d\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00028\u0000H\u0016¢\u0006\u0002\u0010\u001bJ\u0015\u0010\u001c\u001a\u00028\u00002\u0006\u0010\u001d\u001a\u00020\u001eH\u0016¢\u0006\u0002\u0010\u001fR\u0010\u0010\u0006\u001a\u00028\u0000X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\rR\u0014\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u000b0\u000fX\u0082\u000e¢\u0006\u0002\n\u0000R\u001b\u0010\u0010\u001a\u00020\u00118VX\u0096\u0084\u0002¢\u0006\f\n\u0004\b\u0014\u0010\u0015\u001a\u0004\b\u0012\u0010\u0013¨\u0006 "}, d2 = {"Lkotlinx/serialization/internal/ObjectSerializer;", "T", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlinx/serialization/KSerializer;", "serialName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "objectInstance", "<init>", "(Ljava/lang/String;Ljava/lang/Object;)V", "classAnnotations", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "(Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/annotation/Annotation;)V", "Ljava/lang/Object;", "_annotations", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "getDescriptor", "()Lkotlinx/serialization/descriptors/SerialDescriptor;", "descriptor$delegate", "Lkotlin/Lazy;", "serialize", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "encoder", "Lkotlinx/serialization/encoding/Encoder;", "value", "(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V", "deserialize", "decoder", "Lkotlinx/serialization/encoding/Decoder;", "(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@PublishedApi
@SourceDebugExtension
/* loaded from: classes.dex */
public final class ObjectSerializer<T> implements KSerializer<T> {

    @NotNull
    private List<? extends Annotation> _annotations;

    /* renamed from: descriptor$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy descriptor;

    @NotNull
    private final T objectInstance;

    public ObjectSerializer(@NotNull String serialName, @NotNull T objectInstance) {
        Intrinsics.g(serialName, "serialName");
        Intrinsics.g(objectInstance, "objectInstance");
        this.objectInstance = objectInstance;
        this._annotations = EmptyList.f71733a;
        this.descriptor = LazyKt.b(LazyThreadSafetyMode.f71680b, new b00.c(6, serialName, this));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final SerialDescriptor descriptor_delegate$lambda$1(String str, ObjectSerializer objectSerializer) {
        return SerialDescriptorsKt.buildSerialDescriptor(str, StructureKind.OBJECT.INSTANCE, new SerialDescriptor[0], new t(objectSerializer, 20));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit descriptor_delegate$lambda$1$lambda$0(ObjectSerializer objectSerializer, ClassSerialDescriptorBuilder buildSerialDescriptor) {
        Intrinsics.g(buildSerialDescriptor, "$this$buildSerialDescriptor");
        buildSerialDescriptor.setAnnotations(objectSerializer._annotations);
        return Unit.f71706a;
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    @NotNull
    public T deserialize(@NotNull Decoder decoder) {
        int iDecodeElementIndex;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor descriptor = getDescriptor();
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(descriptor);
        if (!compositeDecoderBeginStructure.decodeSequentially() && (iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(getDescriptor())) != -1) {
            throw new SerializationException(c0.h(iDecodeElementIndex, "Unexpected index "));
        }
        Unit unit = Unit.f71706a;
        compositeDecoderBeginStructure.endStructure(descriptor);
        return this.objectInstance;
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    @NotNull
    public SerialDescriptor getDescriptor() {
        return (SerialDescriptor) this.descriptor.getValue();
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public void serialize(@NotNull Encoder encoder, @NotNull T value) {
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        encoder.beginStructure(getDescriptor()).endStructure(getDescriptor());
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @PublishedApi
    public ObjectSerializer(@NotNull String serialName, @NotNull T objectInstance, @NotNull Annotation[] classAnnotations) {
        this(serialName, objectInstance);
        Intrinsics.g(serialName, "serialName");
        Intrinsics.g(objectInstance, "objectInstance");
        Intrinsics.g(classAnnotations, "classAnnotations");
        this._annotations = u90.b.f(classAnnotations);
    }
}
