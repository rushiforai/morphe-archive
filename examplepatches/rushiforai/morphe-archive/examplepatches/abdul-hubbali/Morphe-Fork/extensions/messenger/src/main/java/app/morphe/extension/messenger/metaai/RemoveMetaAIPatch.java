/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/6b06b9d1328b971a06d10b4247f4c10f050e4f61/extensions/messenger/src/main/java/app/revanced/extension/messenger/metaai/RemoveMetaAIPatch.java
 */

package app.morphe.extension.messenger.metaai;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import app.morphe.extension.shared.Logger;

@SuppressWarnings("unused")
public class RemoveMetaAIPatch {
    private static final Set<Long> loggedIDs = Collections.synchronizedSet(new HashSet<>());

    public static boolean overrideBooleanFlag(long id, boolean value) {
        try {
            if (Long.toString(id).startsWith("REPLACED_BY_PATCH")) {
                if (loggedIDs.add(id)) {
                    Logger.printInfo(() -> "Overriding " + id + " from " + value + " to false");
                }
                return false;
            }
        } catch (Exception ex) {
            Logger.printException(() -> "overrideBooleanFlag failure", ex);
        }

        return value;
    }
}
