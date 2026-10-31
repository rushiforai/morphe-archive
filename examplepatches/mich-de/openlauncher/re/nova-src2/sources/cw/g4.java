package cw;

import com.stripe.android.ui.core.elements.SelectorIcon;
import com.stripe.android.ui.core.elements.SharedDataSpec;
import com.tiktok.util.TTConst;
import java.util.ArrayList;
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

/* loaded from: classes4.dex */
public final /* synthetic */ class g4 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final g4 f48155a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        g4 g4Var = new g4();
        f48155a = g4Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.ui.core.elements.SharedDataSpec", g4Var, 3);
        pluginGeneratedSerialDescriptor.addElement(TTConst.TRACK_TYPE, false);
        pluginGeneratedSerialDescriptor.addElement("fields", true);
        pluginGeneratedSerialDescriptor.addElement("selector_icon", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{StringSerializer.INSTANCE, SharedDataSpec.f45336d[1], BuiltinSerializersKt.getNullable(y3.f48389a)};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        String strDecodeStringElement;
        ArrayList arrayList;
        SelectorIcon selectorIcon;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = SharedDataSpec.f45336d;
        String strDecodeStringElement2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
            arrayList = (ArrayList) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], null);
            selectorIcon = (SelectorIcon) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, y3.f48389a, null);
            i5 = 7;
        } else {
            boolean z11 = true;
            int i11 = 0;
            ArrayList arrayList2 = null;
            SelectorIcon selectorIcon2 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    arrayList2 = (ArrayList) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], arrayList2);
                    i11 |= 2;
                } else {
                    if (iDecodeElementIndex != 2) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    selectorIcon2 = (SelectorIcon) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, y3.f48389a, selectorIcon2);
                    i11 |= 4;
                }
            }
            i5 = i11;
            strDecodeStringElement = strDecodeStringElement2;
            arrayList = arrayList2;
            selectorIcon = selectorIcon2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new SharedDataSpec(i5, strDecodeStringElement, arrayList, selectorIcon);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        SharedDataSpec value = (SharedDataSpec) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = SharedDataSpec.f45336d;
        String str = value.f45337a;
        SelectorIcon selectorIcon = value.f45339c;
        ArrayList arrayList = value.f45338b;
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 0, str);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 1) || !Intrinsics.b(arrayList, new ArrayList())) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], arrayList);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 2) || selectorIcon != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 2, y3.f48389a, selectorIcon);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
