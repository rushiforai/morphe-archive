package u10;

import android.net.Uri;
import com.amplitude.android.migration.DatabaseConstants;
import e10.q4;
import e10.z2;
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
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final /* synthetic */ class u implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final u f90424a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        u uVar = new u();
        f90424a = uVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.search.hero.CompositeCard", uVar, 6);
        pluginGeneratedSerialDescriptor.addElement(DatabaseConstants.KEY_FIELD, false);
        pluginGeneratedSerialDescriptor.addElement("displayName", false);
        pluginGeneratedSerialDescriptor.addElement("iconUri", true);
        pluginGeneratedSerialDescriptor.addElement("featuredContent", false);
        pluginGeneratedSerialDescriptor.addElement("actions", true);
        pluginGeneratedSerialDescriptor.addElement("onIconClick", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = w.f90426h;
        return new KSerializer[]{e20.f.f52020a, StringSerializer.INSTANCE, q4.f51772a, BuiltinSerializersKt.getNullable(kSerializerArr[3]), kSerializerArr[4], BuiltinSerializersKt.getNullable(kSerializerArr[5])};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        Function0 function0;
        String str;
        Uri uri;
        int i5;
        com.teslacoilsw.launcher.search.hero.c cVar;
        List list;
        String str2;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = w.f90426h;
        int i11 = 2;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            e20.h hVar = (e20.h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, e20.f.f52020a, null);
            String str3 = hVar != null ? hVar.f52026a : null;
            String strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
            Uri uri2 = (Uri) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, q4.f51772a, null);
            com.teslacoilsw.launcher.search.hero.c cVar2 = (com.teslacoilsw.launcher.search.hero.c) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, kSerializerArr[3], null);
            List list2 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 4, kSerializerArr[4], null);
            function0 = (Function0) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 5, kSerializerArr[5], null);
            str = str3;
            uri = uri2;
            i5 = 63;
            cVar = cVar2;
            list = list2;
            str2 = strDecodeStringElement;
        } else {
            boolean z11 = true;
            int i12 = 0;
            Function0 function02 = null;
            String str4 = null;
            Uri uri3 = null;
            com.teslacoilsw.launcher.search.hero.c cVar3 = null;
            List list3 = null;
            String strDecodeStringElement2 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z11 = false;
                        break;
                    case 0:
                        e20.h hVar2 = (e20.h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, e20.f.f52020a, str4 != null ? new e20.h(str4) : null);
                        str4 = hVar2 != null ? hVar2.f52026a : null;
                        i12 |= 1;
                        i11 = 2;
                        break;
                    case 1:
                        strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
                        i12 |= 2;
                        break;
                    case 2:
                        uri3 = (Uri) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, i11, q4.f51772a, uri3);
                        i12 |= 4;
                        break;
                    case 3:
                        cVar3 = (com.teslacoilsw.launcher.search.hero.c) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, kSerializerArr[3], cVar3);
                        i12 |= 8;
                        break;
                    case 4:
                        list3 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 4, kSerializerArr[4], list3);
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
            uri = uri3;
            i5 = i12;
            cVar = cVar3;
            list = list3;
            str2 = strDecodeStringElement2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new w(i5, str, str2, uri, cVar, list, function0);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        w wVar = (w) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        v vVar = w.Companion;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, e20.f.f52020a, new e20.h(wVar.f90373a));
        KSerializer[] kSerializerArr = w.f90426h;
        String str = wVar.f90427c;
        Function0 function0 = wVar.f90431g;
        List list = wVar.f90430f;
        Uri uri = wVar.f90428d;
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 1, str);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 2) || !Intrinsics.b(uri, r10.o0.d(z2.v(2131231789, "com.teslacoilsw.launcher"), r10.n0.f85193c))) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, q4.f51772a, uri);
        }
        compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 3, kSerializerArr[3], wVar.f90429e);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 4) || !Intrinsics.b(list, EmptyList.f71733a)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 4, kSerializerArr[4], list);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 5) || function0 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 5, kSerializerArr[5], function0);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
