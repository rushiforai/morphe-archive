package wy;

import com.teslacoilsw.launcher.drawer.drawergroups.smart.crowdsourced.SmartFolderSubmission;
import com.teslacoilsw.launcher.drawer.drawergroups.smart.crowdsourced.SmartFolderSubmissionPayload;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class f implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final f f94896a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        f fVar = new f();
        f94896a = fVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.drawer.drawergroups.smart.crowdsourced.SmartFolderSubmissionPayload", fVar, 2);
        pluginGeneratedSerialDescriptor.addElement("additions", false);
        pluginGeneratedSerialDescriptor.addElement("removals", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = SmartFolderSubmissionPayload.f45756c;
        return new KSerializer[]{kSerializerArr[0], kSerializerArr[1]};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        SmartFolderSubmission[] smartFolderSubmissionArr;
        SmartFolderSubmission[] smartFolderSubmissionArr2;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = SmartFolderSubmissionPayload.f45756c;
        SmartFolderSubmission[] smartFolderSubmissionArr3 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            smartFolderSubmissionArr = (SmartFolderSubmission[]) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kSerializerArr[0], null);
            smartFolderSubmissionArr2 = (SmartFolderSubmission[]) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], null);
            i5 = 3;
        } else {
            boolean z11 = true;
            int i11 = 0;
            SmartFolderSubmission[] smartFolderSubmissionArr4 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    smartFolderSubmissionArr3 = (SmartFolderSubmission[]) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kSerializerArr[0], smartFolderSubmissionArr3);
                    i11 |= 1;
                } else {
                    if (iDecodeElementIndex != 1) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    smartFolderSubmissionArr4 = (SmartFolderSubmission[]) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], smartFolderSubmissionArr4);
                    i11 |= 2;
                }
            }
            i5 = i11;
            smartFolderSubmissionArr = smartFolderSubmissionArr3;
            smartFolderSubmissionArr2 = smartFolderSubmissionArr4;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new SmartFolderSubmissionPayload(i5, smartFolderSubmissionArr, smartFolderSubmissionArr2);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        SmartFolderSubmissionPayload smartFolderSubmissionPayload = (SmartFolderSubmissionPayload) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = SmartFolderSubmissionPayload.f45756c;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, kSerializerArr[0], smartFolderSubmissionPayload.f45757a);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], smartFolderSubmissionPayload.f45758b);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
