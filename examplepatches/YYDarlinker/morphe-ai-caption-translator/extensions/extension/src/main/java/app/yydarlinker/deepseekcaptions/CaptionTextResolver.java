package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.content.res.Configuration;
import android.view.View;
import android.widget.TextView;
import java.lang.reflect.Method;
import java.util.Locale;

/** UI text only. A configuration context never leaves string(), and is never retained. */
final class CaptionTextResolver {
    private CaptionTextResolver() {}

    static Locale locale(Context caller) {
        Locale host = Locale.ENGLISH;
        if (caller != null) try {
            host = caller.getResources().getConfiguration().getLocales().get(0);
        } catch (RuntimeException unavailable) { /* Use the complete English catalog. */ }
        try {
            Class<?> base = Class.forName("app.morphe.extension.shared.settings.BaseSettings");
            Object setting = base.getField("MORPHE_LANGUAGE").get(null);
            Class<?> enumSetting = Class.forName("app.morphe.extension.shared.settings.EnumSetting");
            if (enumSetting.isInstance(setting)) {
                Method get = enumSetting.getMethod("get");
                if (Enum.class.isAssignableFrom(get.getReturnType())) {
                    Object value = get.invoke(setting);
                    Class<?> language = Class.forName("app.morphe.extension.shared.settings.AppLanguage");
                    if (language.isInstance(value) && value instanceof Enum
                            && !"DEFAULT".equals(((Enum<?>) value).name())) {
                        Method getLocale = language.getMethod("getLocale");
                        if (getLocale.getReturnType() == Locale.class) {
                            Object selected = getLocale.invoke(value);
                            if (selected instanceof Locale) return normalize((Locale) selected);
                        }
                    }
                }
            }
        } catch (ReflectiveOperationException | LinkageError unavailable) { /* Host locale. */ }
        return normalize(host);
    }

    static Locale normalize(Locale value) {
        if (value == null) return Locale.ENGLISH;
        String language = value.getLanguage();
        if ("zh".equals(language)) {
            String script = value.getScript(), region = value.getCountry();
            boolean traditional = "Hant".equalsIgnoreCase(script)
                    || (!"Hans".equalsIgnoreCase(script)
                    && ("TW".equals(region) || "HK".equals(region) || "MO".equals(region)));
            return Locale.forLanguageTag(traditional ? "zh-Hant-TW" : "zh-Hans-CN");
        }
        if ("in".equals(language) || "id".equals(language)) return Locale.forLanguageTag("id");
        for (String supported : new String[]{"en","es","fr","de","pt","ru","ja","ko","ar","hi","vi"})
            if (supported.equals(language)) return Locale.forLanguageTag(supported);
        return Locale.ENGLISH;
    }

    static String catalogLocale(Locale value) {
        Locale normalized = normalize(value);
        return "zh".equals(normalized.getLanguage())
                ? ("Hant".equals(normalized.getScript()) ? "zh-rTW" : "zh-rCN")
                : normalized.getLanguage();
    }

    static String string(Context caller, String key) {
        Locale selected = locale(caller);
        if (caller != null) try {
            int id = identifier(caller, key);
            if (id != 0) {
                Configuration configuration = new Configuration(caller.getResources().getConfiguration());
                configuration.setLocale(selected);
                // Only this expression receives the temporary resource context. The result is String.
                return caller.createConfigurationContext(configuration).getString(id);
            }
        } catch (RuntimeException unavailable) { /* Generated values are identical to the XML. */ }
        return CaptionTranslationCatalog.text(catalogLocale(selected), key);
    }

    private static int identifier(Context caller, String key) {
        try {
            Object id = Class.forName("app.morphe.extension.shared.ResourceUtils")
                    .getMethod("getStringIdentifier", String.class).invoke(null, "cap_" + key);
            if (id instanceof Integer && (Integer) id != 0) {
                // Confirm that the ID belongs to this resource table, including renamed APKs.
                if (("cap_" + key).equals(caller.getResources().getResourceEntryName((Integer) id))) return (Integer) id;
            }
        } catch (ReflectiveOperationException | RuntimeException | LinkageError unavailable) { /* Standalone host. */ }
        int id = caller.getResources().getIdentifier("cap_" + key, "string", caller.getPackageName());
        if (id == 0) id = caller.getResources().getIdentifier("cap_" + key, "string", "com.google.android.youtube");
        return id;
    }

    static void direction(View view, boolean data) {
        Locale selected = locale(view.getContext());
        boolean rtl = !data && "ar".equals(selected.getLanguage());
        int layout=rtl ? View.LAYOUT_DIRECTION_RTL : View.LAYOUT_DIRECTION_LTR;
        int text=data ? View.TEXT_DIRECTION_LTR : (rtl ? View.TEXT_DIRECTION_RTL : View.TEXT_DIRECTION_LOCALE);
        if(view.getLayoutDirection()!=layout)view.setLayoutDirection(layout);
        if(view.getTextDirection()!=text)view.setTextDirection(text);
        if(view instanceof TextView){
            TextView target=(TextView)view;
            android.os.LocaleList locales=new android.os.LocaleList(selected);
            if(!locales.equals(target.getTextLocales()))target.setTextLocales(locales);
        }
    }
}
