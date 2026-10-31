package com.moloco.sdk.internal.ilrd;

import b.c0;
import b.c9;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.internal.ilrd.c;
import com.moloco.sdk.internal.services.I;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.Deprecated;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import kotlinx.serialization.json.Json;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public static final C0146a f36482g = new C0146a(null);

    /* renamed from: h, reason: collision with root package name */
    public static final int f36483h = 8;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public static final String f36484i = "IlrdActiveSession";

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final I f36485a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final c f36486b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Lazy f36487c;

    /* renamed from: d, reason: collision with root package name */
    public final long f36488d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final AtomicReference<b> f36489e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f36490f;

    /* renamed from: com.moloco.sdk.internal.ilrd.a$a, reason: collision with other inner class name */
    public static final class C0146a {
        public /* synthetic */ C0146a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public C0146a() {
        }
    }

    @Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\b\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\n\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\f\b\u0087\b\u0018\u0000 02\u00020\u0001:\u0002\u0016\u0019B7\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0004\u0012\u0006\u0010\b\u001a\u00020\u0004\u0012\u0006\u0010\t\u001a\u00020\u0004¢\u0006\u0004\b\n\u0010\u000bBK\b\u0010\u0012\u0006\u0010\f\u001a\u00020\u0004\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0004\u0012\u0006\u0010\b\u001a\u00020\u0004\u0012\u0006\u0010\t\u001a\u00020\u0004\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\r¢\u0006\u0004\b\n\u0010\u000fJ'\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0010\u001a\u00020\u00002\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u0013H\u0001¢\u0006\u0004\b\u0016\u0010\u0017J\u0010\u0010\u0016\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0018J\u0010\u0010\u0019\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u001b\u0010\u001aJ\u0010\u0010\u001c\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u001aJ\u0010\u0010\u001d\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u001d\u0010\u001aJ\u0010\u0010\u001e\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001aJL\u0010\u0016\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0006\u001a\u00020\u00042\b\b\u0002\u0010\u0007\u001a\u00020\u00042\b\b\u0002\u0010\b\u001a\u00020\u00042\b\b\u0002\u0010\t\u001a\u00020\u0004HÇ\u0001¢\u0006\u0004\b\u0016\u0010\u001fJ\u0010\u0010!\u001a\u00020 H×\u0001¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020\u0004H×\u0001¢\u0006\u0004\b#\u0010\u001aJ\u001a\u0010&\u001a\u00020%2\b\u0010$\u001a\u0004\u0018\u00010\u0001H×\u0003¢\u0006\u0004\b&\u0010'R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0016\u0010(\u001a\u0004\b)\u0010\u0018R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0019\u0010*\u001a\u0004\b+\u0010\u001aR\u0017\u0010\u0006\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001b\u0010*\u001a\u0004\b,\u0010\u001aR\u0017\u0010\u0007\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001c\u0010*\u001a\u0004\b-\u0010\u001aR\u0017\u0010\b\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001d\u0010*\u001a\u0004\b.\u0010\u001aR\u0017\u0010\t\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001e\u0010*\u001a\u0004\b/\u0010\u001a¨\u00061"}, d2 = {"Lcom/moloco/sdk/internal/ilrd/a$b;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "lastEventReceivedTs", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "banner", "mrec", "native", "interstitial", "rewarded", "<init>", "(JIIIII)V", "seen0", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "serializationConstructorMarker", "(IJIIIIILkotlinx/serialization/internal/SerializationConstructorMarker;)V", "self", "Lkotlinx/serialization/encoding/CompositeEncoder;", "output", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "serialDesc", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "(Lcom/moloco/sdk/internal/ilrd/a$b;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;)V", "()J", "b", "()I", "c", "d", "e", InneractiveMediationDefs.GENDER_FEMALE, "(JIIIII)Lcom/moloco/sdk/internal/ilrd/a$b;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "()Ljava/lang/String;", "hashCode", InneractiveMediationNameConsts.OTHER, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "equals", "(Ljava/lang/Object;)Z", "J", "i", "I", "g", "j", "k", "h", "l", k.O, "moloco-sdk_release"}, k = 1, mv = {2, 0, 0})
    @Serializable
    public static final /* data */ class b {

        /* renamed from: Companion, reason: from kotlin metadata */
        @NotNull
        public static final Companion INSTANCE = new Companion(null);

        /* renamed from: g, reason: collision with root package name */
        public static final int f36491g = 0;

        /* renamed from: a, reason: collision with root package name and from kotlin metadata */
        public final long lastEventReceivedTs;

        /* renamed from: b, reason: collision with root package name and from kotlin metadata */
        public final int banner;

        /* renamed from: c, reason: collision with root package name and from kotlin metadata */
        public final int mrec;

        /* renamed from: d, reason: collision with root package name and from kotlin metadata */
        public final int native;

        /* renamed from: e, reason: collision with root package name and from kotlin metadata */
        public final int interstitial;

        /* renamed from: f, reason: collision with root package name and from kotlin metadata */
        public final int rewarded;

        @Deprecated
        /* renamed from: com.moloco.sdk.internal.ilrd.a$b$a, reason: collision with other inner class name */
        public /* synthetic */ class C0147a implements GeneratedSerializer<b> {

            /* renamed from: a, reason: collision with root package name */
            @NotNull
            public static final C0147a f36498a;

            /* renamed from: b, reason: collision with root package name */
            public static final int f36499b;

            @NotNull
            private static final SerialDescriptor descriptor;

            static {
                C0147a c0147a = new C0147a();
                f36498a = c0147a;
                f36499b = 8;
                PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.moloco.sdk.internal.ilrd.IlrdActiveSession.ImpressionCounts", c0147a, 6);
                pluginGeneratedSerialDescriptor.addElement("lastEventReceivedTs", false);
                pluginGeneratedSerialDescriptor.addElement("banner", false);
                pluginGeneratedSerialDescriptor.addElement("mrec", false);
                pluginGeneratedSerialDescriptor.addElement("native", false);
                pluginGeneratedSerialDescriptor.addElement("interstitial", false);
                pluginGeneratedSerialDescriptor.addElement("rewarded", false);
                descriptor = pluginGeneratedSerialDescriptor;
            }

            @Override // kotlinx.serialization.DeserializationStrategy
            @NotNull
            /* renamed from: a, reason: merged with bridge method [inline-methods] */
            public final b deserialize(@NotNull Decoder decoder) {
                int iDecodeIntElement;
                int iDecodeIntElement2;
                int i5;
                int i11;
                int i12;
                int i13;
                long j11;
                Intrinsics.g(decoder, "decoder");
                SerialDescriptor serialDescriptor = descriptor;
                CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
                if (compositeDecoderBeginStructure.decodeSequentially()) {
                    long jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 0);
                    iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
                    int iDecodeIntElement3 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 2);
                    int iDecodeIntElement4 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 3);
                    int iDecodeIntElement5 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 4);
                    iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 5);
                    i5 = iDecodeIntElement4;
                    i11 = iDecodeIntElement5;
                    i12 = iDecodeIntElement3;
                    i13 = 63;
                    j11 = jDecodeLongElement;
                } else {
                    boolean z11 = true;
                    iDecodeIntElement = 0;
                    int iDecodeIntElement6 = 0;
                    int iDecodeIntElement7 = 0;
                    int i14 = 0;
                    long jDecodeLongElement2 = 0;
                    int iDecodeIntElement8 = 0;
                    int iDecodeIntElement9 = 0;
                    while (z11) {
                        int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                        switch (iDecodeElementIndex) {
                            case -1:
                                z11 = false;
                                continue;
                            case 0:
                                jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 0);
                                i14 |= 1;
                                continue;
                            case 1:
                                iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
                                i14 |= 2;
                                break;
                            case 2:
                                iDecodeIntElement7 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 2);
                                i14 |= 4;
                                break;
                            case 3:
                                iDecodeIntElement9 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 3);
                                i14 |= 8;
                                break;
                            case 4:
                                iDecodeIntElement6 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 4);
                                i14 |= 16;
                                break;
                            case 5:
                                iDecodeIntElement8 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 5);
                                i14 |= 32;
                                break;
                            default:
                                throw new UnknownFieldException(iDecodeElementIndex);
                        }
                    }
                    iDecodeIntElement2 = iDecodeIntElement8;
                    i5 = iDecodeIntElement9;
                    i11 = iDecodeIntElement6;
                    i12 = iDecodeIntElement7;
                    i13 = i14;
                    j11 = jDecodeLongElement2;
                }
                int i15 = iDecodeIntElement;
                compositeDecoderBeginStructure.endStructure(serialDescriptor);
                return new b(i13, j11, i15, i12, i5, i11, iDecodeIntElement2, null);
            }

            @Override // kotlinx.serialization.internal.GeneratedSerializer
            @NotNull
            public final KSerializer<?>[] childSerializers() {
                IntSerializer intSerializer = IntSerializer.INSTANCE;
                return new KSerializer[]{LongSerializer.INSTANCE, intSerializer, intSerializer, intSerializer, intSerializer, intSerializer};
            }

            @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
            @NotNull
            public final SerialDescriptor getDescriptor() {
                return descriptor;
            }

            @Override // kotlinx.serialization.SerializationStrategy
            /* renamed from: a, reason: merged with bridge method [inline-methods] */
            public final void serialize(@NotNull Encoder encoder, @NotNull b value) {
                Intrinsics.g(encoder, "encoder");
                Intrinsics.g(value, "value");
                SerialDescriptor serialDescriptor = descriptor;
                CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
                b.a(value, compositeEncoderBeginStructure, serialDescriptor);
                compositeEncoderBeginStructure.endStructure(serialDescriptor);
            }
        }

        /* renamed from: com.moloco.sdk.internal.ilrd.a$b$b, reason: collision with other inner class name and from kotlin metadata */
        public static final class Companion {
            public Companion() {
            }

            @NotNull
            public final KSerializer<b> serializer() {
                return C0147a.f36498a;
            }

            public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
                this();
            }
        }

        public /* synthetic */ b(int i5, long j11, int i11, int i12, int i13, int i14, int i15, SerializationConstructorMarker serializationConstructorMarker) {
            if (63 != (i5 & 63)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 63, C0147a.f36498a.getDescriptor());
            }
            this.lastEventReceivedTs = j11;
            this.banner = i11;
            this.mrec = i12;
            this.native = i13;
            this.interstitial = i14;
            this.rewarded = i15;
        }

        /* renamed from: a, reason: from getter */
        public final long getLastEventReceivedTs() {
            return this.lastEventReceivedTs;
        }

        /* renamed from: b, reason: from getter */
        public final int getBanner() {
            return this.banner;
        }

        /* renamed from: c, reason: from getter */
        public final int getMrec() {
            return this.mrec;
        }

        /* renamed from: d, reason: from getter */
        public final int getNative() {
            return this.native;
        }

        /* renamed from: e, reason: from getter */
        public final int getInterstitial() {
            return this.interstitial;
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof b)) {
                return false;
            }
            b bVar = (b) other;
            return this.lastEventReceivedTs == bVar.lastEventReceivedTs && this.banner == bVar.banner && this.mrec == bVar.mrec && this.native == bVar.native && this.interstitial == bVar.interstitial && this.rewarded == bVar.rewarded;
        }

        /* renamed from: f, reason: from getter */
        public final int getRewarded() {
            return this.rewarded;
        }

        public final int g() {
            return this.banner;
        }

        public final int h() {
            return this.interstitial;
        }

        public int hashCode() {
            return Integer.hashCode(this.rewarded) + u4.a(this.interstitial, u4.a(this.native, u4.a(this.mrec, u4.a(this.banner, Long.hashCode(this.lastEventReceivedTs) * 31, 31), 31), 31), 31);
        }

        public final long i() {
            return this.lastEventReceivedTs;
        }

        public final int j() {
            return this.mrec;
        }

        public final int k() {
            return this.native;
        }

        public final int l() {
            return this.rewarded;
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("ImpressionCounts(lastEventReceivedTs=");
            sb2.append(this.lastEventReceivedTs);
            sb2.append(", banner=");
            sb2.append(this.banner);
            sb2.append(", mrec=");
            sb2.append(this.mrec);
            sb2.append(", native=");
            sb2.append(this.native);
            sb2.append(", interstitial=");
            sb2.append(this.interstitial);
            sb2.append(", rewarded=");
            return a2.c.m(sb2, this.rewarded, ')');
        }

        public b(long j11, int i5, int i11, int i12, int i13, int i14) {
            this.lastEventReceivedTs = j11;
            this.banner = i5;
            this.mrec = i11;
            this.native = i12;
            this.interstitial = i13;
            this.rewarded = i14;
        }

        @NotNull
        public final b a(long lastEventReceivedTs, int banner, int mrec, int i5, int interstitial, int rewarded) {
            return new b(lastEventReceivedTs, banner, mrec, i5, interstitial, rewarded);
        }

        public static /* synthetic */ b a(b bVar, long j11, int i5, int i11, int i12, int i13, int i14, int i15, Object obj) {
            if ((i15 & 1) != 0) {
                j11 = bVar.lastEventReceivedTs;
            }
            long j12 = j11;
            if ((i15 & 2) != 0) {
                i5 = bVar.banner;
            }
            int i16 = i5;
            if ((i15 & 4) != 0) {
                i11 = bVar.mrec;
            }
            int i17 = i11;
            if ((i15 & 8) != 0) {
                i12 = bVar.native;
            }
            int i18 = i12;
            if ((i15 & 16) != 0) {
                i13 = bVar.interstitial;
            }
            int i19 = i13;
            if ((i15 & 32) != 0) {
                i14 = bVar.rewarded;
            }
            return bVar.a(j12, i16, i17, i18, i19, i14);
        }

        @JvmStatic
        public static final /* synthetic */ void a(b self, CompositeEncoder output, SerialDescriptor serialDesc) {
            output.encodeLongElement(serialDesc, 0, self.lastEventReceivedTs);
            output.encodeIntElement(serialDesc, 1, self.banner);
            output.encodeIntElement(serialDesc, 2, self.mrec);
            output.encodeIntElement(serialDesc, 3, self.native);
            output.encodeIntElement(serialDesc, 4, self.interstitial);
            output.encodeIntElement(serialDesc, 5, self.rewarded);
        }
    }

    @Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u001a\b\u0087\b\u0018\u0000 /2\u00020\u0001:\u0002\u0017\u001aB'\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bB?\b\u0010\u0012\u0006\u0010\r\u001a\u00020\f\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\u000e¢\u0006\u0004\b\n\u0010\u0010J'\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0011\u001a\u00020\u00002\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u0014H\u0001¢\u0006\u0004\b\u0017\u0010\u0018J\u0010\u0010\u0017\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0017\u0010\u0019J\u0010\u0010\u001a\u001a\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u001a\u0010\u001bJ\u0010\u0010\u001c\u001a\u00020\u0006HÆ\u0003¢\u0006\u0004\b\u001c\u0010\u001dJ\u0010\u0010\u001e\u001a\u00020\bHÆ\u0003¢\u0006\u0004\b\u001e\u0010\u001fJ8\u0010\u0017\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\t\u001a\u00020\bHÇ\u0001¢\u0006\u0004\b\u0017\u0010 J\u0010\u0010!\u001a\u00020\u0002H×\u0001¢\u0006\u0004\b!\u0010\u0019J\u0010\u0010\"\u001a\u00020\fH×\u0001¢\u0006\u0004\b\"\u0010#J\u001a\u0010%\u001a\u00020\u00062\b\u0010$\u001a\u0004\u0018\u00010\u0001H×\u0003¢\u0006\u0004\b%\u0010&R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0017\u0010'\u001a\u0004\b(\u0010\u0019R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u001a\u0010)\u001a\u0004\b*\u0010\u001bR\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u001c\u0010+\u001a\u0004\b,\u0010\u001dR\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\u001e\u0010-\u001a\u0004\b.\u0010\u001f¨\u00060"}, d2 = {"Lcom/moloco/sdk/internal/ilrd/a$c;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "sessionId", "Lcom/moloco/sdk/internal/ilrd/a$b;", "impressionCounts", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "isExpired", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "sessionStartTs", "<init>", "(Ljava/lang/String;Lcom/moloco/sdk/internal/ilrd/a$b;ZJ)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "seen0", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "serializationConstructorMarker", "(ILjava/lang/String;Lcom/moloco/sdk/internal/ilrd/a$b;ZJLkotlinx/serialization/internal/SerializationConstructorMarker;)V", "self", "Lkotlinx/serialization/encoding/CompositeEncoder;", "output", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "serialDesc", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "(Lcom/moloco/sdk/internal/ilrd/a$c;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;)V", "()Ljava/lang/String;", "b", "()Lcom/moloco/sdk/internal/ilrd/a$b;", "c", "()Z", "d", "()J", "(Ljava/lang/String;Lcom/moloco/sdk/internal/ilrd/a$b;ZJ)Lcom/moloco/sdk/internal/ilrd/a$c;", "toString", "hashCode", "()I", InneractiveMediationNameConsts.OTHER, "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", InneractiveMediationDefs.GENDER_FEMALE, "Lcom/moloco/sdk/internal/ilrd/a$b;", "e", "Z", "h", "J", "g", k.O, "moloco-sdk_release"}, k = 1, mv = {2, 0, 0})
    @Serializable
    public static final /* data */ class c {

        /* renamed from: Companion, reason: from kotlin metadata */
        @NotNull
        public static final Companion INSTANCE = new Companion(null);

        /* renamed from: e, reason: collision with root package name */
        public static final int f36500e = 0;

        /* renamed from: a, reason: collision with root package name and from kotlin metadata */
        @NotNull
        public final String sessionId;

        /* renamed from: b, reason: collision with root package name and from kotlin metadata */
        @NotNull
        public final b impressionCounts;

        /* renamed from: c, reason: collision with root package name and from kotlin metadata */
        public final boolean isExpired;

        /* renamed from: d, reason: collision with root package name and from kotlin metadata */
        public final long sessionStartTs;

        @Deprecated
        /* renamed from: com.moloco.sdk.internal.ilrd.a$c$a, reason: collision with other inner class name */
        public /* synthetic */ class C0149a implements GeneratedSerializer<c> {

            /* renamed from: a, reason: collision with root package name */
            @NotNull
            public static final C0149a f36505a;

            /* renamed from: b, reason: collision with root package name */
            public static final int f36506b;

            @NotNull
            private static final SerialDescriptor descriptor;

            static {
                C0149a c0149a = new C0149a();
                f36505a = c0149a;
                f36506b = 8;
                PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.moloco.sdk.internal.ilrd.IlrdActiveSession.SessionData", c0149a, 4);
                pluginGeneratedSerialDescriptor.addElement("sessionId", false);
                pluginGeneratedSerialDescriptor.addElement("impressionCounts", false);
                pluginGeneratedSerialDescriptor.addElement("isExpired", false);
                pluginGeneratedSerialDescriptor.addElement("sessionStartTs", false);
                descriptor = pluginGeneratedSerialDescriptor;
            }

            @Override // kotlinx.serialization.DeserializationStrategy
            @NotNull
            /* renamed from: a, reason: merged with bridge method [inline-methods] */
            public final c deserialize(@NotNull Decoder decoder) {
                int i5;
                boolean zDecodeBooleanElement;
                long jDecodeLongElement;
                String str;
                b bVar;
                Intrinsics.g(decoder, "decoder");
                SerialDescriptor serialDescriptor = descriptor;
                CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
                if (compositeDecoderBeginStructure.decodeSequentially()) {
                    String strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
                    b bVar2 = (b) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, b.C0147a.f36498a, null);
                    str = strDecodeStringElement;
                    i5 = 15;
                    zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 2);
                    bVar = bVar2;
                    jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 3);
                } else {
                    long jDecodeLongElement2 = 0;
                    boolean z11 = true;
                    int i11 = 0;
                    String strDecodeStringElement2 = null;
                    b bVar3 = null;
                    boolean zDecodeBooleanElement2 = false;
                    while (z11) {
                        int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                        if (iDecodeElementIndex == -1) {
                            z11 = false;
                        } else if (iDecodeElementIndex == 0) {
                            strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
                            i11 |= 1;
                        } else if (iDecodeElementIndex == 1) {
                            bVar3 = (b) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, b.C0147a.f36498a, bVar3);
                            i11 |= 2;
                        } else if (iDecodeElementIndex == 2) {
                            zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 2);
                            i11 |= 4;
                        } else {
                            if (iDecodeElementIndex != 3) {
                                throw new UnknownFieldException(iDecodeElementIndex);
                            }
                            jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 3);
                            i11 |= 8;
                        }
                    }
                    i5 = i11;
                    zDecodeBooleanElement = zDecodeBooleanElement2;
                    jDecodeLongElement = jDecodeLongElement2;
                    str = strDecodeStringElement2;
                    bVar = bVar3;
                }
                compositeDecoderBeginStructure.endStructure(serialDescriptor);
                return new c(i5, str, bVar, zDecodeBooleanElement, jDecodeLongElement, null);
            }

            @Override // kotlinx.serialization.internal.GeneratedSerializer
            @NotNull
            public final KSerializer<?>[] childSerializers() {
                return new KSerializer[]{StringSerializer.INSTANCE, b.C0147a.f36498a, BooleanSerializer.INSTANCE, LongSerializer.INSTANCE};
            }

            @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
            @NotNull
            public final SerialDescriptor getDescriptor() {
                return descriptor;
            }

            @Override // kotlinx.serialization.SerializationStrategy
            /* renamed from: a, reason: merged with bridge method [inline-methods] */
            public final void serialize(@NotNull Encoder encoder, @NotNull c value) {
                Intrinsics.g(encoder, "encoder");
                Intrinsics.g(value, "value");
                SerialDescriptor serialDescriptor = descriptor;
                CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
                c.a(value, compositeEncoderBeginStructure, serialDescriptor);
                compositeEncoderBeginStructure.endStructure(serialDescriptor);
            }
        }

        /* renamed from: com.moloco.sdk.internal.ilrd.a$c$b, reason: from kotlin metadata */
        public static final class Companion {
            public Companion() {
            }

            @NotNull
            public final KSerializer<c> serializer() {
                return C0149a.f36505a;
            }

            public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
                this();
            }
        }

        public /* synthetic */ c(int i5, String str, b bVar, boolean z11, long j11, SerializationConstructorMarker serializationConstructorMarker) {
            if (15 != (i5 & 15)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 15, C0149a.f36505a.getDescriptor());
            }
            this.sessionId = str;
            this.impressionCounts = bVar;
            this.isExpired = z11;
            this.sessionStartTs = j11;
        }

        @NotNull
        /* renamed from: a, reason: from getter */
        public final String getSessionId() {
            return this.sessionId;
        }

        @NotNull
        /* renamed from: b, reason: from getter */
        public final b getImpressionCounts() {
            return this.impressionCounts;
        }

        /* renamed from: c, reason: from getter */
        public final boolean getIsExpired() {
            return this.isExpired;
        }

        /* renamed from: d, reason: from getter */
        public final long getSessionStartTs() {
            return this.sessionStartTs;
        }

        @NotNull
        public final b e() {
            return this.impressionCounts;
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof c)) {
                return false;
            }
            c cVar = (c) other;
            return Intrinsics.b(this.sessionId, cVar.sessionId) && Intrinsics.b(this.impressionCounts, cVar.impressionCounts) && this.isExpired == cVar.isExpired && this.sessionStartTs == cVar.sessionStartTs;
        }

        @NotNull
        public final String f() {
            return this.sessionId;
        }

        public final long g() {
            return this.sessionStartTs;
        }

        public final boolean h() {
            return this.isExpired;
        }

        public int hashCode() {
            return Long.hashCode(this.sessionStartTs) + c9.f((this.impressionCounts.hashCode() + (this.sessionId.hashCode() * 31)) * 31, 31, this.isExpired);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("SessionData(sessionId=");
            sb2.append(this.sessionId);
            sb2.append(", impressionCounts=");
            sb2.append(this.impressionCounts);
            sb2.append(", isExpired=");
            sb2.append(this.isExpired);
            sb2.append(", sessionStartTs=");
            return a2.c.n(sb2, this.sessionStartTs, ')');
        }

        public c(@NotNull String sessionId, @NotNull b impressionCounts, boolean z11, long j11) {
            Intrinsics.g(sessionId, "sessionId");
            Intrinsics.g(impressionCounts, "impressionCounts");
            this.sessionId = sessionId;
            this.impressionCounts = impressionCounts;
            this.isExpired = z11;
            this.sessionStartTs = j11;
        }

        @NotNull
        public final c a(@NotNull String sessionId, @NotNull b impressionCounts, boolean isExpired, long sessionStartTs) {
            Intrinsics.g(sessionId, "sessionId");
            Intrinsics.g(impressionCounts, "impressionCounts");
            return new c(sessionId, impressionCounts, isExpired, sessionStartTs);
        }

        public static /* synthetic */ c a(c cVar, String str, b bVar, boolean z11, long j11, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = cVar.sessionId;
            }
            if ((i5 & 2) != 0) {
                bVar = cVar.impressionCounts;
            }
            if ((i5 & 4) != 0) {
                z11 = cVar.isExpired;
            }
            if ((i5 & 8) != 0) {
                j11 = cVar.sessionStartTs;
            }
            boolean z12 = z11;
            return cVar.a(str, bVar, z12, j11);
        }

        @JvmStatic
        public static final /* synthetic */ void a(c self, CompositeEncoder output, SerialDescriptor serialDesc) {
            output.encodeStringElement(serialDesc, 0, self.sessionId);
            output.encodeSerializableElement(serialDesc, 1, b.C0147a.f36498a, self.impressionCounts);
            output.encodeBooleanElement(serialDesc, 2, self.isExpired);
            output.encodeLongElement(serialDesc, 3, self.sessionStartTs);
        }
    }

    public a(@NotNull I timeProvider, @Nullable String str) {
        b bVarE;
        Intrinsics.g(timeProvider, "timeProvider");
        this.f36485a = timeProvider;
        c cVar = null;
        if (str != null) {
            try {
                Json.Companion companion = Json.INSTANCE;
                companion.getSerializersModule();
                cVar = (c) companion.decodeFromString(c.INSTANCE.serializer(), str);
            } catch (Exception e3) {
                MolocoLogger.error$default(MolocoLogger.INSTANCE, f36484i, "Error deserializing session data", e3, false, 8, null);
            }
        }
        this.f36486b = cVar;
        this.f36487c = LazyKt.a(new as.c(this, 14));
        this.f36488d = cVar != null ? cVar.g() : this.f36485a.a();
        this.f36489e = new AtomicReference<>((cVar == null || (bVarE = cVar.e()) == null) ? new b(-1L, 0, 0, 0, 0, 0) : bVarE);
        this.f36490f = cVar != null ? cVar.h() : false;
    }

    public static final String a(a aVar) {
        String strF;
        c cVar = aVar.f36486b;
        return (cVar == null || (strF = cVar.f()) == null) ? c0.j("toString(...)") : strF;
    }

    @NotNull
    public final b b() {
        b bVar = this.f36489e.get();
        Intrinsics.f(bVar, "get(...)");
        return bVar;
    }

    @NotNull
    public final String c() {
        return (String) this.f36487c.getValue();
    }

    public final long d() {
        return this.f36488d;
    }

    public final boolean e() {
        return this.f36490f;
    }

    @NotNull
    public final String f() {
        return Json.INSTANCE.encodeToString(c.INSTANCE.serializer(), new c(c(), b(), e(), this.f36488d));
    }

    @NotNull
    public String toString() {
        b bVarB = b();
        return "IlrdActiveSession(id=" + c() + ", startTs=" + this.f36488d + ", expired=" + e() + ", impressions=" + (bVarB.l() + bVarB.h() + bVarB.k() + bVarB.j() + bVarB.g()) + " [banner=" + bVarB.g() + ", mrec=" + bVarB.j() + ", native=" + bVarB.k() + ", interstitial=" + bVarB.h() + ", rewarded=" + bVarB.l() + "])";
    }

    public final void a(@NotNull c.a ilrdData) {
        Intrinsics.g(ilrdData, "ilrdData");
        if (ilrdData instanceof c.a.b) {
            String adFormat = ((c.a.b) ilrdData).b().getAdFormat();
            Intrinsics.f(adFormat, "getAdFormat(...)");
            String upperCase = adFormat.toUpperCase(Locale.ROOT);
            Intrinsics.f(upperCase, "toUpperCase(...)");
            a(upperCase, "Applovin");
            return;
        }
        if (ilrdData instanceof c.a.C0150a) {
            String adFormat2 = ((c.a.C0150a) ilrdData).b().getAdFormat();
            Intrinsics.f(adFormat2, "getAdFormat(...)");
            String upperCase2 = adFormat2.toUpperCase(Locale.ROOT);
            Intrinsics.f(upperCase2, "toUpperCase(...)");
            a(upperCase2, "Ironsource");
            return;
        }
        throw new NoWhenBranchMatchedException();
    }

    public /* synthetic */ a(I i5, String str, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this(i5, (i11 & 2) != 0 ? null : str);
    }

    public final boolean a(String str, String str2) {
        b bVarA;
        long jA = this.f36485a.a();
        b bVar = this.f36489e.get();
        if (r70.k.K0(str, "BANNER", false)) {
            bVarA = b.a(bVar, jA, bVar.g() + 1, 0, 0, 0, 0, 60, null);
        } else if (r70.k.K0(str, "MREC", false)) {
            bVarA = b.a(bVar, jA, 0, bVar.j() + 1, 0, 0, 0, 58, null);
        } else if (r70.k.K0(str, "NATIVE", false)) {
            bVarA = b.a(bVar, jA, 0, 0, bVar.k() + 1, 0, 0, 54, null);
        } else if (r70.k.K0(str, "INTER", false)) {
            bVarA = b.a(bVar, jA, 0, 0, 0, bVar.h() + 1, 0, 46, null);
        } else if (r70.k.K0(str, "REWARD", false)) {
            bVarA = b.a(bVar, jA, 0, 0, 0, 0, bVar.l() + 1, 30, null);
        } else {
            MolocoLogger.warn$default(MolocoLogger.INSTANCE, f36484i, c0.m("Unknown ad format for ", str2, ": ", str), null, false, 12, null);
            return false;
        }
        this.f36489e.set(bVarA);
        return true;
    }

    public final void a() {
        this.f36490f = true;
    }
}
