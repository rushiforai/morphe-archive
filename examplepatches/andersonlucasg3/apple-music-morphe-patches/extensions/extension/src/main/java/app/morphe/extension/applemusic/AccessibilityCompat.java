package app.morphe.extension.applemusic;

import android.os.Build;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;

/**
 * API 29 replacement for the state-description accessors, which were added in API 30.
 *
 * <p>Apple Music 7.0.0 is compiled with minSdk 30, so R8 kept
 * {@code View.getStateDescription}, {@code View.setStateDescription},
 * {@code AccessibilityNodeInfo.getStateDescription} and
 * {@code AccessibilityNodeInfo.setStateDescription} without an SDK_INT guard. On the DiLink
 * (Android 10) the first one reached from the accessibility bridge throws
 * {@code NoSuchMethodError} and kills the process while {@code uiautomator dump} runs or a car
 * accessibility service connects.
 *
 * <p>The platform calls live in {@link Api30} on purpose: this class has to load on API 29, and
 * the nested class is only loaded after the SDK check passes, so no API 30 method reference is
 * resolved there. On API 30+ the direct calls behave exactly like the original ones; on API 29
 * the getters return {@code null} and the setters do nothing. The subclass {@code invoke-super}
 * case has its own documented no-op, see {@link #setStateDescriptionSuper}.
 */
public final class AccessibilityCompat {

    private AccessibilityCompat() {
    }

    public static CharSequence getStateDescription(Object viewOrNode) {
        return Build.VERSION.SDK_INT >= 30 && viewOrNode != null
                ? Api30.getStateDescription(viewOrNode)
                : null;
    }

    public static void setStateDescription(Object viewOrNode, CharSequence stateDescription) {
        if (Build.VERSION.SDK_INT >= 30 && viewOrNode != null) {
            Api30.setStateDescription(viewOrNode, stateDescription);
        }
    }

    /**
     * Replacement for {@code invoke-super android.view.View.setStateDescription} in View
     * subclasses (MaterialCheckBox; obfuscated {@code Lif/a} in Apple Music 7.0.0).
     *
     * <p>A virtual call to the same method would dispatch back into the subclass override and
     * recurse forever, so this is a no-op on every API level. On API 29 the platform method does
     * not exist and the call had to be removed anyway; on API 30+ the subclass still keeps its own
     * state-description field, and only the platform accessibility value is not propagated.
     */
    public static void setStateDescriptionSuper(Object view, CharSequence stateDescription) {
        // Intentionally empty; see the class documentation.
    }

    private static final class Api30 {

        private Api30() {
        }

        static CharSequence getStateDescription(Object viewOrNode) {
            return viewOrNode instanceof View
                    ? ((View) viewOrNode).getStateDescription()
                    : ((AccessibilityNodeInfo) viewOrNode).getStateDescription();
        }

        static void setStateDescription(Object viewOrNode, CharSequence stateDescription) {
            if (viewOrNode instanceof View) {
                ((View) viewOrNode).setStateDescription(stateDescription);
            } else {
                ((AccessibilityNodeInfo) viewOrNode).setStateDescription(stateDescription);
            }
        }
    }
}
