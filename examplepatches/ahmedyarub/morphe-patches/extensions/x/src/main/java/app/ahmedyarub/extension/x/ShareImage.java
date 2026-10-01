package app.ahmedyarub.extension.x;

import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.net.Uri;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Shares a post as an image.
 *
 * The share sheet already renders a post as an image card for Instagram Stories and Snapchat. A
 * "Share as image" entry that asks for that card is added to the sheet's apps, and the rendered
 * card is sent to the system share sheet instead of Instagram.
 */
@SuppressWarnings("unused")
public final class ShareImage {

    /** The package the added entry claims to share to, which no app has. */
    private static final String ENTRY_PACKAGE = "morphe.x.shareimage";

    /** The share sheet's app entry class. Rewritten by the patch. */
    private static String entryClass() { return ""; }

    /** The share method enum the entry uses. Rewritten by the patch. */
    private static String shareMethodClass() { return ""; }

    /** The share sheet's apps, with Share as image first when a post is shared. */
    public static List<?> apps(Object subject, List<?> apps) {
        try {
            if (!"Post".equals(String.valueOf(subject)) || apps == null) return apps;
            for (Object app : apps) {
                if (String.valueOf(app).contains(ENTRY_PACKAGE)) return apps;
            }

            List<Object> result = new ArrayList<>(apps.size() + 1);
            result.add(newEntry());
            result.addAll(apps);
            return result;
        } catch (Exception ex) {
            Logger.printException(() -> "ShareImage apps failure", ex);
            return apps;
        }
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    private static Object newEntry() throws Exception {
        Class<?> shareMethod = Class.forName(shareMethodClass());
        Class<?> entry = Class.forName(entryClass());
        Constructor<?> constructor = entry.getDeclaredConstructor(String.class, String.class, String.class, Drawable.class, shareMethod);
        constructor.setAccessible(true);

        Context context = Utils.getContext();
        Drawable icon = context.getDrawable(android.R.drawable.ic_menu_gallery);
        // The card is rendered for entries that share to Instagram Stories.
        return constructor.newInstance(ENTRY_PACKAGE, "", "Share as image", icon, Enum.valueOf((Class) shareMethod, "InstagramStories"));
    }

    /**
     * Called with the rendered card. If it was rendered for Share as image, shares it and returns
     * true; the app's own handling is then skipped.
     */
    public static boolean share(Context context, Object entry, Object snapshot) {
        try {
            if (entry == null || !String.valueOf(entry).contains(ENTRY_PACKAGE)) return false;
            Uri image = uriOf(snapshot);
            if (image == null) return true;

            Intent send = new Intent(Intent.ACTION_SEND)
                    .setType("image/png")
                    .putExtra(Intent.EXTRA_STREAM, image)
                    .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            send.setClipData(ClipData.newRawUri(null, image));

            Intent chooser = Intent.createChooser(send, "Share as image")
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_GRANT_READ_URI_PERMISSION);
            context.startActivity(chooser);
        } catch (Exception ex) {
            Logger.printException(() -> "ShareImage share failure", ex);
        }
        return true;
    }

    private static Uri uriOf(Object snapshot) throws IllegalAccessException {
        if (snapshot == null) return null;
        for (Field field : snapshot.getClass().getDeclaredFields()) {
            if (field.getType() == Uri.class) {
                field.setAccessible(true);
                return (Uri) field.get(snapshot);
            }
        }
        return null;
    }
}
