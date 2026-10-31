package wy;

import com.teslacoilsw.launcher.drawer.drawergroups.smart.crowdsourced.SmartFolderSubmission;
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
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class a implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final a f94888a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        a aVar = new a();
        f94888a = aVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.drawer.drawergroups.smart.crowdsourced.SmartFolderSubmission", aVar, 2);
        pluginGeneratedSerialDescriptor.addElement("folder", false);
        pluginGeneratedSerialDescriptor.addElement("components", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{StringSerializer.INSTANCE, SmartFolderSubmission.f45753c[1]};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        String strDecodeStringElement;
        String[] strArr;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = SmartFolderSubmission.f45753c;
        String strDecodeStringElement2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
            strArr = (String[]) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], null);
            i5 = 3;
        } else {
            boolean z11 = true;
            int i11 = 0;
            String[] strArr2 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
                    i11 |= 1;
                } else {
                    if (iDecodeElementIndex != 1) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    strArr2 = (String[]) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], strArr2);
                    i11 |= 2;
                }
            }
            i5 = i11;
            strDecodeStringElement = strDecodeStringElement2;
            strArr = strArr2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new SmartFolderSubmission(i5, strDecodeStringElement, strArr);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        SmartFolderSubmission smartFolderSubmission = (SmartFolderSubmission) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = SmartFolderSubmission.f45753c;
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 0, smartFolderSubmission.f45754a);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], smartFolderSubmission.f45755b);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
