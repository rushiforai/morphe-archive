package com.akshaykadam.pixelboard.extension.settings;

import android.content.Context;
import android.content.res.Configuration;
import android.os.Build;
import java.util.Locale;

public final class GboardSettingsText {
    private static final String LANGUAGE_ENGLISH = "en";

    private GboardSettingsText() {
    }

    public static String get(Context context, int resId) {
        String stableText = resolveStableText(context, resId);
        if (stableText != null) {
            return stableText;
        }
        if (context != null) {
            try {
                return context.getString(resId);
            } catch (Throwable ignored) {
            }
        }
        return "";
    }

    public static String format(Context context, int resId, Object... args) {
        String stableText = resolveStableText(context, resId, args);
        if (stableText != null) {
            return stableText;
        }
        if (context != null) {
            try {
                return context.getString(resId, args);
            } catch (Throwable ignored) {
            }
        }
        return "";
    }

    public static String quantity(Context context, int resId, int quantity) {
        String stableQuantity = resolveStableQuantity(context, resId, quantity);
        if (stableQuantity != null) {
            return stableQuantity;
        }
        if (context != null) {
            try {
                return context.getResources().getQuantityString(resId, quantity, quantity);
            } catch (Throwable ignored) {
            }
        }
        return "";
    }

    private static String resolveStableText(Context context, int resId, Object... args) {
        return resolveStableText(resId, resolveLanguageTag(context), args);
    }

    private static String resolveStableText(int resId, String languageTag, Object... args) {
        return formatTemplate(
                languageTag,
                GboardSettingsTextCatalog.template(resId, languageTag),
                args);
    }

    private static String resolveStableQuantity(Context context, int resId, int quantity) {
        return resolveStableQuantity(resId, resolveLanguageTag(context), quantity);
    }

    private static String resolveStableQuantity(int resId, String languageTag, int quantity) {
        return formatTemplate(
                languageTag,
                GboardSettingsTextCatalog.quantityTemplate(resId, languageTag, quantity),
                quantity);
    }

    private static String formatTemplate(String languageTag, String template, Object... args) {
        if (template == null) {
            return null;
        }
        if (args == null || args.length == 0) {
            return template;
        }
        return String.format(Locale.US, template, args);
    }

    private static String resolveLanguageTag(Context context) {
        Locale locale = extractLocale(context);
        return normalizeLanguageTag(locale != null ? locale.getLanguage() : null);
    }

    private static Locale extractLocale(Context context) {
        if (context == null) {
            return Locale.getDefault();
        }
        try {
            if (context.getResources() != null) {
                Configuration configuration = context.getResources().getConfiguration();
                if (configuration != null) {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N
                            && configuration.getLocales() != null
                            && !configuration.getLocales().isEmpty()) {
                        Locale locale = configuration.getLocales().get(0);
                        return locale != null ? locale : Locale.getDefault();
                    }
                    Locale locale = configuration.locale;
                    return locale != null ? locale : Locale.getDefault();
                }
            }
        } catch (Throwable ignored) {
        }
        return Locale.getDefault();
    }

    private static String normalizeLanguageTag(String languageTag) {
        if (languageTag == null || languageTag.isEmpty()) {
            return LANGUAGE_ENGLISH;
        }
        String lower = languageTag.toLowerCase(Locale.US).trim();
        if ("id".equals(lower)) {
            return "in";
        }
        int dashIndex = lower.indexOf('-');
        if (dashIndex > 0) {
            lower = lower.substring(0, dashIndex);
        }
        int underscoreIndex = lower.indexOf('_');
        if (underscoreIndex > 0) {
            lower = lower.substring(0, underscoreIndex);
        }
        return lower;
    }
}
