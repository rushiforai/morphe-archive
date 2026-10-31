package com.moloco.sdk.internal.ortb.model;

import androidx.recyclerview.widget.u1;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.moloco.sdk.internal.ortb.model.A;
import com.moloco.sdk.internal.ortb.model.C;
import com.moloco.sdk.internal.ortb.model.C2931a;
import com.moloco.sdk.internal.ortb.model.C2932b;
import com.moloco.sdk.internal.ortb.model.C2933c;
import com.moloco.sdk.internal.ortb.model.F;
import com.moloco.sdk.internal.ortb.model.G;
import com.moloco.sdk.internal.ortb.model.i;
import com.moloco.sdk.internal.ortb.model.k;
import com.moloco.sdk.internal.ortb.model.n;
import com.moloco.sdk.internal.ortb.model.x;
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
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000v\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b6\b\u0001\u0018\u0000 \\2\u00020\u0001:\u0002(/B\u0097\u0001\u0012\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\b\u001a\u00020\u0007\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\u0006\u0010\f\u001a\u00020\u000b\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u000f\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0011\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u0015\u0012\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u0017\u0012\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u0019¢\u0006\u0004\b\u001b\u0010\u001cB\u009b\u0001\b\u0010\u0012\u0006\u0010\u001e\u001a\u00020\u001d\u0012\b\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\n\u001a\u0004\u0018\u00010\t\u0012\u0006\u0010\f\u001a\u00020\u000b\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\b\u0010\u0010\u001a\u0004\u0018\u00010\u000f\u0012\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011\u0012\b\u0010\u0014\u001a\u0004\u0018\u00010\u0013\u0012\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015\u0012\b\u0010\u0018\u001a\u0004\u0018\u00010\u0017\u0012\b\u0010\u001a\u001a\u0004\u0018\u00010\u0019\u0012\b\u0010 \u001a\u0004\u0018\u00010\u001f¢\u0006\u0004\b\u001b\u0010!J'\u0010(\u001a\u00020'2\u0006\u0010\"\u001a\u00020\u00002\u0006\u0010$\u001a\u00020#2\u0006\u0010&\u001a\u00020%H\u0001¢\u0006\u0004\b(\u0010)R\"\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b(\u0010*\u0012\u0004\b-\u0010.\u001a\u0004\b+\u0010,R \u0010\u0004\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b/\u0010*\u0012\u0004\b1\u0010.\u001a\u0004\b0\u0010,R\"\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b2\u00103\u0012\u0004\b6\u0010.\u001a\u0004\b4\u00105R \u0010\b\u001a\u00020\u00078\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b7\u00108\u0012\u0004\b;\u0010.\u001a\u0004\b9\u0010:R\"\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b<\u0010=\u0012\u0004\b@\u0010.\u001a\u0004\b>\u0010?R \u0010\f\u001a\u00020\u000b8\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\bA\u0010B\u0012\u0004\bE\u0010.\u001a\u0004\bC\u0010DR\"\u0010\u000e\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b0\u0010F\u0012\u0004\bA\u0010.\u001a\u0004\b<\u0010GR\"\u0010\u0010\u001a\u0004\u0018\u00010\u000f8\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b1\u0010H\u0012\u0004\bK\u0010.\u001a\u0004\bI\u0010JR\"\u0010\u0012\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\bL\u0010M\u0012\u0004\bP\u0010.\u001a\u0004\bN\u0010OR\"\u0010\u0014\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\bQ\u0010R\u0012\u0004\bQ\u0010.\u001a\u0004\bL\u0010SR\"\u0010\u0016\u001a\u0004\u0018\u00010\u00158\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b>\u0010T\u0012\u0004\b/\u0010.\u001a\u0004\b(\u0010UR\"\u0010\u0018\u001a\u0004\u0018\u00010\u00178\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\b@\u0010V\u0012\u0004\b7\u0010.\u001a\u0004\b2\u0010WR\"\u0010\u001a\u001a\u0004\u0018\u00010\u00198\u0006X\u0087\u0004¢\u0006\u0012\n\u0004\bN\u0010X\u0012\u0004\b[\u0010.\u001a\u0004\bY\u0010Z¨\u0006]"}, d2 = {"Lcom/moloco/sdk/internal/ortb/model/B;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/moloco/sdk/internal/ortb/model/F;", "skip", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n.f39150d, "Lcom/moloco/sdk/internal/ortb/model/C;", "progressBar", "Lcom/moloco/sdk/internal/ortb/model/A;", "mute", "Lcom/moloco/sdk/internal/ortb/model/i;", "cta", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "isAllAreaClickable", "Lcom/moloco/sdk/internal/ortb/model/c;", "autoStore", "Lcom/moloco/sdk/internal/ortb/model/G;", "vastPrivacyIcon", "Lcom/moloco/sdk/internal/ortb/model/n;", "dec", "Lcom/moloco/sdk/internal/ortb/model/k;", "countDownTimer", "Lcom/moloco/sdk/internal/ortb/model/a;", "androidInline", "Lcom/moloco/sdk/internal/ortb/model/b;", "autoInline", "Lcom/moloco/sdk/internal/ortb/model/x;", "inlineTextButton", "<init>", "(Lcom/moloco/sdk/internal/ortb/model/F;Lcom/moloco/sdk/internal/ortb/model/F;Lcom/moloco/sdk/internal/ortb/model/C;Lcom/moloco/sdk/internal/ortb/model/A;Lcom/moloco/sdk/internal/ortb/model/i;ZLcom/moloco/sdk/internal/ortb/model/c;Lcom/moloco/sdk/internal/ortb/model/G;Lcom/moloco/sdk/internal/ortb/model/n;Lcom/moloco/sdk/internal/ortb/model/k;Lcom/moloco/sdk/internal/ortb/model/a;Lcom/moloco/sdk/internal/ortb/model/b;Lcom/moloco/sdk/internal/ortb/model/x;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "seen0", "Lkotlinx/serialization/internal/SerializationConstructorMarker;", "serializationConstructorMarker", "(ILcom/moloco/sdk/internal/ortb/model/F;Lcom/moloco/sdk/internal/ortb/model/F;Lcom/moloco/sdk/internal/ortb/model/C;Lcom/moloco/sdk/internal/ortb/model/A;Lcom/moloco/sdk/internal/ortb/model/i;ZLcom/moloco/sdk/internal/ortb/model/c;Lcom/moloco/sdk/internal/ortb/model/G;Lcom/moloco/sdk/internal/ortb/model/n;Lcom/moloco/sdk/internal/ortb/model/k;Lcom/moloco/sdk/internal/ortb/model/a;Lcom/moloco/sdk/internal/ortb/model/b;Lcom/moloco/sdk/internal/ortb/model/x;Lkotlinx/serialization/internal/SerializationConstructorMarker;)V", "self", "Lkotlinx/serialization/encoding/CompositeEncoder;", "output", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "serialDesc", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "(Lcom/moloco/sdk/internal/ortb/model/B;Lkotlinx/serialization/encoding/CompositeEncoder;Lkotlinx/serialization/descriptors/SerialDescriptor;)V", "Lcom/moloco/sdk/internal/ortb/model/F;", "u", "()Lcom/moloco/sdk/internal/ortb/model/F;", "v", "()V", "b", "g", "h", "c", "Lcom/moloco/sdk/internal/ortb/model/C;", "s", "()Lcom/moloco/sdk/internal/ortb/model/C;", "t", "d", "Lcom/moloco/sdk/internal/ortb/model/A;", "q", "()Lcom/moloco/sdk/internal/ortb/model/A;", "r", "e", "Lcom/moloco/sdk/internal/ortb/model/i;", "k", "()Lcom/moloco/sdk/internal/ortb/model/i;", "l", InneractiveMediationDefs.GENDER_FEMALE, "Z", "y", "()Z", "z", "Lcom/moloco/sdk/internal/ortb/model/c;", "()Lcom/moloco/sdk/internal/ortb/model/c;", "Lcom/moloco/sdk/internal/ortb/model/G;", "w", "()Lcom/moloco/sdk/internal/ortb/model/G;", "x", "i", "Lcom/moloco/sdk/internal/ortb/model/n;", InneractiveMediationDefs.GENDER_MALE, "()Lcom/moloco/sdk/internal/ortb/model/n;", "n", "j", "Lcom/moloco/sdk/internal/ortb/model/k;", "()Lcom/moloco/sdk/internal/ortb/model/k;", "Lcom/moloco/sdk/internal/ortb/model/a;", "()Lcom/moloco/sdk/internal/ortb/model/a;", "Lcom/moloco/sdk/internal/ortb/model/b;", "()Lcom/moloco/sdk/internal/ortb/model/b;", "Lcom/moloco/sdk/internal/ortb/model/x;", "o", "()Lcom/moloco/sdk/internal/ortb/model/x;", "p", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "moloco-sdk_release"}, k = 1, mv = {2, 0, 0})
@Serializable
/* loaded from: classes4.dex */
public final class B {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);
    public static final int n = 8;

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final F skip;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final F close;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final C progressBar;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final A mute;

    /* renamed from: e, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final i cta;

    /* renamed from: f, reason: collision with root package name and from kotlin metadata */
    public final boolean isAllAreaClickable;

    /* renamed from: g, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final C2933c autoStore;

    /* renamed from: h, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final G vastPrivacyIcon;

    /* renamed from: i, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final n dec;

    /* renamed from: j, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final k countDownTimer;

    /* renamed from: k, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final C2931a androidInline;

    /* renamed from: l, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final C2932b autoInline;

    /* renamed from: m, reason: collision with root package name and from kotlin metadata */
    @Nullable
    public final x inlineTextButton;

    @Deprecated
    public /* synthetic */ class a implements GeneratedSerializer<B> {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public static final a f36647a;

        /* renamed from: b, reason: collision with root package name */
        public static final int f36648b;

        @NotNull
        private static final SerialDescriptor descriptor;

        static {
            a aVar = new a();
            f36647a = aVar;
            f36648b = 8;
            PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.moloco.sdk.internal.ortb.model.Player", aVar, 13);
            pluginGeneratedSerialDescriptor.addElement("skip", true);
            pluginGeneratedSerialDescriptor.addElement(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n.f39150d, false);
            pluginGeneratedSerialDescriptor.addElement("progress_bar", true);
            pluginGeneratedSerialDescriptor.addElement("mute", false);
            pluginGeneratedSerialDescriptor.addElement("cta", true);
            pluginGeneratedSerialDescriptor.addElement("is_all_area_clickable", false);
            pluginGeneratedSerialDescriptor.addElement("auto_store", true);
            pluginGeneratedSerialDescriptor.addElement("vast_privacy_icon", true);
            pluginGeneratedSerialDescriptor.addElement("dec", true);
            pluginGeneratedSerialDescriptor.addElement("countdown_timer", true);
            pluginGeneratedSerialDescriptor.addElement("android_inline", true);
            pluginGeneratedSerialDescriptor.addElement("auto_inline", true);
            pluginGeneratedSerialDescriptor.addElement("inline_button", true);
            descriptor = pluginGeneratedSerialDescriptor;
        }

        @Override // kotlinx.serialization.DeserializationStrategy
        @NotNull
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final B deserialize(@NotNull Decoder decoder) {
            F f11;
            x xVar;
            C2932b c2932b;
            k kVar;
            n nVar;
            G g11;
            i iVar;
            C2931a c2931a;
            C2933c c2933c;
            A a11;
            C c11;
            F f12;
            int i5;
            boolean z11;
            F f13;
            Intrinsics.g(decoder, "decoder");
            SerialDescriptor serialDescriptor = descriptor;
            CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
            if (compositeDecoderBeginStructure.decodeSequentially()) {
                F.a aVar = F.a.f36685a;
                F f14 = (F) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 0, aVar, null);
                F f15 = (F) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, aVar, null);
                C c12 = (C) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, C.a.f36655a, null);
                A a12 = (A) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, A.a.f36632a, null);
                i iVar2 = (i) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, i.a.f36757a, null);
                boolean zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 5);
                C2933c c2933c2 = (C2933c) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 6, C2933c.a.f36716a, null);
                G g12 = (G) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 7, G.a.f36692a, null);
                n nVar2 = (n) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 8, n.a.f36793a, null);
                k kVar2 = (k) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 9, k.a.f36771a, null);
                C2931a c2931a2 = (C2931a) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 10, C2931a.C0155a.f36703a, null);
                C2932b c2932b2 = (C2932b) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 11, C2932b.a.f36710a, null);
                xVar = (x) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 12, x.a.f36862a, null);
                i5 = 8191;
                c2932b = c2932b2;
                c2931a = c2931a2;
                kVar = kVar2;
                g11 = g12;
                c2933c = c2933c2;
                z11 = zDecodeBooleanElement;
                a11 = a12;
                nVar = nVar2;
                iVar = iVar2;
                c11 = c12;
                f11 = f14;
                f12 = f15;
            } else {
                F f16 = null;
                x xVar2 = null;
                C2932b c2932b3 = null;
                k kVar3 = null;
                n nVar3 = null;
                G g13 = null;
                i iVar3 = null;
                C2931a c2931a3 = null;
                C2933c c2933c3 = null;
                A a13 = null;
                boolean z12 = true;
                boolean zDecodeBooleanElement2 = false;
                C c13 = null;
                F f17 = null;
                int i11 = 0;
                while (z12) {
                    int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                    switch (iDecodeElementIndex) {
                        case -1:
                            z12 = false;
                            i11 = i11;
                        case 0:
                            f16 = (F) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 0, F.a.f36685a, f16);
                            i11 |= 1;
                        case 1:
                            f13 = f16;
                            f17 = (F) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, F.a.f36685a, f17);
                            i11 |= 2;
                            f16 = f13;
                        case 2:
                            f13 = f16;
                            c13 = (C) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, C.a.f36655a, c13);
                            i11 |= 4;
                            f16 = f13;
                        case 3:
                            f13 = f16;
                            a13 = (A) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, A.a.f36632a, a13);
                            i11 |= 8;
                            f16 = f13;
                        case 4:
                            f13 = f16;
                            iVar3 = (i) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, i.a.f36757a, iVar3);
                            i11 |= 16;
                            f16 = f13;
                        case 5:
                            f13 = f16;
                            zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 5);
                            i11 |= 32;
                            f16 = f13;
                        case 6:
                            f13 = f16;
                            c2933c3 = (C2933c) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 6, C2933c.a.f36716a, c2933c3);
                            i11 |= 64;
                            f16 = f13;
                        case 7:
                            f13 = f16;
                            g13 = (G) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 7, G.a.f36692a, g13);
                            i11 |= 128;
                            f16 = f13;
                        case 8:
                            f13 = f16;
                            nVar3 = (n) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 8, n.a.f36793a, nVar3);
                            i11 |= 256;
                            f16 = f13;
                        case 9:
                            f13 = f16;
                            kVar3 = (k) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 9, k.a.f36771a, kVar3);
                            i11 |= EventBridgeChannel.QUEUE_CAPACITY;
                            f16 = f13;
                        case 10:
                            f13 = f16;
                            c2931a3 = (C2931a) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 10, C2931a.C0155a.f36703a, c2931a3);
                            i11 |= 1024;
                            f16 = f13;
                        case 11:
                            c2932b3 = (C2932b) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 11, C2932b.a.f36710a, c2932b3);
                            i11 |= 2048;
                            f16 = f16;
                        case 12:
                            f13 = f16;
                            xVar2 = (x) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 12, x.a.f36862a, xVar2);
                            i11 |= u1.FLAG_APPEARED_IN_PRE_LAYOUT;
                            f16 = f13;
                        default:
                            throw new UnknownFieldException(iDecodeElementIndex);
                    }
                }
                f11 = f16;
                xVar = xVar2;
                c2932b = c2932b3;
                kVar = kVar3;
                nVar = nVar3;
                g11 = g13;
                iVar = iVar3;
                c2931a = c2931a3;
                c2933c = c2933c3;
                a11 = a13;
                c11 = c13;
                f12 = f17;
                i5 = i11;
                z11 = zDecodeBooleanElement2;
            }
            compositeDecoderBeginStructure.endStructure(serialDescriptor);
            return new B(i5, f11, f12, c11, a11, iVar, z11, c2933c, g11, nVar, kVar, c2931a, c2932b, xVar, (SerializationConstructorMarker) null);
        }

        @Override // kotlinx.serialization.internal.GeneratedSerializer
        @NotNull
        public final KSerializer<?>[] childSerializers() {
            F.a aVar = F.a.f36685a;
            return new KSerializer[]{BuiltinSerializersKt.getNullable(aVar), aVar, BuiltinSerializersKt.getNullable(C.a.f36655a), A.a.f36632a, BuiltinSerializersKt.getNullable(i.a.f36757a), BooleanSerializer.INSTANCE, BuiltinSerializersKt.getNullable(C2933c.a.f36716a), BuiltinSerializersKt.getNullable(G.a.f36692a), BuiltinSerializersKt.getNullable(n.a.f36793a), BuiltinSerializersKt.getNullable(k.a.f36771a), BuiltinSerializersKt.getNullable(C2931a.C0155a.f36703a), BuiltinSerializersKt.getNullable(C2932b.a.f36710a), BuiltinSerializersKt.getNullable(x.a.f36862a)};
        }

        @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
        @NotNull
        public final SerialDescriptor getDescriptor() {
            return descriptor;
        }

        @Override // kotlinx.serialization.SerializationStrategy
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final void serialize(@NotNull Encoder encoder, @NotNull B value) {
            Intrinsics.g(encoder, "encoder");
            Intrinsics.g(value, "value");
            SerialDescriptor serialDescriptor = descriptor;
            CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
            B.a(value, compositeEncoderBeginStructure, serialDescriptor);
            compositeEncoderBeginStructure.endStructure(serialDescriptor);
        }
    }

    /* renamed from: com.moloco.sdk.internal.ortb.model.B$b, reason: from kotlin metadata */
    public static final class Companion {
        public Companion() {
        }

        @NotNull
        public final KSerializer<B> serializer() {
            return a.f36647a;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    public /* synthetic */ B(int i5, F f11, F f12, C c11, A a11, i iVar, boolean z11, C2933c c2933c, G g11, n nVar, k kVar, C2931a c2931a, C2932b c2932b, x xVar, SerializationConstructorMarker serializationConstructorMarker) {
        if (42 != (i5 & 42)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 42, a.f36647a.getDescriptor());
        }
        if ((i5 & 1) == 0) {
            this.skip = null;
        } else {
            this.skip = f11;
        }
        this.close = f12;
        if ((i5 & 4) == 0) {
            this.progressBar = null;
        } else {
            this.progressBar = c11;
        }
        this.mute = a11;
        if ((i5 & 16) == 0) {
            this.cta = null;
        } else {
            this.cta = iVar;
        }
        this.isAllAreaClickable = z11;
        if ((i5 & 64) == 0) {
            this.autoStore = null;
        } else {
            this.autoStore = c2933c;
        }
        if ((i5 & 128) == 0) {
            this.vastPrivacyIcon = null;
        } else {
            this.vastPrivacyIcon = g11;
        }
        if ((i5 & 256) == 0) {
            this.dec = null;
        } else {
            this.dec = nVar;
        }
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) == 0) {
            this.countDownTimer = null;
        } else {
            this.countDownTimer = kVar;
        }
        if ((i5 & 1024) == 0) {
            this.androidInline = null;
        } else {
            this.androidInline = c2931a;
        }
        if ((i5 & 2048) == 0) {
            this.autoInline = null;
        } else {
            this.autoInline = c2932b;
        }
        if ((i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) == 0) {
            this.inlineTextButton = null;
        } else {
            this.inlineTextButton = xVar;
        }
    }

    @JvmStatic
    public static final /* synthetic */ void a(B self, CompositeEncoder output, SerialDescriptor serialDesc) {
        if (output.shouldEncodeElementDefault(serialDesc, 0) || self.skip != null) {
            output.encodeNullableSerializableElement(serialDesc, 0, F.a.f36685a, self.skip);
        }
        output.encodeSerializableElement(serialDesc, 1, F.a.f36685a, self.close);
        if (output.shouldEncodeElementDefault(serialDesc, 2) || self.progressBar != null) {
            output.encodeNullableSerializableElement(serialDesc, 2, C.a.f36655a, self.progressBar);
        }
        output.encodeSerializableElement(serialDesc, 3, A.a.f36632a, self.mute);
        if (output.shouldEncodeElementDefault(serialDesc, 4) || self.cta != null) {
            output.encodeNullableSerializableElement(serialDesc, 4, i.a.f36757a, self.cta);
        }
        output.encodeBooleanElement(serialDesc, 5, self.isAllAreaClickable);
        if (output.shouldEncodeElementDefault(serialDesc, 6) || self.autoStore != null) {
            output.encodeNullableSerializableElement(serialDesc, 6, C2933c.a.f36716a, self.autoStore);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 7) || self.vastPrivacyIcon != null) {
            output.encodeNullableSerializableElement(serialDesc, 7, G.a.f36692a, self.vastPrivacyIcon);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 8) || self.dec != null) {
            output.encodeNullableSerializableElement(serialDesc, 8, n.a.f36793a, self.dec);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 9) || self.countDownTimer != null) {
            output.encodeNullableSerializableElement(serialDesc, 9, k.a.f36771a, self.countDownTimer);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 10) || self.androidInline != null) {
            output.encodeNullableSerializableElement(serialDesc, 10, C2931a.C0155a.f36703a, self.androidInline);
        }
        if (output.shouldEncodeElementDefault(serialDesc, 11) || self.autoInline != null) {
            output.encodeNullableSerializableElement(serialDesc, 11, C2932b.a.f36710a, self.autoInline);
        }
        if (!output.shouldEncodeElementDefault(serialDesc, 12) && self.inlineTextButton == null) {
            return;
        }
        output.encodeNullableSerializableElement(serialDesc, 12, x.a.f36862a, self.inlineTextButton);
    }

    @SerialName("android_inline")
    public static /* synthetic */ void b() {
    }

    @SerialName("auto_inline")
    public static /* synthetic */ void d() {
    }

    @SerialName("auto_store")
    public static /* synthetic */ void f() {
    }

    @SerialName(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n.f39150d)
    public static /* synthetic */ void h() {
    }

    @SerialName("countdown_timer")
    public static /* synthetic */ void j() {
    }

    @SerialName("cta")
    public static /* synthetic */ void l() {
    }

    @SerialName("dec")
    public static /* synthetic */ void n() {
    }

    @SerialName("inline_button")
    public static /* synthetic */ void p() {
    }

    @SerialName("mute")
    public static /* synthetic */ void r() {
    }

    @SerialName("progress_bar")
    public static /* synthetic */ void t() {
    }

    @SerialName("skip")
    public static /* synthetic */ void v() {
    }

    @SerialName("vast_privacy_icon")
    public static /* synthetic */ void x() {
    }

    @SerialName("is_all_area_clickable")
    public static /* synthetic */ void z() {
    }

    @Nullable
    /* renamed from: c, reason: from getter */
    public final C2932b getAutoInline() {
        return this.autoInline;
    }

    @Nullable
    /* renamed from: e, reason: from getter */
    public final C2933c getAutoStore() {
        return this.autoStore;
    }

    @NotNull
    /* renamed from: g, reason: from getter */
    public final F getClose() {
        return this.close;
    }

    @Nullable
    /* renamed from: i, reason: from getter */
    public final k getCountDownTimer() {
        return this.countDownTimer;
    }

    @Nullable
    /* renamed from: k, reason: from getter */
    public final i getCta() {
        return this.cta;
    }

    @Nullable
    /* renamed from: m, reason: from getter */
    public final n getDec() {
        return this.dec;
    }

    @Nullable
    /* renamed from: o, reason: from getter */
    public final x getInlineTextButton() {
        return this.inlineTextButton;
    }

    @NotNull
    /* renamed from: q, reason: from getter */
    public final A getMute() {
        return this.mute;
    }

    @Nullable
    /* renamed from: s, reason: from getter */
    public final C getProgressBar() {
        return this.progressBar;
    }

    @Nullable
    /* renamed from: u, reason: from getter */
    public final F getSkip() {
        return this.skip;
    }

    @Nullable
    /* renamed from: w, reason: from getter */
    public final G getVastPrivacyIcon() {
        return this.vastPrivacyIcon;
    }

    /* renamed from: y, reason: from getter */
    public final boolean getIsAllAreaClickable() {
        return this.isAllAreaClickable;
    }

    @Nullable
    /* renamed from: a, reason: from getter */
    public final C2931a getAndroidInline() {
        return this.androidInline;
    }

    public B(@Nullable F f11, @NotNull F close, @Nullable C c11, @NotNull A mute, @Nullable i iVar, boolean z11, @Nullable C2933c c2933c, @Nullable G g11, @Nullable n nVar, @Nullable k kVar, @Nullable C2931a c2931a, @Nullable C2932b c2932b, @Nullable x xVar) {
        Intrinsics.g(close, "close");
        Intrinsics.g(mute, "mute");
        this.skip = f11;
        this.close = close;
        this.progressBar = c11;
        this.mute = mute;
        this.cta = iVar;
        this.isAllAreaClickable = z11;
        this.autoStore = c2933c;
        this.vastPrivacyIcon = g11;
        this.dec = nVar;
        this.countDownTimer = kVar;
        this.androidInline = c2931a;
        this.autoInline = c2932b;
        this.inlineTextButton = xVar;
    }

    public /* synthetic */ B(F f11, F f12, C c11, A a11, i iVar, boolean z11, C2933c c2933c, G g11, n nVar, k kVar, C2931a c2931a, C2932b c2932b, x xVar, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : f11, f12, (i5 & 4) != 0 ? null : c11, a11, (i5 & 16) != 0 ? null : iVar, z11, (i5 & 64) != 0 ? null : c2933c, (i5 & 128) != 0 ? null : g11, (i5 & 256) != 0 ? null : nVar, (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? null : kVar, (i5 & 1024) != 0 ? null : c2931a, (i5 & 2048) != 0 ? null : c2932b, (i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? null : xVar);
    }
}
