package app.charlesattend.extension.beeper;

import android.util.Log;

/**
 * Click action of the "Oldest first" item in the inbox title menu.
 *
 * The app's Kotlin Function0 interface is obfuscated, so this class cannot declare it here.
 * The patch adds that interface at patch time. Its only method is invoke().
 */
@SuppressWarnings("unused")
public final class InboxOrderMenuItem {
    private final Object dismissMenu;

    public InboxOrderMenuItem(Object dismissMenu) {
        this.dismissMenu = dismissMenu;
    }

    public Object invoke() {
        try {
            InboxOrderPatch.toggle();
        } catch (Throwable throwable) {
            Log.e("MorpheInboxOrder", "Could not change the inbox order", throwable);
        }
        // Close the menu, as the other menu items do. This returns kotlin.Unit.
        return InboxOrderPatch.invokeFunction0(dismissMenu);
    }
}
