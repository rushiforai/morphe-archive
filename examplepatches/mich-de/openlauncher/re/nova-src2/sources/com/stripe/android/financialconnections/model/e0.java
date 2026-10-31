package com.stripe.android.financialconnections.model;

import com.stripe.android.financialconnections.model.OwnershipRefresh;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class e0 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final e0 f42755a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        e0 e0Var = new e0();
        f42755a = e0Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.financialconnections.model.OwnershipRefresh", e0Var, 2);
        pluginGeneratedSerialDescriptor.addElement("last_attempted_at", false);
        pluginGeneratedSerialDescriptor.addElement("status", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{IntSerializer.INSTANCE, OwnershipRefresh.f42749c[1]};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int iDecodeIntElement;
        int i5;
        OwnershipRefresh.Status status;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = OwnershipRefresh.f42749c;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 0);
            status = (OwnershipRefresh.Status) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], null);
            i5 = 3;
        } else {
            boolean z11 = true;
            iDecodeIntElement = 0;
            OwnershipRefresh.Status status2 = null;
            int i11 = 0;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 0);
                    i11 |= 1;
                } else {
                    if (iDecodeElementIndex != 1) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    status2 = (OwnershipRefresh.Status) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], status2);
                    i11 |= 2;
                }
            }
            i5 = i11;
            status = status2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new OwnershipRefresh(i5, iDecodeIntElement, status);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        OwnershipRefresh value = (OwnershipRefresh) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = OwnershipRefresh.f42749c;
        int i5 = value.f42750a;
        OwnershipRefresh.Status status = value.f42751b;
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 0, i5);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 1) || status != OwnershipRefresh.Status.UNKNOWN) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], status);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
