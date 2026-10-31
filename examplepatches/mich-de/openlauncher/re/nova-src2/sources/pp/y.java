package pp;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialDescriptorsKt;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;

/* loaded from: classes4.dex */
public final class y implements KSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final y f82794a = new y();

    /* renamed from: b, reason: collision with root package name */
    public static final SerialDescriptor f82795b = SerialDescriptorsKt.buildClassSerialDescriptor("LinkOpenType", new SerialDescriptor[0], new nq.a(21));

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        Intrinsics.g(decoder, "decoder");
        int iDecodeInt = decoder.decodeInt();
        r rVar = r.f82767d;
        if (iDecodeInt == 0) {
            return rVar;
        }
        r rVar2 = r.f82769f;
        if (iDecodeInt == 1) {
            return rVar2;
        }
        if (iDecodeInt == 2) {
            return t.f82774c;
        }
        r rVar3 = r.f82773j;
        if (iDecodeInt == 3) {
            return rVar3;
        }
        r rVar4 = r.f82766c;
        if (iDecodeInt == 4) {
            return rVar4;
        }
        r rVar5 = r.f82768e;
        if (iDecodeInt == 5) {
            return rVar5;
        }
        r rVar6 = r.f82771h;
        if (iDecodeInt == 6) {
            return rVar6;
        }
        return iDecodeInt == 7 ? r.f82772i : r.f82770g;
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return f82795b;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        u value = (u) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        encoder.encodeInt(value.f82776b);
    }
}
