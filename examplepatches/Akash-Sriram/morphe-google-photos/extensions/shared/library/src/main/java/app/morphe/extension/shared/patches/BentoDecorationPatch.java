package app.morphe.extension.shared.patches;

import java.lang.reflect.Field;
import app.morphe.extension.shared.Logger;

/**
 * Extension bridge for Google Photos Bento Account Menu decoration:
 * Resolves genuine Google One subscription entitlement from the active account
 * and provides the badge text ("Pro") when GMS In-App Reach is unavailable.
 */
public final class BentoDecorationPatch {
    private static volatile Field isG1Field = null;
    private static volatile Field accountNameField = null;

    private BentoDecorationPatch() {}

    /**
     * Inspects the active account object (Lbuyd;) and returns the genuine subscription badge text.
     * Returns null if the account is not a Google One account.
     */
    public static String getBadgeText(Object accountObj) {
        if (accountObj == null) {
            return null;
        }

        try {
            boolean isG1 = isGoogleOneAccount(accountObj);
            String accountName = getAccountName(accountObj);

            if (!isG1) {
                Logger.printDebug(() -> "Active account (" + accountName + ") is not Google One subscribed, omitting badge.");
                return null;
            }

            Logger.printInfo(() -> "Genuine Google One subscription active for: " + accountName + ". Providing Pro badge.");
            return "Pro";
        } catch (Throwable t) {
            Logger.printException(() -> "Error evaluating Google One status in Bento menu", t);
            return null;
        }
    }

    private static String getAccountName(Object accountObj) {
        if (accountObj == null) return null;
        try {
            if (accountNameField == null) {
                for (Field f : accountObj.getClass().getDeclaredFields()) {
                    if (f.getType() == String.class && f.getName().equals("c")) {
                        f.setAccessible(true);
                        accountNameField = f;
                        break;
                    }
                }
            }
            if (accountNameField != null) {
                return (String) accountNameField.get(accountObj);
            }
        } catch (Throwable ignored) {}
        return null;
    }

    private static boolean isGoogleOneAccount(Object accountObj) {
        if (accountObj == null) return false;

        // Try cached field first
        if (isG1Field != null) {
            try {
                return isG1Field.getBoolean(accountObj);
            } catch (Throwable ignored) {}
        }

        try {
            Class<?> clazz = accountObj.getClass();
            // Field 'd' in Lbuyd; is boolean isG1Account
            try {
                Field f = clazz.getDeclaredField("d");
                if (f.getType() == boolean.class) {
                    f.setAccessible(true);
                    isG1Field = f;
                    return f.getBoolean(accountObj);
                }
            } catch (NoSuchFieldException ignored) {}

            // Fallback: search for boolean fields
            for (Field f : clazz.getDeclaredFields()) {
                if (f.getType() == boolean.class && !f.getName().equals("b")) { // 'b' is always true
                    f.setAccessible(true);
                    if (f.getBoolean(accountObj)) {
                        isG1Field = f;
                        return true;
                    }
                }
            }
        } catch (Throwable t) {
            Logger.printException(() -> "Failed to inspect account fields", t);
        }

        return false;
    }
}
