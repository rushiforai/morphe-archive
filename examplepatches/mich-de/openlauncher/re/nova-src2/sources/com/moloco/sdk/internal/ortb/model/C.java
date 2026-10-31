package com.moloco.sdk.internal.ortb.model;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.UInt;
import kotlin.jvm.JvmField;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerialName;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.UIntSerializer;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0015\b\u0001\u0018\u0000 *2\u00020\u0001:\u0002\u0017\u001eB'\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bBC\b\u0010\u0012\u0006\u0010\r\u001a\u00020\f\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\t\u001a\u0004\u0018\u00010\b\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\u000e¢\u0006\u0004\b\n\u0010\u0010J'\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0011\u001a\u00020\u00002\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u0014H\u0001¢\u0006\u0004\b\u0017\u0010\u0018R \u0010\u0003\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u0017\u0010\u0019\u0012\u0004\b\u001c\u0010\u001d\u001a\u0004\b\u001a\u0010\u001bR \u0010\u0005\u001a\u00020\u00048\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u001e\u0010\u001f\u0012\u0004\b\"\u0010\u001d\u001a\u0004\b \u0010!R \u0010\u0007\u001a\u00020\u00068\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b#\u0010$\u0012\u0004\b'\u0010\u001d\u001a\u0004\b%\u0010&R \u0010\t\u001a\u00020\b8\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b \u0010(\u0012\u0004\b#\u0010\u001d\u001a\u0004\b\u001e\u0010)¨\u0006+"}, d2 = {"Lcom/moloco/sdk/internal/ortb/model/C;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlin/UInt;", "padding", "Lcom/moloco/sdk/internal/ortb/model/w;", "horizontalAlignment", "Lcom/moloco/sdk/internal/ortb/model/H;", "verticalAlignment", "Li2/s;", "foregroundColor", "<init>", "(ILcom/moloco/sdk/internal/ortb/model/w;Lcom/moloco/sdk/internal/ortb/model/H;JLkotlin/jvm/internal/DefaultConstructorMarker;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "seen0", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "serializationConstructorMarker", "(ILkotlin/UInt;Lcom/moloco/sdk/internal/ortb/model/w;Lcom/moloco/sdk/internal/ortb/model/H;Li2/s;Lkotlinx/serialization/internal/SerializationConstructorMarker;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", "self", "Lkotlinx/serialization/encoding/CompositeEncoder;", "output", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "serialDesc", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "(Lcom/moloco/sdk/internal/ortb/model/C;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;)V", "I", InneractiveMediationDefs.GENDER_FEMALE, "()I", "g", "()V", "b", "Lcom/moloco/sdk/internal/ortb/model/w;", "d", "()Lcom/moloco/sdk/internal/ortb/model/w;", "e", "c", "Lcom/moloco/sdk/internal/ortb/model/H;", "h", "()Lcom/moloco/sdk/internal/ortb/model/H;", "i", "J", "()J", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "moloco-sdk_release"}, k = 1, mv = {2, 0, 0})
@Serializable
/* loaded from: classes4.dex */
public final class C {

    /* renamed from: e, reason: collision with root package name */
    public static final int f36649e = 0;

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    public final int padding;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final w horizontalAlignment;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final H verticalAlignment;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    public final long foregroundColor;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    /* renamed from: f, reason: collision with root package name */
    @JvmField
    @NotNull
    public static final KSerializer<Object>[] f36650f = {null, w.INSTANCE.serializer(), H.INSTANCE.serializer(), null};

    @Deprecated
    public /* synthetic */ class a implements GeneratedSerializer<C> {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public static final a f36655a;

        /* renamed from: b, reason: collision with root package name */
        public static final int f36656b;

        @NotNull
        private static final SerialDescriptor descriptor;

        static {
            a aVar = new a();
            f36655a = aVar;
            f36656b = 8;
            PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.moloco.sdk.internal.ortb.model.ProgressBar", aVar, 4);
            pluginGeneratedSerialDescriptor.addElement("padding", false);
            pluginGeneratedSerialDescriptor.addElement("horizontal_alignment", false);
            pluginGeneratedSerialDescriptor.addElement("vertical_alignment", false);
            pluginGeneratedSerialDescriptor.addElement("foreground_color", false);
            descriptor = pluginGeneratedSerialDescriptor;
        }

        @Override // kotlinx.serialization.DeserializationStrategy
        @NotNull
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final C deserialize(@NotNull Decoder decoder) {
            int i5;
            UInt uInt;
            w wVar;
            H h5;
            i2.s sVar;
            Intrinsics.g(decoder, "decoder");
            SerialDescriptor serialDescriptor = descriptor;
            CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
            KSerializer[] kSerializerArr = C.f36650f;
            UInt uInt2 = null;
            if (compositeDecoderBeginStructure.decodeSequentially()) {
                UInt uInt3 = (UInt) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, UIntSerializer.INSTANCE, null);
                w wVar2 = (w) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], null);
                h5 = (H) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], null);
                uInt = uInt3;
                sVar = (i2.s) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, j.f36759a, null);
                i5 = 15;
                wVar = wVar2;
            } else {
                boolean z11 = true;
                int i11 = 0;
                w wVar3 = null;
                H h8 = null;
                i2.s sVar2 = null;
                while (z11) {
                    int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                    if (iDecodeElementIndex == -1) {
                        z11 = false;
                    } else if (iDecodeElementIndex == 0) {
                        uInt2 = (UInt) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, UIntSerializer.INSTANCE, uInt2);
                        i11 |= 1;
                    } else if (iDecodeElementIndex == 1) {
                        wVar3 = (w) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], wVar3);
                        i11 |= 2;
                    } else if (iDecodeElementIndex == 2) {
                        h8 = (H) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], h8);
                        i11 |= 4;
                    } else {
                        if (iDecodeElementIndex != 3) {
                            throw new UnknownFieldException(iDecodeElementIndex);
                        }
                        sVar2 = (i2.s) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, j.f36759a, sVar2);
                        i11 |= 8;
                    }
                }
                i5 = i11;
                uInt = uInt2;
                wVar = wVar3;
                h5 = h8;
                sVar = sVar2;
            }
            compositeDecoderBeginStructure.endStructure(serialDescriptor);
            return new C(i5, uInt, wVar, h5, sVar, null, null);
        }

        @Override // kotlinx.serialization.internal.GeneratedSerializer
        @NotNull
        public final KSerializer<?>[] childSerializers() {
            KSerializer<?>[] kSerializerArr = C.f36650f;
            return new KSerializer[]{UIntSerializer.INSTANCE, kSerializerArr[1], kSerializerArr[2], j.f36759a};
        }

        @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
        @NotNull
        public final SerialDescriptor getDescriptor() {
            return descriptor;
        }

        @Override // kotlinx.serialization.SerializationStrategy
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final void serialize(@NotNull Encoder encoder, @NotNull C value) {
            Intrinsics.g(encoder, "encoder");
            Intrinsics.g(value, "value");
            SerialDescriptor serialDescriptor = descriptor;
            CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
            C.a(value, compositeEncoderBeginStructure, serialDescriptor);
            compositeEncoderBeginStructure.endStructure(serialDescriptor);
        }
    }

    /* renamed from: com.moloco.sdk.internal.ortb.model.C$b, reason: from kotlin metadata */
    public static final class Companion {
        public Companion() {
        }

        @NotNull
        public final KSerializer<C> serializer() {
            return a.f36655a;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public /* synthetic */ C(int i5, w wVar, H h5, long j11, DefaultConstructorMarker defaultConstructorMarker) {
        this(i5, wVar, h5, j11);
    }

    @SerialName("foreground_color")
    @Serializable(with = j.class)
    public static /* synthetic */ void c() {
    }

    @SerialName("horizontal_alignment")
    public static /* synthetic */ void e() {
    }

    @SerialName("padding")
    public static /* synthetic */ void g() {
    }

    @SerialName("vertical_alignment")
    public static /* synthetic */ void i() {
    }

    /* renamed from: b, reason: from getter */
    public final long getForegroundColor() {
        return this.foregroundColor;
    }

    @NotNull
    /* renamed from: d, reason: from getter */
    public final w getHorizontalAlignment() {
        return this.horizontalAlignment;
    }

    /* renamed from: f, reason: from getter */
    public final int getPadding() {
        return this.padding;
    }

    @NotNull
    /* renamed from: h, reason: from getter */
    public final H getVerticalAlignment() {
        return this.verticalAlignment;
    }

    public /* synthetic */ C(int i5, UInt uInt, w wVar, H h5, i2.s sVar, SerializationConstructorMarker serializationConstructorMarker, DefaultConstructorMarker defaultConstructorMarker) {
        this(i5, uInt, wVar, h5, sVar, serializationConstructorMarker);
    }

    @JvmStatic
    public static final /* synthetic */ void a(C self, CompositeEncoder output, SerialDescriptor serialDesc) {
        KSerializer<Object>[] kSerializerArr = f36650f;
        output.encodeSerializableElement(serialDesc, 0, UIntSerializer.INSTANCE, new UInt(self.padding));
        output.encodeSerializableElement(serialDesc, 1, kSerializerArr[1], self.horizontalAlignment);
        output.encodeSerializableElement(serialDesc, 2, kSerializerArr[2], self.verticalAlignment);
        output.encodeSerializableElement(serialDesc, 3, j.f36759a, new i2.s(self.foregroundColor));
    }

    public /* synthetic */ C(int i5, UInt uInt, w wVar, H h5, i2.s sVar, SerializationConstructorMarker serializationConstructorMarker) {
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, a.f36655a.getDescriptor());
        }
        this.padding = uInt.f71697a;
        this.horizontalAlignment = wVar;
        this.verticalAlignment = h5;
        this.foregroundColor = sVar.f61148a;
    }

    public C(int i5, w horizontalAlignment, H verticalAlignment, long j11) {
        Intrinsics.g(horizontalAlignment, "horizontalAlignment");
        Intrinsics.g(verticalAlignment, "verticalAlignment");
        this.padding = i5;
        this.horizontalAlignment = horizontalAlignment;
        this.verticalAlignment = verticalAlignment;
        this.foregroundColor = j11;
    }
}
