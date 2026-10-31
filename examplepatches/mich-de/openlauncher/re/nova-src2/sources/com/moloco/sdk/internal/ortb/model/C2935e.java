package com.moloco.sdk.internal.ortb.model;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.moloco.sdk.internal.ortb.model.C2936f;
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
import kotlinx.serialization.internal.FloatSerializer;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u001b\b\u0001\u0018\u0000 32\u00020\u0001:\u0002\u001a\u001eB[\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\b\u001a\u00020\u0007\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u000b¢\u0006\u0004\b\u000e\u0010\u000fBi\b\u0010\u0012\u0006\u0010\u0010\u001a\u00020\u000b\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\t\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\f\u001a\u0004\u0018\u00010\u000b\u0012\b\u0010\r\u001a\u0004\u0018\u00010\u000b\u0012\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011¢\u0006\u0004\b\u000e\u0010\u0013J'\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u0014\u001a\u00020\u00002\u0006\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0018\u001a\u00020\u0017H\u0001¢\u0006\u0004\b\u001a\u0010\u001bR \u0010\u0003\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u001a\u0010\u001c\u0012\u0004\b\u001e\u0010\u001f\u001a\u0004\b\u001a\u0010\u001dR \u0010\u0005\u001a\u00020\u00048\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u001e\u0010 \u0012\u0004\b#\u0010\u001f\u001a\u0004\b!\u0010\"R\"\u0010\u0006\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b$\u0010\u001c\u0012\u0004\b&\u0010\u001f\u001a\u0004\b%\u0010\u001dR \u0010\b\u001a\u00020\u00078\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b'\u0010(\u0012\u0004\b+\u0010\u001f\u001a\u0004\b)\u0010*R\"\u0010\t\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b%\u0010\u001c\u0012\u0004\b\r\u0010\u001f\u001a\u0004\b,\u0010\u001dR\"\u0010\n\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b&\u0010\u001c\u0012\u0004\b'\u0010\u001f\u001a\u0004\b$\u0010\u001dR\"\u0010\f\u001a\u0004\u0018\u00010\u000b8\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b,\u0010-\u0012\u0004\b0\u0010\u001f\u001a\u0004\b.\u0010/R\"\u0010\r\u001a\u0004\u0018\u00010\u000b8\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\r\u0010-\u0012\u0004\b2\u0010\u001f\u001a\u0004\b1\u0010/¨\u00064"}, d2 = {"Lcom/moloco/sdk/internal/ortb/model/e;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "adm", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "price", "burl", "Lcom/moloco/sdk/internal/ortb/model/f;", "ext", "crid", "bundle", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "w", "h", "<init>", "(Ljava/lang/String;FLjava/lang/String;Lcom/moloco/sdk/internal/ortb/model/f;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V", "seen0", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "serializationConstructorMarker", "(ILjava/lang/String;FLjava/lang/String;Lcom/moloco/sdk/internal/ortb/model/f;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "self", "Lkotlinx/serialization/encoding/CompositeEncoder;", "output", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "serialDesc", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "(Lcom/moloco/sdk/internal/ortb/model/e;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;)V", "Ljava/lang/String;", "()Ljava/lang/String;", "b", "()V", "F", InneractiveMediationDefs.GENDER_MALE, "()F", "n", "c", "e", InneractiveMediationDefs.GENDER_FEMALE, "d", "Lcom/moloco/sdk/internal/ortb/model/f;", "i", "()Lcom/moloco/sdk/internal/ortb/model/f;", "j", "g", "Ljava/lang/Integer;", "o", "()Ljava/lang/Integer;", "p", "k", "l", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "moloco-sdk_release"}, k = 1, mv = {2, 0, 0})
@Serializable
/* renamed from: com.moloco.sdk.internal.ortb.model.e, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2935e {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    /* renamed from: i, reason: collision with root package name */
    public static final int f36723i = 8;

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final String adm;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    public final float price;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final String burl;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final C2936f ext;

    /* renamed from: e, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final String crid;

    /* renamed from: f, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final String bundle;

    /* renamed from: g, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final Integer w;

    @Nullable
    public final Integer h;

    @Deprecated
    /* renamed from: com.moloco.sdk.internal.ortb.model.e$a */
    public /* synthetic */ class a implements GeneratedSerializer<C2935e> {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public static final a f36732a;

        /* renamed from: b, reason: collision with root package name */
        public static final int f36733b;

        @NotNull
        private static final SerialDescriptor descriptor;

        static {
            a aVar = new a();
            f36732a = aVar;
            f36733b = 8;
            PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.moloco.sdk.internal.ortb.model.Bid", aVar, 8);
            pluginGeneratedSerialDescriptor.addElement("adm", false);
            pluginGeneratedSerialDescriptor.addElement("price", false);
            pluginGeneratedSerialDescriptor.addElement("burl", true);
            pluginGeneratedSerialDescriptor.addElement("ext", false);
            pluginGeneratedSerialDescriptor.addElement("crid", true);
            pluginGeneratedSerialDescriptor.addElement("bundle", true);
            pluginGeneratedSerialDescriptor.addElement("w", true);
            pluginGeneratedSerialDescriptor.addElement("h", true);
            descriptor = pluginGeneratedSerialDescriptor;
        }

        @Override // kotlinx.serialization.DeserializationStrategy
        @NotNull
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final C2935e deserialize(@NotNull Decoder decoder) {
            float f11;
            Integer num;
            Integer num2;
            String str;
            int i5;
            String str2;
            String str3;
            C2936f c2936f;
            String str4;
            Intrinsics.g(decoder, "decoder");
            SerialDescriptor serialDescriptor = descriptor;
            CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
            int i11 = 7;
            if (compositeDecoderBeginStructure.decodeSequentially()) {
                String strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
                float fDecodeFloatElement = compositeDecoderBeginStructure.decodeFloatElement(serialDescriptor, 1);
                StringSerializer stringSerializer = StringSerializer.INSTANCE;
                String str5 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, stringSerializer, null);
                C2936f c2936f2 = (C2936f) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, C2936f.a.f36740a, null);
                String str6 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, stringSerializer, null);
                String str7 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 5, stringSerializer, null);
                IntSerializer intSerializer = IntSerializer.INSTANCE;
                Integer num3 = (Integer) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 6, intSerializer, null);
                str2 = strDecodeStringElement;
                num = (Integer) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 7, intSerializer, null);
                num2 = num3;
                str = str7;
                c2936f = c2936f2;
                str4 = str6;
                str3 = str5;
                f11 = fDecodeFloatElement;
                i5 = 255;
            } else {
                float fDecodeFloatElement2 = 0.0f;
                boolean z11 = true;
                Integer num4 = null;
                Integer num5 = null;
                String strDecodeStringElement2 = null;
                String str8 = null;
                C2936f c2936f3 = null;
                String str9 = null;
                int i12 = 0;
                String str10 = null;
                while (z11) {
                    int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                    switch (iDecodeElementIndex) {
                        case -1:
                            z11 = false;
                        case 0:
                            i12 |= 1;
                            strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
                            i11 = 7;
                        case 1:
                            fDecodeFloatElement2 = compositeDecoderBeginStructure.decodeFloatElement(serialDescriptor, 1);
                            i12 |= 2;
                            i11 = 7;
                        case 2:
                            str8 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, StringSerializer.INSTANCE, str8);
                            i12 |= 4;
                            i11 = 7;
                        case 3:
                            c2936f3 = (C2936f) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, C2936f.a.f36740a, c2936f3);
                            i12 |= 8;
                            i11 = 7;
                        case 4:
                            str9 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, StringSerializer.INSTANCE, str9);
                            i12 |= 16;
                        case 5:
                            str10 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 5, StringSerializer.INSTANCE, str10);
                            i12 |= 32;
                        case 6:
                            num5 = (Integer) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 6, IntSerializer.INSTANCE, num5);
                            i12 |= 64;
                        case 7:
                            num4 = (Integer) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, i11, IntSerializer.INSTANCE, num4);
                            i12 |= 128;
                        default:
                            throw new UnknownFieldException(iDecodeElementIndex);
                    }
                }
                f11 = fDecodeFloatElement2;
                num = num4;
                num2 = num5;
                str = str10;
                i5 = i12;
                str2 = strDecodeStringElement2;
                str3 = str8;
                c2936f = c2936f3;
                str4 = str9;
            }
            compositeDecoderBeginStructure.endStructure(serialDescriptor);
            return new C2935e(i5, str2, f11, str3, c2936f, str4, str, num2, num, (SerializationConstructorMarker) null);
        }

        @Override // kotlinx.serialization.internal.GeneratedSerializer
        @NotNull
        public final KSerializer<?>[] childSerializers() {
            StringSerializer stringSerializer = StringSerializer.INSTANCE;
            KSerializer<?> nullable = BuiltinSerializersKt.getNullable(stringSerializer);
            KSerializer<?> nullable2 = BuiltinSerializersKt.getNullable(stringSerializer);
            KSerializer<?> nullable3 = BuiltinSerializersKt.getNullable(stringSerializer);
            IntSerializer intSerializer = IntSerializer.INSTANCE;
            return new KSerializer[]{stringSerializer, FloatSerializer.INSTANCE, nullable, C2936f.a.f36740a, nullable2, nullable3, BuiltinSerializersKt.getNullable(intSerializer), BuiltinSerializersKt.getNullable(intSerializer)};
        }

        @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
        @NotNull
        public final SerialDescriptor getDescriptor() {
            return descriptor;
        }

        @Override // kotlinx.serialization.SerializationStrategy
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final void serialize(@NotNull Encoder encoder, @NotNull C2935e value) {
            Intrinsics.g(encoder, "encoder");
            Intrinsics.g(value, "value");
            SerialDescriptor serialDescriptor = descriptor;
            CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
            C2935e.a(value, compositeEncoderBeginStructure, serialDescriptor);
            compositeEncoderBeginStructure.endStructure(serialDescriptor);
        }
    }

    /* renamed from: com.moloco.sdk.internal.ortb.model.e$b, reason: from kotlin metadata */
    public static final class Companion {
        public Companion() {
        }

        @NotNull
        public final KSerializer<C2935e> serializer() {
            return a.f36732a;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public /* synthetic */ C2935e(int i5, String str, float f11, String str2, C2936f c2936f, String str3, String str4, Integer num, Integer num2, SerializationConstructorMarker serializationConstructorMarker) {
        if (11 != (i5 & 11)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 11, a.f36732a.getDescriptor());
        }
        this.adm = str;
        this.price = f11;
        if ((i5 & 4) == 0) {
            this.burl = null;
        } else {
            this.burl = str2;
        }
        this.ext = c2936f;
        if ((i5 & 16) == 0) {
            this.crid = null;
        } else {
            this.crid = str3;
        }
        if ((i5 & 32) == 0) {
            this.bundle = null;
        } else {
            this.bundle = str4;
        }
        if ((i5 & 64) == 0) {
            this.w = null;
        } else {
            this.w = num;
        }
        if ((i5 & 128) == 0) {
            this.h = null;
        } else {
            this.h = num2;
        }
    }

    @JvmStatic
    public static final /* synthetic */ void a(C2935e self, CompositeEncoder output, SerialDescriptor serialDesc) {
        output.encodeStringElement(serialDesc, 0, self.adm);
        output.encodeFloatElement(serialDesc, 1, self.price);
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.burl != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, StringSerializer.INSTANCE, self.burl);
        }
        output.encodeSerializableElement(serialDesc, 3, C2936f.a.f36740a, self.ext);
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.crid != null) {
            output.encodeNullableSerializableElement(serialDesc, 4, StringSerializer.INSTANCE, self.crid);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 5) || self.bundle != null) {
            output.encodeNullableSerializableElement(serialDesc, 5, StringSerializer.INSTANCE, self.bundle);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 6) || self.w != null) {
            output.encodeNullableSerializableElement(serialDesc, 6, IntSerializer.INSTANCE, self.w);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 7) && self.h == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 7, IntSerializer.INSTANCE, self.h);
    }

    @SerialName("adm")
    public static /* synthetic */ void b() {
    }

    @SerialName("bundle")
    public static /* synthetic */ void d() {
    }

    @SerialName("burl")
    public static /* synthetic */ void f() {
    }

    @SerialName("crid")
    public static /* synthetic */ void h() {
    }

    @SerialName("ext")
    public static /* synthetic */ void j() {
    }

    @SerialName("h")
    public static /* synthetic */ void l() {
    }

    @SerialName("price")
    public static /* synthetic */ void n() {
    }

    @SerialName("w")
    public static /* synthetic */ void p() {
    }

    @Nullable
    /* renamed from: c, reason: from getter */
    public final String getBundle() {
        return this.bundle;
    }

    @Nullable
    /* renamed from: e, reason: from getter */
    public final String getBurl() {
        return this.burl;
    }

    @Nullable
    /* renamed from: g, reason: from getter */
    public final String getCrid() {
        return this.crid;
    }

    @NotNull
    /* renamed from: i, reason: from getter */
    public final C2936f getExt() {
        return this.ext;
    }

    @Nullable
    /* renamed from: k, reason: from getter */
    public final Integer getH() {
        return this.h;
    }

    /* renamed from: m, reason: from getter */
    public final float getPrice() {
        return this.price;
    }

    @Nullable
    /* renamed from: o, reason: from getter */
    public final Integer getW() {
        return this.w;
    }

    @NotNull
    /* renamed from: a, reason: from getter */
    public final String getAdm() {
        return this.adm;
    }

    public C2935e(@NotNull String adm, float f11, @Nullable String str, @NotNull C2936f ext, @Nullable String str2, @Nullable String str3, @Nullable Integer num, @Nullable Integer num2) {
        Intrinsics.g(adm, "adm");
        Intrinsics.g(ext, "ext");
        this.adm = adm;
        this.price = f11;
        this.burl = str;
        this.ext = ext;
        this.crid = str2;
        this.bundle = str3;
        this.w = num;
        this.h = num2;
    }

    public /* synthetic */ C2935e(String str, float f11, String str2, C2936f c2936f, String str3, String str4, Integer num, Integer num2, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, f11, (i5 & 4) != 0 ? null : str2, c2936f, (i5 & 16) != 0 ? null : str3, (i5 & 32) != 0 ? null : str4, (i5 & 64) != 0 ? null : num, (i5 & 128) != 0 ? null : num2);
    }
}
