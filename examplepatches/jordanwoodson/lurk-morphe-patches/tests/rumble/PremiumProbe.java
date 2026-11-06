import java.lang.reflect.Method;

/**
 * Unlock Premium: runs the real profile getter and profile mapper on Android, without an account or network
 * requests, with free and paid fixtures and absent subscription metadata.
 */
public final class PremiumProbe {
    private static final String PROFILE = "com.rumble.network.dto.profile.";

    public static void main(String[] args) {
        ProbeSupport.run("free/paid profile flags and entity mapping; unrelated state preserved", PremiumProbe::run);
    }

    private static void run() throws Exception {
        Class<?> profileClass = Class.forName(PROFILE + "UserProfile");
        Object profile = ProbeSupport.allocate(profileClass);
        ProbeSupport.set(profile, "email", "test@example.invalid");
        ProbeSupport.set(profile, "apiKey", "test-only");

        Object age = ProbeSupport.allocate(Class.forName(PROFILE + "AgeVerification"));
        ProbeSupport.set(age, "required", true);
        ProbeSupport.set(age, "minEligible", 18);
        ProbeSupport.set(profile, "ageVerification", age);
        Object onboarding = ProbeSupport.allocate(Class.forName(PROFILE + "Onboarding"));
        ProbeSupport.set(onboarding, "isPending", true);
        ProbeSupport.set(profile, "onboarding", onboarding);

        // The getter is the one the patch matched. The mapper and the entity's getters aren't patched, so
        // their names stay pinned to the APK this probe was written against.
        Method premiumGetter = ProbeSupport.method("rumble.unlock_premium.profile_premium",
                "Lcom/rumble/network/dto/profile/UserProfile;->l()Z");
        Method mapper = ProbeSupport.method("rumble.unlock_premium.profile_mapper",
                "Lwe/a;->t(Lcom/rumble/network/dto/profile/UserProfile;Ljava/lang/String;Ljava/lang/String;"
                        + "Ljava/lang/String;)Llf/h;");
        Method premiumData = ProbeSupport.bySignature(profileClass, Class.forName(PROFILE + "PremiumData"));
        for (boolean serverPremium : new boolean[] {false, true}) {
            ProbeSupport.set(profile, "isPremium", serverPremium);
            ProbeSupport.check(Boolean.TRUE.equals(premiumGetter.invoke(profile)),
                    "Profile must report premium when server is_premium=" + serverPremium);
            Object entity = mapper.invoke(null, profile, "test-user", "test-airship", "test-eid");
            ProbeSupport.check(Boolean.TRUE.equals(entity.getClass().getMethod("x").invoke(entity)),
                    "Profile mapper must propagate premium to the entity used by the session");
            ProbeSupport.check(premiumData.invoke(profile) == null, "Missing subscription metadata must remain null");
            ProbeSupport.check(Boolean.FALSE.equals(entity.getClass().getMethod("w").invoke(entity)),
                    "Account validation must not change");
            ProbeSupport.check(Boolean.TRUE.equals(age.getClass().getMethod("b").invoke(age)),
                    "Age verification must not change");
            ProbeSupport.check(Boolean.TRUE.equals(onboarding.getClass().getMethod("e").invoke(onboarding)),
                    "Onboarding must not change");
        }

        ProbeSupport.setting("unlock_premium", "false");
        ProbeSupport.set(profile, "isPremium", false);
        ProbeSupport.check(Boolean.FALSE.equals(premiumGetter.invoke(profile)), "off: the server's is_premium=false");
        ProbeSupport.set(profile, "isPremium", true);
        ProbeSupport.check(Boolean.TRUE.equals(premiumGetter.invoke(profile)), "off: the server's is_premium=true");
    }
}
