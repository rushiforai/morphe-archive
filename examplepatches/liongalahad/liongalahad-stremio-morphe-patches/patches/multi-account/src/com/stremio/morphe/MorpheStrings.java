package com.stremio.morphe;

import android.content.Context;
import android.util.Log;

import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Locale;
import java.util.Map;

/** Localized account-picker copy using bundled picker text plus Stremio's general catalogue. */
final class MorpheStrings {
    private static final String TAG = "MorpheAccounts";
    private static final String[] SUPPORTED_LOCALES = new String[]{
            "ar-AR", "be-BY", "bg-BG", "bn-BD", "ca-ES", "cs-CZ", "da-DK",
            "de-DE", "el-GR", "en-US", "eo-EO", "es-ES", "et-EE", "eu-ES",
            "fa-IR", "fi-FI", "fr-FR", "he-IL", "hi-IN", "hr-HR", "hu-HU",
            "id-ID", "it-IT", "ja-JP", "ko-KR", "lt-LT", "mk-MK", "my-BM",
            "nb-NO", "ne-NP", "nl-NL", "nn-NO", "pa-IN", "pl-PL", "pt-BR",
            "pt-PT", "ro-RO", "ru-RU", "sk-SK", "sl-SL", "sr-RS", "sv-SE",
            "ta-IN", "te-IN", "tr-TR", "uk-UA", "ur-PK", "vi-VN", "zh-CN",
            "zh-HK", "zh-TW"
    };

    private static volatile Map<?, ?> translations;
    private final String localeTag;
    private final Object strings;

    private MorpheStrings(String localeTag, Object strings) {
        this.localeTag = localeTag;
        this.strings = strings;
    }

    static MorpheStrings forAccount(Context context, String activeSlot) {
        String stored = null;
        try {
            if (activeSlot != null) stored = MorpheIsolation.interfaceLocale(context, activeSlot);
        } catch (Exception error) {
            Log.w(TAG, "Falling back to device language for the account picker", error);
        }
        String device = Locale.getDefault().toLanguageTag();
        String locale = normalize(stored == null || stored.trim().isEmpty() ? device : stored);
        Map<?, ?> catalogue = catalogue();
        Object translated = catalogue.get(locale);
        if (translated == null) {
            locale = "en-US";
            translated = catalogue.get(locale);
        }
        return new MorpheStrings(locale, translated);
    }

    String localeTag() { return localeTag; }

    static int supportedLocaleCount() { return SUPPORTED_LOCALES.length; }

    static boolean verifySupportedTranslations() {
        Map<?, ?> catalogue = catalogue();
        String[] criticalGetters = new String[]{
                "getLabel_user_profiles_switch_profile_title",
                "getLabel_account",
                "getLabel_welcome_profiles_body",
                "getLabel_user_profiles_add_profile",
                "getLabel_user_profiles_manage_profiles",
                "getLabel_quit",
                "getLabel_peers_active",
                "getLabel_library_folder_rename",
                "getLabel_choose_color",
                "getLabel_user_profiles_set_pin",
                "getLabel_user_profiles_enter_pin",
                "getLabel_user_profiles_remove_pin",
                "getLabel_user_profiles_delete_profile_button",
                "getLabel_user_profiles_profile_name",
                "getLabel_user_profiles_confirm_pin",
                "getLabel_user_profiles_set_pin_description",
                "getLabel_user_profiles_pin_error",
                "getLabel_user_profiles_pin_error_title",
                "getLabel_user_profiles_pin_match_error",
                "getLabel_user_profiles_change_pin_description",
                "getLabel_generic_error_message",
                "getLabel_error",
                "getLabel_user_profiles_delete_profile_title",
                "getLabel_user_profiles_delete_confirmation",
                "getLabel_ctx_remove",
                "getLabel_button_cancel",
                "getLabel_button_continue"
        };
        for (String locale : SUPPORTED_LOCALES) {
            if (!MorphePickerCopy.hasCompleteLocale(locale)) return false;
            if (!MorphePickerActions.hasCompleteLocale(locale)) return false;
            Object value = catalogue.get(locale);
            if (value == null) return false;
            for (String getter : criticalGetters) {
                if (invoke(value, getter) == null) return false;
            }
        }
        return true;
    }

