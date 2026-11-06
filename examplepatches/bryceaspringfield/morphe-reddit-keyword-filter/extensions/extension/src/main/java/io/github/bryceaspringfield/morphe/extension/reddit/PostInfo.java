package io.github.bryceaspringfield.morphe.extension.reddit;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collection;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * What the filters read from one post: its text, poster, community, flairs, type, score, and comment count.
 * <p>
 * A feed post is a tree of Kotlin data classes with obfuscated names. Each part is recognized by the name its
 * toString() starts with (for example {@code PostTitleElement(}), which survives obfuscation, and its values
 * are read from the labels of the same toString() (for example {@code , translatedTitle=}). A repost holds the
 * original post, whose text, poster, and community are added to the repost's.
 */
final class PostInfo {

    final StringBuilder title = new StringBuilder();
    final StringBuilder body = new StringBuilder();
    final List<String> flairs = new ArrayList<>();
    final List<String> authors = new ArrayList<>();
    final List<String> communities = new ArrayList<>();
    final StringBuilder domain = new StringBuilder();
    /** The post's media as host and ID (i.redd.it/abc, imgur.com/xyz), from the first media address it names. */
    final StringBuilder media = new StringBuilder();
    boolean isPost;
    boolean nsfw;
    boolean photo;
    boolean video;
    boolean link;
    boolean repost;
    Long score;
    Long comments;
    final List<String> partNames = new ArrayList<>();

    /**
     * The post's ID (t3_...), or blank.
     */
    String id = "";

    /**
     * The community the post was made in (a repost's own community), or blank.
     */
    String community() {
        return communities.isEmpty() ? "" : communities.get(0);
    }

    boolean textOnly() {
        return !photo && !video && !link;
    }

    @Override
    public String toString() {
        return "PostInfo{post=" + isPost + ", communities=" + communities + ", authors=" + authors
                + ", title=" + clip(title) + ", media=" + media + ", body=" + clip(body) + ", flairs=" + flairs + ", domain=" + domain
                + ", nsfw=" + nsfw + ", photo=" + photo + ", video=" + video + ", link=" + link
                + ", repost=" + repost + ", score=" + score + ", comments=" + comments + ", parts=" + partNames + "}";
    }

    private static String clip(CharSequence text) {
        String value = text.toString().replace('\n', '|');
        return value.length() > 80 ? value.substring(0, 80) + "..." : value;
    }

    // region Feed elements

    private static final Pattern NEXT_LABEL = Pattern.compile(", [a-zA-Z]+=");
    private static final Pattern FLAIR_TEXT = Pattern.compile("(?:\\(|, )(?:text|flairText|richText|name)=");
    private static final Pattern NSFW = Pattern.compile("(?i)(?:\\(|, )(?:isNsfw|nsfw|over18|isOver18|isNSFW|nsfwIndicator)=true|\\bNsfw\\b|\\bNSFW\\b|Indicator\\.Nsfw|Nsfw\\(");
    /** A media address: Reddit's image and video hosts, imgur, RedGIFs, Streamable, Gfycat, and YouTube. */
    private static final Pattern MEDIA_URL = Pattern.compile(
            "https?://(?:www\\.|m\\.)?((?:i|v|preview)\\.redd\\.it|(?:i\\.)?imgur\\.com|(?:www\\.)?redgifs\\.com/(?:watch|ifr)"
                    + "|streamable\\.com|gfycat\\.com|youtu\\.be|youtube\\.com/(?:watch\\?v=|shorts/))/?(?!snoovatar|avatars?/|award)([A-Za-z0-9_-]{5,})");
    private static final Map<Class<?>, List<Field>> FIELDS = new ConcurrentHashMap<>();

    /**
     * The name a data class's toString() starts with, or blank.
     */
    static String nameOf(String text) {
        int paren = text.indexOf('(');
        if (paren <= 0 || paren > 64) return "";
        String name = text.substring(0, paren);
        for (int i = 0; i < name.length(); i++) {
            if (!Character.isLetterOrDigit(name.charAt(i))) return "";
        }
        return name;
    }

    /**
     * The value printed after {@code label} in a data class's toString(), or blank.
     */
    static String valueOf(String text, String label) {
        String key = ", " + label + "=";
        int start = text.indexOf(key);
        if (start < 0) {
            key = "(" + label + "=";
            start = text.indexOf(key);
            if (start < 0) return "";
        }
        start += key.length();
        Matcher next = NEXT_LABEL.matcher(text);
        int end = next.find(start) ? next.start() : text.lastIndexOf(')');
        if (end < start) end = text.length();
        String value = text.substring(start, end).trim();
        return value.equals("null") ? "" : value;
    }

    static PostInfo fromElement(Object element) {
        PostInfo info = new PostInfo();
        info.read(element, 0, new IdentityHashMap<>());
        info.outsideLink();
        return info;
    }

    private void read(Object element, int depth, IdentityHashMap<Object, Boolean> seen) {
        if (element == null || depth > 6 || seen.put(element, Boolean.TRUE) != null) return;
        String text = element.toString();
        String name = nameOf(text);
        if (media.length() == 0) addMedia(text);
        if (name.equals("SearchPostInfo")) {
            readSearchPost(text);
        } else if (!name.endsWith("Element")) {
            return;
        }
        if (partNames.size() < 40) partNames.add(name);
        if (depth == 0 && id.isEmpty()) id = valueOf(text, "linkId");

        switch (name) {
            case "PostElement":
            case "SearchDynamicPostElement":
            case "PostPreviewFeedElement":
                isPost = true;
                break;
            case "SearchPostInfo":
                break;
            case "ClassicPostElement":
                isPost = true;
                addLine(title, valueOf(text, "title"));
                addLine(title, valueOf(text, "translatedTitle"));
                addCommunity(valueOf(text, "subredditName"));
                classicMedia(valueOf(text, "mediaDomain"), valueOf(text, "thumbnail"));
                break;
            case "PostTitleElement":
            case "TitleWithThumbnailElement":
            case "TitleWithThumbnailCollapsedElement":
                addLine(title, valueOf(text, "title"));
                addLine(title, valueOf(text, "translatedTitle"));
                break;
            case "PreviewTextElement":
            case "RichTextElement":
                addLine(body, valueOf(text, "text"));
                addLine(body, valueOf(text, "translatedText"));
                addLine(body, valueOf(text, "body"));
                break;
            case "MetadataHeaderElement":
            case "NewsPostHeaderElement": {
                String author = valueOf(text, "authorNameWithPrefix");
                String details = valueOf(text, "details");
                if (details.startsWith("r/")) addCommunity(details);
                else if (author.isEmpty() && details.startsWith("u/")) author = details;
                addAuthor(author);
                String mediaDomain = valueOf(text, "mediaDomain");
                if (domain.length() == 0) domain.append(mediaDomain);
                break;
            }
            case "PostFlairsElement":
                addFlairs(bracketed(text, "flairs"));
                break;
            case "PostActionScoreBarElement":
            case "PostMetricElement":
                if (score == null) score = parseCount(valueOf(text, "scoreLabel"));
                if (comments == null) comments = parseCount(valueOf(text, "commentLabel"));
                break;
            case "IndicatorsElement":
                if (NSFW.matcher(text).find()) nsfw = true;
                break;
            case "CrosspostElement":
                repost = true;
                break;
            case "VideoElement":
            case "YouTubeElement":
            case "VideoCarouselElement":
                video = true;
                break;
            case "GalleryElement":
            case "GalleryWithLinkFooterElement":
            case "PostSelfImageElement":
                photo = true;
                break;
            case "PostMediaWebsiteElement":
                link = true;
                break;
            default:
                if (name.contains("Video")) video = true;
                else if (name.contains("Image") || name.contains("Gallery")) photo = true;
        }
        if (!nsfw && (name.equals("ClassicPostElement") || name.equals("MetadataHeaderElement"))) {
            String indicators = valueOf(text, "indicators");
            if (!indicators.isEmpty() && NSFW.matcher(indicators).find()) nsfw = true;
        }

        // The parts: lists of elements, and single elements such as a repost's original post.
        for (Field field : fields(element.getClass())) {
            Object value;
            try {
                value = field.get(element);
            } catch (IllegalAccessException ex) {
                continue;
            }
            if (isLink(value)) {
                readLink(value, 0);
            } else if (value instanceof Collection) {
                for (Object part : (Collection<?>) value) read(part, depth + 1, seen);
            } else if (value instanceof Iterable && !(value instanceof CharSequence)) {
                for (Object part : (Iterable<?>) value) read(part, depth + 1, seen);
            } else if (value != null && !(value instanceof CharSequence) && !(value instanceof Number)
                    && !(value instanceof Boolean) && !(value instanceof Enum)) {
                read(value, depth + 1, seen);
            }
        }
    }

    /**
     * A search result's post. A repost's toString() holds its original post after the label crossPostParent, which the
     * recursion reads as a part of its own.
     */
    private void readSearchPost(String text) {
        isPost = true;
        addLine(title, valueOf(text, "title"));
        addCommunity(valueOf(text, "subredditName"));
        addAuthor(valueOf(text, "authorName"));
        if (valueOf(text, "isNsfw").equals("true") || valueOf(text, "isSubredditNsfw").equals("true")) nsfw = true;
        if (score == null) score = parseCount(valueOf(text, "score"));
        if (comments == null) comments = parseCount(valueOf(text, "commentCount"));
        String hint = valueOf(text, "postHint").toLowerCase(Locale.ROOT);
        boolean self = valueOf(text, "isSelfPost").equals("true");
        if (valueOf(text, "isVideo").equals("true") || hint.contains("video")) video = true;
        else if (!valueOf(text, "gallery").isEmpty() || hint.contains("image")) photo = true;
        else if (!self && hint.contains("link")) link = true;
        if (valueOf(text, "crossPostParent").startsWith("SearchPostInfo(")) repost = true;
        addLine(body, valueOf(text, "previewPlainText"));
        if (domain.length() == 0) domain.append(valueOf(text, "domain").toLowerCase(Locale.ROOT));
    }

    /**
     * Names the post's community when no part of the post names one (a community's own feed).
     */
    void defaultCommunity(String name) {
        if (communities.isEmpty() && name != null) addCommunity(name);
    }

    private static List<Field> fields(Class<?> type) {
        List<Field> fields = FIELDS.get(type);
        if (fields != null) return fields;
        fields = new ArrayList<>();
        for (Class<?> current = type; current != null && current != Object.class; current = current.getSuperclass()) {
            for (Field field : current.getDeclaredFields()) {
                Class<?> fieldType = field.getType();
                if (Modifier.isStatic(field.getModifiers()) || fieldType.isPrimitive()
                        || fieldType == String.class || fieldType.isEnum()) continue;
                try {
                    field.setAccessible(true);
                    fields.add(field);
                } catch (RuntimeException ignored) {
                    // A field the runtime refuses to open is skipped.
                }
            }
        }
        FIELDS.put(type, fields);
        return fields;
    }

    private void classicMedia(String mediaDomain, String thumbnail) {
        String host = mediaDomain.toLowerCase(Locale.ROOT);
        if (host.isEmpty() || host.startsWith("self.")) return;
        if (domain.length() == 0) domain.append(host);
        if (host.contains("v.redd.it") || host.contains("youtube") || host.contains("youtu.be")
                || host.contains("redgifs") || host.contains("streamable")) video = true;
        else if (host.contains("i.redd.it") || host.contains("imgur") || host.contains("reddit.com/gallery")) photo = true;
        else link = true;
    }

    private void addFlairs(String text) {
        Matcher matcher = FLAIR_TEXT.matcher(text);
        while (matcher.find()) addFlair(fieldValue(text, matcher.end()));
    }

    private void addFlair(String text) {
        if (text == null || text.trim().equals("null")) return;
        String flair = Rules.flairKey(text);
        if (!flair.isEmpty() && !flairs.contains(flair)) flairs.add(flair);
    }

    /**
     * Whether the post has the flair given, compared by letters and digits alone (case, emoji, and punctuation
     * aside).
     */
    boolean hasFlair(String flair) {
        String key = Rules.flairMatchKey(flair);
        if (key.isEmpty()) return false;
        for (String own : flairs) if (key.equals(Rules.flairMatchKey(own))) return true;
        return false;
    }

    /**
     * A field's value in a data class's toString(), starting at {@code start}: it ends at the next ", name=" or at
     * the closing bracket of its object, with brackets inside the value (a flair "Question (Answered)") kept.
     */
    static String fieldValue(String text, int start) {
        int depth = 0;
        for (int i = start; i < text.length(); i++) {
            char c = text.charAt(i);
            if (c == '(' || c == '[' || c == '{') depth++;
            else if (c == ')' || c == ']' || c == '}') {
                if (depth == 0) return text.substring(start, i).trim();
                depth--;
            } else if (c == ',' && depth == 0 && NEXT_LABEL.matcher(text).region(i, text.length()).lookingAt()) {
                return text.substring(start, i).trim();
            }
        }
        return text.substring(start).trim();
    }

    /**
     * A list or object field's whole value, brackets included ("flairs=[Flair(...), Flair(...)]"), or the plain
     * value of any other field.
     */
    static String bracketed(String text, String label) {
        String key = ", " + label + "=";
        int start = text.indexOf(key);
        if (start < 0) {
            key = "(" + label + "=";
            start = text.indexOf(key);
            if (start < 0) return "";
        }
        start += key.length();
        if (start >= text.length() || "([{".indexOf(text.charAt(start)) < 0) return valueOf(text, label);
        int depth = 0;
        for (int i = start; i < text.length(); i++) {
            char c = text.charAt(i);
            if (c == '(' || c == '[' || c == '{') depth++;
            else if ((c == ')' || c == ']' || c == '}') && --depth == 0) return text.substring(start, i + 1);
        }
        return text.substring(start);
    }

    // endregion

    // region Listing items (com.reddit.domain.model.Link)

    private static final Map<String, Method> LINK_METHODS = new ConcurrentHashMap<>();
    private static final Set<String> MISSING_METHODS = ConcurrentHashMap.newKeySet();

    private static Object call(Object target, String name) {
        String key = target.getClass().getName() + "#" + name;
        if (MISSING_METHODS.contains(key)) return null;
        try {
            Method method = LINK_METHODS.get(key);
            if (method == null) {
                method = target.getClass().getMethod(name);
                LINK_METHODS.put(key, method);
            }
            return method.invoke(target);
        } catch (NoSuchMethodException ex) {
            MISSING_METHODS.add(key);
            return null;
        } catch (Exception ex) {
            return null;
        }
    }

    private static String string(Object target, String name) {
        Object value = call(target, name);
        return value == null ? "" : value.toString();
    }

    static boolean isLink(Object item) {
        return item != null && item.getClass().getName().equals("com.reddit.domain.model.Link");
    }

    static PostInfo fromLink(Object link) {
        PostInfo info = new PostInfo();
        info.readLink(link, 0);
        info.outsideLink();
        return info;
    }

    /**
     * Gives a post with no photo, video, or link part the type its domain names: a post whose card shows only a link
     * preview thumbnail (e.g., ballotpedia.org) names its site in the header, and a text post names self.community or
     * nothing.
     */
    private void outsideLink() {
        if (!textOnly() || domain.length() == 0) return;
        String host = domain.toString().toLowerCase(Locale.ROOT);
        if (host.startsWith("self.") || host.equals("reddit.com") || host.endsWith(".reddit.com")
                || host.startsWith("r/") || host.startsWith("u/") || host.indexOf('.') < 0) return;
        // A media host names the post's type (a YouTube video, an i.redd.it image); any other site is a link.
        classicMedia(host, "");
    }

    private void readLink(Object link, int depth) {
        isPost = true;
        addLine(title, string(link, "getTitle"));
        addLine(title, string(link, "getTranslatedTitle"));
        addLine(body, string(link, "getSelftext"));
        addLine(body, string(link, "getTranslatedSelftext"));
        addCommunity(string(link, "getSubreddit"));
        addAuthor(string(link, "getAuthor"));
        addFlair(string(link, "getLinkFlairText"));
        if (Boolean.TRUE.equals(call(link, "getOver18"))) nsfw = true;
        if (domain.length() == 0) domain.append(string(link, "getDomain").toLowerCase(Locale.ROOT));
        if (media.length() == 0) addMedia(string(link, "getUrl"));

        Object value = call(link, "getScore");
        if (value instanceof Number && score == null) score = ((Number) value).longValue();
        value = call(link, "getNumComments");
        if (value instanceof Number && comments == null) comments = ((Number) value).longValue();

        String hint = string(link, "getPostHint").toLowerCase(Locale.ROOT);
        boolean self = Boolean.TRUE.equals(call(link, "isSelf")) || Boolean.TRUE.equals(call(link, "getIsSelf"));
        if (Boolean.TRUE.equals(call(link, "isVideo")) || Boolean.TRUE.equals(call(link, "getIsVideo"))
                || hint.contains("video")) video = true;
        else if (call(link, "getGallery") != null || hint.equals("image")) photo = true;
        else if (!self && hint.equals("link")) this.link = true;

        Object parents = call(link, "getCrossPostParentList");
        if (parents == null) parents = call(link, "getCrosspostParentList");
        if (parents instanceof Collection && !((Collection<?>) parents).isEmpty()) {
            repost = true;
            if (depth == 0) {
                for (Object parent : (Collection<?>) parents) {
                    if (isLink(parent)) readLink(parent, depth + 1);
                }
            }
        }
    }

    // endregion

    /** Records the first media address in {@code text}, its host shortened to one name for each service. */
    private void addMedia(String text) {
        if (text == null || text.isEmpty()) return;
        Matcher m = MEDIA_URL.matcher(text);
        if (!m.find()) return;
        String host = m.group(1).toLowerCase(Locale.ROOT);
        if (host.endsWith("redd.it")) host = host.startsWith("v.") ? "v.redd.it" : "i.redd.it";
        else if (host.contains("imgur")) host = "imgur";
        else if (host.contains("youtu")) host = "youtube";
        else if (host.contains("redgifs") || host.contains("gfycat")) host = "redgifs";
        String id = m.group(2);
        if (!host.equals("youtube")) id = id.toLowerCase(Locale.ROOT);
        media.append(host).append('/').append(id);
    }

    private void addCommunity(String name) {
        String community = Rules.community(name);
        if (!community.isEmpty() && !communities.contains(community)) communities.add(community);
    }

    private void addAuthor(String name) {
        String author = name.trim().toLowerCase(Locale.ROOT);
        if (author.startsWith("u/")) author = author.substring(2);
        if (!author.isEmpty() && !authors.contains(author)) authors.add(author);
    }

    private static void addLine(StringBuilder builder, String value) {
        if (value == null) return;
        value = value.trim();
        if (value.isEmpty() || value.equals("null")) return;
        if (builder.length() > 0) builder.append('\n');
        builder.append(value.toLowerCase(Locale.ROOT));
    }

    /**
     * A count as printed in the app (for example 42, 1.2k, 3,4 k, or 2M), or null when it states no number.
     */
    static Long parseCount(String label) {
        if (label == null) return null;
        String text = label.trim().toLowerCase(Locale.ROOT).replace(" ", " ");
        Matcher matcher = Pattern.compile("(-?\\d+(?:[.,]\\d+)?)\\s*([km])?").matcher(text);
        if (!matcher.find()) return null;
        String number = matcher.group(1);
        String unit = matcher.group(2);
        if (unit == null) return Long.parseLong(number.replace(",", "").replace(".", ""));
        double value = Double.parseDouble(number.replace(',', '.'));
        return Math.round(value * (unit.equals("k") ? 1_000 : 1_000_000));
    }
}
