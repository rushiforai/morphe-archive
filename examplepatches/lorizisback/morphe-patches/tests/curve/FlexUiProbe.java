import android.content.Context;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/** Runs presentation checks against the real APK classes, without constructing network dependencies. */
public final class FlexUiProbe {
    private static Class<?> helper;

    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    private static Object model(String name) throws Exception {
        // Test-only allocation: getters need their fields, not app services or an authenticated session.
        Class<?> unsafeClass = Class.forName("sun.misc.Unsafe");
        Field field = unsafeClass.getDeclaredField("theUnsafe");
        field.setAccessible(true);
        return unsafeClass.getMethod("allocateInstance", Class.class).invoke(field.get(null), Class.forName(name));
    }

    private static void field(Object instance, String name, Object value) throws Exception {
        Field field = instance.getClass().getDeclaredField(name);
        field.setAccessible(true);
        field.set(instance, value);
    }

    private static Object invoke(Object instance, String name) throws Exception {
        Method method = instance.getClass().getDeclaredMethod(name);
        method.setAccessible(true);
        return method.invoke(instance);
    }

    private static Object helper(String name, Class<?> type, Object value) throws Exception {
        return helper.getMethod(name, type).invoke(null, value);
    }

    private static Object banner(String title, String link) throws Exception {
        return Class.forName("com.curve.wallet.banner.usecase.InfoBanner$RemoteBanner")
            .getConstructor(String.class, String.class, String.class, String.class,
                String.class, String.class, String.class)
            .newInstance(title, "Offer details", "View", null, "fixture", link, null);
    }

    private static void checkPresentation(boolean hidden, boolean menu) throws Exception {
        for (String[] test : new String[][]{
            {"com.curve.settings.ui.main.SettingsMainState$Settings", "showPayIn3EntryPoint", "getShowPayIn3EntryPoint"},
            {"com.curve.transactions.list.model.TransactionsListItem$TransactionItem", "swipeEnabled", "getSwipeEnabled"}
        }) {
            Object instance = model(test[0]);
            field(instance, test[1], true);
            require(Boolean.valueOf(!hidden).equals(invoke(instance, test[2])), test[2]);
            field(instance, test[1], false);
            require(Boolean.FALSE.equals(invoke(instance, test[2])), "Original false flag changed");
        }
        Object transactionMapper = model("com.curve.transaction.details.TransactionDetailsMapper");
        for (String method : Arrays.asList("flexRow", "payInXRow")) {
            require((invoke(transactionMapper, method) == null) == hidden, method);
        }
        Object transaction = model("com.curve.transactions.api.model.RegularTransaction");
        Object details = model("com.curve.transactions.api.model.TransactionDetails");
        field(transaction, "transactionDetails", details);
        field(transaction, "status", model("com.curve.transactions.api.model.RegularTransaction$Status$Declined"));
        Method subtitle = Class.forName("com.curve.transactions.list.ui.TransactionListItemMapperKt")
            .getDeclaredMethod("amountSubtitle", Class.forName("com.curve.transactions.api.model.Transaction"), boolean.class);
        subtitle.setAccessible(true);
        Object ordinarySubtitle = subtitle.invoke(null, transaction, false);
        Object eligibleSubtitle = subtitle.invoke(null, transaction, true);
        require(ordinarySubtitle.equals(eligibleSubtitle) == hidden, "Flex It promotional subtitle");
        field(transaction, "type", model("com.curve.transactions.api.model.RegularTransaction$Type$RefiCredit"));
        Object historicalSubtitle = subtitle.invoke(null, transaction, false);
        require(!ordinarySubtitle.equals(historicalSubtitle), "Historical refinancing description lost");
        require(historicalSubtitle.equals(subtitle.invoke(null, transaction, true)) == hidden, "History subtitle with eligibility");
        Object transactionState = model("com.curve.transactions.list.ui.TransactionsListState$Loaded");
        Object hint = model("com.curve.transactions.list.ui.TransactionsListState$Loaded$SwipeHint");
        field(transactionState, "swipeHint", hint);
        require(invoke(transactionState, "getSwipeHint") == (hidden ? null : hint), "Swipe hint");
        field(transactionState, "swipeHint", null);
        require(invoke(transactionState, "getSwipeHint") == null, "Original null hint changed");

        Class<?> action = Class.forName("com.curve.launchpad.model.LaunchpadAction");
        Object flexAction = action.getField("OPEN_FLEX").get(null);
        Object otherAction = Arrays.stream(action.getEnumConstants())
            .filter(value -> !value.equals(flexAction) && !((Enum<?>) value).name().equals("UNKNOWN"))
            .findFirst().orElseThrow();
        Class<?> button = Class.forName("com.curve.launchpad.model.LaunchpadItem$Button");
        Object flexButton = button.getConstructor(String.class, String.class, String.class, String.class, action)
            .newInstance("Flex", "", null, "flex", flexAction);
        Object otherButton = button.getConstructor(String.class, String.class, String.class, String.class, action)
            .newInstance("Other", "", null, "other", otherAction);
        for (String[] test : new String[][]{
            {"com.curve.launchpad.ui.LaunchpadState$Loaded$ButtonsState$Available", "buttons", "getButtons"},
            {"com.curve.launchpad.ui.LaunchpadState$Loaded$BannersState", "banners", "getBanners"}
        }) {
            Object state = model(test[0]);
            List<Object> original = Arrays.asList(otherButton, flexButton);
            field(state, test[1], original);
            List<?> visible = (List<?>) invoke(state, test[2]);
            boolean hasMenu = menu && test[1].equals("buttons");
            int menuCount = hasMenu ? 1 : 0;
            require(visible.size() == (hidden ? 1 : 2) + menuCount && visible.get(0) == otherButton, test[2]);
            require(hidden || visible.get(1) == flexButton, "Flex button not restored");
            require(original.size() == 2, "Launchpad source mutated");
            if (hasMenu) {
                Object patches = visible.get(visible.size() - 1);
                require("Patches".equals(invoke(patches, "getTitle")), "Patches label");
                require("morphe_patches".equals(invoke(patches, "getId")), "Patches ID");
                require("file:///android_asset/morphe_patches.png".equals(invoke(patches, "getIconUrl")), "Local Patches icon");
                require(action.getField("NONE").get(null) == invoke(patches, "getAction"), "Patches action must be local");
                field(state, test[1], visible);
                require(((List<?>) invoke(state, test[2])).size() == visible.size(), "Duplicate Patches button");
            }
            field(state, test[1], Collections.singletonList(flexButton));
            require(((List<?>) invoke(state, test[2])).size() == (hidden ? 0 : 1) + menuCount, "Flex-only Launchpad");
            field(state, test[1], Collections.emptyList());
            require(((List<?>) invoke(state, test[2])).size() == menuCount, "Empty Launchpad");
        }
        Object keepBanner = banner("Flexible rewards", "curve://support");
        Object flexBanner = banner("Offer", "curve://flexSettings");
        Object textBanner = banner("Try FLEX It", null);
        Object bannerState = model("com.curve.wallet.banner.ui.BannerState");
        field(bannerState, "infoBanners", Arrays.asList(keepBanner, flexBanner, textBanner));
        List<?> banners = (List<?>) invoke(bannerState, "getInfoBanners");
        require(banners.size() == (hidden ? 1 : 3) && banners.get(0) == keepBanner, "Wallet banners");
    }

