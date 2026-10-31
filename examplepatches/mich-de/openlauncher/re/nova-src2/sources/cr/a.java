package cr;

import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.stripe.android.core.model.Country;
import com.stripe.android.core.model.CountryCode;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
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
public final /* synthetic */ class a implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final a f47797a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        a aVar = new a();
        f47797a = aVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.core.model.Country", aVar, 2);
        pluginGeneratedSerialDescriptor.addElement(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, false);
        pluginGeneratedSerialDescriptor.addElement(PendingUpgradeStore.KEY_NAME, false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{c.f47798a, StringSerializer.INSTANCE};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        CountryCode countryCode;
        String strDecodeStringElement;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        CountryCode countryCode2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            countryCode = (CountryCode) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, c.f47798a, null);
            strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
            i5 = 3;
        } else {
            boolean z11 = true;
            int i11 = 0;
            String strDecodeStringElement2 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    countryCode2 = (CountryCode) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, c.f47798a, countryCode2);
                    i11 |= 1;
                } else {
                    if (iDecodeElementIndex != 1) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
                    i11 |= 2;
                }
            }
            i5 = i11;
            countryCode = countryCode2;
            strDecodeStringElement = strDecodeStringElement2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new Country(i5, countryCode, strDecodeStringElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        Country value = (Country) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, c.f47798a, value.f42572a);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 1, value.f42573b);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
