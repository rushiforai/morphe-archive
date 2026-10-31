package e10;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class s0 implements KSerializer {
    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) throws NumberFormatException {
        String strDecodeString = decoder.decodeString();
        int iS0 = r70.k.S0(strDecodeString, "x", 0, false, 6);
        String strSubstring = strDecodeString.substring(0, iS0);
        Intrinsics.f(strSubstring, "substring(...)");
        int i5 = Integer.parseInt(strSubstring);
        String strSubstring2 = strDecodeString.substring(iS0 + 1);
        Intrinsics.f(strSubstring2, "substring(...)");
        return new t0(i5, Integer.parseInt(r70.k.p1(strSubstring2, " subgrid", strSubstring2)), r70.j.A0(strDecodeString, " subgrid", false));
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return t0.f51820d;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        encoder.encodeString(((t0) obj).a());
    }

    @NotNull
    public final KSerializer<t0> serializer() {
        return t0.Companion;
    }
}
