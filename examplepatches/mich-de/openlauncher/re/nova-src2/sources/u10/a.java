package u10;

import com.amplitude.android.migration.DatabaseConstants;
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
public final /* synthetic */ class a implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final a f90363a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        a aVar = new a();
        f90363a = aVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.search.hero.AppCard", aVar, 6);
        pluginGeneratedSerialDescriptor.addElement(DatabaseConstants.KEY_FIELD, false);
        pluginGeneratedSerialDescriptor.addElement("displayName", false);
        pluginGeneratedSerialDescriptor.addElement("featuredContent", false);
        pluginGeneratedSerialDescriptor.addElement("actions", true);
        pluginGeneratedSerialDescriptor.addElement("suggestions", true);
        pluginGeneratedSerialDescriptor.addElement("onIconClick", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = c.f90365h;
        return new KSerializer[]{e20.f.f52020a, StringSerializer.INSTANCE, d.f90371a, kSerializerArr[3], BooleanSerializer.INSTANCE, BuiltinSerializersKt.getNullable(kSerializerArr[5])};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        Function0 function0;
        String str;
        boolean z11;
        com.teslacoilsw.launcher.search.hero.a aVar;
        int i5;
        List list;
        String str2;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = c.f90365h;
        int i11 = 4;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            e20.h hVar = (e20.h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, e20.f.f52020a, null);
            String str3 = hVar != null ? hVar.f52026a : null;
            String strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
            com.teslacoilsw.launcher.search.hero.a aVar2 = (com.teslacoilsw.launcher.search.hero.a) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, d.f90371a, null);
            List list2 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, kSerializerArr[3], null);
            boolean zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 4);
            function0 = (Function0) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 5, kSerializerArr[5], null);
            str = str3;
            z11 = zDecodeBooleanElement;
            aVar = aVar2;
            i5 = 63;
            list = list2;
            str2 = strDecodeStringElement;
        } else {
            boolean z12 = true;
            boolean zDecodeBooleanElement2 = false;
            int i12 = 0;
            Function0 function02 = null;
            String str4 = null;
            com.teslacoilsw.launcher.search.hero.a aVar3 = null;
            List list3 = null;
            String strDecodeStringElement2 = null;
            while (z12) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z12 = false;
                        break;
                    case 0:
                        e20.h hVar2 = (e20.h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, e20.f.f52020a, str4 != null ? new e20.h(str4) : null);
                        str4 = hVar2 != null ? hVar2.f52026a : null;
                        i12 |= 1;
                        i11 = 4;
                        break;
                    case 1:
                        strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
                        i12 |= 2;
                        break;
                    case 2:
                        aVar3 = (com.teslacoilsw.launcher.search.hero.a) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, d.f90371a, aVar3);
                        i12 |= 4;
                        break;
                    case 3:
                        list3 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, kSerializerArr[3], list3);
                        i12 |= 8;
                        break;
                    case 4:
                        zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, i11);
                        i12 |= 16;
                        break;
                    case 5:
                        function02 = (Function0) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 5, kSerializerArr[5], function02);
                        i12 |= 32;
                        break;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            function0 = function02;
            str = str4;
            z11 = zDecodeBooleanElement2;
            aVar = aVar3;
            i5 = i12;
            list = list3;
            str2 = strDecodeStringElement2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new c(i5, str, str2, aVar, list, z11, function0);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        c cVar = (c) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        b bVar = c.Companion;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, e20.f.f52020a, new e20.h(cVar.f90373a));
        KSerializer[] kSerializerArr = c.f90365h;
        String str = cVar.f90366c;
        Function0 function0 = cVar.f90370g;
        boolean z11 = cVar.f90369f;
        List list = cVar.f90368e;
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 1, str);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, d.f90371a, cVar.f90367d);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 3) || !Intrinsics.b(list, EmptyList.f71733a)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 3, kSerializerArr[3], list);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 4) || !z11) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 4, z11);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 5) || function0 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 5, kSerializerArr[5], function0);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
