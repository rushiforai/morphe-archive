package com.stripe.android.financialconnections.model;

import com.stripe.android.financialconnections.model.FinancialConnectionsSession;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class x implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final x f42765a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        x xVar = new x();
        f42765a = xVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.financialconnections.model.FinancialConnectionsSession.StatusDetails.Cancelled", xVar, 1);
        pluginGeneratedSerialDescriptor.addElement("reason", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{b0.f42753e};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        FinancialConnectionsSession.StatusDetails.Cancelled.Reason reason;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        int i5 = 1;
        FinancialConnectionsSession.StatusDetails.Cancelled.Reason reason2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            reason = (FinancialConnectionsSession.StatusDetails.Cancelled.Reason) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, b0.f42753e, null);
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
                    reason2 = (FinancialConnectionsSession.StatusDetails.Cancelled.Reason) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, b0.f42753e, reason2);
                    i11 = 1;
                }
            }
            reason = reason2;
            i5 = i11;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new FinancialConnectionsSession.StatusDetails.Cancelled(i5, reason);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        FinancialConnectionsSession.StatusDetails.Cancelled value = (FinancialConnectionsSession.StatusDetails.Cancelled) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, b0.f42753e, value.f42747a);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
