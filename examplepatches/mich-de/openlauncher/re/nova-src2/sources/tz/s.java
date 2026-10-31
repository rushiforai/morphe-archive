package tz;

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
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class s implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final s f90169a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        s sVar = new s();
        f90169a = sVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.materialyou.RelativeSurfaceColorConfig", sVar, 7);
        pluginGeneratedSerialDescriptor.addElement("paletteConfig", true);
        pluginGeneratedSerialDescriptor.addElement("bgColor", false);
        pluginGeneratedSerialDescriptor.addElement("fgColor", false);
        pluginGeneratedSerialDescriptor.addElement("altColor", true);
        pluginGeneratedSerialDescriptor.addElement("altColor2", true);
        pluginGeneratedSerialDescriptor.addElement("minFgToneDelta", true);
        pluginGeneratedSerialDescriptor.addElement("minAccentToneDelta", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        l lVar = l.f90139a;
        IntSerializer intSerializer = IntSerializer.INSTANCE;
        return new KSerializer[]{p.f90167a, lVar, lVar, lVar, lVar, intSerializer, intSerializer};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int iDecodeIntElement;
        n nVar;
        int i5;
        int i11;
        r rVar;
        n nVar2;
        n nVar3;
        n nVar4;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        int i12 = 6;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            r rVar2 = (r) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, p.f90167a, null);
            l lVar = l.f90139a;
            n nVar5 = (n) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, lVar, null);
            n nVar6 = (n) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, lVar, null);
            n nVar7 = (n) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, lVar, null);
            n nVar8 = (n) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 4, lVar, null);
            int iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 5);
            rVar = rVar2;
            iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 6);
            i5 = iDecodeIntElement2;
            nVar4 = nVar7;
            nVar = nVar8;
            nVar3 = nVar6;
            nVar2 = nVar5;
            i11 = 127;
        } else {
            boolean z11 = true;
            int iDecodeIntElement3 = 0;
            int i13 = 0;
            r rVar3 = null;
            n nVar9 = null;
            n nVar10 = null;
            n nVar11 = null;
            int iDecodeIntElement4 = 0;
            n nVar12 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z11 = false;
                        i12 = 6;
                    case 0:
                        rVar3 = (r) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, p.f90167a, rVar3);
                        i13 |= 1;
                        i12 = 6;
                    case 1:
                        nVar9 = (n) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, l.f90139a, nVar9);
                        i13 |= 2;
                        i12 = 6;
                    case 2:
                        nVar10 = (n) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, l.f90139a, nVar10);
                        i13 |= 4;
                    case 3:
                        nVar11 = (n) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, l.f90139a, nVar11);
                        i13 |= 8;
                    case 4:
                        nVar12 = (n) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 4, l.f90139a, nVar12);
                        i13 |= 16;
                    case 5:
                        iDecodeIntElement4 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 5);
                        i13 |= 32;
                    case 6:
                        iDecodeIntElement3 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, i12);
                        i13 |= 64;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            iDecodeIntElement = iDecodeIntElement3;
            nVar = nVar12;
            i5 = iDecodeIntElement4;
            i11 = i13;
            rVar = rVar3;
            nVar2 = nVar9;
            nVar3 = nVar10;
            nVar4 = nVar11;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new u(i11, rVar, nVar2, nVar3, nVar4, nVar, i5, iDecodeIntElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    @Override // kotlinx.serialization.SerializationStrategy
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void serialize(Encoder encoder, Object obj) {
        u uVar = (u) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 0)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, p.f90167a, new r(uVar.f90170a));
        } else {
            int i5 = uVar.f90170a;
            r.Companion.getClass();
            if (!c.a(i5, 0)) {
            }
        }
        l lVar = l.f90139a;
        long j11 = uVar.f90171b;
        int i11 = uVar.f90176g;
        int i12 = uVar.f90175f;
        long j12 = uVar.f90174e;
        long j13 = uVar.f90172c;
        long j14 = uVar.f90173d;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, lVar, new n(j11));
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, lVar, new n(j13));
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 3) || !n.a(j14, j13)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 3, lVar, new n(j14));
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 4) || !n.a(j12, j14)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 4, lVar, new n(j12));
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 5) || i12 != 40) {
            compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 5, i12);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 6) || i11 != 20) {
            compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 6, i11);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
