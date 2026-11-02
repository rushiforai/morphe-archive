package nl.johninnl.wuplay;

import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.media.tv.TvContract;
import android.net.Uri;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Reconcile only this extension's preview channels; never touch Watch Next. Worker-only. */
final class CatalogPublisher {
    private static final Uri CHANNELS = Uri.parse("content://android.media.tv/channel");
    private static final Uri PROGRAMS = Uri.parse("content://android.media.tv/preview_program");
    private final Context context;
    private final ContentResolver resolver;
    CatalogPublisher(Context context) { this.context = context; resolver = context.getContentResolver(); }

    List<Long> pendingBrowsable(Set<String> selectedHomeCatalogs) {
        List<Long> result = new ArrayList<>();
        try (Cursor cursor = resolver.query(CHANNELS,
                new String[]{"_id", "package_name", "internal_provider_id", "type", "browsable"}, null, null, null)) {
            if (cursor == null) throw new IllegalStateException("TV channel provider unavailable");
            while (cursor.moveToNext()) if (CatalogPolicy.requestVisibility(cursor.getString(1), cursor.getString(2),
                    cursor.getString(3), cursor.getInt(4) != 0, selectedHomeCatalogs))
                result.add(cursor.getLong(0));
        }
        return result;
    }

    void removeUnselected(Set<String> desired) throws Exception {
        List<Long> remove = new ArrayList<>();
        try (Cursor cursor = resolver.query(CHANNELS, new String[]{"_id", "package_name", "internal_provider_id"}, null, null, null)) {
            if (cursor == null) throw new IllegalStateException("TV channel provider unavailable");
            while (cursor.moveToNext()) if (CatalogPolicy.remove(cursor.getString(1), cursor.getString(2), desired)) remove.add(cursor.getLong(0));
        }
        for (long id : remove) resolver.delete(ContentUris.withAppendedId(CHANNELS, id), null, null);
    }

    void publish(NativeCatalogs.Definition definition, List<?> items) throws Exception {
        // Validate/map the whole response before touching the last successful channel.
        Map<String, ContentValues> tiles = new LinkedHashMap<>();
        for (Object item : items) {
            String type = (String) NativeCatalogs.field(item, "type");
            String id = (String) NativeCatalogs.field(item, "id");
            if (id == null || id.isEmpty()) id = (String) NativeCatalogs.field(item, "imdbId");
            String key = CatalogPolicy.tileKey(type, id);
            String title = (String) NativeCatalogs.field(item, "name");
            if (key == null || title == null || title.trim().isEmpty() || tiles.containsKey(key)) continue;
            String background = (String) NativeCatalogs.field(item, "background");
            String poster = (String) NativeCatalogs.field(item, "poster");
            boolean landscape = CatalogPolicy.artwork(background);
            String art = landscape ? background : CatalogPolicy.artwork(poster) ? poster : null;
            if (art == null) continue;
            ContentValues values = new ContentValues();
            values.put("internal_provider_id", key);
            values.put("type", "movie".equals(type) ? 0 : 1);
            values.put("title", title);
            values.put("short_description", (String) NativeCatalogs.field(item, "description"));
            values.put("poster_art_uri", art);
            values.put("poster_art_aspect_ratio", landscape ? 0 : 4);
            values.put("weight", 100 - tiles.size());
            Intent intent = new Intent(Intent.ACTION_VIEW, new Uri.Builder().scheme("wuplay").authority(type).appendPath(id).build());
            intent.setClassName(context.getPackageName(), "app.wuplay.androidtv.MainActivity");
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
            values.put("intent_uri", intent.toUri(Intent.URI_INTENT_SCHEME));
            tiles.put(key, values);
            if (tiles.size() == 100) break;
        }
        long channel = channel(definition);
        Map<String, List<Long>> existing = new LinkedHashMap<>();
        try (Cursor cursor = resolver.query(Uri.parse(PROGRAMS + "?channel=" + channel),
                new String[]{"_id", "channel_id", "package_name", "internal_provider_id"}, null, null, null)) {
            if (cursor == null) throw new IllegalStateException("TV program provider unavailable");
            while (cursor.moveToNext()) if (cursor.getLong(1) == channel && context.getPackageName().equals(cursor.getString(2)))
                existing.computeIfAbsent(cursor.getString(3), ignored -> new ArrayList<>()).add(cursor.getLong(0));
        }
        // Upsert first: a failed write never empties the old catalog before replacement.
        for (Map.Entry<String, ContentValues> tile : tiles.entrySet()) {
            ContentValues values = tile.getValue(); values.put("channel_id", channel);
            List<Long> ids = existing.get(tile.getKey());
            if (ids == null || ids.isEmpty()) {
                if (resolver.insert(PROGRAMS, values) == null) throw new IllegalStateException("Cannot publish TV program");
            } else if (resolver.update(ContentUris.withAppendedId(PROGRAMS, ids.get(0)), values, null, null) != 1)
                throw new IllegalStateException("TV program disappeared during refresh");
        }
        for (Map.Entry<String, List<Long>> entry : existing.entrySet()) {
            int keep = tiles.containsKey(entry.getKey()) ? 1 : 0;
            for (int i = keep; i < entry.getValue().size(); i++)
                resolver.delete(ContentUris.withAppendedId(PROGRAMS, entry.getValue().get(i)), null, null);
        }
    }

