package com.moloco.sdk.internal.ortb.model;

import android.graphics.Color;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import i2.r0;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.UInt;
import kotlin.ULong;
import kotlin.jvm.JvmField;
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
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import kotlinx.serialization.internal.UIntSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000P\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b#\b\u0001\u0018\u0000 >2\u00020\u0001:\u0002\u001d$B[\u0012\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0004\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0006\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b\u0012\b\b\u0002\u0010\u000b\u001a\u00020\n\u0012\b\b\u0002\u0010\r\u001a\u00020\f\u0012\b\b\u0002\u0010\u000f\u001a\u00020\u000e\u0012\b\b\u0002\u0010\u0010\u001a\u00020\u000e¢\u0006\u0004\b\u0011\u0010\u0012Bi\b\u0010\u0012\u0006\u0010\u0013\u001a\u00020\b\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\t\u001a\u0004\u0018\u00010\b\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\b\u0010\r\u001a\u0004\u0018\u00010\f\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u0012\b\u0010\u0010\u001a\u0004\u0018\u00010\u000e\u0012\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014¢\u0006\u0004\b\u0011\u0010\u0016J'\u0010\u001d\u001a\u00020\u001c2\u0006\u0010\u0017\u001a\u00020\u00002\u0006\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u001b\u001a\u00020\u001aH\u0001¢\u0006\u0004\b\u001d\u0010\u001eR\"\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\u001d\u0010\u001f\u0012\u0004\b\"\u0010#\u001a\u0004\b \u0010!R \u0010\u0005\u001a\u00020\u00048\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b$\u0010%\u0012\u0004\b(\u0010#\u001a\u0004\b&\u0010'R \u0010\u0007\u001a\u00020\u00068\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b)\u0010*\u0012\u0004\b-\u0010#\u001a\u0004\b+\u0010,R\"\u0010\t\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b+\u0010.\u0012\u0004\b1\u0010#\u001a\u0004\b/\u00100R \u0010\u000b\u001a\u00020\n8\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b-\u00102\u0012\u0004\b5\u0010#\u001a\u0004\b3\u00104R \u0010\r\u001a\u00020\f8\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b \u00106\u0012\u0004\b9\u0010#\u001a\u0004\b7\u00108R \u0010\u000f\u001a\u00020\u000e8\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b\"\u0010:\u0012\u0004\b=\u0010#\u001a\u0004\b;\u0010<R \u0010\u0010\u001a\u00020\u000e8\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b;\u0010:\u0012\u0004\b)\u0010#\u001a\u0004\b$\u0010<¨\u0006?"}, d2 = {"Lcom/moloco/sdk/internal/ortb/model/k;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "customTimerDesc", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "isDefaultTimer", "Lkotlin/UInt;", "circleSize", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "padding", "Lcom/moloco/sdk/internal/ortb/model/w;", "horizontalAlignment", "Lcom/moloco/sdk/internal/ortb/model/H;", "verticalAlignment", "Li2/s;", "foregroundColor", "backgroundColor", "<init>", "(Ljava/lang/String;ZILjava/lang/Integer;Lcom/moloco/sdk/internal/ortb/model/w;Lcom/moloco/sdk/internal/ortb/model/H;JJLkotlin/jvm/internal/DefaultConstructorMarker;)V", "seen0", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "serializationConstructorMarker", "(ILjava/lang/String;ZLkotlin/UInt;Ljava/lang/Integer;Lcom/moloco/sdk/internal/ortb/model/w;Lcom/moloco/sdk/internal/ortb/model/H;Li2/s;Li2/s;Lkotlinx/serialization/internal/SerializationConstructorMarker;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", "self", "Lkotlinx/serialization/encoding/CompositeEncoder;", "output", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "serialDesc", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "(Lcom/moloco/sdk/internal/ortb/model/k;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;)V", "Ljava/lang/String;", InneractiveMediationDefs.GENDER_FEMALE, "()Ljava/lang/String;", "g", "()V", "b", "Z", "p", "()Z", "q", "c", "I", "d", "()I", "e", "Ljava/lang/Integer;", "l", "()Ljava/lang/Integer;", InneractiveMediationDefs.GENDER_MALE, "Lcom/moloco/sdk/internal/ortb/model/w;", "j", "()Lcom/moloco/sdk/internal/ortb/model/w;", "k", "Lcom/moloco/sdk/internal/ortb/model/H;", "n", "()Lcom/moloco/sdk/internal/ortb/model/H;", "o", "J", "h", "()J", "i", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "moloco-sdk_release"}, k = 1, mv = {2, 0, 0})
@Serializable
/* loaded from: classes4.dex */
public final class k {

