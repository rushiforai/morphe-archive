package app.xposed.extension;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * A post as X-Posed's post card shows it: the author, the text as X shows it, up to four
 * photos, the time and counts, and what X reports about the account. Read from X's models
 * when the share button is tapped.
 */
final class PostCard {
    static final int MAX_PHOTOS = 4;
    /** X's limit for a post's text without Premium, as X-Posed uses for the caption. */
    static final int CAPTION_LIMIT = 280;
    private static final int ALT_TEXT_LIMIT = 1000;
    private static final String[] MONTHS = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
    private static final Pattern MEDIA_PATH = Pattern.compile("/media/([A-Za-z0-9_-]+)(?:\\.[A-Za-z0-9]+)?");

    /** How the post with the card goes to X's composer. */
    enum Mode {
        QUOTE("Quote", "Your post quotes this post."),
        REPLY("Reply", "Your post replies to this post."),
        POST("New post", "A new post that mentions this account at the end.");

        final String label, description;

        Mode(String label, String description) {
            this.label = label;
            this.description = description;
        }
    }

    static final class Photo {
        final String url;
        final int width, height;

        Photo(String url, int width, int height) {
            this.url = url;
            this.width = width;
            this.height = height;
        }
    }

    final long postId;
    final String handle, name, avatarUrl;
    final boolean squareAvatar;
    final int verification;
    final String text;
    final long postedAt;
    final List<Photo> photos;
    /** Explains media the card leaves out, or null. */
    final String mediaNote;
    final long replies, reposts, likes, views;
    final String location, source;
    final boolean locationWarning;
    final long capturedAt;

    private PostCard(long postId, String handle, String name, String avatarUrl, boolean squareAvatar, int verification,
                     String text, long postedAt, List<Photo> photos, String mediaNote, Map<String, Long> counts,
                     AccountInfo info, long capturedAt) {
        this.postId = postId;
        this.handle = handle;
        this.name = name;
        this.avatarUrl = avatarUrl;
        this.squareAvatar = squareAvatar;
        this.verification = verification;
        this.text = text;
        this.postedAt = postedAt;
        this.photos = photos;
        this.mediaNote = mediaNote;
        replies = count(counts, "Reply");
        reposts = count(counts, "Retweet", "UndoRetweet");
        likes = count(counts, "Favorite", "Unfavorite");
        views = count(counts, "ViewCount");
        location = info != null ? info.location : null;
        source = info != null ? info.source : null;
        locationWarning = info != null && info.hasLocationWarning();
        this.capturedAt = capturedAt;
    }

    /** The card for a CanonicalPost by [handle], whose account X reported as [info] (or null). */
    static PostCard of(Object post, String handle, AccountInfo info, long now) {
        Object author = ModelBridge.canonicalAuthor(post);
        String name = author != null ? ModelBridge.displayName(author) : null;
        String avatar = author != null ? AccountCard.avatarUrl(ModelBridge.avatarUrl(author)) : null;
        boolean square = author != null && ModelBridge.squareAvatar(author);
        int verification = author != null ? ModelBridge.verification(author) : ModelBridge.NOT_VERIFIED;

        List<String[]> links = new ArrayList<>();
        List<?> entities = ModelBridge.postLinks(post);
        if (entities != null) {
            for (Object entity : entities) links.add(new String[]{ModelBridge.linkUrl(entity), ModelBridge.expandedUrl(entity)});
        }
        String text = displayText(ModelBridge.postText(post), ModelBridge.textStart(post), ModelBridge.textEnd(post), links);

        List<Photo> photos = new ArrayList<>();
        int photoCount = 0, sensitive = 0, other = 0;
        List<?> media = ModelBridge.postMedia(post);
        if (media != null) {
            for (Object item : media) {
                String raw = ModelBridge.photoUrl(item);
                if (raw == null) {
                    other++;
                } else if (ModelBridge.photoSensitive(item)) {
                    sensitive++;
                } else {
                    String url = photoUrl(raw);
                    if (url == null) {
                        other++;
                        continue;
                    }
                    photoCount++;
                    if (photos.size() < MAX_PHOTOS) {
                        photos.add(new Photo(url, (int) Math.min(ModelBridge.photoWidth(item), Integer.MAX_VALUE),
                                (int) Math.min(ModelBridge.photoHeight(item), Integer.MAX_VALUE)));
                    }
                }
            }
        }

        Map<String, Long> counts = new HashMap<>();
        List<?> actions = ModelBridge.postActions(post);
        if (actions != null) {
            for (Object entry : actions) {
                String action = ModelBridge.actionName(entry);
                long count = ModelBridge.actionCount(entry);
                if (action != null && count >= 0) counts.put(action, count);
            }
        }
        return new PostCard(ModelBridge.canonicalPostId(post), handle, name, avatar, square, verification, text,
                ModelBridge.instantMillis(ModelBridge.canonicalTime(post)), Collections.unmodifiableList(photos),
                mediaNote(photos.size(), photoCount, sensitive, other), counts, info, now);
    }

