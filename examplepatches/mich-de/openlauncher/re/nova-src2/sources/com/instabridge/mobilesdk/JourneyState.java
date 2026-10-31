package com.instabridge.mobilesdk;

import com.instabridge.ai.tools.a;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.EnumsKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0011\n\u0002\u0010\u000b\n\u0002\b\u0003\b\u0087\u0081\u0002\u0018\u0000 \u00152\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0015B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0011\u0010\u0012\u001a\u00020\u00138F¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0014j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011¨\u0006\u0016"}, d2 = {"Lcom/instabridge/mobilesdk/JourneyState;", b.f42142b, "<init>", "(Ljava/lang/String;I)V", "NotEligible", "OfferAvailable", "OfferClaimed", "EsimAssigned", "DefaultBrowser", "PurchasedPro", "EsimInstalled", "DefaultBrowserEsimInstalled", "PurchasedProEsimInstalled", "EmailVerificationRequired", "PaymentVerificationRequired", "ProTrial", "DefaultLauncher", "DefaultLauncherEsimInstalled", "isOnboarded", b.f42142b, "()Z", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes3.dex */
public final class JourneyState {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ JourneyState[] $VALUES;

    @NotNull
    private static final Lazy<KSerializer<Object>> $cachedSerializer$delegate;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE;
    public static final JourneyState NotEligible = new JourneyState("NotEligible", 0);
    public static final JourneyState OfferAvailable = new JourneyState("OfferAvailable", 1);
    public static final JourneyState OfferClaimed = new JourneyState("OfferClaimed", 2);
    public static final JourneyState EsimAssigned = new JourneyState("EsimAssigned", 3);
    public static final JourneyState DefaultBrowser = new JourneyState("DefaultBrowser", 4);
    public static final JourneyState PurchasedPro = new JourneyState("PurchasedPro", 5);
    public static final JourneyState EsimInstalled = new JourneyState("EsimInstalled", 6);
    public static final JourneyState DefaultBrowserEsimInstalled = new JourneyState("DefaultBrowserEsimInstalled", 7);
    public static final JourneyState PurchasedProEsimInstalled = new JourneyState("PurchasedProEsimInstalled", 8);
    public static final JourneyState EmailVerificationRequired = new JourneyState("EmailVerificationRequired", 9);
    public static final JourneyState PaymentVerificationRequired = new JourneyState("PaymentVerificationRequired", 10);
    public static final JourneyState ProTrial = new JourneyState("ProTrial", 11);
    public static final JourneyState DefaultLauncher = new JourneyState("DefaultLauncher", 12);
    public static final JourneyState DefaultLauncherEsimInstalled = new JourneyState("DefaultLauncherEsimInstalled", 13);

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/JourneyState$Companion;", b.f42142b, "<init>", "()V", "serializer", "Lkotlinx/serialization/KSerializer;", "Lcom/instabridge/mobilesdk/JourneyState;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        private final /* synthetic */ KSerializer get$cachedSerializer() {
            return (KSerializer) JourneyState.$cachedSerializer$delegate.getValue();
        }

        @NotNull
        public final KSerializer<JourneyState> serializer() {
            return get$cachedSerializer();
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[JourneyState.values().length];
            try {
                iArr[JourneyState.EsimInstalled.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[JourneyState.PurchasedProEsimInstalled.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[JourneyState.PurchasedPro.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                iArr[JourneyState.DefaultBrowserEsimInstalled.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                iArr[JourneyState.DefaultLauncherEsimInstalled.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    private static final /* synthetic */ JourneyState[] $values() {
        return new JourneyState[]{NotEligible, OfferAvailable, OfferClaimed, EsimAssigned, DefaultBrowser, PurchasedPro, EsimInstalled, DefaultBrowserEsimInstalled, PurchasedProEsimInstalled, EmailVerificationRequired, PaymentVerificationRequired, ProTrial, DefaultLauncher, DefaultLauncherEsimInstalled};
    }

    static {
        JourneyState[] journeyStateArr$values = $values();
        $VALUES = journeyStateArr$values;
        $ENTRIES = EnumEntriesKt.a(journeyStateArr$values);
        INSTANCE = new Companion(null);
        $cachedSerializer$delegate = LazyKt.b(LazyThreadSafetyMode.f71680b, new a(2));
    }

    private JourneyState(String str, int i5) {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final /* synthetic */ KSerializer _init_$_anonymous_() {
        return EnumsKt.createSimpleEnumSerializer("com.instabridge.mobilesdk.JourneyState", values());
    }

    @NotNull
    public static EnumEntries<JourneyState> getEntries() {
        return $ENTRIES;
    }

    public static JourneyState valueOf(String str) {
        return (JourneyState) Enum.valueOf(JourneyState.class, str);
    }

    public static JourneyState[] values() {
        return (JourneyState[]) $VALUES.clone();
    }

    public final boolean isOnboarded() {
        int i5 = WhenMappings.$EnumSwitchMapping$0[ordinal()];
        return i5 == 1 || i5 == 2 || i5 == 3 || i5 == 4 || i5 == 5;
    }
}
