/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import android.content.Context;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * The Save photo item that Download any photo's second switch adds to the menu of a post holding
 * photos, through the same hook Download any video's item uses.
 *
 * <p>Facebook fills every post's menu through one call, and the patch calls {@link #add} right
 * after it. The item goes below Facebook's own rows and none of them changes. A post with one
 * photo gets Save photo, which saves it; a post whose attachment lists several (an album, as
 * Facebook draws a collage) gets Save all photos, which saves each of them one after another. A
 * shared post's photos are the shared post's. The photos are read while the menu opens, when
 * Facebook's models are still live, and each saves at the biggest size the post carries.
 *
 * <p>With either switch off, paused, or before the settings are ready, the menu is Facebook's own.
 * Nothing here names a class or member Facebook renames: the post and its attachments are kept
 * GraphQL models whose getters the patch finds by the field each one reads, and a photo's images
 * are read through the tree accessors Facebook keeps.
 */
public final class PhotoMenuItem {

    private PhotoMenuItem() {}

    /** The source every event of the item carries in the diagnostic report. */
    static final String SOURCE = "PhotoMenuItem";

    private static final String GRAPHQL_STORY = "com.facebook.graphql.model.GraphQLStory";
    private static final String GRAPHQL_STORY_ATTACHMENT = "com.facebook.graphql.model.GraphQLStoryAttachment";

    /** What GraphQL calls a photo. A video's media is a Video and gets Download any video's item. */
    static final String PHOTO_TYPE = "Photo";

    /** How many shared posts deep the photos are looked for, as the video item does. */
    private static final int MAX_SHARE_DEPTH = 4;

    /** The most photos one tap saves, so a huge album can't keep a save running for long. */
    static final int MAX_PHOTOS = 50;

    /** One photo of the post: its biggest image and what the file name can say of it. */
    static final class Photo {
        final String url;
        final PostDetails details;

        Photo(String url, PostDetails details) {
            this.url = url;
            this.details = details;
        }
    }

