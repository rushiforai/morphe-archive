package ns;

import androidx.recyclerview.widget.u1;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import kotlin.Pair;
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
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class a implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final a f78531a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        a aVar = new a();
        f78531a = aVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.link.serialization.PopupPayload", aVar, 19);
        pluginGeneratedSerialDescriptor.addElement("publishableKey", false);
        pluginGeneratedSerialDescriptor.addElement("stripeAccount", false);
        pluginGeneratedSerialDescriptor.addElement("merchantInfo", false);
        pluginGeneratedSerialDescriptor.addElement("customerInfo", false);
        pluginGeneratedSerialDescriptor.addElement("paymentInfo", false);
        pluginGeneratedSerialDescriptor.addElement("appId", false);
        pluginGeneratedSerialDescriptor.addElement("locale", false);
        pluginGeneratedSerialDescriptor.addElement("paymentUserAgent", false);
        pluginGeneratedSerialDescriptor.addElement("paymentObject", false);
        pluginGeneratedSerialDescriptor.addElement("intentMode", false);
        pluginGeneratedSerialDescriptor.addElement("setupFutureUsage", false);
        pluginGeneratedSerialDescriptor.addElement("cardBrandChoice", false);
        pluginGeneratedSerialDescriptor.addElement("flags", false);
        pluginGeneratedSerialDescriptor.addElement("linkFundingSources", false);
        pluginGeneratedSerialDescriptor.addElement("clientAttributionMetadata", false);
        pluginGeneratedSerialDescriptor.addElement("path", true);
        pluginGeneratedSerialDescriptor.addElement("integrationType", true);
        pluginGeneratedSerialDescriptor.addElement("loggerMetadata", true);
        pluginGeneratedSerialDescriptor.addElement("experiments", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = p.f78549t;
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        return new KSerializer[]{stringSerializer, BuiltinSerializersKt.getNullable(stringSerializer), j.f78543a, f.f78536a, BuiltinSerializersKt.getNullable(m.f78546a), stringSerializer, stringSerializer, stringSerializer, stringSerializer, stringSerializer, BooleanSerializer.INSTANCE, BuiltinSerializersKt.getNullable(b.f78532a), kSerializerArr[12], kSerializerArr[13], kSerializerArr[14], stringSerializer, stringSerializer, kSerializerArr[17], kSerializerArr[18]};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        l lVar;
        String str;
        int i5;
        Map map;
        Map map2;
        List list;
        Map map3;
        o oVar;
        String str2;
        Map map4;
        d dVar;
        h hVar;
        String str3;
        String str4;
        String str5;
        String str6;
        String str7;
        String str8;
        String str9;
        boolean z11;
        int i11;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = p.f78549t;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            String strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
            String str10 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, StringSerializer.INSTANCE, null);
            l lVar2 = (l) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, j.f78543a, null);
            h hVar2 = (h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, f.f78536a, null);
            o oVar2 = (o) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, m.f78546a, null);
            String strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 5);
            String strDecodeStringElement3 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 6);
            String strDecodeStringElement4 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 7);
            String strDecodeStringElement5 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 8);
            String strDecodeStringElement6 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 9);
            boolean zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 10);
            d dVar2 = (d) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 11, b.f78532a, null);
            Map map5 = (Map) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 12, kSerializerArr[12], null);
            List list2 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 13, kSerializerArr[13], null);
            Map map6 = (Map) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 14, kSerializerArr[14], null);
            String strDecodeStringElement7 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 15);
            String strDecodeStringElement8 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 16);
            map2 = map6;
            map4 = (Map) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 17, kSerializerArr[17], null);
            map = (Map) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 18, kSerializerArr[18], null);
            i5 = 524287;
            str9 = strDecodeStringElement8;
            z11 = zDecodeBooleanElement;
            str7 = strDecodeStringElement6;
            str5 = strDecodeStringElement4;
            str4 = strDecodeStringElement3;
            str3 = strDecodeStringElement2;
            hVar = hVar2;
            str6 = strDecodeStringElement5;
            oVar = oVar2;
            str8 = strDecodeStringElement7;
            lVar = lVar2;
            str2 = strDecodeStringElement;
            str = str10;
            list = list2;
            map3 = map5;
            dVar = dVar2;
        } else {
            int i12 = 18;
            String strDecodeStringElement9 = null;
            boolean z12 = true;
            int i13 = 0;
            boolean zDecodeBooleanElement2 = false;
            l lVar3 = null;
            String str11 = null;
            Map map7 = null;
            Map map8 = null;
            List list3 = null;
            Map map9 = null;
            o oVar3 = null;
            Map map10 = null;
            d dVar3 = null;
            h hVar3 = null;
            String strDecodeStringElement10 = null;
            String strDecodeStringElement11 = null;
            String strDecodeStringElement12 = null;
            String strDecodeStringElement13 = null;
            String strDecodeStringElement14 = null;
            String strDecodeStringElement15 = null;
            String strDecodeStringElement16 = null;
            while (z12) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z12 = false;
                        i12 = 18;
                    case 0:
                        strDecodeStringElement9 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
                        i13 |= 1;
                        i12 = 18;
                    case 1:
                        str11 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, StringSerializer.INSTANCE, str11);
                        i13 |= 2;
                        i12 = 18;
                    case 2:
                        lVar3 = (l) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, j.f78543a, lVar3);
                        i13 |= 4;
                        i12 = 18;
                    case 3:
                        hVar3 = (h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, f.f78536a, hVar3);
                        i13 |= 8;
                        i12 = 18;
                    case 4:
                        oVar3 = (o) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, m.f78546a, oVar3);
                        i13 |= 16;
                        i12 = 18;
                    case 5:
                        strDecodeStringElement10 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 5);
                        i13 |= 32;
                        i12 = 18;
                    case 6:
                        strDecodeStringElement11 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 6);
                        i13 |= 64;
                        i12 = 18;
                    case 7:
                        strDecodeStringElement12 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 7);
                        i13 |= 128;
                        i12 = 18;
                    case 8:
                        strDecodeStringElement13 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 8);
                        i13 |= 256;
                        i12 = 18;
                    case 9:
                        strDecodeStringElement14 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 9);
                        i13 |= EventBridgeChannel.QUEUE_CAPACITY;
                        i12 = 18;
                    case 10:
                        zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 10);
                        i13 |= 1024;
                        i12 = 18;
                    case 11:
                        dVar3 = (d) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 11, b.f78532a, dVar3);
                        i13 |= 2048;
                        i12 = 18;
                    case 12:
                        map9 = (Map) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 12, kSerializerArr[12], map9);
                        i13 |= u1.FLAG_APPEARED_IN_PRE_LAYOUT;
                        i12 = 18;
                    case 13:
                        list3 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 13, kSerializerArr[13], list3);
                        i13 |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
                        i12 = 18;
                    case 14:
                        map8 = (Map) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 14, kSerializerArr[14], map8);
                        i13 |= ReaderJsonLexerKt.BATCH_SIZE;
                        i12 = 18;
                    case 15:
                        strDecodeStringElement15 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 15);
                        i11 = SQLiteDatabase.OPEN_NOMUTEX;
                        i13 |= i11;
                        i12 = 18;
                    case 16:
                        strDecodeStringElement16 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 16);
                        i11 = SQLiteDatabase.OPEN_FULLMUTEX;
                        i13 |= i11;
                        i12 = 18;
                    case 17:
                        map10 = (Map) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 17, kSerializerArr[17], map10);
                        i13 |= SQLiteDatabase.OPEN_SHAREDCACHE;
                        i12 = 18;
                    case 18:
                        map7 = (Map) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, i12, kSerializerArr[i12], map7);
                        i13 |= SQLiteDatabase.OPEN_PRIVATECACHE;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            lVar = lVar3;
            str = str11;
            i5 = i13;
            map = map7;
            map2 = map8;
            list = list3;
            map3 = map9;
            oVar = oVar3;
            str2 = strDecodeStringElement9;
            map4 = map10;
            dVar = dVar3;
            hVar = hVar3;
            str3 = strDecodeStringElement10;
            str4 = strDecodeStringElement11;
            str5 = strDecodeStringElement12;
            str6 = strDecodeStringElement13;
            str7 = strDecodeStringElement14;
            str8 = strDecodeStringElement15;
            str9 = strDecodeStringElement16;
            z11 = zDecodeBooleanElement2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new p(i5, str2, str, lVar, hVar, oVar, str3, str4, str5, str6, str7, z11, dVar, map3, list, map2, str8, str9, map4, map);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x00df  */
    @Override // kotlinx.serialization.SerializationStrategy
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void serialize(Encoder encoder, Object obj) {
        p value = (p) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = p.f78549t;
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 0, value.f78551a);
        compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 1, StringSerializer.INSTANCE, value.f78552b);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, j.f78543a, value.f78553c);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 3, f.f78536a, value.f78554d);
        compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 4, m.f78546a, value.f78555e);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 5, value.f78556f);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 6, value.f78557g);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 7, value.f78558h);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 8, value.f78559i);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 9, value.f78560j);
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 10, value.f78561k);
        compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 11, b.f78532a, value.f78562l);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 12, kSerializerArr[12], value.f78563m);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 13, kSerializerArr[13], value.n);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 14, kSerializerArr[14], value.o);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 15) || !Intrinsics.b(value.f78564p, "mobile_pay")) {
            compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 15, value.f78564p);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 16) || !Intrinsics.b(value.f78565q, "mobile")) {
            compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 16, value.f78565q);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 17)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 17, kSerializerArr[17], value.f78566r);
        } else {
            Map map = value.f78566r;
            UUID uuid = fr.c.f55586g;
            if (!Intrinsics.b(map, b70.k.e0(new Pair("mobile_session_id", fr.c.f55586g.toString())))) {
            }
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 18) || !Intrinsics.b(value.f78567s, b70.h.f17594a)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 18, kSerializerArr[18], value.f78567s);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
