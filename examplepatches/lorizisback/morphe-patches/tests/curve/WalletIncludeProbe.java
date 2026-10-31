import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Set;

/** Exercises the real Curve DEX on Android without an account or network requests. */
public final class WalletIncludeProbe {
    private static final String API = "com.curve.wallet.api.";

    private static Object unusedProxy(Class<?> type) {
        return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type},
            (proxy, method, args) -> { throw new AssertionError("Unexpected call: " + method); });
    }

    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    private static List<String> includeNames(Set<?> includes) {
        List<String> names = new ArrayList<>();
        for (Object include : includes) {
            String name = include.getClass().getName();
            names.add(name.substring(name.lastIndexOf('$') + 1));
        }
        return names;
    }

    public static void main(String[] args) throws Exception {
        require(args.length == 1 && (args[0].equals("original") || args[0].equals("patched")),
            "Usage: WalletIncludeProbe original|patched");
        boolean patched = args[0].equals("patched");
        Class<?> funding = Class.forName(API + "usecase.GetWalletFundingSourcesUseCase");
        List<Object> requests = new ArrayList<>();
        Object fundingProxy = Proxy.newProxyInstance(funding.getClassLoader(), new Class<?>[]{funding},
            (proxy, method, parameters) -> {
                if (method.getName().equals("invoke")) {
                    requests.add(parameters[0].getClass().getMethod("getInclude").invoke(parameters[0]));
                } else if (method.getName().equals("watch")) {
                    requests.add(parameters[0]);
                } else {
                    throw new AssertionError("Unexpected call: " + method);
                }
                return null;
            });
        Class<?> preferences = Class.forName("com.curve.data.repository.user.UserPreferencesRepository");
        Class<?> cash = Class.forName("com.curve.domain.usecase.curvecash.GetAutoUseCurveCash");
        Object cashInstance = cash.getConstructor(preferences).newInstance(unusedProxy(preferences));
        Class<?> clock = Class.forName("com.curve.domain.entity.common.Clock");
        Object clockInstance = clock.getConstructor().newInstance();
        Class<?> wallet = Class.forName("com.curve.wallet.main.usecase.GetWalletItemsUseCase");
        Object instance = wallet.getConstructor(funding, cash, clock)
            .newInstance(fundingProxy, cashInstance, clockInstance);
        Field field = wallet.getDeclaredField("defaultWalletItemsIncludeSet");
        field.setAccessible(true);
        Set<?> includes = (Set<?>) field.get(instance);
        for (Object include : includes) {
            String name = include.getClass().getName();
            if (name.endsWith("$Card")) {
                require(Boolean.FALSE.equals(include.getClass().getMethod("getOnlyVerified").invoke(include)), "Card verification filter changed");
                require(Boolean.FALSE.equals(include.getClass().getMethod("getOnlyNonExpired").invoke(include)), "Card expiry filter changed");
                require(Boolean.TRUE.equals(include.getClass().getMethod("getIncludeCreditCards").invoke(include)), "Credit card filter changed");
            }
        }
        List<String> allNames = Arrays.asList("Card", "Rewards", "Flex", "PayPal");
        require(includeNames(includes).equals(allNames), "Full Wallet inclusion set must be retained");
        Class<?> continuation = Class.forName("kotlin.coroutines.Continuation");
        Class<?> flag = Class.forName("com.curve.core.flags.IsFeatureFlagEnabledUseCase");
        Class<?> filter = Class.forName("com.curve.wallet.usecase.FilterWalletFundingSourcesUseCase");
        Object filterInstance = filter.getConstructor(flag, clock).newInstance(unusedProxy(flag), clockInstance);
        Class<?> includeFlex = Class.forName(API + "usecase.GetWalletFundingSourcesUseCase$Input$Include$Flex");
        Method filterFlex = filter.getDeclaredMethod("filterFlex", List.class, includeFlex);
        filterFlex.setAccessible(true);
        Class<?> flex = Class.forName(API + "model.WalletFlexCredit");
        Class<?> state = Class.forName(API + "model.WalletFlexCredit$State");
        Class<?> banner = Class.forName(API + "model.WalletFundingSource$Banner");
        Class<?> source = Class.forName(API + "model.WalletFundingSource");
        Object first = unusedProxy(source);
        Object last = unusedProxy(source);
        Field toggle = null;
        if (patched) {
            toggle = Class.forName("app.local.extension.curve.PatchSettings").getDeclaredField("hideFlex");
            toggle.setAccessible(true);
        }
        for (boolean hidden : patched ? new boolean[]{true, false, true} : new boolean[]{false}) {
            if (toggle != null) toggle.setBoolean(null, hidden);
            requests.clear();
            for (String methodName : Arrays.asList("getWalletItems", "getWalletItemsFlow")) {
                Method method = wallet.getDeclaredMethod(methodName, continuation);
                method.setAccessible(true);
                method.invoke(instance, new Object[]{null});
            }
            require(requests.size() == 2, "Missing initial fetch or live update request");
            List<String> expected = hidden ? Arrays.asList("Card", "Rewards", "PayPal") : allNames;
            for (Object request : requests) {
                Set<?> requested = (Set<?>) request;
                require(includeNames(requested).equals(expected), "Unexpected requested Wallet includes");
                require(hidden || requested == includes, "Disabled patch must preserve original inclusion set");
                Object flexInclude = null;
                for (Object include : requested) {
                    require(includes.stream().anyMatch(original -> original == include), "Inclusion object replaced");
                    if (include.getClass().getName().endsWith("$Flex")) flexInclude = include;
                }
                for (Object status : state.getEnumConstants()) {
                    Object card = flex.getConstructor(String.class, String.class, boolean.class,
                        boolean.class, boolean.class, String.class, banner, String.class, List.class, state)
                        .newInstance("test-flex", "", false, false, true, "Flex", null, "GBP",
                            Collections.singletonList("GBP"), status);
                    List<Object> input = Arrays.asList(first, card, last);
                    List<?> output = (List<?>) filterFlex.invoke(filterInstance, input, flexInclude);
                    require(output.size() == (hidden ? 2 : 3), "Wrong filtered size for " + status);
                    require(output.get(0) == first && output.get(output.size() - 1) == last,
                        "Non-Flex items changed order or identity");
                    require(hidden || output.get(1) == card, "Original Flex entry changed");
                    require(input.size() == 3 && input.get(1) == card, "Source list was mutated");
                }
                require(((List<?>) filterFlex.invoke(filterInstance, Collections.emptyList(), flexInclude)).isEmpty(),
                    "Empty Wallet changed");
            }
            require(field.get(instance) == includes && includeNames(includes).equals(allNames),
                "Original inclusion set changed during toggle");
        }
        System.out.println("PASS " + args[0] + ": fetch, refresh, all Flex states, object identity, order, empty list"
            + (patched ? "; hide/show/hide on the same Wallet instance" : ""));
    }
}