    private static void checkHelpers(boolean hidden, Context context) throws Exception {
        for (String link : Arrays.asList("curve://flex", "curve://flexSettings", "curve://launchpad/OpenFlex",
                "imaginecurve://creditLimitOutcome", "https://www.curve.com/flex/",
                "https://www.curve.com/en-gb/flex", "https://curve.com/en/flex-it")) {
            require(Boolean.TRUE.equals(helper("isFlexDestination", String.class, link)), "Missed " + link);
        }
        for (String link : Arrays.asList(null, "invalid link", "curve://wallet", "curve://support",
                "https://example.com/flex", "https://curve.com/flexible", "curve://commercialCard",
                "curve:///credit", "curve://wallet/flex", "curve://support/launchpad/OpenFlex")) {
            require(Boolean.FALSE.equals(helper("isFlexDestination", String.class, link)), "Overmatched " + link);
        }
        Object flex = model("com.curve.wallet.api.model.WalletFlexCredit");
        field(flex, "id", "fixture-flex");
        Object other = new Object();
        Object header = Class.forName("com.curve.wallet.header.ui.WalletHeader$ReFi")
            .getConstructor(boolean.class).newInstance(true);
        List<Object> original = Arrays.asList(other, flex, header, other);
        List<?> filtered = (List<?>) helper("filterItems", List.class, original);
        require(filtered.size() == (hidden ? 2 : 4) && filtered.get(0) == other
            && filtered.get(filtered.size() - 1) == other, "Card/header filtering");
        require(hidden || filtered == original, "Disabled filter must preserve source list");
        require(original.size() == 4, "Source cards mutated");
        require(((List<?>) helper("filterItems", List.class, Collections.emptyList())).isEmpty(), "Empty list");
        Object backup = model("com.curve.backup_card.model.BackupCard");
        field(backup, "id", "fixture-flex");
        helper("rememberFlexSource", Object.class, flex);
        require(Boolean.TRUE.equals(helper("isFlexBackup", Object.class, backup)), "Backup identity");
        field(backup, "id", "ordinary-card");
        require(Boolean.FALSE.equals(helper("isFlexBackup", Object.class, backup)), "Other backup hidden");
        require("fixture-flex".equals(invoke(flex, "getId")), "Source ID mutated");
        require(Integer.valueOf(hidden ? 0x7f0f0000 : 0x7f0f0001).equals(
            helper("menuResource", int.class, 0x7f0f0001)), "Flex tab menu restoration");
        require(Integer.valueOf(0x7f0f0000).equals(helper("menuResource", int.class, 0x7f0f0000)),
            "Original non-Flex menu changed");
        require(Integer.valueOf(hidden ? 0 : -1).equals(helper("quickWalletFallback", int.class, -1)),
            "Quick Wallet missing-selection fallback restoration");
        require(Integer.valueOf(3).equals(helper("quickWalletFallback", int.class, 3)),
            "Quick Wallet valid selection changed");

        View view = new View(context);
        view.setLayoutParams(new ViewGroup.LayoutParams(200, ViewGroup.LayoutParams.WRAP_CONTENT));
        Method bind = helper.getMethod("bindRow", View.class, boolean.class);
        bind.invoke(null, view, true);
        require(view.getVisibility() == (hidden ? View.GONE : View.VISIBLE)
            && view.getLayoutParams().height == (hidden ? 0 : ViewGroup.LayoutParams.WRAP_CONTENT), "Flex row toggle");
        bind.invoke(null, view, false);
        require(view.getVisibility() == View.VISIBLE && view.getLayoutParams().height == ViewGroup.LayoutParams.WRAP_CONTENT
            && view.getLayoutParams().width == 200, "Recycled row restoration");
    }

