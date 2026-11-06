package io.github.bryceaspringfield.morphe.extension.reddit;

import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.*;

import java.lang.reflect.Method;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Decides which posts and comments to hide, from the settings in {@link FilterSettings}.
 */
final class Filter {

    private static volatile Rules postRules = new Rules("");
    private static volatile Rules commentRules = new Rules("");

    private Filter() {
    }

    static Rules postRules() {
        String source = getString(POST_RULES, "");
        Rules current = postRules;
        if (!current.source.equals(source)) postRules = current = new Rules(source);
        return current;
    }

    static Rules commentRules() {
        String source = getString(COMMENT_RULES, "");
        Rules current = commentRules;
        if (!current.source.equals(source)) commentRules = current = new Rules(source);
        return current;
    }

    /**
     * The place a feed type belongs to, or null for feeds the post filters leave alone (an opened post's page).
     */
    static String placeOf(String feedType) {
        if (feedType == null) return PLACE_OTHER;
        switch (feedType) {
            case "HOME":
                return PLACE_HOME;
            case "POPULAR":
                return PLACE_POPULAR;
            case "NEWS":
                return PLACE_NEWS;
            case "SUBREDDIT":
                return PLACE_COMMUNITY;
            case "SEARCH":
                return PLACE_SEARCH;
            case "LATEST":
                return PLACE_LATEST;
            case "FOLLOWING":
                return PLACE_FOLLOWING;
            case "CUSTOM":
                return PLACE_CUSTOM;
            case "TOPIC":
            case "CATEGORY":
            case "ENTITY_CATEGORY":
            case "INTERESTS":
            case "COMMUNITIES":
                return PLACE_EXPLORE;
            case "GAMES":
                return PLACE_GAMES;
            case "MATURE":
                return PLACE_MATURE;
            case "SUBMITTED_POSTS":
                // Another account's profile; hidePost moves posts of the device's own accounts to PLACE_PROFILE_OWN.
                return PLACE_PROFILE;
            case "SAVED_POSTS":
                return PLACE_SAVED;
            case "HISTORY":
                return PLACE_HISTORY;
            case "FBP":
                return PLACE_VIDEO_PLAYER;
            case "PDP":
            case "ARTICLE":
            case "QUEUE":
            case "SAVED_COMMENTS":
            case "SUBMITTED_COMMENTS":
                return null;
            default:
                return PLACE_OTHER;
        }
    }

    /**
     * Whether any post filter is set, so a page with none skips reading its posts.
     */
    static boolean anyPostFilter() {
        if (!postRules().isEmpty() || getBoolean(HIDE_DELETED) || getBoolean(HIDE_DUPLICATES)) return true;
        for (String key : TYPE_KEYS) if (!MODE_SHOW.equals(mode(key))) return true;
        if (bound(POST_SCORE_MIN) != null || bound(POST_SCORE_MAX) != null) return true;
        if (bound(POST_COMMENTS_MIN) != null || bound(POST_COMMENTS_MAX) != null) return true;
        if (!Scopes.all().isEmpty()) return true;
        return !getSet(TOPICS, Collections.emptySet()).isEmpty() || !topicExtra().isEmpty();
    }

    static Set<String> topicExtra() {
        Set<String> names = new HashSet<>();
        for (String line : getString(TOPIC_EXTRA, "").split("[\\n,]")) {
            String name = Rules.community(line).replace("_", "");
            if (!name.isEmpty()) names.add(name);
        }
        return names;
    }

