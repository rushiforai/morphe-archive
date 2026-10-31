package fr;

import com.amplitude.eventbridge.EventBridgeChannel;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.Map;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntRange;
import kotlin.text.Charsets;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.DoubleSerializer;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import kotlinx.serialization.json.JsonElement;
import kotlinx.serialization.json.JsonElementSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class d implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final d f55597a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        d dVar = new d();
        f55597a = dVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.core.networking.AnalyticsRequestV2", dVar, 11);
        pluginGeneratedSerialDescriptor.addElement("eventName", false);
        pluginGeneratedSerialDescriptor.addElement("clientId", false);
        pluginGeneratedSerialDescriptor.addElement("origin", false);
        pluginGeneratedSerialDescriptor.addElement("created", false);
        pluginGeneratedSerialDescriptor.addElement("params", false);
        pluginGeneratedSerialDescriptor.addElement("postParameters", true);
        pluginGeneratedSerialDescriptor.addElement("headers", true);
        pluginGeneratedSerialDescriptor.addElement("method", true);
        pluginGeneratedSerialDescriptor.addElement("mimeType", true);
        pluginGeneratedSerialDescriptor.addElement("retryResponseCodes", true);
        pluginGeneratedSerialDescriptor.addElement(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = g.f55611l;
        KSerializer kSerializer = kSerializerArr[6];
        KSerializer kSerializer2 = kSerializerArr[7];
        KSerializer kSerializer3 = kSerializerArr[8];
        KSerializer kSerializer4 = kSerializerArr[9];
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        return new KSerializer[]{stringSerializer, stringSerializer, stringSerializer, DoubleSerializer.INSTANCE, JsonElementSerializer.INSTANCE, stringSerializer, kSerializer, kSerializer2, kSerializer3, kSerializer4, stringSerializer};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        s0 s0Var;
        Iterable iterable;
        r0 r0Var;
        Map map;
        JsonElement jsonElement;
        String str;
        String str2;
        String str3;
        String str4;
        String strDecodeStringElement;
        double d5;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = g.f55611l;
        int i11 = 10;
        String strDecodeStringElement2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            String strDecodeStringElement3 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
            String strDecodeStringElement4 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
            String strDecodeStringElement5 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 2);
            double dDecodeDoubleElement = compositeDecoderBeginStructure.decodeDoubleElement(serialDescriptor, 3);
            JsonElement jsonElement2 = (JsonElement) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 4, JsonElementSerializer.INSTANCE, null);
            String strDecodeStringElement6 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 5);
            Map map2 = (Map) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 6, kSerializerArr[6], null);
            r0 r0Var2 = (r0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 7, kSerializerArr[7], null);
            s0 s0Var2 = (s0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 8, kSerializerArr[8], null);
            iterable = (Iterable) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 9, kSerializerArr[9], null);
            str = strDecodeStringElement3;
            strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 10);
            str4 = strDecodeStringElement6;
            jsonElement = jsonElement2;
            map = map2;
            str3 = strDecodeStringElement5;
            i5 = 2047;
            r0Var = r0Var2;
            s0Var = s0Var2;
            str2 = strDecodeStringElement4;
            d5 = dDecodeDoubleElement;
        } else {
            boolean z11 = true;
            int i12 = 0;
            s0 s0Var3 = null;
            Iterable iterable2 = null;
            r0 r0Var3 = null;
            Map map3 = null;
            JsonElement jsonElement3 = null;
            String strDecodeStringElement7 = null;
            String strDecodeStringElement8 = null;
            double dDecodeDoubleElement2 = 0.0d;
            String strDecodeStringElement9 = null;
            String strDecodeStringElement10 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z11 = false;
                        i11 = 10;
                    case 0:
                        i12 |= 1;
                        strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
                        i11 = 10;
                    case 1:
                        strDecodeStringElement9 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
                        i12 |= 2;
                        i11 = 10;
                    case 2:
                        strDecodeStringElement10 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 2);
                        i12 |= 4;
                        i11 = 10;
                    case 3:
                        dDecodeDoubleElement2 = compositeDecoderBeginStructure.decodeDoubleElement(serialDescriptor, 3);
                        i12 |= 8;
                        i11 = 10;
                    case 4:
                        jsonElement3 = (JsonElement) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 4, JsonElementSerializer.INSTANCE, jsonElement3);
                        i12 |= 16;
                        i11 = 10;
                    case 5:
                        strDecodeStringElement7 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 5);
                        i12 |= 32;
                    case 6:
                        map3 = (Map) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 6, kSerializerArr[6], map3);
                        i12 |= 64;
                    case 7:
                        r0Var3 = (r0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 7, kSerializerArr[7], r0Var3);
                        i12 |= 128;
                    case 8:
                        s0Var3 = (s0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 8, kSerializerArr[8], s0Var3);
                        i12 |= 256;
                    case 9:
                        iterable2 = (Iterable) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 9, kSerializerArr[9], iterable2);
                        i12 |= EventBridgeChannel.QUEUE_CAPACITY;
                    case 10:
                        strDecodeStringElement8 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, i11);
                        i12 |= 1024;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            i5 = i12;
            s0Var = s0Var3;
            iterable = iterable2;
            r0Var = r0Var3;
            map = map3;
            jsonElement = jsonElement3;
            str = strDecodeStringElement2;
            str2 = strDecodeStringElement9;
            str3 = strDecodeStringElement10;
            str4 = strDecodeStringElement7;
            strDecodeStringElement = strDecodeStringElement8;
            d5 = dDecodeDoubleElement2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new g(i5, str, str2, str3, d5, jsonElement, str4, map, r0Var, s0Var, iterable, strDecodeStringElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0090  */
    @Override // kotlinx.serialization.SerializationStrategy
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void serialize(Encoder encoder, Object obj) {
        g value = (g) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = g.f55611l;
        String str = value.f55612a;
        String str2 = value.f55622k;
        Iterable iterable = value.f55621j;
        s0 s0Var = value.f55620i;
        r0 r0Var = value.f55619h;
        Map map = value.f55618g;
        String str3 = value.f55617f;
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 0, str);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 1, value.f55613b);
        String str4 = value.f55614c;
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 2, str4);
        compositeEncoderBeginStructure.encodeDoubleElement(serialDescriptor, 3, value.f55615d);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 4, JsonElementSerializer.INSTANCE, value.f55616e);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 5) || !Intrinsics.b(str3, value.h())) {
            compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 5, str3);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 6)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 6, kSerializerArr[6], map);
        } else {
            s0 s0Var2 = s0.f55700b;
            if (!Intrinsics.b(map, MapsKt.j0(new Pair("Content-Type", b.c0.k("application/x-www-form-urlencoded; charset=", Charsets.f72000b.name())), new Pair("origin", str4), new Pair("User-Agent", "Stripe/v1 android/22.7.0")))) {
            }
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 7) || r0Var != r0.f55695c) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 7, kSerializerArr[7], r0Var);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 8) || s0Var != s0.f55700b) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 8, kSerializerArr[8], s0Var);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 9) || !Intrinsics.b(iterable, new IntRange(429, 429, 1))) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 9, kSerializerArr[9], iterable);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 10) || !Intrinsics.b(str2, "https://r.stripe.com/0")) {
            compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 10, str2);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
