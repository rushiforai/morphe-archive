package com.moloco.sdk.internal.ortb.model;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
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
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.FloatSerializer;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u0007\n\u0002\b\u0004\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0012\b\u0001\u0018\u0000 &2\u00020\u0001:\u0002\u0016\u001dBC\u0012\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\t\u0010\nBM\b\u0010\u0012\u0006\u0010\f\u001a\u00020\u000b\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\r¢\u0006\u0004\b\t\u0010\u000fJ'\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0010\u001a\u00020\u00002\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u0013H\u0001¢\u0006\u0004\b\u0016\u0010\u0017R\"\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u0016\u0010\u0018\u0012\u0004\b\u001b\u0010\u001c\u001a\u0004\b\u0019\u0010\u001aR\"\u0010\u0004\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u001d\u0010\u0018\u0012\u0004\b\u001f\u0010\u001c\u001a\u0004\b\u001e\u0010\u001aR\"\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b \u0010\u0018\u0012\u0004\b\u001d\u0010\u001c\u001a\u0004\b\u0016\u0010\u001aR\"\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b!\u0010\"\u0012\u0004\b!\u0010\u001c\u001a\u0004\b \u0010#R\"\u0010\b\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b$\u0010\u0018\u0012\u0004\b%\u0010\u001c\u001a\u0004\b$\u0010\u001a¨\u0006'"}, d2 = {"Lcom/moloco/sdk/internal/ortb/model/u;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "serverRenderingIgnoreNetErrFailed", "composeRemovalEnabled", "adaptiveBannerBlurBgEnabled", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "adaptiveBannerBlurGapThreshold", "bannerNonHtmlAdmCheckEnabled", "<init>", "(Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Float;Ljava/lang/Boolean;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "seen0", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "serializationConstructorMarker", "(ILjava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Float;Ljava/lang/Boolean;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "self", "Lkotlinx/serialization/encoding/CompositeEncoder;", "output", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "serialDesc", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "(Lcom/moloco/sdk/internal/ortb/model/u;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;)V", "Ljava/lang/Boolean;", "i", "()Ljava/lang/Boolean;", "j", "()V", "b", "g", "h", "c", "d", "Ljava/lang/Float;", "()Ljava/lang/Float;", "e", InneractiveMediationDefs.GENDER_FEMALE, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "moloco-sdk_release"}, k = 1, mv = {2, 0, 0})
@Serializable
/* loaded from: classes4.dex */
public final class u {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    /* renamed from: f, reason: collision with root package name */
    public static final int f36834f = 0;

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final Boolean serverRenderingIgnoreNetErrFailed;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final Boolean composeRemovalEnabled;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final Boolean adaptiveBannerBlurBgEnabled;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final Float adaptiveBannerBlurGapThreshold;

