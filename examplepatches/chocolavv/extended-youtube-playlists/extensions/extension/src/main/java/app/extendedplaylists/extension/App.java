package app.extendedplaylists.extension;

import android.content.Context;
import android.content.res.Resources;

import androidx.annotation.Nullable;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/** The patched app itself: its strings and bundled assets, found by name at run time. */
final class App {
    /** A string of the app in the user's language, or null when the app has no such string. */
    @Nullable static String string(String name) {
        try {
            Context c = Utils.getContext();
            Resources r = c.getResources();
            // The resource package may differ from the renamed app package; a resource of the app names it.
            final int id = r.getIdentifier(name, "string", r.getResourcePackageName(c.getApplicationInfo().icon));
            return id == 0 ? null : r.getString(id);
        } catch (Exception e) {
            Logger.printInfo(() -> "No string " + name, e);
            return null;
        }
    }

    /** Name of the first asset in a folder that starts with the prefix, or null. */
    @Nullable static String asset(String dir, String prefix) {
        try {
            for (String n : Utils.getContext().getAssets().list(dir)) if (n.startsWith(prefix)) return n;
        } catch (Exception e) {
            Logger.printInfo(() -> "No asset " + dir + "/" + prefix, e);
        }
        return null;
    }

    private App() {}
}
