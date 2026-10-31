package com.stripe.android.model;

import com.stripe.android.model.ConsentUi;
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
public final /* synthetic */ class i implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final i f44038a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        i iVar = new i();
        f44038a = iVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.model.ConsentUi", iVar, 2);
        pluginGeneratedSerialDescriptor.addElement("consent_pane", false);
        pluginGeneratedSerialDescriptor.addElement("consent_section", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{BuiltinSerializersKt.getNullable(j.f44040a), BuiltinSerializersKt.getNullable(s.f44053a)};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        ConsentUi.ConsentPane consentPane;
        ConsentUi.ConsentSection consentSection;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        ConsentUi.ConsentPane consentPane2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            consentPane = (ConsentUi.ConsentPane) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 0, j.f44040a, null);
            consentSection = (ConsentUi.ConsentSection) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, s.f44053a, null);
            i5 = 3;
        } else {
            boolean z11 = true;
            int i11 = 0;
            ConsentUi.ConsentSection consentSection2 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    consentPane2 = (ConsentUi.ConsentPane) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 0, j.f44040a, consentPane2);
                    i11 |= 1;
                } else {
                    if (iDecodeElementIndex != 1) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    consentSection2 = (ConsentUi.ConsentSection) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, s.f44053a, consentSection2);
                    i11 |= 2;
                }
            }
            i5 = i11;
            consentPane = consentPane2;
            consentSection = consentSection2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new ConsentUi(i5, consentPane, consentSection);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        ConsentUi value = (ConsentUi) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 0, j.f44040a, value.f43255a);
        compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 1, s.f44053a, value.f43256b);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
