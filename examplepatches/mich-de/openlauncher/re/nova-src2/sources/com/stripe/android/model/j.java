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
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class j implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final j f44040a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        j jVar = new j();
        f44040a = jVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.model.ConsentUi.ConsentPane", jVar, 5);
        pluginGeneratedSerialDescriptor.addElement("title", false);
        pluginGeneratedSerialDescriptor.addElement("scopes_section", false);
        pluginGeneratedSerialDescriptor.addElement("disclaimer", false);
        pluginGeneratedSerialDescriptor.addElement("deny_button_label", false);
        pluginGeneratedSerialDescriptor.addElement("allow_button_label", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        return new KSerializer[]{stringSerializer, m.f44042a, BuiltinSerializersKt.getNullable(fr.x.f55712a), BuiltinSerializersKt.getNullable(stringSerializer), stringSerializer};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        String str;
        ConsentUi.ConsentPane.ScopesSection scopesSection;
        String str2;
        String str3;
        String strDecodeStringElement;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        String strDecodeStringElement2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            String strDecodeStringElement3 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
            ConsentUi.ConsentPane.ScopesSection scopesSection2 = (ConsentUi.ConsentPane.ScopesSection) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, m.f44042a, null);
            String str4 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, fr.x.f55712a, null);
            str = strDecodeStringElement3;
            str3 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, StringSerializer.INSTANCE, null);
            strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 4);
            str2 = str4;
            scopesSection = scopesSection2;
            i5 = 31;
        } else {
            boolean z11 = true;
            int i11 = 0;
            ConsentUi.ConsentPane.ScopesSection scopesSection3 = null;
            String str5 = null;
            String str6 = null;
            String strDecodeStringElement4 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    scopesSection3 = (ConsentUi.ConsentPane.ScopesSection) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, m.f44042a, scopesSection3);
                    i11 |= 2;
                } else if (iDecodeElementIndex == 2) {
                    str5 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, fr.x.f55712a, str5);
                    i11 |= 4;
                } else if (iDecodeElementIndex == 3) {
                    str6 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, StringSerializer.INSTANCE, str6);
                    i11 |= 8;
                } else {
                    if (iDecodeElementIndex != 4) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    strDecodeStringElement4 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 4);
                    i11 |= 16;
                }
            }
            i5 = i11;
            str = strDecodeStringElement2;
            scopesSection = scopesSection3;
            str2 = str5;
            str3 = str6;
            strDecodeStringElement = strDecodeStringElement4;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new ConsentUi.ConsentPane(i5, str, scopesSection, str2, str3, strDecodeStringElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        ConsentUi.ConsentPane value = (ConsentUi.ConsentPane) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 0, value.f43257a);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, m.f44042a, value.f43258b);
        compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 2, fr.x.f55712a, value.f43259c);
        compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 3, StringSerializer.INSTANCE, value.f43260d);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 4, value.f43261e);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