    String chooseAccount() {
        return picker(MorphePickerCopy.CHOOSE_ACCOUNT, "Choose an account");
    }

    String accountPrivacy() {
        return picker(MorphePickerCopy.PRIVACY,
                "Each account keeps its own login, library, addons and watch state.");
    }

    String addAccount() {
        return picker(MorphePickerCopy.ADD_ACCOUNT, "Add account");
    }

    String pickerHint(boolean empty) {
        return picker(empty ? MorphePickerCopy.EMPTY_HINT : MorphePickerCopy.OPTIONS_HINT,
                empty ? "Select Add account to sign in with a QR code"
                        : "Hold OK on an account for options");
    }

    String quit() {
        return picker(MorphePickerCopy.EXIT_STREMIO, "Exit Stremio");
    }
    String active() {
        return picker(MorphePickerCopy.ACTIVE, "Active");
    }
    String pinProtected() {
        if (isItalian()) return "Protetto da PIN";
        if (isEnglish()) return "PIN protected";
        return value("getLabel_user_profiles_enter_pin", "PIN protected");
    }
    String rename() {
        return action(MorphePickerActions.RENAME, "Rename");
    }
    String changeColor() {
        return action(MorphePickerActions.CHANGE_COLOR, "Change color");
    }
    String addPin() {
        return action(MorphePickerActions.ADD_PIN, "Add PIN");
    }
    String removePin() {
        return action(MorphePickerActions.REMOVE_PIN, "Remove PIN");
    }
    String removeAccount() {
        return action(MorphePickerActions.REMOVE_ACCOUNT, "Remove account");
    }
    String enterPin() {
        return action(MorphePickerActions.ENTER_PIN, "Enter PIN");
    }
    String manageAccount(String name) {
        if (isItalian()) return "Inserisci il PIN per gestire " + name;
        if (isEnglish()) return "Enter PIN to manage " + name;
        return enterPin();
    }
    String renameAccount() {
        if (isItalian()) return "Rinomina account";
        return value("getLabel_user_profiles_profile_name", "Rename account");
    }
    String cancel() {
        if (isItalian()) return "Annulla";
        return value("getLabel_button_cancel", "Cancel");
    }
    String confirmPin() {
        if (isItalian()) return "Conferma PIN";
        return value("getLabel_user_profiles_confirm_pin", "Confirm PIN");
    }
    String pinInstructions() {
        if (isItalian()) return "Inserisci un PIN di quattro cifre";
        return value("getLabel_user_profiles_set_pin_description", "Enter a four-digit PIN");
    }
    String pinMismatchTitle() {
        if (isItalian()) return "I PIN non corrispondono";
        return value("getLabel_user_profiles_pin_error_title", "PINs did not match");
    }
    String pinMismatchMessage() {
        if (isItalian()) return "Il PIN di accesso non è stato aggiunto.";
        return value("getLabel_user_profiles_pin_match_error", "The access PIN was not added.");
    }
    String currentPin() {
        if (isItalian()) return "Inserisci il PIN corrente";
        return value("getLabel_user_profiles_change_pin_description", "Enter the current PIN");
    }
    String incorrectPin() {
        if (isItalian()) return "PIN errato";
        return value("getLabel_user_profiles_pin_error", "Incorrect PIN");
    }
    String accountNamePrompt() {
        if (isItalian()) return "Inserisci un nome per l'account";
        return value("getLabel_user_profiles_profile_name", "Enter an account name");
    }
    String genericError() { return value("getLabel_generic_error_message", "Try again."); }
    String errorTitle() { return value("getLabel_error", "Error"); }
    String ok() { return isItalian() || isEnglish() ? "OK" : value("getLabel_button_continue", "OK"); }
    String removeTitle(String name) {
        if (isItalian()) return "Rimuovere " + name + "?";
        if (isEnglish()) return "Remove " + name + "?";
        return value("getLabel_user_profiles_delete_profile_title", "Remove " + name + "?");
    }
    String removeExplanation() {
        if (isItalian()) return "Rimuove l'account e tutti i suoi dati locali da questa installazione. Non elimina l'account Stremio.";
        if (isEnglish()) return "This removes the account and all of its local data from this installation. It does not delete the Stremio account.";
        return value("getLabel_user_profiles_delete_confirmation",
                "This removes the account and all of its local data from this installation. It does not delete the Stremio account.");
    }
    String remove() { return value("getLabel_ctx_remove", "Remove"); }
    String atLeastOneAccount() {
        if (isItalian()) return "Deve rimanere almeno un account locale.";
        if (isEnglish()) return "At least one local account must remain.";
        return genericError();
    }
    String profileFallback(int number) {
        if (isItalian()) return "Account " + number;
        if (isEnglish()) return "Account " + number;
        return value("getLabel_account", "Account") + " " + number;
    }
    String opening(String name) { return name + "…"; }
    String removing(String name) { return name + "…"; }
    String removed() { return pickerHint(false); }
    String pinAdded(String name) {
        if (isItalian()) return "PIN aggiunto a " + name;
        return name + " — " + addPin();
    }
    String pinRemoved(String name) {
        if (isItalian()) return "PIN rimosso da " + name;
        return name + " — " + removePin();
    }
    String fourDigitsError() {
        if (isItalian()) return "Inserisci esattamente quattro cifre";
        return pinInstructions();
    }
    String nameRequiredError() { return accountNamePrompt(); }
    String nameLengthError() {
        if (isItalian()) return "Usa al massimo 12 caratteri";
        if (isEnglish()) return "Use 12 characters or fewer";
        return accountNamePrompt();
    }

