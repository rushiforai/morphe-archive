package ft;

import com.stripe.android.model.ConsentUi;
import com.stripe.android.model.ConsumerSession;
import com.stripe.android.model.ConsumerSessionLookup;
import com.stripe.android.model.DisplayablePaymentDetails;
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
public final /* synthetic */ class h implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final h f55947a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        h hVar = new h();
        f55947a = hVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.model.ConsumerSessionLookup", hVar, 7);
        pluginGeneratedSerialDescriptor.addElement("exists", false);
        pluginGeneratedSerialDescriptor.addElement("consumer_session", true);
        pluginGeneratedSerialDescriptor.addElement("error_message", true);
        pluginGeneratedSerialDescriptor.addElement("publishable_key", true);
        pluginGeneratedSerialDescriptor.addElement("displayable_payment_details", true);
        pluginGeneratedSerialDescriptor.addElement("consent_ui", true);
        pluginGeneratedSerialDescriptor.addElement("suggested_email", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer nullable = BuiltinSerializersKt.getNullable(f.f55941a);
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        return new KSerializer[]{BooleanSerializer.INSTANCE, nullable, BuiltinSerializersKt.getNullable(stringSerializer), BuiltinSerializersKt.getNullable(stringSerializer), BuiltinSerializersKt.getNullable(s.f56020a), BuiltinSerializersKt.getNullable(com.stripe.android.model.i.f44038a), BuiltinSerializersKt.getNullable(stringSerializer)};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        boolean zDecodeBooleanElement;
        String str;
        int i5;
        ConsumerSession consumerSession;
        String str2;
        String str3;
        DisplayablePaymentDetails displayablePaymentDetails;
        ConsentUi consentUi;
        boolean z11;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        int i11 = 6;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 0);
            ConsumerSession consumerSession2 = (ConsumerSession) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, f.f55941a, null);
            StringSerializer stringSerializer = StringSerializer.INSTANCE;
            String str4 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, stringSerializer, null);
            String str5 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, stringSerializer, null);
            DisplayablePaymentDetails displayablePaymentDetails2 = (DisplayablePaymentDetails) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, s.f56020a, null);
            ConsentUi consentUi2 = (ConsentUi) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 5, com.stripe.android.model.i.f44038a, null);
            str = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 6, stringSerializer, null);
            consentUi = consentUi2;
            str3 = str5;
            displayablePaymentDetails = displayablePaymentDetails2;
            str2 = str4;
            consumerSession = consumerSession2;
            i5 = 127;
        } else {
            boolean z12 = true;
            zDecodeBooleanElement = false;
            ConsumerSession consumerSession3 = null;
            String str6 = null;
            String str7 = null;
            DisplayablePaymentDetails displayablePaymentDetails3 = null;
            ConsentUi consentUi3 = null;
            int i12 = 0;
            String str8 = null;
            while (z12) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z12 = false;
                    case 0:
                        z11 = true;
                        zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 0);
                        i12 |= 1;
                        i11 = 6;
                    case 1:
                        z11 = true;
                        consumerSession3 = (ConsumerSession) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, f.f55941a, consumerSession3);
                        i12 |= 2;
                        i11 = 6;
                    case 2:
                        str6 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, StringSerializer.INSTANCE, str6);
                        i12 |= 4;
                    case 3:
                        str7 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, StringSerializer.INSTANCE, str7);
                        i12 |= 8;
                    case 4:
                        displayablePaymentDetails3 = (DisplayablePaymentDetails) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, s.f56020a, displayablePaymentDetails3);
                        i12 |= 16;
                    case 5:
                        consentUi3 = (ConsentUi) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 5, com.stripe.android.model.i.f44038a, consentUi3);
                        i12 |= 32;
                    case 6:
                        str8 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, i11, StringSerializer.INSTANCE, str8);
                        i12 |= 64;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            str = str8;
            i5 = i12;
            consumerSession = consumerSession3;
            str2 = str6;
            str3 = str7;
            displayablePaymentDetails = displayablePaymentDetails3;
            consentUi = consentUi3;
        }
        boolean z13 = zDecodeBooleanElement;
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new ConsumerSessionLookup(i5, z13, consumerSession, str2, str3, displayablePaymentDetails, consentUi, str);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        ConsumerSessionLookup value = (ConsumerSessionLookup) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        boolean z11 = value.f43342a;
        String str = value.f43348g;
        ConsentUi consentUi = value.f43347f;
        DisplayablePaymentDetails displayablePaymentDetails = value.f43346e;
        String str2 = value.f43345d;
        String str3 = value.f43344c;
        ConsumerSession consumerSession = value.f43343b;
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 0, z11);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 1) || consumerSession != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 1, f.f55941a, consumerSession);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 2) || str3 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 2, StringSerializer.INSTANCE, str3);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 3) || str2 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 3, StringSerializer.INSTANCE, str2);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 4) || displayablePaymentDetails != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 4, s.f56020a, displayablePaymentDetails);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 5) || consentUi != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 5, com.stripe.android.model.i.f44038a, consentUi);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 6) || str != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 6, StringSerializer.INSTANCE, str);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
