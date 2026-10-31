package com.stripe.android.financialconnections.model;

import androidx.recyclerview.widget.u1;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.stripe.android.financialconnections.model.FinancialConnectionsAccount;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.List;
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
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class g implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final g f42756a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        g gVar = new g();
        f42756a = gVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.financialconnections.model.FinancialConnectionsAccount", gVar, 16);
        pluginGeneratedSerialDescriptor.addElement("category", true);
        pluginGeneratedSerialDescriptor.addElement("created", false);
        pluginGeneratedSerialDescriptor.addElement("id", false);
        pluginGeneratedSerialDescriptor.addElement("institution_name", false);
        pluginGeneratedSerialDescriptor.addElement("livemode", false);
        pluginGeneratedSerialDescriptor.addElement("status", true);
        pluginGeneratedSerialDescriptor.addElement("subcategory", true);
        pluginGeneratedSerialDescriptor.addElement("supported_payment_method_types", false);
        pluginGeneratedSerialDescriptor.addElement("balance", true);
        pluginGeneratedSerialDescriptor.addElement("balance_refresh", true);
        pluginGeneratedSerialDescriptor.addElement("display_name", true);
        pluginGeneratedSerialDescriptor.addElement("last4", true);
        pluginGeneratedSerialDescriptor.addElement("ownership", true);
        pluginGeneratedSerialDescriptor.addElement("ownership_refresh", true);
        pluginGeneratedSerialDescriptor.addElement("permissions", true);
        pluginGeneratedSerialDescriptor.addElement("object", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = FinancialConnectionsAccount.f42714q;
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        return new KSerializer[]{i.f42757e, IntSerializer.INSTANCE, stringSerializer, stringSerializer, BooleanSerializer.INSTANCE, n.f42759e, p.f42760e, kSerializerArr[7], BuiltinSerializersKt.getNullable(a.f42752a), BuiltinSerializersKt.getNullable(d.f42754a), BuiltinSerializersKt.getNullable(stringSerializer), BuiltinSerializersKt.getNullable(stringSerializer), BuiltinSerializersKt.getNullable(stringSerializer), BuiltinSerializersKt.getNullable(e0.f42755a), BuiltinSerializersKt.getNullable(kSerializerArr[14]), stringSerializer};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        String str;
        FinancialConnectionsAccount.Subcategory subcategory;
        FinancialConnectionsAccount.Status status;
        FinancialConnectionsAccount.Category category;
        int i5;
        List list;
        String str2;
        String str3;
        Balance balance;
        OwnershipRefresh ownershipRefresh;
        BalanceRefresh balanceRefresh;
        List list2;
        String str4;
        String str5;
        String strDecodeStringElement;
        boolean z11;
        int i11;
        int i12;
        int i13;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = FinancialConnectionsAccount.f42714q;
        FinancialConnectionsAccount.Category category2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            FinancialConnectionsAccount.Category category3 = (FinancialConnectionsAccount.Category) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, i.f42757e, null);
            int iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
            String strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 2);
            String strDecodeStringElement3 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 3);
            boolean zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 4);
            FinancialConnectionsAccount.Status status2 = (FinancialConnectionsAccount.Status) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 5, n.f42759e, null);
            FinancialConnectionsAccount.Subcategory subcategory2 = (FinancialConnectionsAccount.Subcategory) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 6, p.f42760e, null);
            List list3 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 7, kSerializerArr[7], null);
            Balance balance2 = (Balance) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 8, a.f42752a, null);
            BalanceRefresh balanceRefresh2 = (BalanceRefresh) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 9, d.f42754a, null);
            StringSerializer stringSerializer = StringSerializer.INSTANCE;
            String str6 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 10, stringSerializer, null);
            String str7 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 11, stringSerializer, null);
            String str8 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 12, stringSerializer, null);
            OwnershipRefresh ownershipRefresh2 = (OwnershipRefresh) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 13, e0.f42755a, null);
            list = (List) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 14, kSerializerArr[14], null);
            category = category3;
            list2 = list3;
            i11 = iDecodeIntElement;
            str4 = strDecodeStringElement2;
            strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 15);
            str3 = str6;
            balanceRefresh = balanceRefresh2;
            subcategory = subcategory2;
            status = status2;
            str5 = strDecodeStringElement3;
            balance = balance2;
            z11 = zDecodeBooleanElement;
            i5 = 65535;
            ownershipRefresh = ownershipRefresh2;
            str = str8;
            str2 = str7;
        } else {
            int i14 = 7;
            boolean z12 = true;
            int iDecodeIntElement2 = 0;
            int i15 = 0;
            boolean zDecodeBooleanElement2 = false;
            String str9 = null;
            FinancialConnectionsAccount.Subcategory subcategory3 = null;
            FinancialConnectionsAccount.Status status3 = null;
            List list4 = null;
            String str10 = null;
            String str11 = null;
            Balance balance3 = null;
            OwnershipRefresh ownershipRefresh3 = null;
            BalanceRefresh balanceRefresh3 = null;
            List list5 = null;
            String strDecodeStringElement4 = null;
            String strDecodeStringElement5 = null;
            String strDecodeStringElement6 = null;
            while (z12) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        i12 = iDecodeIntElement2;
                        z12 = false;
                        iDecodeIntElement2 = i12;
                        i14 = 7;
                    case 0:
                        i12 = iDecodeIntElement2;
                        category2 = (FinancialConnectionsAccount.Category) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, i.f42757e, category2);
                        i15 |= 1;
                        iDecodeIntElement2 = i12;
                        i14 = 7;
                    case 1:
                        i15 |= 2;
                        iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
                        i14 = 7;
                    case 2:
                        i12 = iDecodeIntElement2;
                        strDecodeStringElement4 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 2);
                        i15 |= 4;
                        iDecodeIntElement2 = i12;
                        i14 = 7;
                    case 3:
                        i12 = iDecodeIntElement2;
                        strDecodeStringElement5 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 3);
                        i15 |= 8;
                        iDecodeIntElement2 = i12;
                        i14 = 7;
                    case 4:
                        i12 = iDecodeIntElement2;
                        zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 4);
                        i15 |= 16;
                        iDecodeIntElement2 = i12;
                        i14 = 7;
                    case 5:
                        i12 = iDecodeIntElement2;
                        status3 = (FinancialConnectionsAccount.Status) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 5, n.f42759e, status3);
                        i15 |= 32;
                        iDecodeIntElement2 = i12;
                        i14 = 7;
                    case 6:
                        i12 = iDecodeIntElement2;
                        subcategory3 = (FinancialConnectionsAccount.Subcategory) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 6, p.f42760e, subcategory3);
                        i15 |= 64;
                        iDecodeIntElement2 = i12;
                        i14 = 7;
                    case 7:
                        i13 = iDecodeIntElement2;
                        list5 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, i14, kSerializerArr[i14], list5);
                        i15 |= 128;
                        iDecodeIntElement2 = i13;
                    case 8:
                        i13 = iDecodeIntElement2;
                        balance3 = (Balance) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 8, a.f42752a, balance3);
                        i15 |= 256;
                        iDecodeIntElement2 = i13;
                    case 9:
                        i13 = iDecodeIntElement2;
                        balanceRefresh3 = (BalanceRefresh) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 9, d.f42754a, balanceRefresh3);
                        i15 |= EventBridgeChannel.QUEUE_CAPACITY;
                        iDecodeIntElement2 = i13;
                    case 10:
                        i13 = iDecodeIntElement2;
                        str11 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 10, StringSerializer.INSTANCE, str11);
                        i15 |= 1024;
                        iDecodeIntElement2 = i13;
                    case 11:
                        i13 = iDecodeIntElement2;
                        str10 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 11, StringSerializer.INSTANCE, str10);
                        i15 |= 2048;
                        iDecodeIntElement2 = i13;
                    case 12:
                        i13 = iDecodeIntElement2;
                        str9 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 12, StringSerializer.INSTANCE, str9);
                        i15 |= u1.FLAG_APPEARED_IN_PRE_LAYOUT;
                        iDecodeIntElement2 = i13;
                    case 13:
                        i13 = iDecodeIntElement2;
                        ownershipRefresh3 = (OwnershipRefresh) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 13, e0.f42755a, ownershipRefresh3);
                        i15 |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
                        iDecodeIntElement2 = i13;
                    case 14:
                        i13 = iDecodeIntElement2;
                        list4 = (List) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 14, kSerializerArr[14], list4);
                        i15 |= ReaderJsonLexerKt.BATCH_SIZE;
                        iDecodeIntElement2 = i13;
                    case 15:
                        strDecodeStringElement6 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 15);
                        i15 |= SQLiteDatabase.OPEN_NOMUTEX;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            str = str9;
            subcategory = subcategory3;
            status = status3;
            category = category2;
            i5 = i15;
            list = list4;
            str2 = str10;
            str3 = str11;
            balance = balance3;
            ownershipRefresh = ownershipRefresh3;
            balanceRefresh = balanceRefresh3;
            list2 = list5;
            str4 = strDecodeStringElement4;
            str5 = strDecodeStringElement5;
            strDecodeStringElement = strDecodeStringElement6;
            z11 = zDecodeBooleanElement2;
            i11 = iDecodeIntElement2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new FinancialConnectionsAccount(i5, category, i11, str4, str5, z11, status, subcategory, list2, balance, balanceRefresh, str3, str2, str, ownershipRefresh, list, strDecodeStringElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        FinancialConnectionsAccount value = (FinancialConnectionsAccount) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        FinancialConnectionsAccount.Category category = value.f42715a;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = FinancialConnectionsAccount.f42714q;
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 0) || category != FinancialConnectionsAccount.Category.UNKNOWN) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, i.f42757e, category);
        }
        int i5 = value.f42716b;
        List list = value.o;
        OwnershipRefresh ownershipRefresh = value.n;
        String str = value.f42727m;
        String str2 = value.f42726l;
        String str3 = value.f42725k;
        BalanceRefresh balanceRefresh = value.f42724j;
        Balance balance = value.f42723i;
        FinancialConnectionsAccount.Subcategory subcategory = value.f42721g;
        FinancialConnectionsAccount.Status status = value.f42720f;
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 1, i5);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 2, value.f42717c);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 3, value.f42718d);
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 4, value.f42719e);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 5) || status != FinancialConnectionsAccount.Status.UNKNOWN) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 5, n.f42759e, status);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 6) || subcategory != FinancialConnectionsAccount.Subcategory.UNKNOWN) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 6, p.f42760e, subcategory);
        }
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 7, kSerializerArr[7], value.f42722h);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 8) || balance != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 8, a.f42752a, balance);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 9) || balanceRefresh != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 9, d.f42754a, balanceRefresh);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 10) || str3 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 10, StringSerializer.INSTANCE, str3);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 11) || str2 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 11, StringSerializer.INSTANCE, str2);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 12) || str != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 12, StringSerializer.INSTANCE, str);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 13) || ownershipRefresh != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 13, e0.f42755a, ownershipRefresh);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 14) || list != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 14, kSerializerArr[14], list);
        }
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 15, value.f42728p);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
