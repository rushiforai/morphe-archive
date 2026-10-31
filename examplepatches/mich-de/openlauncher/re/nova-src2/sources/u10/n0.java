package u10;

import android.net.Uri;
import com.amplitude.android.migration.DatabaseConstants;
import e10.q4;
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
public final /* synthetic */ class n0 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final n0 f90404a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        n0 n0Var = new n0();
        f90404a = n0Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.search.hero.MapLocationHeroCard", n0Var, 6);
        pluginGeneratedSerialDescriptor.addElement(DatabaseConstants.KEY_FIELD, false);
        pluginGeneratedSerialDescriptor.addElement("location", false);
        pluginGeneratedSerialDescriptor.addElement("locationPlaceId", true);
        pluginGeneratedSerialDescriptor.addElement("displayName", true);
        pluginGeneratedSerialDescriptor.addElement("note", true);
        pluginGeneratedSerialDescriptor.addElement("image", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        return new KSerializer[]{e20.f.f52020a, stringSerializer, BuiltinSerializersKt.getNullable(stringSerializer), stringSerializer, BuiltinSerializersKt.getNullable(stringSerializer), BuiltinSerializersKt.getNullable(q4.f51772a)};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        String str;
        Uri uri;
        String str2;
        String str3;
        String str4;
        String str5;
        int i5;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        int i11 = 5;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            e20.h hVar = (e20.h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, e20.f.f52020a, null);
            str = hVar != null ? hVar.f52026a : null;
            String strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
            StringSerializer stringSerializer = StringSerializer.INSTANCE;
            String str6 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, stringSerializer, null);
            String strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 3);
            String str7 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, stringSerializer, null);
            uri = (Uri) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 5, q4.f51772a, null);
            str2 = strDecodeStringElement2;
            str3 = str7;
            str4 = str6;
            str5 = strDecodeStringElement;
            i5 = 63;
        } else {
            boolean z11 = true;
            int i12 = 0;
            str = null;
            Uri uri2 = null;
            String strDecodeStringElement3 = null;
            String str8 = null;
            String str9 = null;
            String strDecodeStringElement4 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z11 = false;
                        break;
                    case 0:
                        e20.h hVar2 = (e20.h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, e20.f.f52020a, str != null ? new e20.h(str) : null);
                        str = hVar2 != null ? hVar2.f52026a : null;
                        i12 |= 1;
                        i11 = 5;
                        break;
                    case 1:
                        strDecodeStringElement4 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
                        i12 |= 2;
                        break;
                    case 2:
                        str9 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, StringSerializer.INSTANCE, str9);
                        i12 |= 4;
                        break;
                    case 3:
                        strDecodeStringElement3 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 3);
                        i12 |= 8;
                        break;
                    case 4:
                        str8 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, StringSerializer.INSTANCE, str8);
                        i12 |= 16;
                        break;
                    case 5:
                        uri2 = (Uri) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, i11, q4.f51772a, uri2);
                        i12 |= 32;
                        break;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            uri = uri2;
            str2 = strDecodeStringElement3;
            str3 = str8;
            str4 = str9;
            str5 = strDecodeStringElement4;
            i5 = i12;
        }
        String str10 = str;
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new p0(i5, str10, str5, str4, str2, str3, uri);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        p0 p0Var = (p0) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        o0 o0Var = p0.Companion;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, e20.f.f52020a, new e20.h(p0Var.f90373a));
        String str = p0Var.f90406c;
        Uri uri = p0Var.f90410g;
        String str2 = p0Var.f90409f;
        String str3 = p0Var.f90408e;
        String str4 = p0Var.f90407d;
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 1, str);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 2) || str4 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 2, StringSerializer.INSTANCE, str4);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 3) || !Intrinsics.b(str3, str)) {
            compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 3, str3);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 4) || str2 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 4, StringSerializer.INSTANCE, str2);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 5) || uri != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 5, q4.f51772a, uri);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
