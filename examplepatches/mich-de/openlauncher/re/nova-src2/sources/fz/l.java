package fz;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.FloatArraySerializer;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final /* synthetic */ class l implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final l f56295a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        l lVar = new l();
        f56295a = lVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.icon.CornerCustomShapePath", lVar, 6);
        pluginGeneratedSerialDescriptor.addElement("topLeft", false);
        pluginGeneratedSerialDescriptor.addElement("topRight", true);
        pluginGeneratedSerialDescriptor.addElement("bottomLeft", true);
        pluginGeneratedSerialDescriptor.addElement("bottomRight", true);
        pluginGeneratedSerialDescriptor.addElement("isSymetrical", true);
        pluginGeneratedSerialDescriptor.addElement("mTempRadii", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        g gVar = g.f56246a;
        return new KSerializer[]{gVar, gVar, gVar, gVar, BooleanSerializer.INSTANCE, FloatArraySerializer.INSTANCE};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        boolean z11;
        int i5;
        i iVar;
        i iVar2;
        i iVar3;
        i iVar4;
        float[] fArr;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        int i11 = 5;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            g gVar = g.f56246a;
            i iVar5 = (i) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, gVar, null);
            i iVar6 = (i) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, gVar, null);
            i iVar7 = (i) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, gVar, null);
            i iVar8 = (i) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, gVar, null);
            boolean zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 4);
            iVar4 = iVar8;
            fArr = (float[]) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 5, FloatArraySerializer.INSTANCE, null);
            z11 = zDecodeBooleanElement;
            i5 = 63;
            iVar3 = iVar7;
            iVar2 = iVar6;
            iVar = iVar5;
        } else {
            boolean z12 = true;
            boolean zDecodeBooleanElement2 = false;
            i iVar9 = null;
            i iVar10 = null;
            i iVar11 = null;
            i iVar12 = null;
            float[] fArr2 = null;
            int i12 = 0;
            while (z12) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z12 = false;
                        i11 = 5;
                    case 0:
                        iVar9 = (i) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, g.f56246a, iVar9);
                        i12 |= 1;
                        i11 = 5;
                    case 1:
                        iVar10 = (i) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, g.f56246a, iVar10);
                        i12 |= 2;
                    case 2:
                        iVar11 = (i) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, g.f56246a, iVar11);
                        i12 |= 4;
                    case 3:
                        iVar12 = (i) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, g.f56246a, iVar12);
                        i12 |= 8;
                    case 4:
                        zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 4);
                        i12 |= 16;
                    case 5:
                        fArr2 = (float[]) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, i11, FloatArraySerializer.INSTANCE, fArr2);
                        i12 |= 32;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            z11 = zDecodeBooleanElement2;
            i5 = i12;
            iVar = iVar9;
            iVar2 = iVar10;
            iVar3 = iVar11;
            iVar4 = iVar12;
            fArr = fArr2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new p(i5, iVar, iVar2, iVar3, iVar4, z11, fArr);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x007c  */
    @Override // kotlinx.serialization.SerializationStrategy
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void serialize(Encoder encoder, Object obj) {
        p pVar = (p) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        m mVar = p.Companion;
        g gVar = g.f56246a;
        i iVar = pVar.f56328d;
        float[] fArr = pVar.f56333i;
        boolean z11 = pVar.f56332h;
        i iVar2 = pVar.f56331g;
        i iVar3 = pVar.f56330f;
        i iVar4 = pVar.f56329e;
        boolean z12 = false;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, gVar, iVar);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 1) || !Intrinsics.b(iVar4, iVar)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, gVar, iVar4);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 2) || !Intrinsics.b(iVar3, iVar)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, gVar, iVar3);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 3) || !Intrinsics.b(iVar2, iVar)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 3, gVar, iVar2);
        }
        if (!compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 4)) {
            if ((iVar.f56259a == 0 && iVar4.f56259a == 0 && iVar3.f56259a == 0 && iVar2.f56259a == 0) || (Intrinsics.b(iVar, iVar4) && Intrinsics.b(iVar, iVar3) && Intrinsics.b(iVar, iVar2))) {
                z12 = true;
            }
            if (z11 != z12) {
                compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 4, z11);
            }
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 5) || !Intrinsics.b(fArr, new float[8])) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 5, FloatArraySerializer.INSTANCE, fArr);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
