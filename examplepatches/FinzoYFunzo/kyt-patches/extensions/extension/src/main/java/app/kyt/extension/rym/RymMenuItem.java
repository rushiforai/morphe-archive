package app.kyt.extension.rym;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;
import android.widget.Toast;

import java.util.List;

/**
 * A context menu item added to the TIDAL menus.
 * <p>
 * The TIDAL menu item class is obfuscated and its name changes with every app version,
 * so this class cannot extend it when compiling the extension. Instead, the patch:
 * <ul>
 *     <li>Changes the superclass of this class to the TIDAL menu item class.</li>
 *     <li>Replaces the super() call of the constructor with a call to the constructor
 *     of the TIDAL menu item class, passing the first 8 parameters.</li>
 *     <li>Adds the method TIDAL calls when the item is pressed, which calls {@link #onClick(Activity)}.</li>
 * </ul>
 */
@SuppressWarnings("unused")
public class RymMenuItem {
    private final String dialogTitle;
    private final List<RymSearch> searches;

    /**
     * The first 8 parameters are passed as they are to the constructor of the TIDAL menu item class.
     * Do not change their order or types, the patch depends on them.
     *
     * @param title           TIDAL title object, see {@link TidalObjects#createTitle(String)}.
     * @param iconResId       Drawable resource id of the icon.
     * @param id              Identifier of the menu item.
     * @param contentMetadata TIDAL tracking metadata, see {@link TidalObjects#createContentMetadata(String, String)}.
     * @param unknown1        Passed as 0, same as the TIDAL menu items.
     * @param colorResId      Color resource id of the icon and title.
     * @param unknown2        Passed as 0, same as the TIDAL menu items.
     * @param defaultsMask    Which of the previous parameters use their default value instead.
     * @param dialogTitle     Title of the dialog that lists the searches.
     * @param searches        The searches the user can choose from. Must not be empty.
     */
    public RymMenuItem(Object title, int iconResId, String id, Object contentMetadata,
                       int unknown1, int colorResId, int unknown2, int defaultsMask,
                       String dialogTitle, List<RymSearch> searches) {
        super(); // Replaced by the patch.
        this.dialogTitle = dialogTitle;
        this.searches = searches;
    }

    /**
     * Called when the menu item is pressed.
     * Opens the search directly if there is only one, otherwise shows a dialog to choose one.
     */
    public void onClick(Activity activity) {
        try {
            if (searches.size() == 1) {
                openInBrowser(activity, searches.get(0).url);
                return;
            }

            String[] labels = new String[searches.size()];
            for (int i = 0; i < searches.size(); i++) {
                labels[i] = searches.get(i).label;
            }

            new AlertDialog.Builder(activity)
                    .setTitle(dialogTitle)
                    // "which" is the position of the pressed option in the list.
                    .setItems(labels, (dialog, which) -> openInBrowser(activity, searches.get(which).url))
                    .show();
        } catch (Exception ex) {
            Log.e(RateYourMusicPatch.TAG, "onClick failure", ex);
        }
    }

    /**
     * Opens an address in the default browser of the user.
     */
    private static void openInBrowser(Activity activity, String url) {
        Log.d(RateYourMusicPatch.TAG, "Opening " + url);
        try {
            // ACTION_VIEW asks Android to open the address with the app the user chose for it,
            // which is the default browser, or the RateYourMusic app if one handles its links.
            activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)));
        } catch (ActivityNotFoundException ex) {
            // No app can open web addresses.
            Toast.makeText(activity, "No browser found", Toast.LENGTH_SHORT).show();
        }
    }
}
