package dev.jason.gboardpatches.extension.addsymbols;

import android.content.Context;
import android.inputmethodservice.InputMethodService;
import android.util.Log;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Locale;
import java.util.Set;
import java.util.function.Supplier;

import dev.jason.gboardpatches.extension.editingaccesspoints.GboardEditingAccessPointsContribution;

/** Adds the patch's palette to the stock draggable toolbar catalog. */
public final class GboardCustomSymbolsContribution {
    private static final String TOKEN = "morphe_custom_symbols";
    private static final String LABEL = "Custom Symbols";
    // Gboard 18.8's native Rich Symbols icon. Its tint follows the keyboard theme.
    private static final int SYMBOL_ICON = 0x7f080524;

    private GboardCustomSymbolsContribution() {
    }

    public static Object extendOrderCatalog(Object original) {
        if (!(original instanceof Set<?> tokens) || tokens.contains(TOKEN)) return original;
        try {
            Class<?> setClass = Class.forName("auco", false, original.getClass().getClassLoader());
            if (!setClass.isInstance(original)) return original;
            Method copy = setClass.getDeclaredMethod("n", Collection.class);
            ArrayList<Object> extended = new ArrayList<>(tokens);
            extended.add(TOKEN);
            return copy.invoke(null, extended);
        } catch (ReflectiveOperationException | RuntimeException unavailable) {
            return original;
        }
    }

    public static void register(Object controller, Context context,
            Supplier<InputMethodService> currentService) {
        if (controller == null || context == null) return;
        try {
            ClassLoader loader = controller.getClass().getClassLoader();
            Method activeLocale = Class.forName("aety", false, loader).getDeclaredMethod("f");
            if (activeLocale.getReturnType() != Locale.class
                    || !"drawable".equals(context.getResources().getResourceTypeName(SYMBOL_ICON))) {
                return;
            }
            GboardEditingAccessPointsContribution.registerExtra(controller, context, TOKEN,
                    SYMBOL_ICON, LABEL, () -> {
                        try {
                            Locale locale = (Locale) activeLocale.invoke(null);
                            GboardNativeSymbols.open(currentService.get(), locale);
                        } catch (ReflectiveOperationException | RuntimeException unavailable) {
                            Log.w("GboardPatches", "Could not open Custom Symbols");
                        }
                    });
        } catch (ReflectiveOperationException | RuntimeException unavailable) {
            // An unavailable toolbar binding leaves the other Access Points intact.
        }
    }
}
