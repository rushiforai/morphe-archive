package com.stripe.android.financialconnections.model;

import com.amplitude.eventbridge.EventBridgeChannel;
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
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class s implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final s f42762a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        s sVar = new s();
        f42762a = sVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.financialconnections.model.FinancialConnectionsSession", sVar, 11);
        pluginGeneratedSerialDescriptor.addElement("client_secret", false);
        pluginGeneratedSerialDescriptor.addElement("id", false);
        pluginGeneratedSerialDescriptor.addElement("linked_accounts", true);
        pluginGeneratedSerialDescriptor.addElement("accounts", true);
        pluginGeneratedSerialDescriptor.addElement("livemode", false);
        pluginGeneratedSerialDescriptor.addElement("payment_account", true);
        pluginGeneratedSerialDescriptor.addElement("return_url", true);
        pluginGeneratedSerialDescriptor.addElement("bank_account_token", true);
        pluginGeneratedSerialDescriptor.addElement("manual_entry", true);
        pluginGeneratedSerialDescriptor.addElement("status", true);
        pluginGeneratedSerialDescriptor.addElement("status_details", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        xr.j jVar = xr.j.f96228a;
        return new KSerializer[]{stringSerializer, stringSerializer, BuiltinSerializersKt.getNullable(jVar), BuiltinSerializersKt.getNullable(jVar), BooleanSerializer.INSTANCE, BuiltinSerializersKt.getNullable(yr.b.f97406a), BuiltinSerializersKt.getNullable(stringSerializer), BuiltinSerializersKt.getNullable(yr.a.f97405b), BuiltinSerializersKt.getNullable(xr.m.f96229a), BuiltinSerializersKt.getNullable(v.f42763e), BuiltinSerializersKt.getNullable(w.f42764a)};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        boolean z11;
        FinancialConnectionsSession.StatusDetails statusDetails;
        FinancialConnectionsSession.Status status;
        ManualEntry manualEntry;
        String str;
        String str2;
        PaymentAccount paymentAccount;
        FinancialConnectionsAccountList financialConnectionsAccountList;
        FinancialConnectionsAccountList financialConnectionsAccountList2;
        int i5;
        String str3;
        String str4;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        int i11 = 10;
        int i12 = 9;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            String strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
            String strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
            xr.j jVar = xr.j.f96228a;
            FinancialConnectionsAccountList financialConnectionsAccountList3 = (FinancialConnectionsAccountList) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, jVar, null);
            FinancialConnectionsAccountList financialConnectionsAccountList4 = (FinancialConnectionsAccountList) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, jVar, null);
            boolean zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 4);
            PaymentAccount paymentAccount2 = (PaymentAccount) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 5, yr.b.f97406a, null);
            String str5 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 6, StringSerializer.INSTANCE, null);
            String str6 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 7, yr.a.f97405b, null);
            ManualEntry manualEntry2 = (ManualEntry) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 8, xr.m.f96229a, null);
            FinancialConnectionsSession.Status status2 = (FinancialConnectionsSession.Status) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 9, v.f42763e, null);
            str3 = strDecodeStringElement;
            statusDetails = (FinancialConnectionsSession.StatusDetails) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 10, w.f42764a, null);
            status = status2;
            str2 = str6;
            str = str5;
            paymentAccount = paymentAccount2;
            financialConnectionsAccountList = financialConnectionsAccountList4;
            manualEntry = manualEntry2;
            z11 = zDecodeBooleanElement;
            financialConnectionsAccountList2 = financialConnectionsAccountList3;
            str4 = strDecodeStringElement2;
            i5 = 2047;
        } else {
            boolean z12 = true;
            boolean zDecodeBooleanElement2 = false;
            FinancialConnectionsSession.StatusDetails statusDetails2 = null;
            FinancialConnectionsSession.Status status3 = null;
            ManualEntry manualEntry3 = null;
            String str7 = null;
            String str8 = null;
            PaymentAccount paymentAccount3 = null;
            FinancialConnectionsAccountList financialConnectionsAccountList5 = null;
            String strDecodeStringElement3 = null;
            String strDecodeStringElement4 = null;
            int i13 = 0;
            FinancialConnectionsAccountList financialConnectionsAccountList6 = null;
            while (z12) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z12 = false;
                        i11 = 10;
                    case 0:
                        i13 |= 1;
                        strDecodeStringElement3 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
                        i11 = 10;
                        i12 = 9;
                    case 1:
                        strDecodeStringElement4 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
                        i13 |= 2;
                        i11 = 10;
                        i12 = 9;
                    case 2:
                        financialConnectionsAccountList6 = (FinancialConnectionsAccountList) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, xr.j.f96228a, financialConnectionsAccountList6);
                        i13 |= 4;
                        i11 = 10;
                        i12 = 9;
                    case 3:
                        financialConnectionsAccountList5 = (FinancialConnectionsAccountList) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, xr.j.f96228a, financialConnectionsAccountList5);
                        i13 |= 8;
                        i11 = 10;
                        i12 = 9;
                    case 4:
                        zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 4);
                        i13 |= 16;
                        i11 = 10;
                    case 5:
                        paymentAccount3 = (PaymentAccount) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 5, yr.b.f97406a, paymentAccount3);
                        i13 |= 32;
                        i11 = 10;
                    case 6:
                        str7 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 6, StringSerializer.INSTANCE, str7);
                        i13 |= 64;
                        i11 = 10;
                    case 7:
                        str8 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 7, yr.a.f97405b, str8);
                        i13 |= 128;
                        i11 = 10;
                    case 8:
                        manualEntry3 = (ManualEntry) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 8, xr.m.f96229a, manualEntry3);
                        i13 |= 256;
                        i11 = 10;
                    case 9:
                        status3 = (FinancialConnectionsSession.Status) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, i12, v.f42763e, status3);
                        i13 |= EventBridgeChannel.QUEUE_CAPACITY;
                    case 10:
                        statusDetails2 = (FinancialConnectionsSession.StatusDetails) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, i11, w.f42764a, statusDetails2);
                        i13 |= 1024;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            z11 = zDecodeBooleanElement2;
            statusDetails = statusDetails2;
            status = status3;
            manualEntry = manualEntry3;
            str = str7;
            str2 = str8;
            paymentAccount = paymentAccount3;
            financialConnectionsAccountList = financialConnectionsAccountList5;
            financialConnectionsAccountList2 = financialConnectionsAccountList6;
            i5 = i13;
            str3 = strDecodeStringElement3;
            str4 = strDecodeStringElement4;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new FinancialConnectionsSession(i5, str3, str4, financialConnectionsAccountList2, financialConnectionsAccountList, z11, paymentAccount, str, str2, manualEntry, status, statusDetails);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        FinancialConnectionsSession value = (FinancialConnectionsSession) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        String str = value.f42735a;
        FinancialConnectionsSession.StatusDetails statusDetails = value.f42745k;
        FinancialConnectionsSession.Status status = value.f42744j;
        ManualEntry manualEntry = value.f42743i;
        String str2 = value.f42742h;
        String str3 = value.f42741g;
        PaymentAccount paymentAccount = value.f42740f;
        FinancialConnectionsAccountList financialConnectionsAccountList = value.f42738d;
        FinancialConnectionsAccountList financialConnectionsAccountList2 = value.f42737c;
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 0, str);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 1, value.f42736b);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 2) || financialConnectionsAccountList2 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 2, xr.j.f96228a, financialConnectionsAccountList2);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 3) || financialConnectionsAccountList != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 3, xr.j.f96228a, financialConnectionsAccountList);
        }
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 4, value.f42739e);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 5) || paymentAccount != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 5, yr.b.f97406a, paymentAccount);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 6) || str3 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 6, StringSerializer.INSTANCE, str3);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 7) || str2 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 7, yr.a.f97405b, str2);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 8) || manualEntry != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 8, xr.m.f96229a, manualEntry);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 9) || status != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 9, v.f42763e, status);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 10) || statusDetails != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 10, w.f42764a, statusDetails);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
