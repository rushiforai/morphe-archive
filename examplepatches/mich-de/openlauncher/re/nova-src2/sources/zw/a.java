package zw;

import androidx.recyclerview.widget.u1;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.Locale;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
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
    public static final a f98771a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        a aVar = new a();
        f98771a = aVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.hcaptcha.config.HCaptchaConfig", aVar, 18);
        pluginGeneratedSerialDescriptor.addElement("siteKey", false);
        pluginGeneratedSerialDescriptor.addElement("sentry", true);
        pluginGeneratedSerialDescriptor.addElement("loading", true);
        pluginGeneratedSerialDescriptor.addElement("hideDialog", true);
        pluginGeneratedSerialDescriptor.addElement("rqdata", true);
        pluginGeneratedSerialDescriptor.addElement("jsSrc", true);
        pluginGeneratedSerialDescriptor.addElement("endpoint", true);
        pluginGeneratedSerialDescriptor.addElement("reportapi", true);
        pluginGeneratedSerialDescriptor.addElement("assethost", true);
        pluginGeneratedSerialDescriptor.addElement("imghost", true);
        pluginGeneratedSerialDescriptor.addElement("locale", true);
        pluginGeneratedSerialDescriptor.addElement("size", true);
        pluginGeneratedSerialDescriptor.addElement("orientation", true);
        pluginGeneratedSerialDescriptor.addElement("theme", true);
        pluginGeneratedSerialDescriptor.addElement("host", true);
        pluginGeneratedSerialDescriptor.addElement("customTheme", true);
        pluginGeneratedSerialDescriptor.addElement("tokenExpiration", true);
        pluginGeneratedSerialDescriptor.addElement("disableHardwareAcceleration", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = c.f98772t;
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        KSerializer nullable = BuiltinSerializersKt.getNullable(stringSerializer);
        KSerializer nullable2 = BuiltinSerializersKt.getNullable(stringSerializer);
        KSerializer nullable3 = BuiltinSerializersKt.getNullable(stringSerializer);
        KSerializer nullable4 = BuiltinSerializersKt.getNullable(stringSerializer);
        KSerializer nullable5 = BuiltinSerializersKt.getNullable(stringSerializer);
        KSerializer kSerializer = kSerializerArr[11];
        KSerializer kSerializer2 = kSerializerArr[12];
        KSerializer kSerializer3 = kSerializerArr[13];
        KSerializer nullable6 = BuiltinSerializersKt.getNullable(stringSerializer);
        KSerializer nullable7 = BuiltinSerializersKt.getNullable(stringSerializer);
        BooleanSerializer booleanSerializer = BooleanSerializer.INSTANCE;
        return new KSerializer[]{stringSerializer, booleanSerializer, booleanSerializer, booleanSerializer, nullable, stringSerializer, nullable2, nullable3, nullable4, nullable5, stringSerializer, kSerializer, kSerializer2, kSerializer3, nullable6, nullable7, ax.a.f15732a, booleanSerializer};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        String strDecodeStringElement;
        int i5;
        String str;
        String str2;
        Duration duration;
        String str3;
        j jVar;
        f fVar;
        h hVar;
        String str4;
        String str5;
        String str6;
        String str7;
        String str8;
        String str9;
        boolean zDecodeBooleanElement;
        boolean z11;
        boolean z12;
        boolean z13;
        int i11;
        boolean z14;
        boolean z15;
        boolean z16;
        int i12;
        int i13;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = c.f98772t;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            String strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
            boolean zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 1);
            boolean zDecodeBooleanElement3 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 2);
            boolean zDecodeBooleanElement4 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 3);
            StringSerializer stringSerializer = StringSerializer.INSTANCE;
            String str10 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, stringSerializer, null);
            String strDecodeStringElement3 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 5);
            String str11 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 6, stringSerializer, null);
            String str12 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 7, stringSerializer, null);
            String str13 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 8, stringSerializer, null);
            String str14 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 9, stringSerializer, null);
            String strDecodeStringElement4 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 10);
            strDecodeStringElement = strDecodeStringElement2;
            h hVar2 = (h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 11, kSerializerArr[11], null);
            f fVar2 = (f) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 12, kSerializerArr[12], null);
            j jVar2 = (j) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 13, kSerializerArr[13], null);
            String str15 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 14, stringSerializer, null);
            String str16 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 15, stringSerializer, null);
            duration = (Duration) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 16, ax.a.f15732a, null);
            str6 = str15;
            z12 = zDecodeBooleanElement3;
            z13 = zDecodeBooleanElement2;
            zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 17);
            str9 = strDecodeStringElement4;
            str7 = str14;
            str = str12;
            str5 = str11;
            str8 = strDecodeStringElement3;
            z11 = zDecodeBooleanElement4;
            i5 = 262143;
            str4 = str13;
            str2 = str10;
            str3 = str16;
            jVar = jVar2;
            fVar = fVar2;
            hVar = hVar2;
        } else {
            boolean zDecodeBooleanElement5 = false;
            boolean zDecodeBooleanElement6 = false;
            boolean zDecodeBooleanElement7 = false;
            int i14 = 0;
            String str17 = null;
            Duration duration2 = null;
            String str18 = null;
            j jVar3 = null;
            f fVar3 = null;
            h hVar3 = null;
            String str19 = null;
            String str20 = null;
            String str21 = null;
            strDecodeStringElement = null;
            String strDecodeStringElement5 = null;
            String strDecodeStringElement6 = null;
            boolean z17 = true;
            boolean zDecodeBooleanElement8 = false;
            String str22 = null;
            String str23 = null;
            while (z17) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        i11 = i14;
                        z14 = zDecodeBooleanElement5;
                        z17 = false;
                        zDecodeBooleanElement5 = z14;
                        i14 = i11;
                    case 0:
                        z15 = zDecodeBooleanElement8;
                        int i15 = i14;
                        z16 = zDecodeBooleanElement5;
                        strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
                        i11 = i15 | 1;
                        zDecodeBooleanElement5 = z16;
                        zDecodeBooleanElement8 = z15;
                        i14 = i11;
                    case 1:
                        int i16 = i14;
                        z14 = zDecodeBooleanElement5;
                        i11 = i16 | 2;
                        zDecodeBooleanElement8 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 1);
                        zDecodeBooleanElement5 = z14;
                        i14 = i11;
                    case 2:
                        i14 |= 4;
                        zDecodeBooleanElement5 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 2);
                        zDecodeBooleanElement8 = zDecodeBooleanElement8;
                    case 3:
                        z15 = zDecodeBooleanElement8;
                        int i17 = i14;
                        z16 = zDecodeBooleanElement5;
                        zDecodeBooleanElement7 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 3);
                        i11 = i17 | 8;
                        zDecodeBooleanElement5 = z16;
                        zDecodeBooleanElement8 = z15;
                        i14 = i11;
                    case 4:
                        z15 = zDecodeBooleanElement8;
                        int i18 = i14;
                        z16 = zDecodeBooleanElement5;
                        str22 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, StringSerializer.INSTANCE, str22);
                        i11 = i18 | 16;
                        zDecodeBooleanElement5 = z16;
                        zDecodeBooleanElement8 = z15;
                        i14 = i11;
                    case 5:
                        z15 = zDecodeBooleanElement8;
                        int i19 = i14;
                        z16 = zDecodeBooleanElement5;
                        strDecodeStringElement5 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 5);
                        i11 = i19 | 32;
                        zDecodeBooleanElement5 = z16;
                        zDecodeBooleanElement8 = z15;
                        i14 = i11;
                    case 6:
                        z15 = zDecodeBooleanElement8;
                        int i21 = i14;
                        z16 = zDecodeBooleanElement5;
                        str23 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 6, StringSerializer.INSTANCE, str23);
                        i11 = i21 | 64;
                        zDecodeBooleanElement5 = z16;
                        zDecodeBooleanElement8 = z15;
                        i14 = i11;
                    case 7:
                        z15 = zDecodeBooleanElement8;
                        int i22 = i14;
                        z16 = zDecodeBooleanElement5;
                        str17 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 7, StringSerializer.INSTANCE, str17);
                        i11 = i22 | 128;
                        zDecodeBooleanElement5 = z16;
                        zDecodeBooleanElement8 = z15;
                        i14 = i11;
                    case 8:
                        z15 = zDecodeBooleanElement8;
                        int i23 = i14;
                        z16 = zDecodeBooleanElement5;
                        str19 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 8, StringSerializer.INSTANCE, str19);
                        i11 = i23 | 256;
                        zDecodeBooleanElement5 = z16;
                        zDecodeBooleanElement8 = z15;
                        i14 = i11;
                    case 9:
                        z15 = zDecodeBooleanElement8;
                        int i24 = i14;
                        z16 = zDecodeBooleanElement5;
                        str21 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 9, StringSerializer.INSTANCE, str21);
                        i11 = i24 | EventBridgeChannel.QUEUE_CAPACITY;
                        zDecodeBooleanElement5 = z16;
                        zDecodeBooleanElement8 = z15;
                        i14 = i11;
                    case 10:
                        z15 = zDecodeBooleanElement8;
                        int i25 = i14;
                        z16 = zDecodeBooleanElement5;
                        strDecodeStringElement6 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 10);
                        i11 = i25 | 1024;
                        zDecodeBooleanElement5 = z16;
                        zDecodeBooleanElement8 = z15;
                        i14 = i11;
                    case 11:
                        z15 = zDecodeBooleanElement8;
                        int i26 = i14;
                        z16 = zDecodeBooleanElement5;
                        hVar3 = (h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 11, kSerializerArr[11], hVar3);
                        i11 = i26 | 2048;
                        zDecodeBooleanElement5 = z16;
                        zDecodeBooleanElement8 = z15;
                        i14 = i11;
                    case 12:
                        z15 = zDecodeBooleanElement8;
                        int i27 = i14;
                        z16 = zDecodeBooleanElement5;
                        fVar3 = (f) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 12, kSerializerArr[12], fVar3);
                        i11 = i27 | u1.FLAG_APPEARED_IN_PRE_LAYOUT;
                        zDecodeBooleanElement5 = z16;
                        zDecodeBooleanElement8 = z15;
                        i14 = i11;
                    case 13:
                        z15 = zDecodeBooleanElement8;
                        int i28 = i14;
                        z16 = zDecodeBooleanElement5;
                        jVar3 = (j) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 13, kSerializerArr[13], jVar3);
                        i11 = i28 | UserMetadata.MAX_INTERNAL_KEY_SIZE;
                        zDecodeBooleanElement5 = z16;
                        zDecodeBooleanElement8 = z15;
                        i14 = i11;
                    case 14:
                        z15 = zDecodeBooleanElement8;
                        int i29 = i14;
                        z16 = zDecodeBooleanElement5;
                        str20 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 14, StringSerializer.INSTANCE, str20);
                        i11 = i29 | ReaderJsonLexerKt.BATCH_SIZE;
                        zDecodeBooleanElement5 = z16;
                        zDecodeBooleanElement8 = z15;
                        i14 = i11;
                    case 15:
                        z15 = zDecodeBooleanElement8;
                        i12 = i14;
                        z16 = zDecodeBooleanElement5;
                        str18 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 15, StringSerializer.INSTANCE, str18);
                        i13 = SQLiteDatabase.OPEN_NOMUTEX;
                        i11 = i12 | i13;
                        zDecodeBooleanElement5 = z16;
                        zDecodeBooleanElement8 = z15;
                        i14 = i11;
                    case 16:
                        i12 = i14;
                        z16 = zDecodeBooleanElement5;
                        z15 = zDecodeBooleanElement8;
                        duration2 = (Duration) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 16, ax.a.f15732a, duration2);
                        i13 = SQLiteDatabase.OPEN_FULLMUTEX;
                        i11 = i12 | i13;
                        zDecodeBooleanElement5 = z16;
                        zDecodeBooleanElement8 = z15;
                        i14 = i11;
                    case 17:
                        zDecodeBooleanElement6 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 17);
                        i14 |= SQLiteDatabase.OPEN_SHAREDCACHE;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            i5 = i14;
            str = str17;
            str2 = str22;
            duration = duration2;
            str3 = str18;
            jVar = jVar3;
            fVar = fVar3;
            hVar = hVar3;
            str4 = str19;
            str5 = str23;
            str6 = str20;
            str7 = str21;
            str8 = strDecodeStringElement5;
            str9 = strDecodeStringElement6;
            zDecodeBooleanElement = zDecodeBooleanElement6;
            z11 = zDecodeBooleanElement7;
            z12 = zDecodeBooleanElement5;
            z13 = zDecodeBooleanElement8;
        }
        String str24 = strDecodeStringElement;
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new c(i5, str24, z13, z12, z11, str2, str8, str5, str, str4, str7, str9, hVar, fVar, jVar, str6, str3, duration, zDecodeBooleanElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    /* JADX WARN: Removed duplicated region for block: B:76:0x0138  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x014a  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0159  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x015c  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0180  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x0183  */
    @Override // kotlinx.serialization.SerializationStrategy
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void serialize(Encoder encoder, Object obj) {
        j jVar;
        long j11;
        boolean z11;
        c value = (c) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        boolean z12 = value.f98789s;
        long j12 = value.f98788r;
        String str = value.f98786p;
        String str2 = value.o;
        j jVar2 = value.n;
        f fVar = value.f98785m;
        h hVar = value.f98784l;
        String str3 = value.f98783k;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = c.f98772t;
        String str4 = value.f98773a;
        String str5 = value.f98782j;
        String str6 = value.f98781i;
        String str7 = value.f98780h;
        String str8 = value.f98779g;
        String str9 = value.f98778f;
        String str10 = value.f98777e;
        boolean z13 = value.f98776d;
        boolean z14 = value.f98775c;
        boolean z15 = value.f98774b;
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 0, str4);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 1) || !z15) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 1, z15);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 2) || !z14) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 2, z14);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 3) || z13) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 3, z13);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 4) || str10 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 4, StringSerializer.INSTANCE, str10);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 5) || !Intrinsics.b(str9, "https://js.hcaptcha.com/1/api.js")) {
            compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 5, str9);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 6) || str8 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 6, StringSerializer.INSTANCE, str8);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 7) || str7 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 7, StringSerializer.INSTANCE, str7);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 8) || str6 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 8, StringSerializer.INSTANCE, str6);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 9) || str5 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 9, StringSerializer.INSTANCE, str5);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 10) || !Intrinsics.b(str3, Locale.getDefault().getLanguage())) {
            compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 10, str3);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 11) || hVar != h.f98795b) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 11, kSerializerArr[11], hVar);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 12) || fVar != f.f98792b) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 12, kSerializerArr[12], fVar);
        }
        if (!compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 13)) {
            jVar = jVar2;
            if (jVar != j.f98798b) {
            }
            if (!compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 14) || str2 != null) {
                compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 14, StringSerializer.INSTANCE, str2);
            }
            if (!compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 15) || str != null) {
                compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 15, StringSerializer.INSTANCE, str);
            }
            if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 16)) {
                Duration.Companion companion = Duration.f72038b;
                j11 = j12;
                if (!Duration.d(j11, DurationKt.g(120, DurationUnit.f72046e))) {
                }
                if (!compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 17)) {
                    z11 = z12;
                    if (!z11) {
                    }
                    compositeEncoderBeginStructure.endStructure(serialDescriptor);
                }
                z11 = z12;
                compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 17, z11);
                compositeEncoderBeginStructure.endStructure(serialDescriptor);
            }
            j11 = j12;
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 16, ax.a.f15732a, new Duration(j11));
            if (!compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 17)) {
            }
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 17, z11);
            compositeEncoderBeginStructure.endStructure(serialDescriptor);
        }
        jVar = jVar2;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 13, kSerializerArr[13], jVar);
        if (!compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 14)) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 14, StringSerializer.INSTANCE, str2);
        }
        if (!compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 15)) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 15, StringSerializer.INSTANCE, str);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 16)) {
        }
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 16, ax.a.f15732a, new Duration(j11));
        if (!compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 17)) {
        }
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 17, z11);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
