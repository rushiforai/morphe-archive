package app.polishapps.extension.yanosik;

@SuppressWarnings("unused")
public final class YanosikPatch {

    private YanosikPatch() {
    }

    /** Active premium state for Yanosik 26.9.0. */
    public static Object premiumState() {
        return createPremiumState("h4f", "b6f");
    }

    /** Active premium state for Yanosik 26.10.0. */
    public static Object premiumStateV2610() {
        return createPremiumState("z8f", "ebf");
    }

    /**
     * Builds an active premium entitlement state for the Yanosik subscription flow.
     *
     * The entitlement type and its enum are obfuscated and not available at extension compile
     * time, so they are resolved reflectively against the patched app at runtime. The returned
     * object replaces the initial (non-premium) state value so {@code isPro} is true from the
     * first frame, matching the manual smali build. The obfuscated names change between releases,
     * so each supported version has its own entry point.
     */
    private static Object createPremiumState(String stateClassName, String premiumClassName) {
        try {
            Class<?> typeClass = Class.forName(stateClassName);

            Object active = null;
            for (Object constant : typeClass.getEnumConstants()) {
                if (((Enum<?>) constant).name().equals("ACTIVE")) {
                    active = constant;
                    break;
                }
            }
            if (active == null) {
                throw new IllegalStateException(stateClassName + ".ACTIVE not found");
            }

            Class<?> premiumClass = Class.forName(premiumClassName);
            java.lang.reflect.Constructor<?> constructor =
                    premiumClass.getConstructor(typeClass, java.util.Date.class, boolean.class);
            return constructor.newInstance(active, new java.util.Date(), true);
        } catch (ReflectiveOperationException e) {
            throw new RuntimeException("Yanosik premium state could not be created", e);
        }
    }
}
