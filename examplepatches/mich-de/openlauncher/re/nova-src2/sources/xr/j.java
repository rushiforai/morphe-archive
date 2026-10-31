package xr;

import com.stripe.android.financialconnections.model.FinancialConnectionsAccountList;
import com.tiktok.appevents.edp.TTEDPEventConstants;
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
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class j implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final j f96228a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        j jVar = new j();
        f96228a = jVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.financialconnections.model.FinancialConnectionsAccountList", jVar, 5);
        pluginGeneratedSerialDescriptor.addElement("data", false);
        pluginGeneratedSerialDescriptor.addElement("has_more", false);
        pluginGeneratedSerialDescriptor.addElement(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, false);
        pluginGeneratedSerialDescriptor.addElement("count", true);
        pluginGeneratedSerialDescriptor.addElement("total_count", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer kSerializer = FinancialConnectionsAccountList.f42729f[0];
        IntSerializer intSerializer = IntSerializer.INSTANCE;
        return new KSerializer[]{kSerializer, BooleanSerializer.INSTANCE, StringSerializer.INSTANCE, BuiltinSerializersKt.getNullable(intSerializer), BuiltinSerializersKt.getNullable(intSerializer)};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        boolean zDecodeBooleanElement;
        int i5;
        List list;
        String str;
        Integer num;
        Integer num2;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = FinancialConnectionsAccountList.f42729f;
        int i11 = 0;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            List list2 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kSerializerArr[0], null);
            zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 1);
            String strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 2);
            IntSerializer intSerializer = IntSerializer.INSTANCE;
            list = list2;
            num = (Integer) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, intSerializer, null);
            num2 = (Integer) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, intSerializer, null);
            str = strDecodeStringElement;
            i5 = 31;
        } else {
            int i12 = 1;
            zDecodeBooleanElement = false;
            List list3 = null;
            String strDecodeStringElement2 = null;
            Integer num3 = null;
            Integer num4 = null;
            int i13 = 0;
            while (i12 != 0) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                int i14 = i11;
                if (iDecodeElementIndex == -1) {
                    i11 = i14;
                    i12 = i11;
                } else if (iDecodeElementIndex != 0) {
                    if (iDecodeElementIndex == 1) {
                        zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 1);
                        i13 |= 2;
                    } else if (iDecodeElementIndex == 2) {
                        strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 2);
                        i13 |= 4;
                    } else if (iDecodeElementIndex == 3) {
                        num3 = (Integer) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, IntSerializer.INSTANCE, num3);
                        i13 |= 8;
                    } else {
                        if (iDecodeElementIndex != 4) {
                            throw new UnknownFieldException(iDecodeElementIndex);
                        }
                        num4 = (Integer) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, IntSerializer.INSTANCE, num4);
                        i13 |= 16;
                    }
                    i11 = i14;
                } else {
                    list3 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, i14, kSerializerArr[i14], list3);
                    i13 |= 1;
                    i11 = i14;
                }
            }
            i5 = i13;
            list = list3;
            str = strDecodeStringElement2;
            num = num3;
            num2 = num4;
        }
        boolean z11 = zDecodeBooleanElement;
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new FinancialConnectionsAccountList(i5, list, z11, str, num, num2);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        FinancialConnectionsAccountList value = (FinancialConnectionsAccountList) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer kSerializer = FinancialConnectionsAccountList.f42729f[0];
        List list = value.f42730a;
        Integer num = value.f42734e;
        Integer num2 = value.f42733d;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, kSerializer, list);
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 1, value.f42731b);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 2, value.f42732c);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 3) || num2 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 3, IntSerializer.INSTANCE, num2);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 4) || num != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 4, IntSerializer.INSTANCE, num);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
