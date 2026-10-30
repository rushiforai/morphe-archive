package app.hushmessenger.extension;

import android.content.ClipData;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;

/**
 * Opens the phone's own gallery app for the chat's gallery button. Messenger's launcher only starts its own screens, so
 * the chat starts the pick screen, which opens the gallery app and hands what the person picks back under the request
 * code Messenger reads a photo from another app under. The chat's own code then copies one item and opens it in
 * Messenger's editor for that chat. Several items go to Messenger's Send to sheet with that chat on top instead (#64, #82),
 * since the chat's result handler only ever reads one.
 */
final class GalleryPicker {
    static final String KEY = "external_gallery";
    /** On a pick of more than one item, so the chat's result handler sends them all instead of opening the first. */
    static final String ITEMS_MARK = "app.hushmessenger.gallery_items";
    /** Set on that result once its items went to the Send to sheet. */
    static final String ITEMS_SENT = "app.hushmessenger.gallery_items_sent";
    static final String RESULT_PREPARED = "app.hushmessenger.gallery_prepared";
    /** Messenger's own share entry. It takes several items and opens the Send to sheet with any chats it's handed on top. */
    static final String SHARE_HANDLER = "com.facebook.messenger.intents.ShareIntentHandler";
    /** The share sheet reads the chats to put on top from this key as a list of threads or as user ids. */
    static final String SHARE_TARGETS = "android.intent.extra.shortcut.ID";
    /** Google Photos' provider. A pick of something already on the phone carries its MediaStore URI in its path. */
    static final String PHOTOS_PROVIDER = "com.google.android.apps.photos.contentprovider";
    private static final String[] MEDIA = {"image/*", "video/*"};
    enum Outcome { NOT_USED, PICKER_MISSING, COMPONENT_MISSING, LAUNCH_FAILED, RESULT_INVALID, RESULT_REVOKED,
        RESULT_TIMEOUT, RESULT_BUSY, CANCELED, SELECTED }
    static volatile Outcome lastOutcome = Outcome.NOT_USED;

    private GalleryPicker() {}

