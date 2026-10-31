package app.local.extension.curve;

import android.view.View;
import android.view.ViewGroup;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Pattern;

public final class HideFlex {
    private static final String FLEX_SOURCE = "com.curve.wallet.api.model.WalletFlexCredit";
    private static final String BANNER = "com.curve.wallet.banner.usecase.InfoBanner$";
    private static final List<String> FLEX_ROUTES = Arrays.asList(
        "credit", "flex", "flexsettings", "flexopenbankingaccountconnections",
        "flexaccounttermsandconditions", "creditswipetoflexintro", "debittocreditonboarding",
        "swipenowpaylater", "creditlimitadjustment", "creditlimitoutcome"
    );
    private static final List<String> FLEX_EVENTS = Arrays.asList(
        "OpenCurveFlex", "OpenCreditIbl", "OpenFlexAccountTermsAndConditions",
        "OpenFlexSettings", "OpenFlexOpenBankingAccountConnections", "OpenFlexLoanCalculator",
        "OpenCreditApplicationOutcomeSuccessful", "OpenCreditApplicationOutcomeFailure",
        "CreditDeeplinkAction", "OpenDebitToCreditMigration", "OpenFlexOnboarding",
        "OpenCreditLimitAdjustment", "OpenCreditLimitOutcome", "OpenSnplIntro"
    );
    private static final Pattern FLEX_WORD = Pattern.compile(
        "(?<![\\p{L}\\p{N}_])flex(?![\\p{L}\\p{N}_])"
    );
    private static volatile String flexSourceId;

    private HideFlex() {}

    public static Set<?> filterIncludes(Set<?> includes) {
        if (!PatchSettings.isFlexHidden()) return includes;
        Set<Object> visible = new LinkedHashSet<>(includes.size());
        for (Object include : includes) {
            if (!include.getClass().getName().equals(
                    "com.curve.wallet.api.usecase.GetWalletFundingSourcesUseCase$Input$Include$Flex")) {
                visible.add(include);
            }
        }
        return visible;
    }

    public static List<?> filterItems(List<?> items) {
        if (!PatchSettings.isFlexHidden()) return items;
        List<Object> visible = new ArrayList<>(items.size());
        for (Object item : items) {
            if (!isFlexItem(item)) visible.add(item);
        }
        return visible;
    }

    public static boolean filterFlag(boolean original) {
        return original && !PatchSettings.isFlexHidden();
    }

    public static Object filterEntry(Object original) {
        return PatchSettings.isFlexHidden() ? null : original;
    }

    public static int menuResource(int original) {
        return PatchSettings.isFlexHidden() && original == 0x7f0f0001 ? 0x7f0f0000 : original;
    }

    public static int quickWalletFallback(int original) {
        return PatchSettings.isFlexHidden() && original == -1 ? 0 : original;
    }

    private static boolean isFlexItem(Object item) {
        if (item == null) return false;
        String type = item.getClass().getName();
        if (type.equals(FLEX_SOURCE)
                || type.equals("com.curve.wallet.header.ui.WalletHeader$ReFi")
                || type.equals("com.curve.wallet.header.ui.WalletHeader$FlexAvailableCredit")
                || type.equals(BANNER + "Faafs")) return true;
        if (type.startsWith("com.curve.launchpad.model.LaunchpadItem$")) {
            Object action = get(item, "getAction");
            if (action == null) return false;
            if (!(action instanceof Enum<?>)) throw new IllegalStateException("Unexpected Launchpad action type");
            return ((Enum<?>) action).name().equals("OPEN_FLEX");
        }
        if (type.startsWith(BANNER)) {
            Object action = get(item, "getAction");
            if (action != null) {
                String actionType = action.getClass().getName();
                if (actionType.equals(BANNER + "Action$DeepLink")
                        && isFlexDestination((String) get(action, "getDeepLink"))) return true;
                if (actionType.equals(BANNER + "Action$Url")
                        && isFlexDestination((String) get(action, "getUrl"))) return true;
            }
            // Only promotional copy is inspected; transaction and account descriptions are untouched.
            if (type.equals(BANNER + "RemoteBanner")) {
                return mentionsFlex(get(item, "getTitle"))
                    || mentionsFlex(get(item, "getSubtitle"))
                    || mentionsFlex(get(item, "getCta"));
            }
        }
        return false;
    }

    private static boolean mentionsFlex(Object text) {
        return text != null && text.getClass().getName().equals(BANNER + "Text$Static")
            && FLEX_WORD.matcher(((String) get(text, "getText")).toLowerCase(Locale.ROOT)).find();
    }

    public static boolean isFlexDestination(String destination) {
        if (destination == null) return false;
        final URI uri;
        try {
            uri = new URI(destination);
        } catch (URISyntaxException error) {
            return false;
        }
        String scheme = uri.getScheme();
        if (scheme == null) return false;
        scheme = scheme.toLowerCase(Locale.ROOT);
        String host = uri.getHost();
        host = host == null ? "" : host.toLowerCase(Locale.ROOT);
        String path = uri.getPath();
        path = path == null ? "" : path.toLowerCase(Locale.ROOT);
        if (scheme.equals("http") || scheme.equals("https")) {
            if (!host.equals("curve.com") && !host.equals("www.curve.com")) return false;
            for (String segment : path.split("/")) {
                if (segment.equals("flex") || segment.equals("flex-it")) return true;
            }
            return false;
        }
        if (!scheme.equals("curve") && !scheme.equals("imaginecurve") && !scheme.equals("curve.app")) {
            return false;
        }
        if (FLEX_ROUTES.contains(host)) return true;
        return host.equals("launchpad") && (path.equals("/openflex") || path.startsWith("/openflex/"));
    }

    public static boolean isFlexEvent(Object event) {
        if (!PatchSettings.isFlexHidden() || event == null) return false;
        String prefix = "com.imaginecurve.curve.main.MainActivityEvent$";
        String type = event.getClass().getName();
        return type.startsWith(prefix) && FLEX_EVENTS.contains(type.substring(prefix.length()));
    }

    public static void bindRow(View view, boolean hide) {
        hide = hide && PatchSettings.isFlexHidden();
        view.setVisibility(hide ? View.GONE : View.VISIBLE);
        ViewGroup.LayoutParams layout = view.getLayoutParams();
        if (layout != null) {
            layout.height = hide ? 0 : ViewGroup.LayoutParams.WRAP_CONTENT;
            view.setLayoutParams(layout);
        }
    }

    public static void rememberFlexSource(Object source) {
        if (source != null && source.getClass().getName().equals(FLEX_SOURCE)) {
            flexSourceId = (String) get(source, "getId");
        }
    }

    public static boolean isFlexBackup(Object backupCard) {
        String rememberedId = flexSourceId;
        return rememberedId != null && backupCard != null && rememberedId.equals(get(backupCard, "getId"));
    }

    private static Object get(Object object, String method) {
        try {
            return object.getClass().getMethod(method).invoke(object);
        } catch (ReflectiveOperationException | SecurityException error) {
            throw new IllegalStateException("Curve presentation contract changed: "
                + object.getClass().getName() + "." + method, error);
        }
    }
}
