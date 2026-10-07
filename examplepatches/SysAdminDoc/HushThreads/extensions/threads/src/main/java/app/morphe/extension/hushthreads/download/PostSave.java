/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.download;

import android.content.Context;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * The Save row in a Threads post's menu: every photo and video of the post, saved to the phone.
 *
 * <p>The patch asks {@link #canSave} while the menu draws, shows {@link #label} on the row, and
 * calls {@link #save} from the row's click. A post is read through {@link InstagramMedia}, whose
 * bodies the patch writes, and only plain values reach the save: addresses, sizes, the DASH
 * manifest and what names the file. A post with one photo or video saves it as a single file. A
 * post with more saves all of them as one batch on one worker, in page order, with one Cancel
 * ({@link MediaSave#saveBatch}), and each file's name ends with the post's number and the page's
 * place, so two posts saved at once never mix their files or their names.
 *
 * <p>Every entry point fails closed: until the settings are ready, while HushThreads is paused,
 * with the switch off, or when something throws, the menu has no row and a tap saves nothing.
 */
public final class PostSave {
    private PostSave() {
    }

    /** The source a post save's lines carry in the diagnostic report. */
    private static final String SOURCE = "PostSave";

    /**
     * How a post is read. On a phone it's {@link #BRIDGES}, the bodies the patch writes; a test
     * hands in posts of its own. Each method answers what the bridge of the same name does.
     */
    interface Reader {
        List<?> carouselMedia(Object media);

        List<?> videoVersions(Object media);

        String dashManifest(Object media);

        String versionUrl(Object version);

        Integer versionWidth(Object version);

        Integer versionHeight(Object version);

        Object imageVersions(Object media);

        List<?> imageCandidates(Object imageVersions);

        String candidateUrl(Object candidate);

        int candidateWidth(Object candidate);

        int candidateHeight(Object candidate);

        String mediaId(Object media);

        Object owner(Object media);

        Long takenAt(Object media);

        String username(Object user);
    }

    /** The patch's bridges, as built: null and 0 until the patch writes their bodies. */
    static final Reader BRIDGES = new Reader() {
        @Override public List<?> carouselMedia(Object media) { return InstagramMedia.carouselMedia(media); }
        @Override public List<?> videoVersions(Object media) { return InstagramMedia.videoVersions(media); }
        @Override public String dashManifest(Object media) { return InstagramMedia.dashManifest(media); }
        @Override public String versionUrl(Object version) { return InstagramMedia.versionUrl(version); }
        @Override public Integer versionWidth(Object version) { return InstagramMedia.versionWidth(version); }
        @Override public Integer versionHeight(Object version) { return InstagramMedia.versionHeight(version); }
        @Override public Object imageVersions(Object media) { return InstagramMedia.imageVersions(media); }
        @Override public List<?> imageCandidates(Object versions) { return InstagramMedia.imageCandidates(versions); }
        @Override public String candidateUrl(Object candidate) { return InstagramMedia.candidateUrl(candidate); }
        @Override public int candidateWidth(Object candidate) { return InstagramMedia.candidateWidth(candidate); }
        @Override public int candidateHeight(Object candidate) { return InstagramMedia.candidateHeight(candidate); }
        @Override public String mediaId(Object media) { return InstagramMedia.mediaId(media); }
        @Override public Object owner(Object media) { return InstagramMedia.owner(media); }
        @Override public Long takenAt(Object media) { return InstagramMedia.takenAt(media); }
        @Override public String username(Object user) { return InstagramMedia.username(user); }
    };

    /** The reader every entry point uses. A test sets its own and puts this back. */
    static volatile Reader reader = BRIDGES;

    /** What a page of a post saves: its video, its picture, or nothing the bridges can read. */
    enum Kind { VIDEO, PHOTO, NONE }

    /**
     * Whether the post menu shows the row: {@link Settings#SAVE_MEDIA} is on and the post, or a
     * page of it, has a photo or video the bridges can read. Called while Compose draws, on the main
     * thread: cheap, never throws, false on anything odd.
     */
    public static boolean canSave(Object media) {
        try {
            HookStatus.invoked(FamilyNames.SAVE_MEDIA);
            if (media == null || !on()) return false;
            Reader read = reader;
            for (Object page : pages(read, media)) {
                if (kind(read, page) != Kind.NONE) return true;
            }
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SAVE_MEDIA, "post menu", failure);
            return false;
        }
    }

    /**
     * The row's label, in the phone's language: Save all for a post with more than one photo or
     * video, else Save video or Save photo. Never throws.
     */
    public static String label(Object media) {
        try {
            Reader read = reader;
            List<?> pages = media == null ? Collections.emptyList() : pages(read, media);
            if (pages.size() > 1) return L10n.t("Save all");
            return !pages.isEmpty() && kind(read, pages.get(0)) == Kind.VIDEO
                    ? L10n.t("Save video") : L10n.t("Save photo");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SAVE_MEDIA, "post menu label", failure);
            return L10n.t("Save photo");
        }
    }

    /**
     * Starts saving every photo and video of the post [media] in page order, from the row's click
     * on the main thread. [context] may be the Activity: only its application is kept. Reads the
     * post here, into plain values, and returns at once; the files are fetched on the save's own
     * worker. Never throws, and says how it went with toasts.
     */
    public static void save(Context context, Object media) {
        Context shown = context != null ? context : Utils.getContext();
        try {
            if (media == null || !on()) return;
            Reader read = reader;
            List<?> pages = new ArrayList<>(pages(read, media));
            if (pages.size() > MediaSave.MAX_BATCH_PAGES) {
                Feedback.show(shown, L10n.f(shown, "Not saved: a carousel can have at most %1$d pages",
                        MediaSave.MAX_BATCH_PAGES), true);
                return;
            }
            boolean started;
            if (pages.size() == 1) {
                started = saveOne(read, shown, pages.get(0), media);
            } else {
                List<MediaSave.Item> items = new ArrayList<>(pages.size());
                for (Object page : pages) items.add(item(read, page, media));
                final int count = items.size();
                Logger.diagnosticInfo(DiagnosticCategory.DOWNLOADS, SOURCE, () -> "post save tapped: " + count + " pages");
                started = MediaSave.saveBatch(shown, items, read.mediaId(media), null);
            }
            if (!started) failed(shown);
        } catch (Throwable failure) {
            // A throw from here reaches Threads' click handler, which ends the app.
            HookStatus.threw(FamilyNames.SAVE_MEDIA, "post save", failure);
            failed(shown);
        }
    }

    /** A post of one photo or video: a save of its own, which names the folder it went to. */
    private static boolean saveOne(Reader read, Context context, Object page, Object post) {
        PostDetails details = details(read, page, post);
        switch (kind(read, page)) {
            case VIDEO: {
                List<MediaSave.Rendition> renditions = renditions(read, page);
                String manifest = read.dashManifest(page);
                final int files = renditions.size();
                final boolean dash = manifest != null;
                Logger.diagnosticInfo(DiagnosticCategory.DOWNLOADS, SOURCE, () -> "post video save tapped: " + files
                        + " file(s)" + (dash ? " and a manifest" : ", no manifest"));
                return MediaSave.saveVideo(context, renditions, manifest, details);
            }
            case PHOTO: {
                List<MediaSave.Rendition> pictures = pictures(read, page);
                final int sizes = pictures.size();
                Logger.diagnosticInfo(DiagnosticCategory.DOWNLOADS, SOURCE, () -> "post photo save tapped: " + sizes + " size(s)");
                return MediaSave.savePhoto(context, pictures, details);
            }
            default:
                MediaSave.failure(() -> "nothing to save: the post has no photo or video the bridges can read", null);
                return false;
        }
    }

    /**
     * A page of a batch as plain values. A page that reads as nothing, or that can't be read, still
     * takes its place and fails once on the worker, so the count at the end says so, rather than
     * the page going missing without a word. A null page is skipped.
     */
    private static MediaSave.Item item(Reader read, Object page, Object post) {
        if (page == null) return null;
        try {
            switch (kind(read, page)) {
                case VIDEO:
                    return new MediaSave.Item(true, renditions(read, page), read.dashManifest(page),
                            details(read, page, post));
                case PHOTO:
                    return new MediaSave.Item(false, pictures(read, page), null, details(read, page, post));
                default:
                    return new MediaSave.Item(false, null, null, null);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SAVE_MEDIA, "post page", failure);
            return new MediaSave.Item(false, null, null, null);
        }
    }

    private static void failed(Context context) {
        if (context == null) return;
        Context application = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        Feedback.show(application, L10n.t(application, "Download failed"), true);
    }

    /** The pages of [media] in order: a carousel's pages, or the post itself. */
    static List<?> pages(Reader read, Object media) {
        List<?> carousel = read.carouselMedia(media);
        return carousel == null || carousel.isEmpty() ? Collections.singletonList(media) : carousel;
    }

    /**
     * What [page] saves. A page with single video files or a DASH manifest is a video, whatever
     * else it lists: every video has a picture too, its cover, and that isn't what's asked for.
     */
    static Kind kind(Reader read, Object page) {
        if (page == null) return Kind.NONE;
        if (!renditions(read, page).isEmpty() || read.dashManifest(page) != null) return Kind.VIDEO;
        return pictures(read, page).isEmpty() ? Kind.NONE : Kind.PHOTO;
    }

    /** A page's {@code video_versions}, as renditions with the sizes it states. */
    static List<MediaSave.Rendition> renditions(Reader read, Object media) {
        List<?> versions = read.videoVersions(media);
        if (versions == null) return Collections.emptyList();
        List<MediaSave.Rendition> renditions = new ArrayList<>(versions.size());
        for (Object version : versions) {
            if (version == null) continue;
            String url = read.versionUrl(version);
            if (url == null || url.isEmpty()) continue;
            renditions.add(new MediaSave.Rendition(url, orZero(read.versionWidth(version)),
                    orZero(read.versionHeight(version)), 0));
        }
        return renditions;
    }

    /** A page's {@code image_versions2} candidates, as renditions with the sizes it states. */
    static List<MediaSave.Rendition> pictures(Reader read, Object media) {
        Object versions = read.imageVersions(media);
        List<?> candidates = versions == null ? null : read.imageCandidates(versions);
        if (candidates == null) return Collections.emptyList();
        List<MediaSave.Rendition> pictures = new ArrayList<>(candidates.size());
        for (Object candidate : candidates) {
            if (candidate == null) continue;
            String url = read.candidateUrl(candidate);
            if (url == null || url.isEmpty()) continue;
            pictures.add(new MediaSave.Rendition(url, read.candidateWidth(candidate), read.candidateHeight(candidate), 0));
        }
        return pictures;
    }

    /**
     * The file name's details for [page], a page of [post] or the post itself. A page keeps its own
     * id, and takes the poster and the day from the post when it doesn't list them.
     */
    static PostDetails details(Reader read, Object page, Object post) {
        Object user = read.owner(page);
        if (user == null && page != post) user = read.owner(post);
        Long takenAt = read.takenAt(page);
        if ((takenAt == null || takenAt <= 0) && page != post) takenAt = read.takenAt(post);
        String id = read.mediaId(page);
        if (id == null && page != post) id = read.mediaId(post);
        return PostDetails.of(id, user == null ? null : read.username(user),
                takenAt == null || takenAt <= 0 ? null : new Date(takenAt * 1000L));
    }

    private static int orZero(Integer value) {
        return value == null ? 0 : value;
    }

    /** Whether the switch is on: false before the settings are ready and while HushThreads is paused. */
    private static boolean on() {
        try {
            return Utils.settingsReady() && Settings.SAVE_MEDIA.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SAVE_MEDIA, "post menu switch", failure);
            return false;
        }
    }
}
