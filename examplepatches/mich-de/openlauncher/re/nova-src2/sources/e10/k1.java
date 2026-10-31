package e10;

import kotlin.jvm.internal.Intrinsics;
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

/* loaded from: classes.dex */
public final /* synthetic */ class k1 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final k1 f51624a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        k1 k1Var = new k1();
        f51624a = k1Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.preferences.PopupItems", k1Var, 7);
        pluginGeneratedSerialDescriptor.addElement("uninstall", false);
        pluginGeneratedSerialDescriptor.addElement("playStore", false);
        pluginGeneratedSerialDescriptor.addElement("closeApp", false);
        pluginGeneratedSerialDescriptor.addElement("relaunch", false);
        pluginGeneratedSerialDescriptor.addElement("saveApk", true);
        pluginGeneratedSerialDescriptor.addElement("sesame", true);
        pluginGeneratedSerialDescriptor.addElement("hideApp", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        h1 h1Var = h1.f51569a;
        return new KSerializer[]{h1Var, h1Var, h1Var, h1Var, h1Var, h1Var, h1Var};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        j1 j1Var;
        j1 j1Var2;
        j1 j1Var3;
        j1 j1Var4;
        j1 j1Var5;
        j1 j1Var6;
        j1 j1Var7;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        int i11 = 6;
        j1 j1Var8 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            h1 h1Var = h1.f51569a;
            j1 j1Var9 = (j1) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, h1Var, null);
            j1 j1Var10 = (j1) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, h1Var, null);
            j1 j1Var11 = (j1) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, h1Var, null);
            j1 j1Var12 = (j1) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, h1Var, null);
            j1 j1Var13 = (j1) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 4, h1Var, null);
            j1 j1Var14 = (j1) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 5, h1Var, null);
            j1Var = (j1) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 6, h1Var, null);
            i5 = 127;
            j1Var7 = j1Var14;
            j1Var5 = j1Var12;
            j1Var6 = j1Var13;
            j1Var4 = j1Var11;
            j1Var3 = j1Var10;
            j1Var2 = j1Var9;
        } else {
            boolean z11 = true;
            int i12 = 0;
            j1 j1Var15 = null;
            j1 j1Var16 = null;
            j1 j1Var17 = null;
            j1 j1Var18 = null;
            j1 j1Var19 = null;
            j1 j1Var20 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z11 = false;
                        i11 = 6;
                    case 0:
                        j1Var8 = (j1) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, h1.f51569a, j1Var8);
                        i12 |= 1;
                        i11 = 6;
                    case 1:
                        j1Var16 = (j1) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, h1.f51569a, j1Var16);
                        i12 |= 2;
                        i11 = 6;
                    case 2:
                        j1Var17 = (j1) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, h1.f51569a, j1Var17);
                        i12 |= 4;
                    case 3:
                        j1Var18 = (j1) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, h1.f51569a, j1Var18);
                        i12 |= 8;
                    case 4:
                        j1Var19 = (j1) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 4, h1.f51569a, j1Var19);
                        i12 |= 16;
                    case 5:
                        j1Var20 = (j1) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 5, h1.f51569a, j1Var20);
                        i12 |= 32;
                    case 6:
                        j1Var15 = (j1) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, i11, h1.f51569a, j1Var15);
                        i12 |= 64;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            i5 = i12;
            j1Var = j1Var15;
            j1Var2 = j1Var8;
            j1Var3 = j1Var16;
            j1Var4 = j1Var17;
            j1Var5 = j1Var18;
            j1Var6 = j1Var19;
            j1Var7 = j1Var20;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new m1(i5, j1Var2, j1Var3, j1Var4, j1Var5, j1Var6, j1Var7, j1Var);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x003f  */
    @Override // kotlinx.serialization.SerializationStrategy
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void serialize(Encoder encoder, Object obj) {
        m1 m1Var = (m1) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        l1 l1Var = m1.Companion;
        h1 h1Var = h1.f51569a;
        j1 j1Var = m1Var.f51651a;
        j1 j1Var2 = m1Var.f51657g;
        j1 j1Var3 = m1Var.f51656f;
        j1 j1Var4 = m1Var.f51655e;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, h1Var, j1Var);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, h1Var, m1Var.f51652b);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, h1Var, m1Var.f51653c);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 3, h1Var, m1Var.f51654d);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 4)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 4, h1Var, j1Var4);
        } else {
            j1.Companion.getClass();
            if (!Intrinsics.b(j1Var4, j1.f51604c)) {
            }
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 5) || !Intrinsics.b(j1Var3, new j1(true, true))) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 5, h1Var, j1Var3);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 6) || !Intrinsics.b(j1Var2, new j1(false, true))) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 6, h1Var, j1Var2);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