    /* renamed from: i, reason: collision with root package name */
    public static final int f36761i = 0;

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final String customTimerDesc;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    public final boolean isDefaultTimer;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    public final int circleSize;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final Integer padding;

    /* renamed from: e, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final w horizontalAlignment;

    /* renamed from: f, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final H verticalAlignment;

    /* renamed from: g, reason: collision with root package name and from kotlin metadata */
    public final long foregroundColor;

    /* renamed from: h, reason: collision with root package name and from kotlin metadata */
    public final long backgroundColor;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    /* renamed from: j, reason: collision with root package name */
    @JvmField
    @NotNull
    public static final KSerializer<Object>[] f36762j = {null, null, null, null, w.INSTANCE.serializer(), H.INSTANCE.serializer(), null, null};

    @Deprecated
    public /* synthetic */ class a implements GeneratedSerializer<k> {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public static final a f36771a;

        /* renamed from: b, reason: collision with root package name */
        public static final int f36772b;

        @NotNull
        private static final SerialDescriptor descriptor;

        static {
            a aVar = new a();
            f36771a = aVar;
            f36772b = 8;
            PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.moloco.sdk.internal.ortb.model.CountDownTimer", aVar, 8);
            pluginGeneratedSerialDescriptor.addElement("custom_timer_desc", true);
            pluginGeneratedSerialDescriptor.addElement("is_default_timer", true);
            pluginGeneratedSerialDescriptor.addElement("control_size", true);
            pluginGeneratedSerialDescriptor.addElement("padding", true);
            pluginGeneratedSerialDescriptor.addElement("horizontal_alignment", true);
            pluginGeneratedSerialDescriptor.addElement("vertical_alignment", true);
            pluginGeneratedSerialDescriptor.addElement("foreground_color", true);
            pluginGeneratedSerialDescriptor.addElement("background_color", true);
            descriptor = pluginGeneratedSerialDescriptor;
        }

        @Override // kotlinx.serialization.DeserializationStrategy
        @NotNull
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final k deserialize(@NotNull Decoder decoder) {
            int i5;
            i2.s sVar;
            i2.s sVar2;
            H h5;
            w wVar;
            boolean z11;
            String str;
            UInt uInt;
            Integer num;
            Intrinsics.g(decoder, "decoder");
            SerialDescriptor serialDescriptor = descriptor;
            CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
            KSerializer[] kSerializerArr = k.f36762j;
            int i11 = 7;
            int i12 = 6;
            int i13 = 4;
            if (compositeDecoderBeginStructure.decodeSequentially()) {
                String str2 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 0, StringSerializer.INSTANCE, null);
                boolean zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 1);
                UInt uInt2 = (UInt) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, UIntSerializer.INSTANCE, null);
                Integer num2 = (Integer) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, IntSerializer.INSTANCE, null);
                w wVar2 = (w) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 4, kSerializerArr[4], null);
                H h8 = (H) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 5, kSerializerArr[5], null);
                j jVar = j.f36759a;
                i2.s sVar3 = (i2.s) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 6, jVar, null);
                h5 = h8;
                str = str2;
                sVar = (i2.s) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 7, jVar, null);
                sVar2 = sVar3;
                num = num2;
                uInt = uInt2;
                i5 = 255;
                wVar = wVar2;
                z11 = zDecodeBooleanElement;
            } else {
                boolean z12 = true;
                int i14 = 0;
                i2.s sVar4 = null;
                i2.s sVar5 = null;
                H h11 = null;
                String str3 = null;
                UInt uInt3 = null;
                Integer num3 = null;
                boolean zDecodeBooleanElement2 = false;
                w wVar3 = null;
                while (z12) {
                    int i15 = i13;
                    int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                    switch (iDecodeElementIndex) {
                        case -1:
                            z12 = false;
                            i12 = 6;
                            i13 = 4;
                        case 0:
                            str3 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 0, StringSerializer.INSTANCE, str3);
                            i14 |= 1;
                            i11 = 7;
                            i12 = 6;
                            i13 = 4;
                        case 1:
                            zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 1);
                            i14 |= 2;
                            i11 = 7;
                            i13 = 4;
                        case 2:
                            uInt3 = (UInt) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, UIntSerializer.INSTANCE, uInt3);
                            i14 |= 4;
                            i11 = 7;
                            i13 = 4;
                        case 3:
                            num3 = (Integer) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, IntSerializer.INSTANCE, num3);
                            i14 |= 8;
                            i11 = 7;
                            i13 = 4;
                        case 4:
                            wVar3 = (w) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, i15, kSerializerArr[i15], wVar3);
                            i14 |= 16;
                            i13 = i15;
                            i11 = 7;
                        case 5:
                            h11 = (H) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 5, kSerializerArr[5], h11);
                            i14 |= 32;
                            i13 = i15;
                        case 6:
                            sVar5 = (i2.s) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, i12, j.f36759a, sVar5);
                            i14 |= 64;
                            i13 = i15;
                        case 7:
                            sVar4 = (i2.s) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, i11, j.f36759a, sVar4);
                            i14 |= 128;
                            i13 = i15;
                        default:
                            throw new UnknownFieldException(iDecodeElementIndex);
                    }
                }
                i5 = i14;
                sVar = sVar4;
                sVar2 = sVar5;
                h5 = h11;
                wVar = wVar3;
                z11 = zDecodeBooleanElement2;
                str = str3;
                uInt = uInt3;
                num = num3;
            }
            compositeDecoderBeginStructure.endStructure(serialDescriptor);
            return new k(i5, str, z11, uInt, num, wVar, h5, sVar2, sVar, null, null);
        }

        @Override // kotlinx.serialization.internal.GeneratedSerializer
        @NotNull
        public final KSerializer<?>[] childSerializers() {
            KSerializer<?>[] kSerializerArr = k.f36762j;
            KSerializer<?> nullable = BuiltinSerializersKt.getNullable(StringSerializer.INSTANCE);
            KSerializer<?> nullable2 = BuiltinSerializersKt.getNullable(IntSerializer.INSTANCE);
            KSerializer<?> kSerializer = kSerializerArr[4];
            KSerializer<?> kSerializer2 = kSerializerArr[5];
            j jVar = j.f36759a;
            return new KSerializer[]{nullable, BooleanSerializer.INSTANCE, UIntSerializer.INSTANCE, nullable2, kSerializer, kSerializer2, jVar, jVar};
        }

        @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
        @NotNull
        public final SerialDescriptor getDescriptor() {
            return descriptor;
        }

        @Override // kotlinx.serialization.SerializationStrategy
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final void serialize(@NotNull Encoder encoder, @NotNull k value) {
            Intrinsics.g(encoder, "encoder");
            Intrinsics.g(value, "value");
            SerialDescriptor serialDescriptor = descriptor;
            CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
            k.a(value, compositeEncoderBeginStructure, serialDescriptor);
            compositeEncoderBeginStructure.endStructure(serialDescriptor);
        }
    }

    /* renamed from: com.moloco.sdk.internal.ortb.model.k$b, reason: from kotlin metadata */
    public static final class Companion {
        public Companion() {
        }

        @NotNull
        public final KSerializer<k> serializer() {
            return a.f36771a;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public /* synthetic */ k(int i5, String str, boolean z11, UInt uInt, Integer num, w wVar, H h5, i2.s sVar, i2.s sVar2, SerializationConstructorMarker serializationConstructorMarker, DefaultConstructorMarker defaultConstructorMarker) {
        this(i5, str, z11, uInt, num, wVar, h5, sVar, sVar2, serializationConstructorMarker);
    }

    @SerialName("background_color")
    @Serializable(with = j.class)
    public static /* synthetic */ void c() {
    }

    @SerialName("control_size")
    public static /* synthetic */ void e() {
    }

    @SerialName("custom_timer_desc")
    public static /* synthetic */ void g() {
    }

    @SerialName("foreground_color")
    @Serializable(with = j.class)
    public static /* synthetic */ void i() {
    }

    @SerialName("horizontal_alignment")
    public static /* synthetic */ void k() {
    }

    @SerialName("padding")
    public static /* synthetic */ void m() {
    }

    @SerialName("vertical_alignment")
    public static /* synthetic */ void o() {
    }

    @SerialName("is_default_timer")
    public static /* synthetic */ void q() {
    }

    /* renamed from: b, reason: from getter */
    public final long getBackgroundColor() {
        return this.backgroundColor;
    }

    /* renamed from: d, reason: from getter */
    public final int getCircleSize() {
        return this.circleSize;
    }

    @Nullable
    /* renamed from: f, reason: from getter */
    public final String getCustomTimerDesc() {
        return this.customTimerDesc;
    }

    /* renamed from: h, reason: from getter */
    public final long getForegroundColor() {
        return this.foregroundColor;
    }

    @NotNull
    /* renamed from: j, reason: from getter */
    public final w getHorizontalAlignment() {
        return this.horizontalAlignment;
    }

    @Nullable
    /* renamed from: l, reason: from getter */
    public final Integer getPadding() {
        return this.padding;
    }

    @NotNull
    /* renamed from: n, reason: from getter */
    public final H getVerticalAlignment() {
        return this.verticalAlignment;
    }

    /* renamed from: p, reason: from getter */
    public final boolean getIsDefaultTimer() {
        return this.isDefaultTimer;
    }

    public /* synthetic */ k(String str, boolean z11, int i5, Integer num, w wVar, H h5, long j11, long j12, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, z11, i5, num, wVar, h5, j11, j12);
    }

    /* JADX WARN: Removed duplicated region for block: B:43:0x0099  */
    @JvmStatic
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(k self, CompositeEncoder output, SerialDescriptor serialDesc) {
        KSerializer<Object>[] kSerializerArr = f36762j;
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.customTimerDesc != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, StringSerializer.INSTANCE, self.customTimerDesc);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 1) || !self.isDefaultTimer) {
            output.encodeBooleanElement(serialDesc, 1, self.isDefaultTimer);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.circleSize != 30) {
            output.encodeSerializableElement(serialDesc, 2, UIntSerializer.INSTANCE, new UInt(self.circleSize));
        }
        if (output.shouldEncodeElementDefault(serialDesc, 3) || self.padding != null) {
            output.encodeNullableSerializableElement(serialDesc, 3, IntSerializer.INSTANCE, self.padding);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.horizontalAlignment != w.f36851f) {
            output.encodeSerializableElement(serialDesc, 4, kSerializerArr[4], self.horizontalAlignment);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 5) || self.verticalAlignment != H.f36695b) {
            output.encodeSerializableElement(serialDesc, 5, kSerializerArr[5], self.verticalAlignment);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 6)) {
            output.encodeSerializableElement(serialDesc, 6, j.f36759a, new i2.s(self.foregroundColor));
        } else {
            long j11 = self.foregroundColor;
            long jB = r0.b(Color.parseColor("#FF4285f4"));
            int i5 = i2.s.n;
            if (!ULong.a(j11, jB)) {
            }
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 7) && ULong.a(self.backgroundColor, r0.b(Color.parseColor("#FFFFFFFF")))) {
            return;
        }
        output.encodeSerializableElement(serialDesc, 7, j.f36759a, new i2.s(self.backgroundColor));
    }

    public /* synthetic */ k(int i5, String str, boolean z11, UInt uInt, Integer num, w wVar, H h5, i2.s sVar, i2.s sVar2, SerializationConstructorMarker serializationConstructorMarker) {
        long jB;
        long jB2;
        if ((i5 & 1) == 0) {
            this.customTimerDesc = null;
        } else {
            this.customTimerDesc = str;
        }
        if ((i5 & 2) == 0) {
            this.isDefaultTimer = true;
        } else {
            this.isDefaultTimer = z11;
        }
        this.circleSize = (i5 & 4) == 0 ? 30 : uInt.f71697a;
        if ((i5 & 8) == 0) {
            this.padding = null;
        } else {
            this.padding = num;
        }
        if ((i5 & 16) == 0) {
            this.horizontalAlignment = w.f36851f;
        } else {
            this.horizontalAlignment = wVar;
        }
        if ((i5 & 32) == 0) {
            this.verticalAlignment = H.f36695b;
        } else {
            this.verticalAlignment = h5;
        }
        if ((i5 & 64) == 0) {
            jB = r0.b(Color.parseColor("#FF4285f4"));
        } else {
            jB = sVar.f61148a;
        }
        this.foregroundColor = jB;
        if ((i5 & 128) == 0) {
            jB2 = r0.b(Color.parseColor("#FFFFFFFF"));
        } else {
            jB2 = sVar2.f61148a;
        }
        this.backgroundColor = jB2;
    }

    public k(String str, boolean z11, int i5, Integer num, w horizontalAlignment, H verticalAlignment, long j11, long j12) {
        Intrinsics.g(horizontalAlignment, "horizontalAlignment");
        Intrinsics.g(verticalAlignment, "verticalAlignment");
        this.customTimerDesc = str;
        this.isDefaultTimer = z11;
        this.circleSize = i5;
        this.padding = num;
        this.horizontalAlignment = horizontalAlignment;
        this.verticalAlignment = verticalAlignment;
        this.foregroundColor = j11;
        this.backgroundColor = j12;
    }

    public /* synthetic */ k(String str, boolean z11, int i5, Integer num, w wVar, H h5, long j11, long j12, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this((i11 & 1) != 0 ? null : str, (i11 & 2) != 0 ? true : z11, (i11 & 4) != 0 ? 30 : i5, (i11 & 8) != 0 ? null : num, (i11 & 16) != 0 ? w.f36851f : wVar, (i11 & 32) != 0 ? H.f36695b : h5, (i11 & 64) != 0 ? r0.b(Color.parseColor("#FF4285f4")) : j11, (i11 & 128) != 0 ? r0.b(Color.parseColor("#FFFFFFFF")) : j12, null);
    }
}
