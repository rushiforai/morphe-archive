package com.instabridge.mobilesdk.internal.ui;

import b.u4;
import com.instabridge.mobilesdk.internal.data.EsimInstallStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001d\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0080\u0081\u0002\u0018\u0000 '2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0002&'B%\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0003¢\u0006\u0004\b\u0007\u0010\bJ\u000e\u0010!\u001a\u00020\u00032\u0006\u0010\"\u001a\u00020#J\u000e\u0010$\u001a\u00020#2\u0006\u0010\"\u001a\u00020#J\u0010\u0010%\u001a\u00020\u00052\u0006\u0010\"\u001a\u00020#H\u0002R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000j\u0002\b\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016j\u0002\b\u0017j\u0002\b\u0018j\u0002\b\u0019j\u0002\b\u001aj\u0002\b\u001bj\u0002\b\u001cj\u0002\b\u001dj\u0002\b\u001ej\u0002\b\u001fj\u0002\b ¨\u0006("}, d2 = {"Lcom/instabridge/mobilesdk/internal/ui/Step;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "analyticsName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "product", "Lcom/instabridge/mobilesdk/internal/ui/Step$Product;", "screenName", "<init>", "(Ljava/lang/String;ILjava/lang/String;Lcom/instabridge/mobilesdk/internal/ui/Step$Product;Ljava/lang/String;)V", "getAnalyticsName", "()Ljava/lang/String;", "ONBOARDING", "HOW_IT_WORKS", "PLANS", "LOGIN", "CHECKOUT", "ACTIVATING", "INSTALL_ESIM", "INSTALLING", "ALMOST_THERE", "CONNECTED", "PLAN_UPDATED", "BOOSTER_SUCCESS", "COULDNT_INSTALL", "DASHBOARD", "TRAVEL_PLANS", "TRAVEL_DESTINATIONS", "TRAVEL_ESIM_READY", "TRAVEL_ESIM_INSTALL_OPTIONS", "TRAVEL_ESIM_INSTALLED", "MY_ESIMS", "WINBACK_PLANS", "CANCEL_PLAN_REASONS", "viewEvent", "travel", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "isTravel", "resolve", "Product", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class Step {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ Step[] $VALUES;
    public static final Step ACTIVATING;
    public static final Step ALMOST_THERE;
    public static final Step BOOSTER_SUCCESS;
    public static final Step CANCEL_PLAN_REASONS;
    public static final Step CHECKOUT;
    public static final Step CONNECTED;
    public static final Step COULDNT_INSTALL;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE;
    public static final Step DASHBOARD;
    public static final Step INSTALLING;
    public static final Step INSTALL_ESIM;
    public static final Step LOGIN;
    public static final Step MY_ESIMS;
    public static final Step ONBOARDING = new Step("ONBOARDING", 0, "intro", null, null, 6, null);
    public static final Step PLAN_UPDATED;
    public static final Step TRAVEL_DESTINATIONS;
    public static final Step TRAVEL_ESIM_INSTALLED;
    public static final Step TRAVEL_ESIM_INSTALL_OPTIONS;
    public static final Step TRAVEL_ESIM_READY;
    public static final Step TRAVEL_PLANS;
    public static final Step WINBACK_PLANS;

    @NotNull
    private final String analyticsName;

    @NotNull
    private final Product product;

    @NotNull
    private final String screenName;
    public static final Step HOW_IT_WORKS = new Step("HOW_IT_WORKS", 1, "how_it_works", 0 == true ? 1 : 0, null, 6, null);
    public static final Step PLANS = new Step("PLANS", 2, "pick_plan", 0 == true ? 1 : 0, null, 6, null);

    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0080\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0018\u0010\u0004\u001a\u00020\u0005*\u00020\u00068BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0007\u0010\b¨\u0006\t"}, d2 = {"Lcom/instabridge/mobilesdk/internal/ui/Step$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "prefix", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/mobilesdk/internal/ui/Step$Product;", "getPrefix", "(Lcom/instabridge/mobilesdk/internal/ui/Step$Product;)Ljava/lang/String;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {

        @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
        public /* synthetic */ class WhenMappings {
            public static final /* synthetic */ int[] $EnumSwitchMapping$0;

            static {
                int[] iArr = new int[Product.values().length];
                try {
                    iArr[Product.TRAVEL.ordinal()] = 1;
                } catch (NoSuchFieldError unused) {
                }
                $EnumSwitchMapping$0 = iArr;
            }
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final String getPrefix(Product product) {
            return WhenMappings.$EnumSwitchMapping$0[product.ordinal()] == 1 ? "travel_esim_" : "primary_mobile_";
        }

        private Companion() {
        }
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0006\b\u0080\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006¨\u0006\u0007"}, d2 = {"Lcom/instabridge/mobilesdk/internal/ui/Step$Product;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;I)V", "LOCAL_PLAN", "TRAVEL", "BY_VISIT", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Product {
        private static final /* synthetic */ EnumEntries $ENTRIES;
        private static final /* synthetic */ Product[] $VALUES;
        public static final Product LOCAL_PLAN = new Product("LOCAL_PLAN", 0);
        public static final Product TRAVEL = new Product("TRAVEL", 1);
        public static final Product BY_VISIT = new Product("BY_VISIT", 2);

        private static final /* synthetic */ Product[] $values() {
            return new Product[]{LOCAL_PLAN, TRAVEL, BY_VISIT};
        }

        static {
            Product[] productArr$values = $values();
            $VALUES = productArr$values;
            $ENTRIES = EnumEntriesKt.a(productArr$values);
        }

        private Product(String str, int i5) {
        }

        @NotNull
        public static EnumEntries<Product> getEntries() {
            return $ENTRIES;
        }

        public static Product valueOf(String str) {
            return (Product) Enum.valueOf(Product.class, str);
        }

        public static Product[] values() {
            return (Product[]) $VALUES.clone();
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[Product.values().length];
            try {
                iArr[Product.BY_VISIT.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    private static final /* synthetic */ Step[] $values() {
        return new Step[]{ONBOARDING, HOW_IT_WORKS, PLANS, LOGIN, CHECKOUT, ACTIVATING, INSTALL_ESIM, INSTALLING, ALMOST_THERE, CONNECTED, PLAN_UPDATED, BOOSTER_SUCCESS, COULDNT_INSTALL, DASHBOARD, TRAVEL_PLANS, TRAVEL_DESTINATIONS, TRAVEL_ESIM_READY, TRAVEL_ESIM_INSTALL_OPTIONS, TRAVEL_ESIM_INSTALLED, MY_ESIMS, WINBACK_PLANS, CANCEL_PLAN_REASONS};
    }

    /* JADX WARN: Multi-variable type inference failed */
    static {
        Product product = Product.BY_VISIT;
        LOGIN = new Step("LOGIN", 3, "login", product, null, 4, null);
        CHECKOUT = new Step("CHECKOUT", 4, "checkout", product, null, 4, null);
        int i5 = 6;
        DefaultConstructorMarker defaultConstructorMarker = null;
        ACTIVATING = new Step("ACTIVATING", 5, "activating", null, null, i5, defaultConstructorMarker);
        INSTALL_ESIM = new Step("INSTALL_ESIM", 6, "install_esim", null, null, 6, null);
        INSTALLING = new Step("INSTALLING", 7, "installing", product, null, 4, null);
        ALMOST_THERE = new Step("ALMOST_THERE", 8, "almost_there", 0 == true ? 1 : 0, 0 == true ? 1 : 0, i5, defaultConstructorMarker);
        int i11 = 6;
        DefaultConstructorMarker defaultConstructorMarker2 = null;
        Product product2 = null;
        String str = null;
        CONNECTED = new Step("CONNECTED", 9, "connected", product2, str, i11, defaultConstructorMarker2);
        PLAN_UPDATED = new Step("PLAN_UPDATED", 10, "plan_updated", 0 == true ? 1 : 0, 0 == true ? 1 : 0, i5, defaultConstructorMarker);
        BOOSTER_SUCCESS = new Step("BOOSTER_SUCCESS", 11, "booster_success", product2, str, i11, defaultConstructorMarker2);
        int i12 = 4;
        DefaultConstructorMarker defaultConstructorMarker3 = null;
        String str2 = null;
        COULDNT_INSTALL = new Step("COULDNT_INSTALL", 12, "couldnt_install", product, str2, i12, defaultConstructorMarker3);
        DASHBOARD = new Step("DASHBOARD", 13, "dashboard", product, str2, i12, defaultConstructorMarker3);
        Product product3 = Product.TRAVEL;
        TRAVEL_PLANS = new Step("TRAVEL_PLANS", 14, "travel_plans", product3, "plans");
        TRAVEL_DESTINATIONS = new Step("TRAVEL_DESTINATIONS", 15, "travel_destinations", product3, "destinations");
        TRAVEL_ESIM_READY = new Step("TRAVEL_ESIM_READY", 16, "travel_esim_ready", product3, "ready");
        TRAVEL_ESIM_INSTALL_OPTIONS = new Step("TRAVEL_ESIM_INSTALL_OPTIONS", 17, "travel_esim_install_options", product3, "install_options");
        TRAVEL_ESIM_INSTALLED = new Step("TRAVEL_ESIM_INSTALLED", 18, "travel_esim_installed", product3, EsimInstallStore.KEY_INSTALLED);
        MY_ESIMS = new Step("MY_ESIMS", 19, "my_esims", product3, null, 4, 0 == true ? 1 : 0);
        WINBACK_PLANS = new Step("WINBACK_PLANS", 20, "winback_plans", 0 == true ? 1 : 0, null, 6, 0 == true ? 1 : 0);
        CANCEL_PLAN_REASONS = new Step("CANCEL_PLAN_REASONS", 21, "cancel_plan_reasons", 0 == true ? 1 : 0, null, 6, null);
        Step[] stepArr$values = $values();
        $VALUES = stepArr$values;
        $ENTRIES = EnumEntriesKt.a(stepArr$values);
        INSTANCE = new Companion(null);
    }

    private Step(String str, int i5, String str2, Product product, String str3) {
        this.analyticsName = str2;
        this.product = product;
        this.screenName = str3;
    }

    @NotNull
    public static EnumEntries<Step> getEntries() {
        return $ENTRIES;
    }

    private final Product resolve(boolean travel) {
        return WhenMappings.$EnumSwitchMapping$0[this.product.ordinal()] == 1 ? travel ? Product.TRAVEL : Product.LOCAL_PLAN : this.product;
    }

    public static Step valueOf(String str) {
        return (Step) Enum.valueOf(Step.class, str);
    }

    public static Step[] values() {
        return (Step[]) $VALUES.clone();
    }

    @NotNull
    public final String getAnalyticsName() {
        return this.analyticsName;
    }

    public final boolean isTravel(boolean travel) {
        return resolve(travel) == Product.TRAVEL;
    }

    @NotNull
    public final String viewEvent(boolean travel) {
        return u4.m(INSTANCE.getPrefix(resolve(travel)), this.screenName, "_view");
    }

    public /* synthetic */ Step(String str, int i5, String str2, Product product, String str3, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, i5, str2, (i11 & 2) != 0 ? Product.LOCAL_PLAN : product, (i11 & 4) != 0 ? str2 : str3);
    }
}
