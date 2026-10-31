package f00;

import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
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

/* loaded from: classes4.dex */
public final /* synthetic */ class g0 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final g0 f53271a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        g0 g0Var = new g0();
        f53271a = g0Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.novasettings.cards.MapLocation", g0Var, 4);
        pluginGeneratedSerialDescriptor.addElement(PendingUpgradeStore.KEY_NAME, false);
        pluginGeneratedSerialDescriptor.addElement("id", false);
        pluginGeneratedSerialDescriptor.addElement(PlaceTypes.ADDRESS, false);
        pluginGeneratedSerialDescriptor.addElement("latLong", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer nullable = BuiltinSerializersKt.getNullable(d0.f53256a);
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        return new KSerializer[]{stringSerializer, stringSerializer, stringSerializer, nullable};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        String str;
        String str2;
        String str3;
        f0 f0Var;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        String strDecodeStringElement = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            String strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
            String strDecodeStringElement3 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
            String strDecodeStringElement4 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 2);
            str = strDecodeStringElement2;
            f0Var = (f0) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, d0.f53256a, null);
            str3 = strDecodeStringElement4;
            str2 = strDecodeStringElement3;
            i5 = 15;
        } else {
            boolean z11 = true;
            int i11 = 0;
            String strDecodeStringElement5 = null;
            String strDecodeStringElement6 = null;
            f0 f0Var2 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    strDecodeStringElement5 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
                    i11 |= 2;
                } else if (iDecodeElementIndex == 2) {
                    strDecodeStringElement6 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 2);
                    i11 |= 4;
                } else {
                    if (iDecodeElementIndex != 3) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    f0Var2 = (f0) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, d0.f53256a, f0Var2);
                    i11 |= 8;
                }
            }
            i5 = i11;
            str = strDecodeStringElement;
            str2 = strDecodeStringElement5;
            str3 = strDecodeStringElement6;
            f0Var = f0Var2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new i0(i5, str, str2, str3, f0Var);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        i0 i0Var = (i0) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 0, i0Var.f53288a);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 1, i0Var.f53289b);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 2, i0Var.f53290c);
        compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 3, d0.f53256a, i0Var.f53291d);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
