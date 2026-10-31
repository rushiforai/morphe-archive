package com.stripe.android.financialconnections.model;

import com.stripe.android.financialconnections.model.Balance;
import com.tiktok.util.TTConst;
import java.util.Map;
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
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class a implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final a f42752a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        a aVar = new a();
        f42752a = aVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.financialconnections.model.Balance", aVar, 5);
        pluginGeneratedSerialDescriptor.addElement("as_of", false);
        pluginGeneratedSerialDescriptor.addElement("current", false);
        pluginGeneratedSerialDescriptor.addElement(TTConst.TRACK_TYPE, true);
        pluginGeneratedSerialDescriptor.addElement("cash", true);
        pluginGeneratedSerialDescriptor.addElement("credit", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = Balance.f42696f;
        return new KSerializer[]{IntSerializer.INSTANCE, kSerializerArr[1], kSerializerArr[2], BuiltinSerializersKt.getNullable(xr.e.f96226a), BuiltinSerializersKt.getNullable(xr.g.f96227a)};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int iDecodeIntElement;
        int i5;
        Map map;
        Balance.Type type;
        CashBalance cashBalance;
        CreditBalance creditBalance;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = Balance.f42696f;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 0);
            Map map2 = (Map) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], null);
            type = (Balance.Type) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], null);
            cashBalance = (CashBalance) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, xr.e.f96226a, null);
            creditBalance = (CreditBalance) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, xr.g.f96227a, null);
            i5 = 31;
            map = map2;
        } else {
            boolean z11 = true;
            iDecodeIntElement = 0;
            Map map3 = null;
            Balance.Type type2 = null;
            CashBalance cashBalance2 = null;
            CreditBalance creditBalance2 = null;
            int i11 = 0;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 0);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    map3 = (Map) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], map3);
                    i11 |= 2;
                } else if (iDecodeElementIndex == 2) {
                    type2 = (Balance.Type) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], type2);
                    i11 |= 4;
                } else if (iDecodeElementIndex == 3) {
                    cashBalance2 = (CashBalance) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, xr.e.f96226a, cashBalance2);
                    i11 |= 8;
                } else {
                    if (iDecodeElementIndex != 4) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    creditBalance2 = (CreditBalance) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, xr.g.f96227a, creditBalance2);
                    i11 |= 16;
                }
            }
            i5 = i11;
            map = map3;
            type = type2;
            cashBalance = cashBalance2;
            creditBalance = creditBalance2;
        }
        int i12 = iDecodeIntElement;
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new Balance(i5, i12, map, type, cashBalance, creditBalance);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        Balance value = (Balance) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = Balance.f42696f;
        int i5 = value.f42697a;
        CreditBalance creditBalance = value.f42701e;
        CashBalance cashBalance = value.f42700d;
        Balance.Type type = value.f42699c;
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 0, i5);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], value.f42698b);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 2) || type != Balance.Type.UNKNOWN) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], type);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 3) || cashBalance != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 3, xr.e.f96226a, cashBalance);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 4) || creditBalance != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 4, xr.g.f96227a, creditBalance);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
