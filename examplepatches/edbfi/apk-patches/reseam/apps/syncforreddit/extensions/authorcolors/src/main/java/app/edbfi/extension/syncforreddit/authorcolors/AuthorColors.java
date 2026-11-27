// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.syncforreddit.authorcolors;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import androidx.preference.Preference;
import app.reseam.runtime.Export;
import com.laurencedawson.reddit_sync.ui.fragment_dialogs.bottom.material_dialogs.base.AbstractSelectionDialogBottomSheet.h;
import java.util.Map;
import java.util.regex.Pattern;

public final class AuthorColors {
    private static final Pattern USERNAME = Pattern.compile("[A-Za-z0-9_-]{1,20}");
    private AuthorColors() {}

    @Export
    public static native Map<String, Integer> storedColors();

    @Export
    public static native String currentProfile();

    @Export
    public static native void writeColor(String profile, String author, String hex);

    @Export
    public static h createAction(String author, int icon) {
        if (!isUsername(author)) {
            return null;
        }
        return new ColorAction(icon, author);
    }

    @Export
    public static boolean editAction(Activity activity, Object row) {
        if (!(row instanceof ColorAction)) {
            return false;
        }
        if (activity != null && !activity.isFinishing()) {
            AuthorColorDialog.open(activity, ((ColorAction) row).author);
        }
        return true;
    }

    @Export
    public static void registerManager(Preference preference) {
        preference.A0(row -> {
            Context context = row.k();
            while (context instanceof ContextWrapper) {
                if (context instanceof Activity) {
                    AuthorColorDialog.open((Activity) context, null);
                    break;
                }
                context = ((ContextWrapper) context).getBaseContext();
            }
            return true;
        });
    }

    @Export
    public static Integer savedColor(String author) {
        return isUsername(author) ? storedColors().get(author) : null;
    }

    static boolean isUsername(String value) {
        return value != null && USERNAME.matcher(value).matches();
    }

    private static final class ColorAction extends h {
        private final String author;

        private ColorAction(int icon, String author) {
            super(icon, "Local author color");
            this.author = author;
        }
    }
}
