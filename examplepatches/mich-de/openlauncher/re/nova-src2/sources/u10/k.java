package u10;

import android.net.Uri;
import com.amplitude.android.migration.DatabaseConstants;
import e10.q4;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function0;
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

/* loaded from: classes.dex */
public final /* synthetic */ class k implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final k f90389a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        k kVar = new k();
        f90389a = kVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.search.hero.BranchHeroCard", kVar, 7);
        pluginGeneratedSerialDescriptor.addElement(DatabaseConstants.KEY_FIELD, false);
        pluginGeneratedSerialDescriptor.addElement("displayName", false);
        pluginGeneratedSerialDescriptor.addElement("iconUri", false);
        pluginGeneratedSerialDescriptor.addElement("featuredContent", false);
        pluginGeneratedSerialDescriptor.addElement("actions", true);
        pluginGeneratedSerialDescriptor.addElement("suggestions", true);
        pluginGeneratedSerialDescriptor.addElement("onIconClick", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = m.f90391i;
        return new KSerializer[]{e20.f.f52020a, StringSerializer.INSTANCE, q4.f51772a, kSerializerArr[3], kSerializerArr[4], BooleanSerializer.INSTANCE, BuiltinSerializersKt.getNullable(kSerializerArr[6])};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        Function0 function0;
        List list;
        com.teslacoilsw.launcher.search.hero.c cVar;
        String str;
        boolean z11;
        Uri uri;
        int i5;
        String str2;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = m.f90391i;
        int i11 = 5;
        int i12 = 2;
        com.teslacoilsw.launcher.search.hero.c cVar2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            e20.h hVar = (e20.h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, e20.f.f52020a, null);
            String str3 = hVar != null ? hVar.f52026a : null;
            String strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
            Uri uri2 = (Uri) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, q4.f51772a, null);
            com.teslacoilsw.launcher.search.hero.c cVar3 = (com.teslacoilsw.launcher.search.hero.c) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, kSerializerArr[3], null);
            List list2 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 4, kSerializerArr[4], null);
            boolean zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 5);
            function0 = (Function0) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 6, kSerializerArr[6], null);
            str = str3;
            z11 = zDecodeBooleanElement;
            uri = uri2;
            i5 = 127;
            cVar = cVar3;
            list = list2;
            str2 = strDecodeStringElement;
        } else {
            boolean z12 = true;
            boolean zDecodeBooleanElement2 = false;
            int i13 = 0;
            Function0 function02 = null;
            List list3 = null;
            String str4 = null;
            Uri uri3 = null;
            String strDecodeStringElement2 = null;
            while (z12) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z12 = false;
                        continue;
                    case 0:
                        e20.h hVar2 = (e20.h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, e20.f.f52020a, str4 != null ? new e20.h(str4) : null);
                        i13 |= 1;
                        str4 = hVar2 != null ? hVar2.f52026a : null;
                        i11 = 5;
                        i12 = 2;
                        continue;
                    case 1:
                        strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
                        i13 |= 2;
                        continue;
                    case 2:
                        uri3 = (Uri) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, i12, q4.f51772a, uri3);
                        i13 |= 4;
                        break;
                    case 3:
                        cVar2 = (com.teslacoilsw.launcher.search.hero.c) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, kSerializerArr[3], cVar2);
                        i13 |= 8;
                        break;
                    case 4:
                        list3 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 4, kSerializerArr[4], list3);
                        i13 |= 16;
                        break;
                    case 5:
                        zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, i11);
                        i13 |= 32;
                        break;
                    case 6:
                        function02 = (Function0) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 6, kSerializerArr[6], function02);
                        i13 |= 64;
                        break;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            function0 = function02;
            list = list3;
            cVar = cVar2;
            str = str4;
            z11 = zDecodeBooleanElement2;
            uri = uri3;
            i5 = i13;
            str2 = strDecodeStringElement2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new m(i5, str, str2, uri, cVar, list, z11, function0);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        m mVar = (m) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        l lVar = m.Companion;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, e20.f.f52020a, new e20.h(mVar.f90373a));
        KSerializer[] kSerializerArr = m.f90391i;
        String str = mVar.f90392c;
        Function0 function0 = mVar.f90397h;
        boolean z11 = mVar.f90396g;
        List list = mVar.f90395f;
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 1, str);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, q4.f51772a, mVar.f90393d);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 3, kSerializerArr[3], mVar.f90394e);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 4) || !Intrinsics.b(list, EmptyList.f71733a)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 4, kSerializerArr[4], list);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 5) || !z11) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 5, z11);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 6) || function0 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 6, kSerializerArr[6], function0);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
