package com.stripe.android.model;

import com.stripe.android.model.ConsumerSession;
import com.tiktok.util.TTConst;
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
public final /* synthetic */ class i0 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final i0 f44039a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        i0 i0Var = new i0();
        f44039a = i0Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.model.ConsumerSession.VerificationSession", i0Var, 2);
        pluginGeneratedSerialDescriptor.addElement(TTConst.TRACK_TYPE, false);
        pluginGeneratedSerialDescriptor.addElement("state", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = ConsumerSession.VerificationSession.f43324c;
        return new KSerializer[]{kSerializerArr[0], kSerializerArr[1]};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        ConsumerSession.VerificationSession.SessionType sessionType;
        ConsumerSession.VerificationSession.SessionState sessionState;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = ConsumerSession.VerificationSession.f43324c;
        ConsumerSession.VerificationSession.SessionType sessionType2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            sessionType = (ConsumerSession.VerificationSession.SessionType) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kSerializerArr[0], null);
            sessionState = (ConsumerSession.VerificationSession.SessionState) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], null);
            i5 = 3;
        } else {
            boolean z11 = true;
            int i11 = 0;
            ConsumerSession.VerificationSession.SessionState sessionState2 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    sessionType2 = (ConsumerSession.VerificationSession.SessionType) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kSerializerArr[0], sessionType2);
                    i11 |= 1;
                } else {
                    if (iDecodeElementIndex != 1) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    sessionState2 = (ConsumerSession.VerificationSession.SessionState) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], sessionState2);
                    i11 |= 2;
                }
            }
            i5 = i11;
            sessionType = sessionType2;
            sessionState = sessionState2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new ConsumerSession.VerificationSession(i5, sessionType, sessionState);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        ConsumerSession.VerificationSession value = (ConsumerSession.VerificationSession) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = ConsumerSession.VerificationSession.f43324c;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, kSerializerArr[0], value.f43325a);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], value.f43326b);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
