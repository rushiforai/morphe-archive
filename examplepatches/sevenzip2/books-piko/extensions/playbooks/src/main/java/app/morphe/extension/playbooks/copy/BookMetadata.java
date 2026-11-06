package app.morphe.extension.playbooks.copy;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.util.Log;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;

/** Reads the already downloaded book metadata; never makes a network request. */
public final class BookMetadata implements AttributedCopy.MetadataLookup {
    // BooksProvider: VOLUMES (100), LocalVolumesProvidelet and the native volumes columns.
    private static final Uri VOLUMES = Uri.parse("content://com.google.android.apps.books/accounts/volumes");
    private static final String[] PROJECTION = {"title", "creator", "authors"};
    private final Context context;

    private BookMetadata(Context context) {
        this.context = context;
    }

    public static String copyText(Context context, String text, String id, boolean attributed) {
        if (!attributed) return text;
        return AttributedCopy.copyText(text, id, true, context == null ? null : new BookMetadata(context));
    }

    @Override
    public AttributedCopy.Metadata find(String id) {
        Cursor cursor = null;
        try {
            cursor = context.getContentResolver().query(VOLUMES, PROJECTION.clone(),
                    "volume_id = ?", new String[]{id}, null);
            if (cursor == null) return null;
            while (cursor.moveToNext()) {
                String title = cursor.getString(0);
                if (title == null || title.trim().isEmpty()) continue;
                return new AttributedCopy.Metadata(title, authors(cursor.getString(2), cursor.getString(1)));
            }
        } catch (RuntimeException exception) {
            Log.w("BooksPiko", "Could not read local book metadata for attribution", exception);
        } finally {
            if (cursor != null) cursor.close();
        }
        return null;
    }

    private static List<String> authors(String json, String creator) {
        if (json != null && !json.isEmpty()) {
            try {
                JSONArray array = new JSONArray(json);
                List<String> result = new ArrayList<>();
                for (int i = 0; i < array.length(); i++) {
                    String name = array.optString(i, "");
                    if (!name.isEmpty()) result.add(name);
                }
                if (!result.isEmpty()) return result;
            } catch (JSONException ignored) {
                // Older database rows can omit the JSON list but still have a display creator.
            }
        }
        return creator == null || creator.trim().isEmpty()
                ? Collections.<String>emptyList() : Collections.singletonList(creator);
    }
}
