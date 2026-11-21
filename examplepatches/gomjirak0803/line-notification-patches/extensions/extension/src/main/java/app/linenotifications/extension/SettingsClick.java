package app.linenotifications.extension;

import android.content.Context;
import java.io.Serializable;

/** LINE's obfuscated function interfaces are attached by the settings patch. */
public final class SettingsClick implements Serializable {
    private static final long serialVersionUID = 1L;
    public Object invoke(Object fragment) {
        try { Settings.show((Context) fragment.getClass().getMethod("getContext").invoke(fragment)); }
        catch (ReflectiveOperationException | RuntimeException ignored) { }
        return null;
    }
    public Object invoke(Object context, Object rows, Object navigation) {
        if (context instanceof Context) Settings.show((Context) context);
        return null;
    }
}
