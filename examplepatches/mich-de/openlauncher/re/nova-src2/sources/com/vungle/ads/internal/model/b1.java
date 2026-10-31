package com.vungle.ads.internal.model;

import com.google.ads.mediation.moloco.MolocoMediationAdapter;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.DoubleSerializer;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;

/* loaded from: classes4.dex */
public final class b1 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final b1 f46941a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ PluginGeneratedSerialDescriptor f46942b;

    static {
        b1 b1Var = new b1();
        f46941a = b1Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.vungle.ads.internal.model.CommonRequestBody.CSBParam", b1Var, 7);
        pluginGeneratedSerialDescriptor.addElement("bidfloor", false);
        pluginGeneratedSerialDescriptor.addElement("phase", false);
        pluginGeneratedSerialDescriptor.addElement("is_vx_winner", false);
        pluginGeneratedSerialDescriptor.addElement("parent_auction_id", false);
        pluginGeneratedSerialDescriptor.addElement("creative_id", false);
        pluginGeneratedSerialDescriptor.addElement(MolocoMediationAdapter.KEY_AD_UNIT_ID, false);
        pluginGeneratedSerialDescriptor.addElement("ext", true);
        f46942b = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        return new KSerializer[]{DoubleSerializer.INSTANCE, IntSerializer.INSTANCE, BooleanSerializer.INSTANCE, stringSerializer, stringSerializer, stringSerializer, BuiltinSerializersKt.getNullable(stringSerializer)};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int iDecodeIntElement;
        boolean z11;
        int i5;
        Object objDecodeNullableSerializableElement;
        String str;
        String str2;
        String str3;
        double d5;
        Intrinsics.g(decoder, "decoder");
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = f46942b;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(pluginGeneratedSerialDescriptor);
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            double dDecodeDoubleElement = compositeDecoderBeginStructure.decodeDoubleElement(pluginGeneratedSerialDescriptor, 0);
            iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(pluginGeneratedSerialDescriptor, 1);
            boolean zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(pluginGeneratedSerialDescriptor, 2);
            String strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(pluginGeneratedSerialDescriptor, 3);
            String strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(pluginGeneratedSerialDescriptor, 4);
            String strDecodeStringElement3 = compositeDecoderBeginStructure.decodeStringElement(pluginGeneratedSerialDescriptor, 5);
            objDecodeNullableSerializableElement = compositeDecoderBeginStructure.decodeNullableSerializableElement(pluginGeneratedSerialDescriptor, 6, StringSerializer.INSTANCE, null);
            str3 = strDecodeStringElement3;
            str = strDecodeStringElement;
            str2 = strDecodeStringElement2;
            z11 = zDecodeBooleanElement;
            i5 = 127;
            d5 = dDecodeDoubleElement;
        } else {
            boolean z12 = true;
            iDecodeIntElement = 0;
            String strDecodeStringElement4 = null;
            String strDecodeStringElement5 = null;
            String strDecodeStringElement6 = null;
            double dDecodeDoubleElement2 = 0.0d;
            boolean zDecodeBooleanElement2 = false;
            int i11 = 0;
            Object objDecodeNullableSerializableElement2 = null;
            while (z12) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(pluginGeneratedSerialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z12 = false;
                        continue;
                    case 0:
                        dDecodeDoubleElement2 = compositeDecoderBeginStructure.decodeDoubleElement(pluginGeneratedSerialDescriptor, 0);
                        i11 |= 1;
                        continue;
                    case 1:
                        iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(pluginGeneratedSerialDescriptor, 1);
                        i11 |= 2;
                        break;
                    case 2:
                        zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(pluginGeneratedSerialDescriptor, 2);
                        i11 |= 4;
                        break;
                    case 3:
                        strDecodeStringElement4 = compositeDecoderBeginStructure.decodeStringElement(pluginGeneratedSerialDescriptor, 3);
                        i11 |= 8;
                        break;
                    case 4:
                        strDecodeStringElement5 = compositeDecoderBeginStructure.decodeStringElement(pluginGeneratedSerialDescriptor, 4);
                        i11 |= 16;
                        break;
                    case 5:
                        strDecodeStringElement6 = compositeDecoderBeginStructure.decodeStringElement(pluginGeneratedSerialDescriptor, 5);
                        i11 |= 32;
                        break;
                    case 6:
                        objDecodeNullableSerializableElement2 = compositeDecoderBeginStructure.decodeNullableSerializableElement(pluginGeneratedSerialDescriptor, 6, StringSerializer.INSTANCE, objDecodeNullableSerializableElement2);
                        i11 |= 64;
                        break;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            z11 = zDecodeBooleanElement2;
            i5 = i11;
            objDecodeNullableSerializableElement = objDecodeNullableSerializableElement2;
            str = strDecodeStringElement4;
            str2 = strDecodeStringElement5;
            str3 = strDecodeStringElement6;
            d5 = dDecodeDoubleElement2;
        }
        int i12 = iDecodeIntElement;
        compositeDecoderBeginStructure.endStructure(pluginGeneratedSerialDescriptor);
        return new d1(i5, d5, i12, z11, str, str2, str3, (String) objDecodeNullableSerializableElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return f46942b;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        d1 value = (d1) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = f46942b;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(pluginGeneratedSerialDescriptor);
        d1.a(value, compositeEncoderBeginStructure, pluginGeneratedSerialDescriptor);
        compositeEncoderBeginStructure.endStructure(pluginGeneratedSerialDescriptor);
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] typeParametersSerializers() {
        return GeneratedSerializer.DefaultImpls.typeParametersSerializers(this);
    }
}
