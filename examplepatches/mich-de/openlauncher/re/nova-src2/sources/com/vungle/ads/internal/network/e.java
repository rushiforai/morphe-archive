package com.vungle.ads.internal.network;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.EnumDescriptor;
import kotlinx.serialization.internal.GeneratedSerializer;

/* loaded from: classes4.dex */
public final class e implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final e f47239a = new e();

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ EnumDescriptor f47240b;

    static {
        EnumDescriptor enumDescriptor = new EnumDescriptor("com.vungle.ads.internal.network.HttpMethod", 2);
        enumDescriptor.addElement("GET", false);
        enumDescriptor.addElement("POST", false);
        f47240b = enumDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[0];
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        Intrinsics.g(decoder, "decoder");
        return g.values()[decoder.decodeEnum(f47240b)];
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return f47240b;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        g value = (g) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        encoder.encodeEnum(f47240b, value.ordinal());
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] typeParametersSerializers() {
        return GeneratedSerializer.DefaultImpls.typeParametersSerializers(this);
    }
}
