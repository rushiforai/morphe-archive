package com.stripe.android.model;

import com.stripe.android.model.ConsentUi;
import com.tiktok.appevents.contents.TTContentsEventConstants;
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
public final /* synthetic */ class p implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final p f44043a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        p pVar = new p();
        f44043a = pVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.model.ConsentUi.ConsentPane.ScopesSection.Scope", pVar, 3);
        pluginGeneratedSerialDescriptor.addElement("icon", false);
        pluginGeneratedSerialDescriptor.addElement("header", false);
        pluginGeneratedSerialDescriptor.addElement(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{w.f44058a, BuiltinSerializersKt.getNullable(StringSerializer.INSTANCE), fr.x.f55712a};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        ConsentUi.Icon icon;
        String str;
        String str2;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        ConsentUi.Icon icon2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            icon = (ConsentUi.Icon) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, w.f44058a, null);
            str = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, StringSerializer.INSTANCE, null);
            str2 = (String) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, fr.x.f55712a, null);
            i5 = 7;
        } else {
            boolean z11 = true;
            int i11 = 0;
            String str3 = null;
            String str4 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    icon2 = (ConsentUi.Icon) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, w.f44058a, icon2);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    str3 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, StringSerializer.INSTANCE, str3);
                    i11 |= 2;
                } else {
                    if (iDecodeElementIndex != 2) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    str4 = (String) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, fr.x.f55712a, str4);
                    i11 |= 4;
                }
            }
            i5 = i11;
            icon = icon2;
            str = str3;
            str2 = str4;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new ConsentUi.ConsentPane.ScopesSection.Scope(i5, icon, str, str2);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        ConsentUi.ConsentPane.ScopesSection.Scope value = (ConsentUi.ConsentPane.ScopesSection.Scope) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, w.f44058a, value.f43265a);
        compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 1, StringSerializer.INSTANCE, value.f43266b);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, fr.x.f55712a, value.f43267c);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