    private String value(String getter, String fallback) {
        String translated = invoke(strings, getter);
        return translated == null ? fallback : translated;
    }

    private String picker(int field, String fallback) {
        return MorphePickerCopy.get(localeTag, field, fallback);
    }

    private String action(int field, String fallback) {
        return MorphePickerActions.get(localeTag, field, fallback);
    }

    private boolean isEnglish() { return "en-US".equals(localeTag); }
    private boolean isItalian() { return "it-IT".equals(localeTag); }

    private static String normalize(String raw) {
        String candidate = raw == null ? "" : raw.trim().replace('_', '-');
        if (candidate.equalsIgnoreCase("eng")) return "en-US";
        if (candidate.equalsIgnoreCase("pob")) return "pt-BR";
        if (candidate.equalsIgnoreCase("spl")) return "es-ES";
        if (candidate.equalsIgnoreCase("zhe")) return "zh-HK";
        if (candidate.equalsIgnoreCase("zht")) return "zh-TW";
        for (String supported : SUPPORTED_LOCALES) {
            if (supported.equalsIgnoreCase(candidate)) return supported;
        }
        String language = Locale.forLanguageTag(candidate).getLanguage();
        for (String supported : SUPPORTED_LOCALES) {
            if (Locale.forLanguageTag(supported).getLanguage().equalsIgnoreCase(language)) return supported;
        }
        return "en-US";
    }

    @SuppressWarnings("unchecked")
    private static Map<?, ?> catalogue() {
        Map<?, ?> cached = translations;
        if (cached != null) return cached;
        try {
            Class<?> owner = Class.forName("com.stremio.translations.TranslationsKt");
            Object value = owner.getMethod("getStremioTranslations").invoke(null);
            if (value instanceof Map) {
                translations = (Map<?, ?>) value;
                return translations;
            }
        } catch (Exception error) {
            Log.e(TAG, "Stremio translation catalogue is unavailable", error);
        }
        translations = Collections.emptyMap();
        return translations;
    }

    private static String invoke(Object target, String getter) {
        if (target == null) return null;
        try {
            Method method = target.getClass().getMethod(getter);
            Object value = method.invoke(target);
            if (value instanceof String && !((String) value).trim().isEmpty()) return (String) value;
        } catch (Exception error) {
            Log.e(TAG, "Missing Stremio translation getter " + getter, error);
        }
        return null;
    }
}