    /* renamed from: e, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final Boolean bannerNonHtmlAdmCheckEnabled;

    @Deprecated
    public /* synthetic */ class a implements GeneratedSerializer<u> {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public static final a f36840a;

        /* renamed from: b, reason: collision with root package name */
        public static final int f36841b;

        @NotNull
        private static final SerialDescriptor descriptor;

        static {
            a aVar = new a();
            f36840a = aVar;
            f36841b = 8;
            PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.moloco.sdk.internal.ortb.model.ExperimentalConfigs", aVar, 5);
            pluginGeneratedSerialDescriptor.addElement("server_rendering_ignore_net_err_failed", true);
            pluginGeneratedSerialDescriptor.addElement("compose_removal_enabled", true);
            pluginGeneratedSerialDescriptor.addElement("adaptive_banner_blur_bg_enabled", true);
            pluginGeneratedSerialDescriptor.addElement("adaptive_banner_blur_gap_threshold", true);
            pluginGeneratedSerialDescriptor.addElement("banner_non_html_adm_check_enabled", true);
            descriptor = pluginGeneratedSerialDescriptor;
        }

        @Override // kotlinx.serialization.DeserializationStrategy
        @NotNull
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final u deserialize(@NotNull Decoder decoder) {
            int i5;
            Boolean bool;
            Boolean bool2;
            Boolean bool3;
            Float f11;
            Boolean bool4;
            Intrinsics.g(decoder, "decoder");
            SerialDescriptor serialDescriptor = descriptor;
            CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
            Boolean bool5 = null;
            if (compositeDecoderBeginStructure.decodeSequentially()) {
                BooleanSerializer booleanSerializer = BooleanSerializer.INSTANCE;
                Boolean bool6 = (Boolean) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 0, booleanSerializer, null);
                Boolean bool7 = (Boolean) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, booleanSerializer, null);
                Boolean bool8 = (Boolean) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, booleanSerializer, null);
                Float f12 = (Float) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, FloatSerializer.INSTANCE, null);
                bool4 = (Boolean) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, booleanSerializer, null);
                f11 = f12;
                i5 = 31;
                bool3 = bool8;
                bool2 = bool7;
                bool = bool6;
            } else {
                boolean z11 = true;
                int i11 = 0;
                Boolean bool9 = null;
                Boolean bool10 = null;
                Float f13 = null;
                Boolean bool11 = null;
                while (z11) {
                    int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                    if (iDecodeElementIndex == -1) {
                        z11 = false;
                    } else if (iDecodeElementIndex == 0) {
                        bool5 = (Boolean) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 0, BooleanSerializer.INSTANCE, bool5);
                        i11 |= 1;
                    } else if (iDecodeElementIndex == 1) {
                        bool9 = (Boolean) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, BooleanSerializer.INSTANCE, bool9);
                        i11 |= 2;
                    } else if (iDecodeElementIndex == 2) {
                        bool10 = (Boolean) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, BooleanSerializer.INSTANCE, bool10);
                        i11 |= 4;
                    } else if (iDecodeElementIndex == 3) {
                        f13 = (Float) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, FloatSerializer.INSTANCE, f13);
                        i11 |= 8;
                    } else {
                        if (iDecodeElementIndex != 4) {
                            throw new UnknownFieldException(iDecodeElementIndex);
                        }
                        bool11 = (Boolean) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, BooleanSerializer.INSTANCE, bool11);
                        i11 |= 16;
                    }
                }
                i5 = i11;
                bool = bool5;
                bool2 = bool9;
                bool3 = bool10;
                f11 = f13;
                bool4 = bool11;
            }
            compositeDecoderBeginStructure.endStructure(serialDescriptor);
            return new u(i5, bool, bool2, bool3, f11, bool4, (SerializationConstructorMarker) null);
        }

        @Override // kotlinx.serialization.internal.GeneratedSerializer
        @NotNull
        public final KSerializer<?>[] childSerializers() {
            BooleanSerializer booleanSerializer = BooleanSerializer.INSTANCE;
            return new KSerializer[]{BuiltinSerializersKt.getNullable(booleanSerializer), BuiltinSerializersKt.getNullable(booleanSerializer), BuiltinSerializersKt.getNullable(booleanSerializer), BuiltinSerializersKt.getNullable(FloatSerializer.INSTANCE), BuiltinSerializersKt.getNullable(booleanSerializer)};
        }

        @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
        @NotNull
        public final SerialDescriptor getDescriptor() {
            return descriptor;
        }

        @Override // kotlinx.serialization.SerializationStrategy
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final void serialize(@NotNull Encoder encoder, @NotNull u value) {
            Intrinsics.g(encoder, "encoder");
            Intrinsics.g(value, "value");
            SerialDescriptor serialDescriptor = descriptor;
            CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
            u.a(value, compositeEncoderBeginStructure, serialDescriptor);
            compositeEncoderBeginStructure.endStructure(serialDescriptor);
        }
    }

    /* renamed from: com.moloco.sdk.internal.ortb.model.u$b, reason: from kotlin metadata */
    public static final class Companion {
        public Companion() {
        }

        @NotNull
        public final KSerializer<u> serializer() {
            return a.f36840a;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public u() {
        this((Boolean) null, (Boolean) null, (Boolean) null, (Float) null, (Boolean) null, 31, (DefaultConstructorMarker) null);
    }

    @JvmStatic
    public static final /* synthetic */ void a(u self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.serverRenderingIgnoreNetErrFailed != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, BooleanSerializer.INSTANCE, self.serverRenderingIgnoreNetErrFailed);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || self.composeRemovalEnabled != null) {
            output.encodeNullableSerializableElement(serialDesc, 1, BooleanSerializer.INSTANCE, self.composeRemovalEnabled);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.adaptiveBannerBlurBgEnabled != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, BooleanSerializer.INSTANCE, self.adaptiveBannerBlurBgEnabled);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.adaptiveBannerBlurGapThreshold != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, FloatSerializer.INSTANCE, self.adaptiveBannerBlurGapThreshold);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 4) && self.bannerNonHtmlAdmCheckEnabled == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 4, BooleanSerializer.INSTANCE, self.bannerNonHtmlAdmCheckEnabled);
    }

    @SerialName("adaptive_banner_blur_bg_enabled")
    public static /* synthetic */ void b() {
    }

    @SerialName("adaptive_banner_blur_gap_threshold")
    public static /* synthetic */ void d() {
    }

    @SerialName("banner_non_html_adm_check_enabled")
    public static /* synthetic */ void f() {
    }

    @SerialName("compose_removal_enabled")
    public static /* synthetic */ void h() {
    }

    @SerialName("server_rendering_ignore_net_err_failed")
    public static /* synthetic */ void j() {
    }

    @Nullable
    /* renamed from: c, reason: from getter */
    public final Float getAdaptiveBannerBlurGapThreshold() {
        return this.adaptiveBannerBlurGapThreshold;
    }

    @Nullable
    /* renamed from: e, reason: from getter */
    public final Boolean getBannerNonHtmlAdmCheckEnabled() {
        return this.bannerNonHtmlAdmCheckEnabled;
    }

    @Nullable
    /* renamed from: g, reason: from getter */
    public final Boolean getComposeRemovalEnabled() {
        return this.composeRemovalEnabled;
    }

    @Nullable
    /* renamed from: i, reason: from getter */
    public final Boolean getServerRenderingIgnoreNetErrFailed() {
        return this.serverRenderingIgnoreNetErrFailed;
    }

    public /* synthetic */ u(int i5, Boolean bool, Boolean bool2, Boolean bool3, Float f11, Boolean bool4, SerializationConstructorMarker serializationConstructorMarker) {
        if ((i5 & 1) == 0) {
            this.serverRenderingIgnoreNetErrFailed = null;
        } else {
            this.serverRenderingIgnoreNetErrFailed = bool;
        }
        if ((i5 & 2) == 0) {
            this.composeRemovalEnabled = null;
        } else {
            this.composeRemovalEnabled = bool2;
        }
        if ((i5 & 4) == 0) {
            this.adaptiveBannerBlurBgEnabled = null;
        } else {
            this.adaptiveBannerBlurBgEnabled = bool3;
        }
        if ((i5 & 8) == 0) {
            this.adaptiveBannerBlurGapThreshold = null;
        } else {
            this.adaptiveBannerBlurGapThreshold = f11;
        }
        if ((i5 & 16) == 0) {
            this.bannerNonHtmlAdmCheckEnabled = null;
        } else {
            this.bannerNonHtmlAdmCheckEnabled = bool4;
        }
    }

    @Nullable
    /* renamed from: a, reason: from getter */
    public final Boolean getAdaptiveBannerBlurBgEnabled() {
        return this.adaptiveBannerBlurBgEnabled;
    }

    public u(@Nullable Boolean bool, @Nullable Boolean bool2, @Nullable Boolean bool3, @Nullable Float f11, @Nullable Boolean bool4) {
        this.serverRenderingIgnoreNetErrFailed = bool;
        this.composeRemovalEnabled = bool2;
        this.adaptiveBannerBlurBgEnabled = bool3;
        this.adaptiveBannerBlurGapThreshold = f11;
        this.bannerNonHtmlAdmCheckEnabled = bool4;
    }

    public /* synthetic */ u(Boolean bool, Boolean bool2, Boolean bool3, Float f11, Boolean bool4, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : bool, (i5 & 2) != 0 ? null : bool2, (i5 & 4) != 0 ? null : bool3, (i5 & 8) != 0 ? null : f11, (i5 & 16) != 0 ? null : bool4);
    }
}