    private static void checkNavigation(boolean hidden) throws Exception {
        Object main = model("com.imaginecurve.curve.main.MainActivity");
        Method navigate = main.getClass().getMethod("k", Class.forName("io.uniflow.core.flow.data.UIEvent"));
        for (String suffix : Arrays.asList("OpenCurveFlex", "OpenCreditIbl", "OpenFlexSettings",
                "OpenFlexAccountTermsAndConditions", "OpenFlexOpenBankingAccountConnections",
                "OpenFlexLoanCalculator", "OpenCreditApplicationOutcomeSuccessful", "OpenCreditApplicationOutcomeFailure",
                "CreditDeeplinkAction", "OpenDebitToCreditMigration", "OpenFlexOnboarding",
                "OpenCreditLimitAdjustment", "OpenCreditLimitOutcome", "OpenSnplIntro")) {
            Object event = model("com.imaginecurve.curve.main.MainActivityEvent$" + suffix);
            require(Boolean.valueOf(hidden).equals(helper("isFlexEvent", Object.class, event)), "Event toggle " + suffix);
            // Must return before touching uninitialized Activity dependencies while hiding Flex.
            if (hidden) navigate.invoke(main, event);
        }
        require(Boolean.FALSE.equals(helper("isFlexEvent", Object.class, new Object())), "Unrelated event blocked");
        Class<?> tab = Class.forName("com.curve.common.ui.HomeTab");
        try {
            main.getClass().getMethod("m", tab).invoke(main, tab.getField("CREDIT").get(null));
            require(hidden, "Disabled CREDIT navigation guard did not restore original code");
        } catch (InvocationTargetException error) {
            // The uninitialized fixture proves the original binding path is reachable without opening an Activity.
            Throwable cause = error.getCause();
            require(!hidden && cause.getClass().getName().equals("kotlin.UninitializedPropertyAccessException")
                && cause.getMessage().contains("mBinding"), "Unexpected CREDIT navigation failure: " + cause);
        }
    }

    public static void main(String[] args) throws Exception {
        require((args.length == 1 || args.length == 2)
                && (args[0].equals("original") || args[0].equals("patched"))
                && (args.length == 1 || (args[0].equals("patched") && args[1].equals("menu"))),
            "Usage: FlexUiProbe original|patched [menu]");
        boolean patched = args[0].equals("patched");
        boolean menu = args.length == 2;
        Field toggle = null;
        Context context = null;
        if (patched) {
            helper = Class.forName("app.local.extension.curve.HideFlex");
            toggle = Class.forName("app.local.extension.curve.PatchSettings").getDeclaredField("hideFlex");
            toggle.setAccessible(true);
            if (Looper.myLooper() == null) Looper.prepareMainLooper();
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Object thread = activityThread.getMethod("systemMain").invoke(null);
            context = (Context) activityThread.getMethod("getSystemContext").invoke(thread);
        }
        for (boolean hidden : patched ? new boolean[]{true, false, true} : new boolean[]{false}) {
            if (toggle != null) toggle.setBoolean(null, hidden);
            checkPresentation(hidden, menu);
            if (patched) {
                checkHelpers(hidden, context);
                checkNavigation(hidden);
            }
        }
        System.out.println("PASS " + args[0] + ": Flex presentation getters, actions, banners and Launchpad"
            + (patched ? "; hide/show/hide, helpers, backup identity, navigation guards and recycled rows" : "")
            + (menu ? "; local Patches tile, icon and deduplication" : ""));
    }
}
