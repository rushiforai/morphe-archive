package app.southstar21.extension.instagram.settings;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Callable;

/**
 * One patch's section in the menu: an on/off switch plus its settings.
 * <p>
 * The extension contains every patch's code, so {@link #included} tells whether this patch
 * was actually selected in Morphe Manager. Patches that weren't are hidden from the menu.
 */
public final class PatchSettings {
    public final String title;
    public final String description;
    public final BooleanSetting enabled;
    public final List<Setting> settings;
    private final Callable<Boolean> included;

    /**
     * @param key      prefix for the stored values, e.g. "liquid_glass"
     * @param included usually the patch's {@code isIncluded()}, which the patch makes return true
     */
    public PatchSettings(String key, String title, String description, Callable<Boolean> included,
                         Setting... settings) {
        this.title = title;
        this.description = description;
        this.included = included;
        this.enabled = new BooleanSetting(key + "_enabled", "Enabled", null, true, true);
        this.settings = Collections.unmodifiableList(Arrays.asList(settings));
    }

    public boolean isIncluded() {
        try {
            return included.call();
        } catch (Exception e) {
            return false;
        }
    }

    /** Included in the patched app and switched on in the menu. */
    public boolean isActive() {
        return isIncluded() && enabled.get();
    }
}
