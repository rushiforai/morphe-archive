package com.stripe.android.financialconnections.model;

import com.stripe.android.financialconnections.model.BalanceRefresh;
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
public final /* synthetic */ class d implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final d f42754a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        d dVar = new d();
        f42754a = dVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.financialconnections.model.BalanceRefresh", dVar, 2);
        pluginGeneratedSerialDescriptor.addElement("status", true);
        pluginGeneratedSerialDescriptor.addElement("last_attempted_at", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{BuiltinSerializersKt.getNullable(BalanceRefresh.f42702c[0]), IntSerializer.INSTANCE};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int iDecodeIntElement;
        int i5;
        BalanceRefresh.BalanceRefreshStatus balanceRefreshStatus;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = BalanceRefresh.f42702c;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            balanceRefreshStatus = (BalanceRefresh.BalanceRefreshStatus) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 0, kSerializerArr[0], null);
            iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
            i5 = 3;
        } else {
            boolean z11 = true;
            iDecodeIntElement = 0;
            BalanceRefresh.BalanceRefreshStatus balanceRefreshStatus2 = null;
            int i11 = 0;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    balanceRefreshStatus2 = (BalanceRefresh.BalanceRefreshStatus) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 0, kSerializerArr[0], balanceRefreshStatus2);
                    i11 |= 1;
                } else {
                    if (iDecodeElementIndex != 1) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
                    i11 |= 2;
                }
            }
            i5 = i11;
            balanceRefreshStatus = balanceRefreshStatus2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new BalanceRefresh(i5, balanceRefreshStatus, iDecodeIntElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        BalanceRefresh value = (BalanceRefresh) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        BalanceRefresh.BalanceRefreshStatus balanceRefreshStatus = value.f42703a;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = BalanceRefresh.f42702c;
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 0) || balanceRefreshStatus != BalanceRefresh.BalanceRefreshStatus.UNKNOWN) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 0, kSerializerArr[0], balanceRefreshStatus);
        }
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 1, value.f42704b);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