    /**
     * The reason a post is hidden, or null to show it.
     */
    static String hidePost(PostInfo post, String place) {
        if (PLACE_PROFILE.equals(place) && Accounts.ownsAny(post.authors)) place = PLACE_PROFILE_OWN;
        if (!post.isPost || place == null || !places().contains(place)) return null;
        if (!post.authors.isEmpty() && DELETED_AUTHOR.equals(post.authors.get(0)) && getBoolean(HIDE_DELETED)) {
            return "deleted account";
        }

        Set<String> topics = getSet(TOPICS, Collections.emptySet());
        Set<String> extra = topicExtra();
        for (String community : post.communities) {
            if (Topics.hides(community, topics, extra)) return "topic r/" + community;
        }

        Rules rules = postRules();
        if (!rules.isEmpty()) {
            Set<String> fields = fields();
            String flairs = String.join("\n", post.flairs);
            for (Rules.Rule rule : rules.rules) {
                if (!inScope(rule, post)) continue;
                switch (rule.kind) {
                    case COMMUNITY:
                        if (!rule.value.isEmpty() && post.communities.contains(rule.value)) return "r/" + rule.value;
                        break;
                    case AUTHOR:
                        if (post.authors.contains(rule.value)) return "u/" + rule.value;
                        break;
                    case FLAIR:
                        if (post.hasFlair(rule.value)) return "flair " + rule.value;
                        break;
                    case NOT_FLAIR:
                        if (!post.hasFlair(rule.value)) return "not flair " + rule.value;
                        break;
                    default:
                        if ((fields.contains(FIELD_TITLE) && rule.matchesText(post.title.toString()))
                                || (fields.contains(FIELD_BODY) && rule.matchesText(post.body.toString()))
                                || (fields.contains(FIELD_FLAIR) && rule.matchesText(flairs))
                                || (fields.contains(FIELD_POSTER) && rule.matchesText(String.join("\n", post.authors)))
                                || (fields.contains(FIELD_COMMUNITY) && rule.matchesText(String.join("\n", post.communities)))
                                || (fields.contains(FIELD_DOMAIN) && rule.matchesText(post.domain.toString()))) {
                            return "keyword " + rule.value;
                        }
                }
            }
        }

        boolean[] has = {post.textOnly(), post.photo, post.video, post.repost, post.nsfw};
        boolean anyOnly = false;
        boolean matchesOnly = false;
        for (int i = 0; i < TYPE_KEYS.length; i++) {
            String mode = mode(TYPE_KEYS[i]);
            if (MODE_HIDE.equals(mode) && has[i]) return "type " + TYPE_KEYS[i];
            if (MODE_ONLY.equals(mode)) {
                anyOnly = true;
                if (has[i]) matchesOnly = true;
            }
        }
        if (anyOnly && !matchesOnly) return "not an only type";

        Scopes.noteFlairs(post);
        String scoped = Scopes.hidePost(post, has);
        if (scoped != null) return scoped;

        if (outside(post.score, POST_SCORE_MIN, POST_SCORE_MAX)) return "score " + post.score;
        if (outside(post.comments, POST_COMMENTS_MIN, POST_COMMENTS_MAX)) return "comments " + post.comments;
        if (getBoolean(HIDE_DUPLICATES)) return Duplicates.check(post);
        return null;
    }

    private static boolean inScope(Rules.Rule rule, PostInfo post) {
        return rule.inScope(post.communities, post.authors);
    }

    static boolean outside(Long value, Long min, Long max) {
        return value != null && ((min != null && value < min) || (max != null && value > max));
    }

    private static boolean outside(Long value, String minKey, String maxKey) {
        if (value == null) return false;
        Long min = bound(minKey);
        Long max = bound(maxKey);
        return (min != null && value < min) || (max != null && value > max);
    }

    // region Comments

    private static final Map<String, Method> METHODS = new ConcurrentHashMap<>();

    private static Object call(Object target, String name) {
        String key = target.getClass().getName() + "#" + name;
        try {
            Method method = METHODS.get(key);
            if (method == null) {
                method = target.getClass().getMethod(name);
                METHODS.put(key, method);
            }
            return method.invoke(target);
        } catch (Exception ex) {
            return null;
        }
    }

    static boolean isComment(Object item) {
        return item != null && item.getClass().getName().equals("com.reddit.domain.model.Comment");
    }

    static boolean anyCommentFilter() {
        return !commentRules().isEmpty() || getBoolean(HIDE_DELETED) || bound(COMMENT_SCORE_MIN) != null || bound(COMMENT_SCORE_MAX) != null;
    }

    /**
     * The reason a comment is hidden, or null to show it.
     */
    static String hideComment(Object comment) {
        String body = String.valueOf(call(comment, "getBody")).toLowerCase(Locale.ROOT);
        String author = String.valueOf(call(comment, "getAuthor")).toLowerCase(Locale.ROOT);
        String community = Rules.community(String.valueOf(call(comment, "getSubreddit")));
        if (DELETED_AUTHOR.equals(author) && getBoolean(HIDE_DELETED)) return "deleted account";

        for (Rules.Rule rule : commentRules().rules) {
            if (!rule.inScope(Collections.singletonList(community), Collections.singletonList(author))) continue;
            switch (rule.kind) {
                case AUTHOR:
                    if (author.equals(rule.value)) return "u/" + rule.value;
                    break;
                case COMMUNITY:
                    if (!rule.value.isEmpty() && community.equals(rule.value)) return "r/" + rule.value;
                    break;
                case FLAIR:
                case NOT_FLAIR:
                    break;
                default:
                    if (rule.matchesText(body)) return "keyword " + rule.value;
            }
        }

        Object score = call(comment, "getScore");
        Object hidden = call(comment, "getScoreHidden");
        if (score instanceof Number && !Boolean.TRUE.equals(hidden)
                && outside(((Number) score).longValue(), COMMENT_SCORE_MIN, COMMENT_SCORE_MAX)) {
            return "score " + score;
        }
        return null;
    }

    static int depthOf(Object item) {
        Object depth = call(item, "getDepth");
        return depth instanceof Number ? ((Number) depth).intValue() : -1;
    }

    // endregion

    static List<String> describe(List<String> list) {
        return list;
    }
}
