package jx;

import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.teslacoilsw.conditions.SimpleBluetoothDevice;
import com.tiktok.util.TTConst;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class p implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final p f70422a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        p pVar = new p();
        f70422a = pVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.conditions.SimpleBluetoothDevice", pVar, 5);
        pluginGeneratedSerialDescriptor.addElement(PendingUpgradeStore.KEY_NAME, false);
        pluginGeneratedSerialDescriptor.addElement(TTConst.TRACK_TYPE, false);
        pluginGeneratedSerialDescriptor.addElement(PlaceTypes.ADDRESS, false);
        pluginGeneratedSerialDescriptor.addElement("bluetoothClass", false);
        pluginGeneratedSerialDescriptor.addElement("bluetoothClassMajor", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        IntSerializer intSerializer = IntSerializer.INSTANCE;
        return new KSerializer[]{stringSerializer, intSerializer, stringSerializer, intSerializer, intSerializer};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        String strDecodeStringElement;
        int iDecodeIntElement;
        int iDecodeIntElement2;
        String str;
        int i5;
        int i11;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
            int iDecodeIntElement3 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
            String strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 2);
            iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 3);
            iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 4);
            str = strDecodeStringElement2;
            i5 = iDecodeIntElement3;
            i11 = 31;
        } else {
            strDecodeStringElement = null;
            String strDecodeStringElement3 = null;
            boolean z11 = true;
            int iDecodeIntElement4 = 0;
            int iDecodeIntElement5 = 0;
            int iDecodeIntElement6 = 0;
            int i12 = 0;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
                    i12 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    iDecodeIntElement6 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
                    i12 |= 2;
                } else if (iDecodeElementIndex == 2) {
                    strDecodeStringElement3 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 2);
                    i12 |= 4;
                } else if (iDecodeElementIndex == 3) {
                    iDecodeIntElement4 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 3);
                    i12 |= 8;
                } else {
                    if (iDecodeElementIndex != 4) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    iDecodeIntElement5 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 4);
                    i12 |= 16;
                }
            }
            iDecodeIntElement = iDecodeIntElement4;
            iDecodeIntElement2 = iDecodeIntElement5;
            str = strDecodeStringElement3;
            i5 = iDecodeIntElement6;
            i11 = i12;
        }
        String str2 = strDecodeStringElement;
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new SimpleBluetoothDevice(i11, i5, iDecodeIntElement, iDecodeIntElement2, str2, str);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        SimpleBluetoothDevice simpleBluetoothDevice = (SimpleBluetoothDevice) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 0, simpleBluetoothDevice.f45534a);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 1, simpleBluetoothDevice.f45535b);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 2, simpleBluetoothDevice.f45536c);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 3, simpleBluetoothDevice.f45537d);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 4, simpleBluetoothDevice.f45538e);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
