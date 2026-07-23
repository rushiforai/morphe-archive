package io.github.ilikeadofai.vocacolle.extension.settings;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.LocaleManager;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.LocaleList;
import java.util.Locale;

/** Applies the extension-owned display-language preference to the host app. */
@SuppressWarnings({"deprecation", "unused"})
public final class AppLanguageController {
    private AppLanguageController() {
    }

    public static void applySavedLanguage(Context context) {
        DisplayLanguage selected;
        try {
            selected = SettingsStore.from(context).getDisplayLanguage();
        } catch (RuntimeException ignored) {
            selected = DisplayLanguage.SYSTEM;
        }
        applySavedLanguage(
            selected,
            Build.VERSION.SDK_INT,
            new AndroidBackend(context)
        );
    }

    public static void apply(Context context, DisplayLanguage language) {
        if (context == null) {
            throw new NullPointerException("context");
        }
        DisplayLanguage safeLanguage = language == null ? DisplayLanguage.SYSTEM : language;
        apply(safeLanguage, Build.VERSION.SDK_INT, new AndroidBackend(context));
    }

    static void apply(DisplayLanguage language, int sdkInt, Backend backend) {
        DisplayLanguage safeLanguage = language == null ? DisplayLanguage.SYSTEM : language;
        String languageTag = safeLanguage == DisplayLanguage.SYSTEM
                ? ""
                : safeLanguage.persistedValue();
        if (sdkInt >= Build.VERSION_CODES.TIRAMISU) {
            backend.setPlatformApplicationLocale(languageTag);
        } else {
            backend.updateLegacyResources(languageTag);
        }
        backend.updateProcessLocale(languageTag);
    }

    static void applySavedLanguage(
            DisplayLanguage language,
            int sdkInt,
            Backend backend
    ) {
        DisplayLanguage safeLanguage = language == null ? DisplayLanguage.SYSTEM : language;
        try {
            apply(safeLanguage, sdkInt, backend);
        } catch (RuntimeException ignored) {
            if (safeLanguage == DisplayLanguage.SYSTEM) {
                return;
            }
            try {
                apply(DisplayLanguage.SYSTEM, sdkInt, backend);
            } catch (RuntimeException ignoredFallback) {
                // Preserve original app startup if the platform locale API is broken.
            }
        }
    }

    interface Backend {
        void updateProcessLocale(String languageTag);

        void setPlatformApplicationLocale(String languageTag);

        void updateLegacyResources(String languageTag);
    }

    private static final class AndroidBackend implements Backend {
        private final Context context;

        private AndroidBackend(Context context) {
            this.context = context;
        }

        @Override
        public void updateProcessLocale(String languageTag) {
            Locale locale;
            if (languageTag.isEmpty()) {
                locale = systemLocale();
                if (locale == null) {
                    return;
                }
            } else {
                locale = Locale.forLanguageTag(languageTag);
            }
            Locale.setDefault(locale);
        }

        @Override
        public void setPlatformApplicationLocale(String languageTag) {
            Api33.setApplicationLocales(context, languageTag);
        }

        @Override
        public void updateLegacyResources(String languageTag) {
            Resources resources = context.getResources();
            Configuration configuration = new Configuration(resources.getConfiguration());
            Locale locale = languageTag.isEmpty()
                    ? systemLocale()
                    : Locale.forLanguageTag(languageTag);
            if (locale == null) {
                return;
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                Api24.setLocales(configuration, locale);
            } else {
                configuration.locale = locale;
            }
            resources.updateConfiguration(configuration, resources.getDisplayMetrics());
        }

        private static Locale systemLocale() {
            Configuration systemConfiguration = Resources.getSystem().getConfiguration();
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                return Api24.firstLocale(systemConfiguration);
            }
            return systemConfiguration.locale;
        }
    }

    @TargetApi(Build.VERSION_CODES.N)
    private static final class Api24 {
        private Api24() {
        }

        static Locale firstLocale(Configuration configuration) {
            LocaleList locales = configuration.getLocales();
            return locales.isEmpty() ? null : locales.get(0);
        }

        @SuppressLint("AppBundleLocaleChanges")
        static void setLocales(Configuration configuration, Locale locale) {
            configuration.setLocales(new LocaleList(locale));
        }
    }

    @TargetApi(Build.VERSION_CODES.TIRAMISU)
    private static final class Api33 {
        private Api33() {
        }

        static void setApplicationLocales(Context context, String languageTag) {
            LocaleManager localeManager = context.getSystemService(LocaleManager.class);
            if (localeManager == null) {
                throw new IllegalStateException("LocaleManager is unavailable");
            }
            LocaleList locales = languageTag.isEmpty()
                    ? LocaleList.getEmptyLocaleList()
                    : LocaleList.forLanguageTags(languageTag);
            localeManager.setApplicationLocales(locales);
        }
    }
}
