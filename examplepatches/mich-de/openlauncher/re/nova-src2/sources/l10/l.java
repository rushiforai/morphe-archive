package l10;

import android.net.Uri;
import e10.q4;
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
import mx.c0;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final /* synthetic */ class l implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final l f74432a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        l lVar = new l();
        f74432a = lVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.quicksearchbar.QsbAction", lVar, 2);
        pluginGeneratedSerialDescriptor.addElement("action", false);
        pluginGeneratedSerialDescriptor.addElement("customIcon", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{n.f74433c[0], BuiltinSerializersKt.getNullable(q4.f51772a)};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        c0 c0Var;
        Uri uri;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = n.f74433c;
        c0 c0Var2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            c0Var = (c0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kSerializerArr[0], null);
            uri = (Uri) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, q4.f51772a, null);
            i5 = 3;
        } else {
            boolean z11 = true;
            int i11 = 0;
            Uri uri2 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    c0Var2 = (c0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kSerializerArr[0], c0Var2);
                    i11 |= 1;
                } else {
                    if (iDecodeElementIndex != 1) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    uri2 = (Uri) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, q4.f51772a, uri2);
                    i11 |= 2;
                }
            }
            i5 = i11;
            c0Var = c0Var2;
            uri = uri2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new n(i5, c0Var, uri);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        n nVar = (n) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer kSerializer = n.f74433c[0];
        c0 c0Var = nVar.f74437a;
        Uri uri = nVar.f74438b;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, kSerializer, c0Var);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 1) || uri != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 1, q4.f51772a, uri);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
