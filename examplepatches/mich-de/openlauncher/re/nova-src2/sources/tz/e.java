package tz;

import androidx.recyclerview.widget.u1;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
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
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final /* synthetic */ class e implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final e f90111a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        e eVar = new e();
        f90111a = eVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.materialyou.NovaColorSchemeConfig", eVar, 15);
        pluginGeneratedSerialDescriptor.addElement("novaSettings", false);
        pluginGeneratedSerialDescriptor.addElement("desktop", false);
        pluginGeneratedSerialDescriptor.addElement("drawer", false);
        pluginGeneratedSerialDescriptor.addElement("dock", false);
        pluginGeneratedSerialDescriptor.addElement("desktopFolder", false);
        pluginGeneratedSerialDescriptor.addElement("desktopSearchBar", false);
        pluginGeneratedSerialDescriptor.addElement("drawerSearchBar", false);
        pluginGeneratedSerialDescriptor.addElement("searchWindow", false);
        pluginGeneratedSerialDescriptor.addElement("popupMenu", false);
        pluginGeneratedSerialDescriptor.addElement("_unused", true);
        pluginGeneratedSerialDescriptor.addElement("_unused2", true);
        pluginGeneratedSerialDescriptor.addElement("desktopFolderIcon", true);
        pluginGeneratedSerialDescriptor.addElement("numericBadge", true);
        pluginGeneratedSerialDescriptor.addElement("feedPage", true);
        pluginGeneratedSerialDescriptor.addElement("feedPageSearchBar", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        s sVar = s.f90169a;
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        return new KSerializer[]{sVar, sVar, sVar, sVar, sVar, sVar, sVar, sVar, sVar, stringSerializer, stringSerializer, sVar, sVar, sVar, sVar};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        u uVar;
        u uVar2;
        u uVar3;
        u uVar4;
        u uVar5;
        u uVar6;
        u uVar7;
        u uVar8;
        u uVar9;
        u uVar10;
        u uVar11;
        u uVar12;
        u uVar13;
        int i5;
        String str;
        String str2;
        u uVar14;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        u uVar15 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            s sVar = s.f90169a;
            u uVar16 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, sVar, null);
            u uVar17 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, sVar, null);
            u uVar18 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, sVar, null);
            u uVar19 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, sVar, null);
            u uVar20 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 4, sVar, null);
            u uVar21 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 5, sVar, null);
            u uVar22 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 6, sVar, null);
            u uVar23 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 7, sVar, null);
            u uVar24 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 8, sVar, null);
            String strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 9);
            String strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 10);
            u uVar25 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 11, sVar, null);
            u uVar26 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 12, sVar, null);
            u uVar27 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 13, sVar, null);
            uVar3 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 14, sVar, null);
            i5 = 32767;
            uVar = uVar16;
            uVar10 = uVar25;
            str2 = strDecodeStringElement2;
            str = strDecodeStringElement;
            uVar7 = uVar23;
            uVar8 = uVar22;
            uVar11 = uVar21;
            uVar12 = uVar19;
            uVar6 = uVar24;
            uVar9 = uVar20;
            uVar13 = uVar18;
            uVar4 = uVar27;
            uVar5 = uVar26;
            uVar2 = uVar17;
        } else {
            boolean z11 = true;
            int i11 = 0;
            u uVar28 = null;
            u uVar29 = null;
            u uVar30 = null;
            u uVar31 = null;
            u uVar32 = null;
            u uVar33 = null;
            u uVar34 = null;
            u uVar35 = null;
            u uVar36 = null;
            u uVar37 = null;
            u uVar38 = null;
            u uVar39 = null;
            String strDecodeStringElement3 = null;
            String strDecodeStringElement4 = null;
            while (z11) {
                u uVar40 = uVar15;
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z11 = false;
                        uVar28 = uVar28;
                        uVar15 = uVar40;
                        i11 = i11;
                        continue;
                    case 0:
                        uVar15 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, s.f90169a, uVar40);
                        i11 |= 1;
                        uVar29 = uVar29;
                        uVar28 = uVar28;
                        continue;
                    case 1:
                        uVar29 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, s.f90169a, uVar29);
                        i11 |= 2;
                        uVar15 = uVar40;
                        continue;
                    case 2:
                        uVar14 = uVar29;
                        uVar28 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, s.f90169a, uVar28);
                        i11 |= 4;
                        break;
                    case 3:
                        uVar14 = uVar29;
                        uVar39 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, s.f90169a, uVar39);
                        i11 |= 8;
                        break;
                    case 4:
                        uVar14 = uVar29;
                        uVar36 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 4, s.f90169a, uVar36);
                        i11 |= 16;
                        break;
                    case 5:
                        uVar14 = uVar29;
                        uVar38 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 5, s.f90169a, uVar38);
                        i11 |= 32;
                        break;
                    case 6:
                        uVar14 = uVar29;
                        uVar35 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 6, s.f90169a, uVar35);
                        i11 |= 64;
                        break;
                    case 7:
                        uVar14 = uVar29;
                        uVar34 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 7, s.f90169a, uVar34);
                        i11 |= 128;
                        break;
                    case 8:
                        uVar14 = uVar29;
                        uVar33 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 8, s.f90169a, uVar33);
                        i11 |= 256;
                        break;
                    case 9:
                        uVar14 = uVar29;
                        strDecodeStringElement3 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 9);
                        i11 |= EventBridgeChannel.QUEUE_CAPACITY;
                        break;
                    case 10:
                        uVar14 = uVar29;
                        strDecodeStringElement4 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 10);
                        i11 |= 1024;
                        break;
                    case 11:
                        uVar14 = uVar29;
                        uVar37 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 11, s.f90169a, uVar37);
                        i11 |= 2048;
                        break;
                    case 12:
                        uVar14 = uVar29;
                        uVar32 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 12, s.f90169a, uVar32);
                        i11 |= u1.FLAG_APPEARED_IN_PRE_LAYOUT;
                        break;
                    case 13:
                        uVar14 = uVar29;
                        uVar31 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 13, s.f90169a, uVar31);
                        i11 |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
                        break;
                    case 14:
                        uVar14 = uVar29;
                        uVar30 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 14, s.f90169a, uVar30);
                        i11 |= ReaderJsonLexerKt.BATCH_SIZE;
                        break;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
                uVar15 = uVar40;
                uVar29 = uVar14;
            }
            uVar = uVar15;
            uVar2 = uVar29;
            uVar3 = uVar30;
            uVar4 = uVar31;
            uVar5 = uVar32;
            uVar6 = uVar33;
            uVar7 = uVar34;
            uVar8 = uVar35;
            uVar9 = uVar36;
            uVar10 = uVar37;
            uVar11 = uVar38;
            uVar12 = uVar39;
            uVar13 = uVar28;
            i5 = i11;
            str = strDecodeStringElement3;
            str2 = strDecodeStringElement4;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new g(i5, uVar, uVar2, uVar13, uVar12, uVar9, uVar11, uVar8, uVar7, uVar6, str, str2, uVar10, uVar5, uVar4, uVar3);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x00ce  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00fe  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0127  */
    @Override // kotlinx.serialization.SerializationStrategy
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void serialize(Encoder encoder, Object obj) {
        g gVar = (g) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        s sVar = s.f90169a;
        u uVar = gVar.f90112a;
        u uVar2 = gVar.o;
        u uVar3 = gVar.n;
        u uVar4 = gVar.f90124m;
        u uVar5 = gVar.f90123l;
        String str = gVar.f90122k;
        String str2 = gVar.f90121j;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, sVar, uVar);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, sVar, gVar.f90113b);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, sVar, gVar.f90114c);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 3, sVar, gVar.f90115d);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 4, sVar, gVar.f90116e);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 5, sVar, gVar.f90117f);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 6, sVar, gVar.f90118g);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 7, sVar, gVar.f90119h);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 8, sVar, gVar.f90120i);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 9) || !Intrinsics.b(str2, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)) {
            compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 9, str2);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 10) || !Intrinsics.b(str, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)) {
            compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 10, str);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 11)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 11, sVar, uVar5);
        } else {
            r.Companion.getClass();
            n.Companion.getClass();
            if (!Intrinsics.b(uVar5, new u(0, n.i(160, n.f90153q), n.f90140b, n.f90150l, 112))) {
            }
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 12)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 12, sVar, uVar4);
        } else {
            r.Companion.getClass();
            n.Companion.getClass();
            if (!Intrinsics.b(uVar4, new u(0, n.n, n.f90140b, n.f90150l, 112))) {
            }
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 13)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 13, sVar, uVar3);
        } else {
            r.Companion.getClass();
            n.Companion.getClass();
            if (!Intrinsics.b(uVar3, new u(0, n.i(Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, n.A), n.f90143e, n.f90147i, 112))) {
            }
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 14)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 14, sVar, uVar2);
        } else {
            u uVar6 = gVar.n;
            n.Companion.getClass();
            if (!Intrinsics.b(uVar2, u.a(uVar6, 0, n.f90162z, 0L, 0L, 0, 0, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE))) {
            }
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
