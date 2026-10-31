package com.stripe.android.financialconnections.model;

import com.stripe.android.financialconnections.model.FinancialConnectionsSession;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class w implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final w f42764a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        w wVar = new w();
        f42764a = wVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.financialconnections.model.FinancialConnectionsSession.StatusDetails", wVar, 1);
        pluginGeneratedSerialDescriptor.addElement("cancelled", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{BuiltinSerializersKt.getNullable(x.f42765a)};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        FinancialConnectionsSession.StatusDetails.Cancelled cancelled;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        int i5 = 1;
        FinancialConnectionsSession.StatusDetails.Cancelled cancelled2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            cancelled = (FinancialConnectionsSession.StatusDetails.Cancelled) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 0, x.f42765a, null);
        } else {
            boolean z11 = true;
            int i11 = 0;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else {
                    if (iDecodeElementIndex != 0) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    cancelled2 = (FinancialConnectionsSession.StatusDetails.Cancelled) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 0, x.f42765a, cancelled2);
                    i11 = 1;
                }
            }
            cancelled = cancelled2;
            i5 = i11;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new FinancialConnectionsSession.StatusDetails(i5, cancelled);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        FinancialConnectionsSession.StatusDetails value = (FinancialConnectionsSession.StatusDetails) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        FinancialConnectionsSession.StatusDetails.Cancelled cancelled = value.f42746a;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 0) || cancelled != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 0, x.f42765a, cancelled);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