    /**
     * The text X shows: the code points in [start, end) as X clamps them (the whole text without
     * a range), with each t.co link replaced by where it leads. links holds {t.co, expanded} pairs.
     */
    static String displayText(String text, int start, int end, List<String[]> links) {
        if (text == null) return "";
        String shown = text;
        if (start >= 0 && end >= 0) {
            int count = text.codePointCount(0, text.length());
            int from = Math.min(start, count);
            int to = Math.min(Math.max(end, from), count);
            shown = text.substring(text.offsetByCodePoints(0, from), text.offsetByCodePoints(0, to));
        }
        for (String[] link : links) {
            if (link[0] != null && !link[0].isEmpty() && link[1] != null && !link[1].isEmpty()) {
                shown = shown.replace(link[0], link[1]);
            }
        }
        return shown.trim();
    }

    /** The first count X gave for any of [actions], or -1. */
    static long count(Map<String, Long> counts, String... actions) {
        for (String action : actions) {
            Long value = counts.get(action);
            if (value != null) return value;
        }
        return -1;
    }

    /** What the card leaves out of the post's media, or null when it shows all of it. */
    static String mediaNote(int shown, int photos, int sensitive, int other) {
        StringBuilder s = new StringBuilder();
        if (photos > shown) s.append("Showing ").append(shown).append(" of ").append(photos).append(" photos.");
        if (sensitive > 0) {
            if (s.length() > 0) s.append(' ');
            s.append(sensitive == 1 ? "A photo marked as sensitive is not shown."
                    : sensitive + " photos marked as sensitive are not shown.");
        }
        if (other > 0) {
            if (s.length() > 0) s.append(' ');
            s.append(other == 1 ? "A video or GIF is not shown." : other + " videos or GIFs are not shown.");
        }
        return s.length() > 0 ? s.toString() : null;
    }

    /**
     * A photo on X's image server in its medium size as JPEG, which is under the image loader's
     * size limit; null for anything else.
     */
    static String photoUrl(String raw) {
        String url = AccountCard.imageUrl(raw);
        if (url == null) return null;
        try {
            Matcher m = MEDIA_PATH.matcher(new URI(url).getRawPath());
            return m.matches() ? "https://pbs.twimg.com/media/" + m.group(1) + "?format=jpg&name=medium" : null;
        } catch (URISyntaxException e) {
            return null;
        }
    }

    /** The post's permanent link by ID, which survives handle changes. */
    static String statusUrl(long postId) {
        return "https://x.com/i/status/" + postId;
    }

    /** A date in UTC, as X-Posed prints it: "5 Mar 2026 · 14:05 UTC", with seconds when asked. */
    static String formatUtc(long millis, boolean seconds) {
        Calendar c = Calendar.getInstance(TimeZone.getTimeZone("UTC"), Locale.ROOT);
        c.setTimeInMillis(millis);
        String time = two(c.get(Calendar.HOUR_OF_DAY)) + ':' + two(c.get(Calendar.MINUTE))
                + (seconds ? ":" + two(c.get(Calendar.SECOND)) : "");
        return c.get(Calendar.DAY_OF_MONTH) + " " + MONTHS[c.get(Calendar.MONTH)] + ' ' + c.get(Calendar.YEAR)
                + " \u00B7 " + time + " UTC";
    }

    private static String two(int n) {
        return n < 10 ? "0" + n : Integer.toString(n);
    }

    /** X-Posed's suggested caption. */
    static String caption(String location) {
        String where = location != null && !location.isEmpty() && !location.equals("Unknown") ? location : null;
        String caption = where != null ? "X lists this account\u2019s location as " + where + ". (via X-Posed)"
                : "Account information reported by X. (via X-Posed)";
        return caption.length() > CAPTION_LIMIT ? caption.substring(0, CAPTION_LIMIT) : caption;
    }

    /** The composer's text: a new post mentions the account at the end, so X doesn't make it a reply. */
    static String composerText(Mode mode, String caption, String handle) {
        String text = caption == null ? "" : caption.trim();
        return mode == Mode.POST && handle != null ? (text + " @" + handle).trim() : text;
    }

    /** A description of the image for people using screen readers, within X's alt text limit. */
    static String altText(PostCard card) {
        StringBuilder s = new StringBuilder("Image of a post by @").append(card.handle).append(", made with X-Posed.");
        if (card.location != null) s.append(" X lists the account's location as ").append(card.location).append('.');
        if (card.source != null) s.append(" Connected via ").append(card.source).append('.');
        if (card.locationWarning) s.append(" X reports that this location may be inaccurate.");
        if (!card.text.isEmpty()) s.append(" The post says: ").append(card.text);
        if (s.length() <= ALT_TEXT_LIMIT) return s.toString();
        int cut = ALT_TEXT_LIMIT - 1;
        if (Character.isHighSurrogate(s.charAt(cut - 1))) cut--;
        return s.substring(0, cut) + "\u2026";
    }

    /** X-Posed's file name for a post card. */
    static String fileName(String handle, long postId) {
        String safe = handle == null ? "" : handle.replaceAll("[^A-Za-z0-9_]", "");
        return "x-posed-" + (safe.isEmpty() ? "post" : safe) + "-" + postId + ".png";
    }
}
