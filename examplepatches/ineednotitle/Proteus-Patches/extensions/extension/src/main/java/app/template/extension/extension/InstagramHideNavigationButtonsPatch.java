/*
 * Adapted from https://github.com/brosssh/morphe-patches
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.extension.extension;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@SuppressWarnings("unused")
public final class InstagramHideNavigationButtonsPatch {

    private InstagramHideNavigationButtonsPatch() {
    }

    /**
     * Injection point.
     *
     * @param navigationButtonsList the list of navigation buttons, as an (obfuscated) Enum type
     * @param buttonNameToRemove the fragment name of the button to remove (e.g. "fragment_clips")
     * @param enumNameField the field in the nav button enum class storing the fragment name
     * @return the patched list of navigation buttons
     */
    public static List<Object> removeNavigationButtonByName(
            List<Object> navigationButtonsList,
            String buttonNameToRemove,
            String enumNameField
    ) throws IllegalAccessException, NoSuchFieldException {
        if (navigationButtonsList == null) return null;
        List<Object> mutableList = new ArrayList<>(navigationButtonsList);

        Iterator<Object> iterator = mutableList.iterator();
        while (iterator.hasNext()) {
            Object button = iterator.next();
            if (button == null) continue;
            Field f = button.getClass().getDeclaredField(enumNameField);
            f.setAccessible(true);
            Object value = f.get(button);
            if (buttonNameToRemove.equals(value)) {
                iterator.remove();
                break;
            }
        }
        return mutableList;
    }
}
