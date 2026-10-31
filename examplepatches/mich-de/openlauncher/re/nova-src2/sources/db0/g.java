package db0;

import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.util.TTConst;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
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
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final /* synthetic */ class g implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final g f49146a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        g gVar = new g();
        f49146a = gVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("rdl.Event.BluetoothDevice", gVar, 6);
        pluginGeneratedSerialDescriptor.addElement("isConnected", false);
        pluginGeneratedSerialDescriptor.addElement(PendingUpgradeStore.KEY_NAME, false);
        pluginGeneratedSerialDescriptor.addElement(PlaceTypes.ADDRESS, false);
        pluginGeneratedSerialDescriptor.addElement(TTConst.TRACK_TYPE, false);
        pluginGeneratedSerialDescriptor.addElement("deviceClass", false);
        pluginGeneratedSerialDescriptor.addElement("timestamp", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        d0 d0Var = d0.f49139a;
        IntSerializer intSerializer = IntSerializer.INSTANCE;
        return new KSerializer[]{BooleanSerializer.INSTANCE, d0Var, d0Var, intSerializer, intSerializer, LongSerializer.INSTANCE};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        boolean zDecodeBooleanElement;
        int i5;
        int iDecodeIntElement;
        int iDecodeIntElement2;
        long jDecodeLongElement;
        f0 f0Var;
        f0 f0Var2;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 0);
            d0 d0Var = d0.f49139a;
            f0 f0Var3 = (f0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, d0Var, null);
            f0 f0Var4 = (f0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, d0Var, null);
            i5 = 63;
            iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 3);
            iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 4);
            f0Var2 = f0Var4;
            f0Var = f0Var3;
            jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 5);
        } else {
            boolean z11 = true;
            zDecodeBooleanElement = false;
            f0 f0Var5 = null;
            f0 f0Var6 = null;
            long jDecodeLongElement2 = 0;
            int i11 = 0;
            int iDecodeIntElement3 = 0;
            int iDecodeIntElement4 = 0;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z11 = false;
                        continue;
                    case 0:
                        zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 0);
                        i11 |= 1;
                        continue;
                    case 1:
                        f0Var5 = (f0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, d0.f49139a, f0Var5);
                        i11 |= 2;
                        break;
                    case 2:
                        f0Var6 = (f0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, d0.f49139a, f0Var6);
                        i11 |= 4;
                        break;
                    case 3:
                        iDecodeIntElement3 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 3);
                        i11 |= 8;
                        break;
                    case 4:
                        iDecodeIntElement4 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 4);
                        i11 |= 16;
                        break;
                    case 5:
                        jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 5);
                        i11 |= 32;
                        break;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            i5 = i11;
            iDecodeIntElement = iDecodeIntElement3;
            iDecodeIntElement2 = iDecodeIntElement4;
            jDecodeLongElement = jDecodeLongElement2;
            f0Var = f0Var5;
            f0Var2 = f0Var6;
        }
        boolean z12 = zDecodeBooleanElement;
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new i(i5, z12, f0Var, f0Var2, iDecodeIntElement, iDecodeIntElement2, jDecodeLongElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        i iVar = (i) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 0, iVar.f49155b);
        d0 d0Var = d0.f49139a;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, d0Var, f0.a(iVar.f49156c));
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, d0Var, f0.a(iVar.f49157d));
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 3, iVar.f49158e);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 4, iVar.f49159f);
        compositeEncoderBeginStructure.encodeLongElement(serialDescriptor, 5, iVar.f49160g);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
