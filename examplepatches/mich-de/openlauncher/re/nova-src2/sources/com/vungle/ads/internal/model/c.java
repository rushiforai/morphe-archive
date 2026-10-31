package com.vungle.ads.internal.model;

import com.vungle.ads.internal.protos.Sdk;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.reflect.KClass;
import kotlinx.serialization.ContextualSerializer;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.LinkedHashMapSerializer;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;

/* loaded from: classes4.dex */
public final class c implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final c f46966a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ PluginGeneratedSerialDescriptor f46967b;

    static {
        c cVar = new c();
        f46966a = cVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.vungle.ads.internal.model.AdPayload", cVar, 7);
        pluginGeneratedSerialDescriptor.addElement("ads", true);
        pluginGeneratedSerialDescriptor.addElement("config", true);
        pluginGeneratedSerialDescriptor.addElement("expiryWindowStart", true);
        pluginGeneratedSerialDescriptor.addElement("mraidFiles", true);
        pluginGeneratedSerialDescriptor.addElement("incentivizedTextSettings", true);
        pluginGeneratedSerialDescriptor.addElement("assetsFullyDownloaded", true);
        pluginGeneratedSerialDescriptor.addElement("indexFilePath", true);
        f46967b = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer nullable = BuiltinSerializersKt.getNullable(new ArrayListSerializer(q.f47117a));
        KSerializer nullable2 = BuiltinSerializersKt.getNullable(v1.f47168a);
        KSerializer nullable3 = BuiltinSerializersKt.getNullable(LongSerializer.INSTANCE);
        KClass orCreateKotlinClass = Reflection.f71864a.getOrCreateKotlinClass(ConcurrentHashMap.class);
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        return new KSerializer[]{nullable, nullable2, nullable3, new ContextualSerializer(orCreateKotlinClass, null, new KSerializer[]{stringSerializer, stringSerializer}), new LinkedHashMapSerializer(stringSerializer, stringSerializer), BooleanSerializer.INSTANCE, BuiltinSerializersKt.getNullable(stringSerializer)};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        Object objDecodeNullableSerializableElement;
        Object objDecodeNullableSerializableElement2;
        boolean z11;
        Object objDecodeSerializableElement;
        Object objDecodeSerializableElement2;
        int i5;
        Object objDecodeNullableSerializableElement3;
        Object objDecodeNullableSerializableElement4;
        char c11;
        Intrinsics.g(decoder, "decoder");
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = f46967b;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(pluginGeneratedSerialDescriptor);
        int i11 = 6;
        int i12 = 5;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            objDecodeNullableSerializableElement = compositeDecoderBeginStructure.decodeNullableSerializableElement(pluginGeneratedSerialDescriptor, 0, new ArrayListSerializer(q.f47117a), null);
            objDecodeNullableSerializableElement4 = compositeDecoderBeginStructure.decodeNullableSerializableElement(pluginGeneratedSerialDescriptor, 1, v1.f47168a, null);
            objDecodeNullableSerializableElement3 = compositeDecoderBeginStructure.decodeNullableSerializableElement(pluginGeneratedSerialDescriptor, 2, LongSerializer.INSTANCE, null);
            KClass orCreateKotlinClass = Reflection.f71864a.getOrCreateKotlinClass(ConcurrentHashMap.class);
            StringSerializer stringSerializer = StringSerializer.INSTANCE;
            objDecodeSerializableElement = compositeDecoderBeginStructure.decodeSerializableElement(pluginGeneratedSerialDescriptor, 3, new ContextualSerializer(orCreateKotlinClass, null, new KSerializer[]{stringSerializer, stringSerializer}), null);
            objDecodeSerializableElement2 = compositeDecoderBeginStructure.decodeSerializableElement(pluginGeneratedSerialDescriptor, 4, new LinkedHashMapSerializer(stringSerializer, stringSerializer), null);
            boolean zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(pluginGeneratedSerialDescriptor, 5);
            objDecodeNullableSerializableElement2 = compositeDecoderBeginStructure.decodeNullableSerializableElement(pluginGeneratedSerialDescriptor, 6, stringSerializer, null);
            i5 = Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
            z11 = zDecodeBooleanElement;
        } else {
            boolean z12 = true;
            boolean zDecodeBooleanElement2 = false;
            int i13 = 0;
            objDecodeNullableSerializableElement = null;
            Object objDecodeNullableSerializableElement5 = null;
            Object objDecodeNullableSerializableElement6 = null;
            Object objDecodeNullableSerializableElement7 = null;
            Object objDecodeSerializableElement3 = null;
            Object objDecodeSerializableElement4 = null;
            while (z12) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(pluginGeneratedSerialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z12 = false;
                        i12 = 5;
                    case 0:
                        objDecodeNullableSerializableElement = compositeDecoderBeginStructure.decodeNullableSerializableElement(pluginGeneratedSerialDescriptor, 0, new ArrayListSerializer(q.f47117a), objDecodeNullableSerializableElement);
                        i13 |= 1;
                        i11 = 6;
                        i12 = 5;
                    case 1:
                        objDecodeNullableSerializableElement6 = compositeDecoderBeginStructure.decodeNullableSerializableElement(pluginGeneratedSerialDescriptor, 1, v1.f47168a, objDecodeNullableSerializableElement6);
                        i13 |= 2;
                        i11 = 6;
                        i12 = 5;
                    case 2:
                        c11 = 3;
                        objDecodeNullableSerializableElement5 = compositeDecoderBeginStructure.decodeNullableSerializableElement(pluginGeneratedSerialDescriptor, 2, LongSerializer.INSTANCE, objDecodeNullableSerializableElement5);
                        i13 |= 4;
                        i11 = 6;
                        i12 = 5;
                    case 3:
                        KClass orCreateKotlinClass2 = Reflection.f71864a.getOrCreateKotlinClass(ConcurrentHashMap.class);
                        StringSerializer stringSerializer2 = StringSerializer.INSTANCE;
                        c11 = 3;
                        objDecodeSerializableElement3 = compositeDecoderBeginStructure.decodeSerializableElement(pluginGeneratedSerialDescriptor, 3, new ContextualSerializer(orCreateKotlinClass2, null, new KSerializer[]{stringSerializer2, stringSerializer2}), objDecodeSerializableElement3);
                        i13 |= 8;
                        i11 = 6;
                        i12 = 5;
                    case 4:
                        StringSerializer stringSerializer3 = StringSerializer.INSTANCE;
                        objDecodeSerializableElement4 = compositeDecoderBeginStructure.decodeSerializableElement(pluginGeneratedSerialDescriptor, 4, new LinkedHashMapSerializer(stringSerializer3, stringSerializer3), objDecodeSerializableElement4);
                        i13 |= 16;
                        i11 = 6;
                    case 5:
                        zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(pluginGeneratedSerialDescriptor, i12);
                        i13 |= 32;
                    case 6:
                        objDecodeNullableSerializableElement7 = compositeDecoderBeginStructure.decodeNullableSerializableElement(pluginGeneratedSerialDescriptor, i11, StringSerializer.INSTANCE, objDecodeNullableSerializableElement7);
                        i13 |= 64;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            objDecodeNullableSerializableElement2 = objDecodeNullableSerializableElement7;
            z11 = zDecodeBooleanElement2;
            objDecodeSerializableElement = objDecodeSerializableElement3;
            objDecodeSerializableElement2 = objDecodeSerializableElement4;
            i5 = i13;
            objDecodeNullableSerializableElement3 = objDecodeNullableSerializableElement5;
            objDecodeNullableSerializableElement4 = objDecodeNullableSerializableElement6;
        }
        compositeDecoderBeginStructure.endStructure(pluginGeneratedSerialDescriptor);
        return new i0(i5, (List) objDecodeNullableSerializableElement, (w2) objDecodeNullableSerializableElement4, (Long) objDecodeNullableSerializableElement3, (ConcurrentHashMap) objDecodeSerializableElement, (Map) objDecodeSerializableElement2, z11, (String) objDecodeNullableSerializableElement2);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return f46967b;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        i0 value = (i0) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = f46967b;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(pluginGeneratedSerialDescriptor);
        i0.a(value, compositeEncoderBeginStructure, pluginGeneratedSerialDescriptor);
        compositeEncoderBeginStructure.endStructure(pluginGeneratedSerialDescriptor);
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] typeParametersSerializers() {
        return GeneratedSerializer.DefaultImpls.typeParametersSerializers(this);
    }
}