    private long channel(NativeCatalogs.Definition definition) throws Exception {
        Long id = null;
        List<Long> duplicates = new ArrayList<>();
        try (Cursor cursor = resolver.query(CHANNELS, new String[]{"_id", "package_name", "internal_provider_id"}, null, null, null)) {
            if (cursor == null) throw new IllegalStateException("TV channel provider unavailable");
            while (cursor.moveToNext()) if (context.getPackageName().equals(cursor.getString(1)) && definition.key.equals(cursor.getString(2))) {
                if (id == null) id = cursor.getLong(0); else duplicates.add(cursor.getLong(0));
            }
        }
        Intent launch = context.getPackageManager().getLeanbackLaunchIntentForPackage(context.getPackageName());
        if (launch == null) throw new IllegalStateException("Wuplay launch activity unavailable");
        ContentValues values = new ContentValues();
        values.put("type", "TYPE_PREVIEW"); values.put("display_name", definition.name);
        values.put("internal_provider_id", definition.key);
        values.put("app_link_intent_uri", launch.toUri(Intent.URI_INTENT_SCHEME));
        if (id == null) {
            Uri created = resolver.insert(CHANNELS, values);
            if (created == null) throw new IllegalStateException("Cannot publish TV channel");
            id = ContentUris.parseId(created);
            try { logo(id); TvContract.requestChannelBrowsable(context, id); }
            catch (RuntimeException | java.io.IOException ignored) { /* Channel remains available to launcher content readers. */ }
        } else if (resolver.update(ContentUris.withAppendedId(CHANNELS, id), values, null, null) != 1)
            throw new IllegalStateException("TV channel disappeared during refresh");
        for (long duplicate : duplicates) resolver.delete(ContentUris.withAppendedId(CHANNELS, duplicate), null, null);
        return id;
    }

    private void logo(long id) throws java.io.IOException {
        Drawable drawable = context.getApplicationInfo().loadIcon(context.getPackageManager());
        Bitmap bitmap = Bitmap.createBitmap(128, 128, Bitmap.Config.ARGB_8888);
        try (OutputStream out = resolver.openOutputStream(Uri.withAppendedPath(ContentUris.withAppendedId(CHANNELS, id), "logo"))) {
            drawable.setBounds(0, 0, 128, 128); drawable.draw(new Canvas(bitmap));
            if (out != null) bitmap.compress(Bitmap.CompressFormat.PNG, 100, out);
        } finally { bitmap.recycle(); }
    }
}