    /**
     * A pick for photos and videos when some app on the phone answers it, otherwise null. Every app it asks about by name
     * came back from queryIntentActivities, so Android 11+ already lets Messenger see it.
     */
    @android.annotation.SuppressLint("QueryPermissionsNeeded")
    static Intent pickIntent(Context context) {
        if (context == null) return null;
        PackageManager packages = context.getPackageManager();
        Intent photos = new Intent(Intent.ACTION_PICK).setType("image/*").putExtra(Intent.EXTRA_MIME_TYPES, MEDIA)
            .putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true);
        ResolveInfo opens = packages.resolveActivity(photos, PackageManager.MATCH_DEFAULT_ONLY);
        if (opens == null || opens.activityInfo == null) return null;
        // Samsung's Gallery shows only photos for a photo pick and skips the type list, but shows both for any type. Any
        // type also reaches contact pickers, so it goes only to the one gallery app Android opens without asking.
        String app = opens.activityInfo.packageName;
        java.util.Set<String> galleries = new java.util.LinkedHashSet<>();
        for (ResolveInfo candidate : packages.queryIntentActivities(photos, PackageManager.MATCH_DEFAULT_ONLY)) {
            if (candidate.activityInfo != null) galleries.add(candidate.activityInfo.packageName);
        }
        if (galleries.contains(app)) {
            Intent media = anyType().setPackage(app);
            return media.resolveActivity(packages) != null ? media : photos;
        }
        // Android asks which gallery to use. An any-type pick behind a photo-pick selector still let contact pickers and
        // other apps onto Samsung's list (#94), so each gallery gets its own any-type pick by name and the chooser lists
        // only those. A default gallery set in Android's settings skips the question through the branch above.
        if (galleries.isEmpty()) return photos;
        java.util.List<Intent> named = new java.util.ArrayList<>();
        for (String gallery : galleries) {
            Intent media = anyType().setPackage(gallery);
            ComponentName screen = media.resolveActivity(packages);
            if (screen == null) return photos;
            named.add(media.setComponent(screen));
        }
        if (named.size() == 1) return named.get(0);
        Intent chooser = Intent.createChooser(named.remove(0), null);
        return chooser.putExtra(Intent.EXTRA_INITIAL_INTENTS, named.toArray(new android.os.Parcelable[0]));
    }

    /** Samsung's Gallery honors several items on a pick, not only on a get-content. */
    private static Intent anyType() {
        return new Intent(Intent.ACTION_PICK).setType("*/*").putExtra(Intent.EXTRA_MIME_TYPES, MEDIA)
            .putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true);
    }

    /** The pick screen when Android knows it under this package's own name and a gallery app answers a pick, otherwise null. */
    static Intent screenIntent(Context context) {
        if (pickIntent(context) == null) {
            lastOutcome = Outcome.PICKER_MISSING;
            return null;
        }
        String own = context.getPackageName();
        Intent intent = new Intent().setClassName(own, GalleryActivity.class.getName());
        ResolveInfo screen = context.getPackageManager().resolveActivity(intent, 0);
        // A Root Mount install keeps the stock manifest, so the screen isn't there and Messenger's gallery stays.
        if (screen == null || screen.activityInfo == null || !own.equals(screen.activityInfo.packageName)) {
            lastOutcome = Outcome.COMPONENT_MISSING;
            return null;
        }
        return intent;
    }

    static boolean isPick(Context context, Intent intent) {
        ComponentName target = intent == null ? null : intent.getComponent();
        return context != null && target != null && context.getPackageName().equals(target.getPackageName()) &&
            GalleryActivity.class.getName().equals(target.getClassName());
    }

    /**
     * What the pick screen hands the chat for the gallery app's answer, or null for no pick. The read grant goes along, so
     * the chat can still open the items once the pick screen is gone. Gallery apps often send no type, and the chat sends
     * an item without one as a plain file, so the type comes from the item then. A pick of several comes back in the
     * ClipData, with or without the first in the data. The first stays the data, so the chat still opens that one when the
     * switch is turned off before it comes back, and the rest ride along marked. Runs on a worker, since it can open items.
     */
    static Intent handBack(Context context, Intent picked) {
        if (picked == null) return null;
        java.util.List<Uri> items = new java.util.ArrayList<>();
        if (picked.getData() != null) items.add(onPhone(context, picked.getData()));
        ClipData clip = picked.getClipData();
        for (int i = 0; clip != null && i < clip.getItemCount(); i++) {
            Uri item = clip.getItemAt(i).getUri();
            if (item != null) item = onPhone(context, item);
            if (item != null && !items.contains(item)) items.add(item);
        }
        if (items.isEmpty()) return null;
        for (Uri item : items) if (!"content".equals(item.getScheme()) && !"file".equals(item.getScheme())) return null;
        Uri first = items.get(0);
        String type = first.equals(picked.getData()) ? picked.getType() : null;
        if (type == null || "*/*".equals(type) || "application/octet-stream".equals(type)) type = typeOf(context, first);
        if (type != null && !mediaType(type)) return null;
        Intent result = type == null ? new Intent().setData(first) : new Intent().setDataAndType(first, type);
        if (items.size() > 1) {
            java.util.Set<String> types = new java.util.LinkedHashSet<>();
            types.add(type == null ? "*/*" : type);
            for (Uri item : items.subList(1, items.size())) {
                String itemType = typeOf(context, item);
                if (itemType != null && !mediaType(itemType)) return null;
                types.add(itemType == null ? "*/*" : itemType);
            }
            ClipData all = new ClipData("picked", types.toArray(new String[0]), new ClipData.Item(first));
            for (Uri item : items.subList(1, items.size())) all.addItem(new ClipData.Item(item));
            result.setClipData(all);
            result.putExtra(ITEMS_MARK, true);
        }
        return result.putExtra(RESULT_PREPARED, true).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
    }

    /**
     * The phone's own MediaStore item a Google Photos pick wraps, when Messenger can open it, otherwise the item as picked.
     * Messenger reads that item with its own media access, as its own gallery does, so sending it no longer leans on the
     * grant Photos gave (#103). A cloud-only pick has no MediaStore URI in it and stays as picked, and so does one the phone
     * doesn't list as a photo or video. Its type then comes from the phone, not from what Photos said.
     */
    static Uri onPhone(Context context, Uri item) {
        if (!"content".equals(item.getScheme()) || !PHOTOS_PROVIDER.equals(item.getAuthority())) return item;
        for (String segment : item.getPathSegments()) {
            if (!segment.startsWith("content://media/")) continue;
            Uri media = Uri.parse(segment);
            try (android.content.res.AssetFileDescriptor file = context.getContentResolver().openAssetFileDescriptor(media, "r")) {
                String type = file == null ? null : typeOf(context, media);
                return type != null && mediaType(type) ? media : item;
            } catch (java.io.IOException | RuntimeException unreadable) {
                return item;
            }
        }
        return item;
    }

    private static String typeOf(Context context, Uri item) {
        return "content".equals(item.getScheme()) ? context.getContentResolver().getType(item) : null;
    }

    private static boolean mediaType(String type) {
        String lower = type.toLowerCase(java.util.Locale.ROOT);
        return lower.startsWith("image/") || lower.startsWith("video/");
    }

    /** Check the actual grant on a worker before the picker screen returns it to Messenger. */
    static void requireReadable(Context context, Intent picked) throws java.io.IOException {
        java.util.List<Uri> items = new java.util.ArrayList<>();
        items.add(picked.getData());
        ClipData clip = picked.getClipData();
        for (int i = 0; clip != null && i < clip.getItemCount(); i++) {
            Uri item = clip.getItemAt(i).getUri();
            if (!items.contains(item)) items.add(item);
        }
        for (Uri item : items) {
            try (android.content.res.AssetFileDescriptor file = context.getContentResolver().openAssetFileDescriptor(item, "r")) {
                if (file == null) throw new java.io.IOException("gallery selection unavailable");
            }
        }
    }

    /**
     * Messenger's share entry for every item in [clip], with [thread] on top of the Send to sheet when it's one Android can
     * carry. The person still taps Send, and can add other chats. The type is the one all the items share, or any type.
     */
    static Intent sendIntent(Context context, Object thread, ClipData clip) {
        java.util.ArrayList<Uri> items = new java.util.ArrayList<>();
        for (int i = 0; i < clip.getItemCount(); i++) items.add(clip.getItemAt(i).getUri());
        String type = null;
        for (int i = 0; i < clip.getDescription().getMimeTypeCount(); i++) {
            String kind = clip.getDescription().getMimeType(i);
            int slash = kind.indexOf('/');
            kind = slash > 0 ? kind.substring(0, slash) + "/*" : "*/*";
            type = type == null || type.equals(kind) ? kind : "*/*";
        }
        Intent send = new Intent(Intent.ACTION_SEND_MULTIPLE).setClassName(context.getPackageName(), SHARE_HANDLER)
            .setType(type == null ? "*/*" : type)
            .putParcelableArrayListExtra(Intent.EXTRA_STREAM, items)
            .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_ACTIVITY_NEW_TASK);
        send.setClipData(clip);
        if (thread instanceof android.os.Parcelable) {
            java.util.ArrayList<android.os.Parcelable> targets = new java.util.ArrayList<>();
            targets.add((android.os.Parcelable) thread);
            send.putParcelableArrayListExtra(SHARE_TARGETS, targets);
        }
        return send;
    }
}
