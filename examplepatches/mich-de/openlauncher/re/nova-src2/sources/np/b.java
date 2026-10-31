package np;

import androidx.recyclerview.widget.u1;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.time.LocalDate;
import java.util.EnumMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.collections.EmptyList;
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
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import pp.b0;
import pp.f0;
import pp.l;

/* loaded from: classes4.dex */
public final /* synthetic */ class b implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final b f78485a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        b bVar = new b();
        f78485a = bVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.novalauncher.novalytics.DailyStats", bVar, 29);
        pluginGeneratedSerialDescriptor.addElement("date", false);
        pluginGeneratedSerialDescriptor.addElement("applicationId", true);
        pluginGeneratedSerialDescriptor.addElement("applicationVersion", false);
        pluginGeneratedSerialDescriptor.addElement("installationId", true);
        pluginGeneratedSerialDescriptor.addElement("androidSdkInt", false);
        pluginGeneratedSerialDescriptor.addElement("deviceBrand", false);
        pluginGeneratedSerialDescriptor.addElement("deviceModel", false);
        pluginGeneratedSerialDescriptor.addElement("submitted", true);
        pluginGeneratedSerialDescriptor.addElement("lastEventTimeMillis", true);
        pluginGeneratedSerialDescriptor.addElement("sessionHadSearch", true);
        pluginGeneratedSerialDescriptor.addElement("windowHadSearch", true);
        pluginGeneratedSerialDescriptor.addElement("search_sessions", true);
        pluginGeneratedSerialDescriptor.addElement("search_windows", true);
        pluginGeneratedSerialDescriptor.addElement("search_windows_with_click", true);
        pluginGeneratedSerialDescriptor.addElement("search_no_clicks_when_micro_shown", true);
        pluginGeneratedSerialDescriptor.addElement("search_clicks", true);
        pluginGeneratedSerialDescriptor.addElement("search_opens", true);
        pluginGeneratedSerialDescriptor.addElement("card_update_events", true);
        pluginGeneratedSerialDescriptor.addElement("micro_results_enabled", true);
        pluginGeneratedSerialDescriptor.addElement("shortcut_search_enabled", true);
        pluginGeneratedSerialDescriptor.addElement("card_view_enabled", true);
        pluginGeneratedSerialDescriptor.addElement("contacts_enabled", true);
        pluginGeneratedSerialDescriptor.addElement("web_suggestions", true);
        pluginGeneratedSerialDescriptor.addElement("search_more_providers", true);
        pluginGeneratedSerialDescriptor.addElement("click_records", true);
        pluginGeneratedSerialDescriptor.addElement("impression_records", true);
        pluginGeneratedSerialDescriptor.addElement("smart_folders_enabled", true);
        pluginGeneratedSerialDescriptor.addElement("smart_folder_types", true);
        pluginGeneratedSerialDescriptor.addElement("smart_folders_edits", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = d.D;
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        KSerializer kSerializer = kSerializerArr[7];
        KSerializer kSerializer2 = kSerializerArr[9];
        KSerializer kSerializer3 = kSerializerArr[10];
        KSerializer kSerializer4 = kSerializerArr[15];
        KSerializer kSerializer5 = kSerializerArr[16];
        KSerializer nullable = BuiltinSerializersKt.getNullable(stringSerializer);
        KSerializer kSerializer6 = kSerializerArr[23];
        KSerializer kSerializer7 = kSerializerArr[27];
        KSerializer kSerializer8 = kSerializerArr[28];
        IntSerializer intSerializer = IntSerializer.INSTANCE;
        BooleanSerializer booleanSerializer = BooleanSerializer.INSTANCE;
        return new KSerializer[]{e.f78510a, stringSerializer, intSerializer, stringSerializer, intSerializer, stringSerializer, stringSerializer, kSerializer, LongSerializer.INSTANCE, kSerializer2, kSerializer3, intSerializer, intSerializer, intSerializer, intSerializer, kSerializer4, kSerializer5, a.f78483a, booleanSerializer, booleanSerializer, booleanSerializer, booleanSerializer, nullable, kSerializer6, op.d.f80551a, op.i.f80558a, booleanSerializer, kSerializer7, kSerializer8};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        LocalDate localDate;
        List list;
        Map map;
        l lVar;
        String[] strArr;
        Map map2;
        l lVar2;
        op.c cVar;
        op.l lVar3;
        String str;
        Map map3;
        k kVar;
        int i5;
        boolean z11;
        boolean z12;
        String str2;
        String str3;
        String str4;
        String str5;
        int i11;
        List list2;
        int i12;
        boolean z13;
        int i13;
        int i14;
        int i15;
        int i16;
        boolean z14;
        long j11;
        boolean z15;
        k kVar2;
        int i17;
        int i18;
        int i19;
        List list3;
        List list4;
        int i21;
        k kVar3;
        k kVar4;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = d.D;
        boolean zDecodeBooleanElement = false;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            LocalDate localDate2 = (LocalDate) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, e.f78510a, null);
            String strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
            int iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 2);
            String strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 3);
            int iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 4);
            String strDecodeStringElement3 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 5);
            String strDecodeStringElement4 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 6);
            k kVar5 = (k) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 7, kSerializerArr[7], null);
            long jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 8);
            l lVar4 = (l) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 9, kSerializerArr[9], null);
            l lVar5 = (l) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 10, kSerializerArr[10], null);
            int iDecodeIntElement3 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 11);
            int iDecodeIntElement4 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 12);
            int iDecodeIntElement5 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 13);
            int iDecodeIntElement6 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 14);
            Map map4 = (Map) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 15, kSerializerArr[15], null);
            Map map5 = (Map) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 16, kSerializerArr[16], null);
            List list5 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 17, a.f78483a, null);
            boolean zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 18);
            boolean zDecodeBooleanElement3 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 19);
            boolean zDecodeBooleanElement4 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 20);
            boolean zDecodeBooleanElement5 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 21);
            String str6 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 22, StringSerializer.INSTANCE, null);
            String[] strArr2 = (String[]) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 23, kSerializerArr[23], null);
            op.c cVar2 = (op.c) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 24, op.d.f80551a, null);
            op.l lVar6 = (op.l) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 25, op.i.f80558a, null);
            boolean zDecodeBooleanElement6 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 26);
            List list6 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 27, kSerializerArr[27], null);
            lVar3 = lVar6;
            map3 = (Map) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 28, kSerializerArr[28], null);
            i5 = 536870911;
            i11 = iDecodeIntElement5;
            str5 = strDecodeStringElement4;
            str4 = strDecodeStringElement3;
            str3 = strDecodeStringElement2;
            lVar2 = lVar4;
            i13 = iDecodeIntElement2;
            i14 = iDecodeIntElement;
            lVar = lVar5;
            i15 = iDecodeIntElement3;
            kVar = kVar5;
            z14 = zDecodeBooleanElement3;
            z12 = zDecodeBooleanElement6;
            cVar = cVar2;
            str2 = strDecodeStringElement;
            z15 = zDecodeBooleanElement5;
            z13 = zDecodeBooleanElement4;
            list = list5;
            z11 = zDecodeBooleanElement2;
            list2 = list6;
            strArr = strArr2;
            str = str6;
            i16 = iDecodeIntElement4;
            localDate = localDate2;
            i12 = iDecodeIntElement6;
            map = map5;
            map2 = map4;
            j11 = jDecodeLongElement;
        } else {
            int i22 = 0;
            Map map6 = null;
            boolean z16 = true;
            boolean zDecodeBooleanElement7 = false;
            int iDecodeIntElement7 = 0;
            int iDecodeIntElement8 = 0;
            boolean zDecodeBooleanElement8 = false;
            int iDecodeIntElement9 = 0;
            int iDecodeIntElement10 = 0;
            int iDecodeIntElement11 = 0;
            int iDecodeIntElement12 = 0;
            boolean zDecodeBooleanElement9 = false;
            int i23 = 9;
            int i24 = 10;
            int i25 = 7;
            k kVar6 = null;
            List list7 = null;
            List list8 = null;
            Map map7 = null;
            l lVar7 = null;
            String[] strArr3 = null;
            Map map8 = null;
            l lVar8 = null;
            op.c cVar3 = null;
            op.l lVar9 = null;
            String str7 = null;
            LocalDate localDate3 = null;
            String strDecodeStringElement5 = null;
            String strDecodeStringElement6 = null;
            String strDecodeStringElement7 = null;
            String strDecodeStringElement8 = null;
            long jDecodeLongElement2 = 0;
            boolean zDecodeBooleanElement10 = false;
            while (z16) {
                boolean z17 = zDecodeBooleanElement;
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        list3 = list7;
                        z16 = false;
                        i22 = i22;
                        list7 = list3;
                        zDecodeBooleanElement = z17;
                        i25 = 7;
                        i23 = 9;
                        i24 = 10;
                    case 0:
                        list3 = list7;
                        localDate3 = (LocalDate) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, e.f78510a, localDate3);
                        i22 |= 1;
                        kVar6 = kVar6;
                        list7 = list3;
                        zDecodeBooleanElement = z17;
                        i25 = 7;
                        i23 = 9;
                        i24 = 10;
                    case 1:
                        int i26 = i25;
                        list4 = list7;
                        i21 = i26;
                        kVar3 = kVar6;
                        strDecodeStringElement5 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
                        i22 |= 2;
                        List list9 = list4;
                        i25 = i21;
                        list7 = list9;
                        kVar6 = kVar3;
                        zDecodeBooleanElement = z17;
                        i23 = 9;
                        i24 = 10;
                    case 2:
                        int i27 = i25;
                        list4 = list7;
                        i21 = i27;
                        kVar3 = kVar6;
                        iDecodeIntElement10 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 2);
                        i22 |= 4;
                        List list92 = list4;
                        i25 = i21;
                        list7 = list92;
                        kVar6 = kVar3;
                        zDecodeBooleanElement = z17;
                        i23 = 9;
                        i24 = 10;
                    case 3:
                        int i28 = i25;
                        list4 = list7;
                        i21 = i28;
                        kVar3 = kVar6;
                        strDecodeStringElement6 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 3);
                        i22 |= 8;
                        List list922 = list4;
                        i25 = i21;
                        list7 = list922;
                        kVar6 = kVar3;
                        zDecodeBooleanElement = z17;
                        i23 = 9;
                        i24 = 10;
                    case 4:
                        int i29 = i25;
                        list4 = list7;
                        i21 = i29;
                        kVar3 = kVar6;
                        iDecodeIntElement9 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 4);
                        i22 |= 16;
                        List list9222 = list4;
                        i25 = i21;
                        list7 = list9222;
                        kVar6 = kVar3;
                        zDecodeBooleanElement = z17;
                        i23 = 9;
                        i24 = 10;
                    case 5:
                        int i31 = i25;
                        list4 = list7;
                        i21 = i31;
                        kVar3 = kVar6;
                        strDecodeStringElement7 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 5);
                        i22 |= 32;
                        List list92222 = list4;
                        i25 = i21;
                        list7 = list92222;
                        kVar6 = kVar3;
                        zDecodeBooleanElement = z17;
                        i23 = 9;
                        i24 = 10;
                    case 6:
                        int i32 = i25;
                        list4 = list7;
                        i21 = i32;
                        kVar3 = kVar6;
                        strDecodeStringElement8 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 6);
                        i22 |= 64;
                        List list922222 = list4;
                        i25 = i21;
                        list7 = list922222;
                        kVar6 = kVar3;
                        zDecodeBooleanElement = z17;
                        i23 = 9;
                        i24 = 10;
                    case 7:
                        int i33 = i25;
                        kVar6 = (k) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, i33, kSerializerArr[i25], kVar6);
                        i22 |= 128;
                        i25 = i33;
                        list7 = list7;
                        zDecodeBooleanElement = z17;
                        i23 = 9;
                        i24 = 10;
                    case 8:
                        kVar4 = kVar6;
                        jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 8);
                        i22 |= 256;
                        zDecodeBooleanElement = z17;
                        kVar6 = kVar4;
                        i24 = 10;
                    case 9:
                        kVar4 = kVar6;
                        lVar8 = (l) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, i23, kSerializerArr[i23], lVar8);
                        i22 |= EventBridgeChannel.QUEUE_CAPACITY;
                        zDecodeBooleanElement = z17;
                        kVar6 = kVar4;
                        i24 = 10;
                    case 10:
                        kVar2 = kVar6;
                        lVar7 = (l) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, i24, kSerializerArr[i24], lVar7);
                        i22 |= 1024;
                        zDecodeBooleanElement = z17;
                        kVar6 = kVar2;
                    case 11:
                        kVar2 = kVar6;
                        iDecodeIntElement11 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 11);
                        i22 |= 2048;
                        zDecodeBooleanElement = z17;
                        kVar6 = kVar2;
                    case 12:
                        kVar2 = kVar6;
                        iDecodeIntElement12 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 12);
                        i22 |= u1.FLAG_APPEARED_IN_PRE_LAYOUT;
                        zDecodeBooleanElement = z17;
                        kVar6 = kVar2;
                    case 13:
                        kVar2 = kVar6;
                        iDecodeIntElement7 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 13);
                        i22 |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
                        zDecodeBooleanElement = z17;
                        kVar6 = kVar2;
                    case 14:
                        kVar2 = kVar6;
                        iDecodeIntElement8 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 14);
                        i22 |= ReaderJsonLexerKt.BATCH_SIZE;
                        zDecodeBooleanElement = z17;
                        kVar6 = kVar2;
                    case 15:
                        kVar2 = kVar6;
                        map8 = (Map) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 15, kSerializerArr[15], map8);
                        i17 = SQLiteDatabase.OPEN_NOMUTEX;
                        i22 |= i17;
                        zDecodeBooleanElement = z17;
                        kVar6 = kVar2;
                    case 16:
                        kVar2 = kVar6;
                        map7 = (Map) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 16, kSerializerArr[16], map7);
                        i18 = SQLiteDatabase.OPEN_FULLMUTEX;
                        i22 |= i18;
                        zDecodeBooleanElement = z17;
                        kVar6 = kVar2;
                    case 17:
                        kVar2 = kVar6;
                        list8 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 17, a.f78483a, list8);
                        i17 = SQLiteDatabase.OPEN_SHAREDCACHE;
                        i22 |= i17;
                        zDecodeBooleanElement = z17;
                        kVar6 = kVar2;
                    case 18:
                        kVar2 = kVar6;
                        zDecodeBooleanElement10 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 18);
                        i19 = SQLiteDatabase.OPEN_PRIVATECACHE;
                        i22 |= i19;
                        zDecodeBooleanElement = z17;
                        kVar6 = kVar2;
                    case 19:
                        kVar2 = kVar6;
                        zDecodeBooleanElement9 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 19);
                        i19 = 524288;
                        i22 |= i19;
                        zDecodeBooleanElement = z17;
                        kVar6 = kVar2;
                    case 20:
                        kVar2 = kVar6;
                        zDecodeBooleanElement8 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 20);
                        i19 = 1048576;
                        i22 |= i19;
                        zDecodeBooleanElement = z17;
                        kVar6 = kVar2;
                    case 21:
                        kVar2 = kVar6;
                        i22 |= 2097152;
                        zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 21);
                        kVar6 = kVar2;
                    case 22:
                        kVar2 = kVar6;
                        str7 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 22, StringSerializer.INSTANCE, str7);
                        i18 = 4194304;
                        i22 |= i18;
                        zDecodeBooleanElement = z17;
                        kVar6 = kVar2;
                    case 23:
                        kVar2 = kVar6;
                        strArr3 = (String[]) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 23, kSerializerArr[23], strArr3);
                        i18 = 8388608;
                        i22 |= i18;
                        zDecodeBooleanElement = z17;
                        kVar6 = kVar2;
                    case 24:
                        kVar2 = kVar6;
                        cVar3 = (op.c) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 24, op.d.f80551a, cVar3);
                        i17 = 16777216;
                        i22 |= i17;
                        zDecodeBooleanElement = z17;
                        kVar6 = kVar2;
                    case 25:
                        kVar2 = kVar6;
                        lVar9 = (op.l) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 25, op.i.f80558a, lVar9);
                        i17 = 33554432;
                        i22 |= i17;
                        zDecodeBooleanElement = z17;
                        kVar6 = kVar2;
                    case 26:
                        kVar2 = kVar6;
                        zDecodeBooleanElement7 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 26);
                        i22 |= 67108864;
                        zDecodeBooleanElement = z17;
                        kVar6 = kVar2;
                    case 27:
                        kVar2 = kVar6;
                        list7 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 27, kSerializerArr[27], list7);
                        i18 = 134217728;
                        i22 |= i18;
                        zDecodeBooleanElement = z17;
                        kVar6 = kVar2;
                    case 28:
                        kVar2 = kVar6;
                        map6 = (Map) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 28, kSerializerArr[28], map6);
                        i17 = 268435456;
                        i22 |= i17;
                        zDecodeBooleanElement = z17;
                        kVar6 = kVar2;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            localDate = localDate3;
            list = list8;
            map = map7;
            lVar = lVar7;
            strArr = strArr3;
            map2 = map8;
            lVar2 = lVar8;
            cVar = cVar3;
            lVar3 = lVar9;
            str = str7;
            map3 = map6;
            kVar = kVar6;
            i5 = i22;
            z11 = zDecodeBooleanElement10;
            z12 = zDecodeBooleanElement7;
            str2 = strDecodeStringElement5;
            str3 = strDecodeStringElement6;
            str4 = strDecodeStringElement7;
            str5 = strDecodeStringElement8;
            i11 = iDecodeIntElement7;
            list2 = list7;
            i12 = iDecodeIntElement8;
            z13 = zDecodeBooleanElement8;
            i13 = iDecodeIntElement9;
            i14 = iDecodeIntElement10;
            i15 = iDecodeIntElement11;
            i16 = iDecodeIntElement12;
            z14 = zDecodeBooleanElement9;
            j11 = jDecodeLongElement2;
            z15 = zDecodeBooleanElement;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new d(i5, localDate, str2, i14, str3, i13, str4, str5, kVar, j11, lVar2, lVar, i15, i16, i11, i12, map2, map, list, z11, z14, z13, z15, str, strArr, cVar, lVar3, z12, list2, map3);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        d value = (d) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        Map map = value.C;
        op.l lVar = value.f78509z;
        op.c cVar = value.f78508y;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = d.D;
        e eVar = e.f78510a;
        LocalDate localDate = value.f78486a;
        Map map2 = value.f78500q;
        Map map3 = value.f78499p;
        String str = value.f78489d;
        String str2 = value.f78487b;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, eVar, localDate);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 1) || !Intrinsics.b(str2, "com.teslacoilsw.launcher")) {
            compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 1, str2);
        }
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 2, value.f78488c);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 3) || !Intrinsics.b(str, "no_id")) {
            compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 3, str);
        }
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 4, value.f78490e);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 5, value.f78491f);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 6, value.f78492g);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 7) || value.f78493h != k.f78519b) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 7, kSerializerArr[7], value.f78493h);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 8) || value.f78494i != 0) {
            compositeEncoderBeginStructure.encodeLongElement(serialDescriptor, 8, value.f78494i);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 9) || value.f78495j != l.f82757a) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 9, kSerializerArr[9], value.f78495j);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 10) || value.f78496k != l.f82757a) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 10, kSerializerArr[10], value.f78496k);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 11) || value.f78497l != 0) {
            compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 11, value.f78497l);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 12) || value.f78498m != 0) {
            compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 12, value.f78498m);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 13) || value.n != 0) {
            compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 13, value.n);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 14) || value.o != 0) {
            compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 14, value.o);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 15) || !Intrinsics.b(map3, new EnumMap(b0.class))) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 15, kSerializerArr[15], map3);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 16) || !Intrinsics.b(map2, new EnumMap(f0.class))) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 16, kSerializerArr[16], map2);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 17) || !Intrinsics.b(value.f78501r, EmptyList.f71733a)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 17, a.f78483a, value.f78501r);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 18) || value.f78502s) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 18, value.f78502s);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 19) || value.f78503t) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 19, value.f78503t);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 20) || value.f78504u) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 20, value.f78504u);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 21) || value.f78505v) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 21, value.f78505v);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 22) || value.f78506w != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 22, StringSerializer.INSTANCE, value.f78506w);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 23) || !Intrinsics.b(value.f78507x, new String[0])) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 23, kSerializerArr[23], value.f78507x);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 24) || !Intrinsics.b(cVar, new op.c())) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 24, op.d.f80551a, cVar);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 25) || !Intrinsics.b(lVar, new op.l())) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 25, op.i.f80558a, lVar);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 26) || value.A) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 26, value.A);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 27) || !Intrinsics.b(value.B, EmptyList.f71733a)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 27, kSerializerArr[27], value.B);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 28) || !Intrinsics.b(map, new LinkedHashMap())) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 28, kSerializerArr[28], map);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] typeParametersSerializers() {
        return GeneratedSerializer.DefaultImpls.typeParametersSerializers(this);
    }
}
