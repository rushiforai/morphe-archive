/*
 * Meta Patches — developer options holder.
 *
 * Forked from InstaFL patch_exts/DevHolder.smali
 * (https://github.com/mamiiblt/instafel) by mamiiblt (Muhammed Ali Bulut).
 *
 * The patch binds the Instagram main activity and the current user session
 * when the home long press fires, so the extension can open the developer
 * options inside Instagram without knowing obfuscated internals at compile
 * time.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.meta.extension;

import android.app.Activity;

/**
 * Holds the Instagram main activity and user session for the current menu use.
 */
public class ModsDevHolder {

    private static Activity mainActivity;
    private static Object userSession;

    /** Called by the patch from the replaced home long click handler. */
    public static void set(Activity mainActivity, Object userSession) {
        ModsDevHolder.mainActivity = mainActivity;
        ModsDevHolder.userSession = userSession;
    }

    public static Activity getActivity() {
        return mainActivity;
    }

    public static Object getSession() {
        return userSession;
    }

    private ModsDevHolder() {
    }
}