    /**
     * Adds the item to [menu] when the post Facebook filled it for holds photos.
     *
     * <p>[item] is what the menu was built for: the post, or one of its attachments.
     * [attachmentsGetter], [mediaGetter], [attachedStoryGetter] and [subattachmentsGetter] are the
     * real names of the post's attachment list, an attachment's media, the post a share wraps and
     * an attachment's own list of attachments. [icon] is the drawable Facebook's own Download row
     * uses in this build. Never throws: this runs inside Facebook's menu code.
     */
    public static void add(Menu menu, View anchor, Object item, int icon, String attachmentsGetter,
                           String mediaGetter, String attachedStoryGetter, String subattachmentsGetter) {
        try {
            if (!enabled() || menu == null) return;
            HookStatus.invoked(FamilyNames.PHOTO_DOWNLOAD);

            List<Photo> photos = photosOf(item, attachmentsGetter, mediaGetter, attachedStoryGetter, subattachmentsGetter);
            if (photos.isEmpty()) return;

            MenuItem entry = menu.add(photos.size() == 1 ? L10n.t("Save photo") : L10n.t("Save all photos"));
            if (entry == null) return;
            if (icon != 0) entry.setIcon(icon);
            Context context = anchor == null ? null : anchor.getContext();
            entry.setOnMenuItemClickListener(tapped -> {
                tap(context, photos);
                return true;
            });
            HookStatus.bound(FamilyNames.PHOTO_DOWNLOAD, "post menu photo item");
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.PHOTO_DOWNLOAD, "post menu photo item", t);
            Logger.diagnosticError(DiagnosticCategory.DOWNLOADS, SOURCE,
                () -> "could not add Save photo to a post's menu", t);
        }
    }

    /** Both switches on, Hushfacebook running and its settings ready. */
    static boolean enabled() {
        return Utils.settingsReady() && Settings.DOWNLOAD_PHOTOS.get() && Settings.POST_MENU_PHOTO_SAVE.get();
    }

    /**
     * A tap on the item: the saves, or a message saying they didn't start. The report says why in
     * either case, never with an address or a file name. Answers the thread running the saves, or
     * null when none started.
     */
    static Thread tap(Context context, List<Photo> photos) {
        try {
            // A menu can stay open while a switch goes off. The tap then does nothing, quietly.
            if (!enabled()) {
                Logger.diagnosticInfo(DiagnosticCategory.DOWNLOADS, SOURCE,
                    () -> "Save photo tapped after its switch went off");
                return null;
            }
            Context application = context == null ? Utils.getContext() : context.getApplicationContext();
            Logger.diagnosticInfo(DiagnosticCategory.DOWNLOADS, SOURCE,
                () -> "Save photo tapped on a post's menu, " + photos.size() + " photo(s)");
            List<String> urls = new ArrayList<>();
            List<PostDetails> details = new ArrayList<>();
            for (Photo photo : photos) {
                urls.add(photo.url);
                details.add(photo.details);
            }
            Thread saves = MediaDownload.savePhotos(application, urls, details);
            if (saves == null) {
                Feedback.show(application, L10n.t(application, "Couldn't save this post's photos. Try again in a moment."), true);
            }
            return saves;
        } catch (Throwable t) {
            // It runs inside Facebook's click dispatch, on the thread that draws the app.
            HookStatus.threw(FamilyNames.PHOTO_DOWNLOAD, "post menu photo tap", t);
            Logger.diagnosticError(DiagnosticCategory.DOWNLOADS, SOURCE, () -> "the Save photo tap failed", t);
            return null;
        }
    }

    /**
     * The photos of [item], in the order the post shows them, at most {@link #MAX_PHOTOS}: for each
     * attachment of the post, its own attachments' photos when it lists some, or else its own
     * media when that's a photo. A post sharing another post is followed to the shared one first,
     * as Facebook's own menu finds a post's media. An attachment's menu reads that attachment only.
     * Media that isn't a photo, and a photo with no image address, are left out.
     */
    static List<Photo> photosOf(Object item, String attachmentsGetter, String mediaGetter,
                                String attachedStoryGetter, String subattachmentsGetter) {
        if (item == null) return Collections.emptyList();
        List<Object> attachments = new ArrayList<>();
        Object story = null;
        if (isA(item, GRAPHQL_STORY_ATTACHMENT)) {
            attachments.add(item);
        } else {
            story = postOf(item, attachedStoryGetter);
            if (story == null) return Collections.emptyList();
            Object list = call(story, attachmentsGetter);
            if (list instanceof List) attachments.addAll((List<?>) list);
        }

        List<Photo> photos = new ArrayList<>();
        for (Object attachment : attachments) {
            if (attachment == null) continue;
            Object subattachments = call(attachment, subattachmentsGetter);
            if (subattachments instanceof List && !((List<?>) subattachments).isEmpty()) {
                for (Object sub : (List<?>) subattachments) {
                    if (sub != null) addPhoto(photos, call(sub, mediaGetter), story);
                }
            } else {
                addPhoto(photos, call(attachment, mediaGetter), story);
            }
            if (photos.size() >= MAX_PHOTOS) break;
        }
        return photos;
    }

    private static void addPhoto(List<Photo> photos, Object media, Object story) {
        if (media == null || photos.size() >= MAX_PHOTOS || !PHOTO_TYPE.equals(typeName(media))) return;
        String url = PhotoSave.largest(media);
        if (url == null) return;
        photos.add(new Photo(url, PostDetails.read(PostDetails.string(media, PostDetails.ID), media, story)));
    }

    /** The post [item] is, followed through the posts it shares, or null when it's no post. */
    private static Object postOf(Object item, String attachedStoryGetter) {
        if (!isA(item, GRAPHQL_STORY)) return null;
        Object story = item;
        for (int depth = 0; depth < MAX_SHARE_DEPTH; depth++) {
            Object shared = call(story, attachedStoryGetter);
            if (shared == null) break;
            story = shared;
        }
        return story;
    }

    // ---------------------------------------------------------------- reflection

    private static boolean isA(Object value, String className) {
        if (value == null) return false;
        for (Class<?> type = value.getClass(); type != null; type = type.getSuperclass()) {
            if (type.getName().equals(className)) return true;
        }
        return false;
    }

    /**
     * The answer of the public getter [name] of [host]. A getter that isn't there is a build that
     * moved it, which Hook status reports; any other failure is only a post without that part.
     */
    private static Object call(Object host, String name) {
        if (host == null || name == null) return null;
        Method method;
        try {
            method = host.getClass().getMethod(name);
        } catch (NoSuchMethodException moved) {
            HookStatus.missingMember(FamilyNames.PHOTO_DOWNLOAD, "method", host.getClass().getName(), name);
            return null;
        }
        try {
            return method.invoke(host);
        } catch (Throwable t) {
            return null;
        }
    }

    /** The model's GraphQL type name, asked only of a model whose native tree is still there. */
    private static String typeName(Object model) {
        try {
            Object valid = model.getClass().getMethod("isValidGraphServicesJNIModel").invoke(model);
            if (!Boolean.TRUE.equals(valid)) return null;
            Object name = model.getClass().getMethod("getTypeName").invoke(model);
            return name instanceof String ? (String) name : null;
        } catch (Throwable t) {
            return null;
        }
    }
}
