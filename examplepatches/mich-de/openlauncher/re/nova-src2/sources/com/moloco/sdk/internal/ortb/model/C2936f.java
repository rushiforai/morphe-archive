package com.moloco.sdk.internal.ortb.model;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.moloco.sdk.internal.ortb.model.B;
import com.moloco.sdk.internal.ortb.model.D;
import com.moloco.sdk.internal.ortb.model.y;
import com.moloco.sdk.internal.ortb.model.z;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerialName;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0018\b\u0001\u0018\u0000 /2\u00020\u0001:\u0002\u0019 BC\u0012\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n¢\u0006\u0004\b\f\u0010\rBM\b\u0010\u0012\u0006\u0010\u000f\u001a\u00020\u000e\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\t\u001a\u0004\u0018\u00010\b\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010¢\u0006\u0004\b\f\u0010\u0012J'\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u0013\u001a\u00020\u00002\u0006\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0017\u001a\u00020\u0016H\u0001¢\u0006\u0004\b\u0019\u0010\u001aR\"\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u0019\u0010\u001b\u0012\u0004\b\u001e\u0010\u001f\u001a\u0004\b\u001c\u0010\u001dR\"\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b \u0010!\u0012\u0004\b$\u0010\u001f\u001a\u0004\b\"\u0010#R\"\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b%\u0010&\u0012\u0004\b \u0010\u001f\u001a\u0004\b\u0019\u0010'R\"\u0010\t\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b(\u0010)\u0012\u0004\b,\u0010\u001f\u001a\u0004\b*\u0010+R\"\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\"\u0010-\u0012\u0004\b(\u0010\u001f\u001a\u0004\b%\u0010.¨\u00060"}, d2 = {"Lcom/moloco/sdk/internal/ortb/model/f;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/moloco/sdk/internal/ortb/model/B;", "player", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "mtid", "Lcom/moloco/sdk/internal/ortb/model/z;", "configs", "Lcom/moloco/sdk/internal/ortb/model/D;", "sdkEvents", "Lcom/moloco/sdk/internal/ortb/model/y;", "molocoSdkClickMetaData", "<init>", "(Lcom/moloco/sdk/internal/ortb/model/B;Ljava/lang/String;Lcom/moloco/sdk/internal/ortb/model/z;Lcom/moloco/sdk/internal/ortb/model/D;Lcom/moloco/sdk/internal/ortb/model/y;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "seen0", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "serializationConstructorMarker", "(ILcom/moloco/sdk/internal/ortb/model/B;Ljava/lang/String;Lcom/moloco/sdk/internal/ortb/model/z;Lcom/moloco/sdk/internal/ortb/model/D;Lcom/moloco/sdk/internal/ortb/model/y;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "self", "Lkotlinx/serialization/encoding/CompositeEncoder;", "output", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "serialDesc", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "(Lcom/moloco/sdk/internal/ortb/model/f;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;)V", "Lcom/moloco/sdk/internal/ortb/model/B;", "g", "()Lcom/moloco/sdk/internal/ortb/model/B;", "h", "()V", "b", "Ljava/lang/String;", "e", "()Ljava/lang/String;", InneractiveMediationDefs.GENDER_FEMALE, "c", "Lcom/moloco/sdk/internal/ortb/model/z;", "()Lcom/moloco/sdk/internal/ortb/model/z;", "d", "Lcom/moloco/sdk/internal/ortb/model/D;", "i", "()Lcom/moloco/sdk/internal/ortb/model/D;", "j", "Lcom/moloco/sdk/internal/ortb/model/y;", "()Lcom/moloco/sdk/internal/ortb/model/y;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "moloco-sdk_release"}, k = 1, mv = {2, 0, 0})
@Serializable
/* renamed from: com.moloco.sdk.internal.ortb.model.f, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2936f {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    /* renamed from: f, reason: collision with root package name */
    public static final int f36734f = 8;

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final B player;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final String mtid;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final z configs;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final D sdkEvents;

    /* renamed from: e, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final y molocoSdkClickMetaData;

    @Deprecated
    /* renamed from: com.moloco.sdk.internal.ortb.model.f$a */
    public /* synthetic */ class a implements GeneratedSerializer<C2936f> {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public static final a f36740a;

        /* renamed from: b, reason: collision with root package name */
        public static final int f36741b;

        @NotNull
        private static final SerialDescriptor descriptor;

        static {
            a aVar = new a();
            f36740a = aVar;
            f36741b = 8;
            PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.moloco.sdk.internal.ortb.model.BidExt", aVar, 5);
            pluginGeneratedSerialDescriptor.addElement("player", true);
            pluginGeneratedSerialDescriptor.addElement("mtid", true);
            pluginGeneratedSerialDescriptor.addElement("moloco_sdk_configs", true);
            pluginGeneratedSerialDescriptor.addElement("moloco_sdk_events", true);
            pluginGeneratedSerialDescriptor.addElement("moloco_sdk_click_metadata", true);
            descriptor = pluginGeneratedSerialDescriptor;
        }

        @Override // kotlinx.serialization.DeserializationStrategy
        @NotNull
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final C2936f deserialize(@NotNull Decoder decoder) {
            int i5;
            B b11;
            String str;
            z zVar;
            D d5;
            y yVar;
            Intrinsics.g(decoder, "decoder");
            SerialDescriptor serialDescriptor = descriptor;
            CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
            B b12 = null;
            if (compositeDecoderBeginStructure.decodeSequentially()) {
                B b13 = (B) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 0, B.a.f36647a, null);
                String str2 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, StringSerializer.INSTANCE, null);
                z zVar2 = (z) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, z.a.f36871a, null);
                b11 = b13;
                d5 = (D) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, D.a.f36669a, null);
                yVar = (y) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, y.a.f36866a, null);
                zVar = zVar2;
                str = str2;
                i5 = 31;
            } else {
                boolean z11 = true;
                int i11 = 0;
                String str3 = null;
                z zVar3 = null;
                D d11 = null;
                y yVar2 = null;
                while (z11) {
                    int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                    if (iDecodeElementIndex == -1) {
                        z11 = false;
                    } else if (iDecodeElementIndex == 0) {
                        b12 = (B) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 0, B.a.f36647a, b12);
                        i11 |= 1;
                    } else if (iDecodeElementIndex == 1) {
                        str3 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, StringSerializer.INSTANCE, str3);
                        i11 |= 2;
                    } else if (iDecodeElementIndex == 2) {
                        zVar3 = (z) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, z.a.f36871a, zVar3);
                        i11 |= 4;
                    } else if (iDecodeElementIndex == 3) {
                        d11 = (D) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, D.a.f36669a, d11);
                        i11 |= 8;
                    } else {
                        if (iDecodeElementIndex != 4) {
                            throw new UnknownFieldException(iDecodeElementIndex);
                        }
                        yVar2 = (y) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, y.a.f36866a, yVar2);
                        i11 |= 16;
                    }
                }
                i5 = i11;
                b11 = b12;
                str = str3;
                zVar = zVar3;
                d5 = d11;
                yVar = yVar2;
            }
            compositeDecoderBeginStructure.endStructure(serialDescriptor);
            return new C2936f(i5, b11, str, zVar, d5, yVar, (SerializationConstructorMarker) null);
        }

        @Override // kotlinx.serialization.internal.GeneratedSerializer
        @NotNull
        public final KSerializer<?>[] childSerializers() {
            return new KSerializer[]{BuiltinSerializersKt.getNullable(B.a.f36647a), BuiltinSerializersKt.getNullable(StringSerializer.INSTANCE), BuiltinSerializersKt.getNullable(z.a.f36871a), BuiltinSerializersKt.getNullable(D.a.f36669a), BuiltinSerializersKt.getNullable(y.a.f36866a)};
        }

        @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
        @NotNull
        public final SerialDescriptor getDescriptor() {
            return descriptor;
        }

        @Override // kotlinx.serialization.SerializationStrategy
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final void serialize(@NotNull Encoder encoder, @NotNull C2936f value) {
            Intrinsics.g(encoder, "encoder");
            Intrinsics.g(value, "value");
            SerialDescriptor serialDescriptor = descriptor;
            CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
            C2936f.a(value, compositeEncoderBeginStructure, serialDescriptor);
            compositeEncoderBeginStructure.endStructure(serialDescriptor);
        }
    }

    /* renamed from: com.moloco.sdk.internal.ortb.model.f$b, reason: from kotlin metadata */
    public static final class Companion {
        public Companion() {
        }

        @NotNull
        public final KSerializer<C2936f> serializer() {
            return a.f36740a;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public C2936f() {
        this((B) null, (String) null, (z) null, (D) null, (y) null, 31, (DefaultConstructorMarker) null);
    }

    @JvmStatic
    public static final /* synthetic */ void a(C2936f self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.player != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, B.a.f36647a, self.player);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.mtid != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, StringSerializer.INSTANCE, self.mtid);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.configs != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, z.a.f36871a, self.configs);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.sdkEvents != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, D.a.f36669a, self.sdkEvents);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 4) && self.molocoSdkClickMetaData == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 4, y.a.f36866a, self.molocoSdkClickMetaData);
    }

    @SerialName("moloco_sdk_configs")
    public static /* synthetic */ void b() {
    }

    @SerialName("moloco_sdk_click_metadata")
    public static /* synthetic */ void d() {
    }

    @SerialName("mtid")
    public static /* synthetic */ void f() {
    }

    @SerialName("player")
    public static /* synthetic */ void h() {
    }

    @SerialName("moloco_sdk_events")
    public static /* synthetic */ void j() {
    }

    @Nullable
    /* renamed from: c, reason: from getter */
    public final y getMolocoSdkClickMetaData() {
        return this.molocoSdkClickMetaData;
    }

    @Nullable
    /* renamed from: e, reason: from getter */
    public final String getMtid() {
        return this.mtid;
    }

    @Nullable
    /* renamed from: g, reason: from getter */
    public final B getPlayer() {
        return this.player;
    }

    @Nullable
    /* renamed from: i, reason: from getter */
    public final D getSdkEvents() {
        return this.sdkEvents;
    }

    public /* synthetic */ C2936f(int i5, B b11, String str, z zVar, D d5, y yVar, SerializationConstructorMarker serializationConstructorMarker) {
        if ((i5 & 1) == 0) {
            this.player = null;
        } else {
            this.player = b11;
        }
        if ((i5 & 2) == 0) {
            this.mtid = null;
        } else {
            this.mtid = str;
        }
        if ((i5 & 4) == 0) {
            this.configs = null;
        } else {
            this.configs = zVar;
        }
        if ((i5 & 8) == 0) {
            this.sdkEvents = null;
        } else {
            this.sdkEvents = d5;
        }
        if ((i5 & 16) == 0) {
            this.molocoSdkClickMetaData = null;
        } else {
            this.molocoSdkClickMetaData = yVar;
        }
    }

    @Nullable
    /* renamed from: a, reason: from getter */
    public final z getConfigs() {
        return this.configs;
    }

    public C2936f(@Nullable B b11, @Nullable String str, @Nullable z zVar, @Nullable D d5, @Nullable y yVar) {
        this.player = b11;
        this.mtid = str;
        this.configs = zVar;
        this.sdkEvents = d5;
        this.molocoSdkClickMetaData = yVar;
    }

    public /* synthetic */ C2936f(B b11, String str, z zVar, D d5, y yVar, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : b11, (i5 & 2) != 0 ? null : str, (i5 & 4) != 0 ? null : zVar, (i5 & 8) != 0 ? null : d5, (i5 & 16) != 0 ? null : yVar);
    }
}
