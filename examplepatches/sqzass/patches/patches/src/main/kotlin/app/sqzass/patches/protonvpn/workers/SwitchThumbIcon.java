package app.sqzass.patches.protonvpn;

import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import android.content.Context;
import android.util.TypedValue;
import app.morphe.extension.shared.Utils;
import app.sqzass.extension.proton.MaterialSwitches;
import app.sqzass.extension.proton.PatchesTheme;
import app.sqzass.extension.shared.ProxyHandler;

@SuppressWarnings("unused")
public final class SwitchThumbIcon {
    private static final int TINT_FROM_CONTENT_COLOR = 0x8;
    private static boolean checked;
    private static long tint;
    private static volatile Object checkedContent;
    private static volatile Object uncheckedContent;
    private SwitchThumbIcon() {}

    public static synchronized Object thumbContent(Class<?> composableLambdaType, boolean checked) {
        if (!MaterialSwitches.isEnabled()) {
            return null;
        }
        if (checked) {
            if (checkedContent == null) {
                checkedContent = newThumbContent(composableLambdaType, true);
            }
            return checkedContent;
        }
        if (uncheckedContent == null) {
            uncheckedContent = newThumbContent(composableLambdaType, false);
        }
        return uncheckedContent;
    }

    static int thumbColorAttribute() {
        return 0;
    }
    public static long checkedThumbColor(long original) {
        final Context context = Utils.getContext();
        if (context == null || !MaterialSwitches.isEnabled()) {
            return original;
        }

        final Context themed = PatchesTheme.withApplicationTheme(context);
        final TypedValue value = new TypedValue();
        if (!themed.getTheme().resolveAttribute(thumbColorAttribute(), value, true)) {
            return original;
        }
        final int argb = (value.resourceId != 0) ? themed.getColor(value.resourceId) : value.data;
        return ((long) argb) << 32;
    }
    public static void remember(boolean isChecked, long checkedTrackColor, long uncheckedTrackColor) {
        checked = isChecked;
        tint = isChecked ? checkedTrackColor : uncheckedTrackColor;
    }
    public static void drawThumbIcon(Object composer) {
        if (MaterialSwitches.isEnabled()) {
            drawIcon(composer, checked, tint, 0);
        }
    }
    static void drawIcon(Object composer, boolean isChecked, long iconTint, int defaults) {
    }
    private static Object newThumbContent(Class<?> composableLambdaType, boolean checked) {
        return Proxy.newProxyInstance(SwitchThumbIcon.class.getClassLoader(), new Class<?>[] { composableLambdaType },
                new ThumbContentHandler(checked));
    }
    private static final class ThumbContentHandler extends ProxyHandler {
        private final boolean checked;
        ThumbContentHandler(boolean checked) {
            this.checked = checked;
        }
        @Override
        protected String describe() {
            return (this.checked) ? "SwitchThumbIcon(checked)" : "SwitchThumbIcon(unchecked)";
        }
        @Override
        protected Object handle(Method method, Object[] args) {
            drawIcon(args[0], this.checked, 0L, TINT_FROM_CONTENT_COLOR);
            return null;
        }
    }
}
