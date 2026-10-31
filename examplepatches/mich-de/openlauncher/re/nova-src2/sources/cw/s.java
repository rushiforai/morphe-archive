package cw;

import android.os.Parcelable;
import com.stripe.android.ui.core.elements.BacsDebitBankAccountSpec;
import com.stripe.android.uicore.elements.IdentifierSpec;
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

/* loaded from: classes4.dex */
public final /* synthetic */ class s implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final s f48290a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        s sVar = new s();
        f48290a = sVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.ui.core.elements.BacsDebitBankAccountSpec", sVar, 3);
        pluginGeneratedSerialDescriptor.addElement("sortCodeIdentifier", true);
        pluginGeneratedSerialDescriptor.addElement("accountNumberIdentifier", true);
        pluginGeneratedSerialDescriptor.addElement("apiPath", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        kw.y0 y0Var = kw.y0.f72733a;
        return new KSerializer[]{y0Var, y0Var, y0Var};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        IdentifierSpec identifierSpec;
        IdentifierSpec identifierSpec2;
        IdentifierSpec identifierSpec3;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        IdentifierSpec identifierSpec4 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            kw.y0 y0Var = kw.y0.f72733a;
            identifierSpec = (IdentifierSpec) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, y0Var, null);
            identifierSpec2 = (IdentifierSpec) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, y0Var, null);
            identifierSpec3 = (IdentifierSpec) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, y0Var, null);
            i5 = 7;
        } else {
            boolean z11 = true;
            int i11 = 0;
            IdentifierSpec identifierSpec5 = null;
            IdentifierSpec identifierSpec6 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    identifierSpec4 = (IdentifierSpec) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kw.y0.f72733a, identifierSpec4);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    identifierSpec5 = (IdentifierSpec) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kw.y0.f72733a, identifierSpec5);
                    i11 |= 2;
                } else {
                    if (iDecodeElementIndex != 2) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    identifierSpec6 = (IdentifierSpec) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, kw.y0.f72733a, identifierSpec6);
                    i11 |= 4;
                }
            }
            i5 = i11;
            identifierSpec = identifierSpec4;
            identifierSpec2 = identifierSpec5;
            identifierSpec3 = identifierSpec6;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new BacsDebitBankAccountSpec(i5, identifierSpec, identifierSpec2, identifierSpec3);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0033  */
    @Override // kotlinx.serialization.SerializationStrategy
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void serialize(Encoder encoder, Object obj) {
        BacsDebitBankAccountSpec value = (BacsDebitBankAccountSpec) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        IdentifierSpec identifierSpec = value.f45294c;
        IdentifierSpec identifierSpec2 = value.f45293b;
        IdentifierSpec identifierSpec3 = value.f45292a;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        Parcelable.Creator<BacsDebitBankAccountSpec> creator = BacsDebitBankAccountSpec.CREATOR;
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 0)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, kw.y0.f72733a, identifierSpec3);
        } else {
            IdentifierSpec.Companion.getClass();
            if (!Intrinsics.b(identifierSpec3, kw.z0.a("bacs_debit[sort_code]"))) {
            }
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 1)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, kw.y0.f72733a, identifierSpec2);
        } else {
            IdentifierSpec.Companion.getClass();
            if (!Intrinsics.b(identifierSpec2, kw.z0.a("bacs_debit[account_number]"))) {
            }
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 2) || !Intrinsics.b(identifierSpec, new IdentifierSpec())) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, kw.y0.f72733a, identifierSpec);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
