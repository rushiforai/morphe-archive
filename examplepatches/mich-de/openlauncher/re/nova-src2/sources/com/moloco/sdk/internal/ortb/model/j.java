package com.moloco.sdk.internal.ortb.model;

import android.graphics.Color;
import i2.r0;
import kotlin.NotImplementedError;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.descriptors.PrimitiveKind;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialDescriptorsKt;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class j implements KSerializer<i2.s> {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final j f36759a = new j();

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final SerialDescriptor f36760b = SerialDescriptorsKt.PrimitiveSerialDescriptor("Color", PrimitiveKind.STRING.INSTANCE);

    public long a(@NotNull Decoder decoder) {
        Intrinsics.g(decoder, "decoder");
        return r0.b(Color.parseColor(decoder.decodeString()));
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public /* synthetic */ Object deserialize(Decoder decoder) {
        return new i2.s(a(decoder));
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    @NotNull
    public SerialDescriptor getDescriptor() {
        return f36760b;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public /* synthetic */ void serialize(Encoder encoder, Object obj) {
        a(encoder, ((i2.s) obj).f61148a);
    }

    public void a(@NotNull Encoder encoder, long j11) {
        Intrinsics.g(encoder, "encoder");
        throw new NotImplementedError("Color encoding is not supported");
    }
}
