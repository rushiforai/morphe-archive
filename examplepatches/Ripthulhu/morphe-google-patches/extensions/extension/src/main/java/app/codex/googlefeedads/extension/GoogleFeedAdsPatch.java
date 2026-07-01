package app.codex.googlefeedads.extension;

import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Set;

@SuppressWarnings({"rawtypes", "unchecked"})
public final class GoogleFeedAdsPatch {
    private static final String TAG = "GoogleFeedAdsPatch";
    private static final int MAX_DEBUG_NODES = 40;
    private static final int MAX_TEXT_CHARS = 6000;
    private static int debugNodeCount;

    private GoogleFeedAdsPatch() {
    }

    public static List filterDiscoverFeedNodes(List nodes) {
        if (nodes == null || nodes.isEmpty()) {
            return nodes;
        }

        ArrayList filtered = new ArrayList(nodes.size());
        int removed = 0;
        for (Object node : nodes) {
            if (isLikelyAdNode(node)) {
                removed++;
                Log.i(TAG, "Dropping Discover feed node: " + compactNodeSummary(node));
            } else {
                logSampleNode(node);
                filtered.add(node);
            }
        }

        if (removed > 0) {
            Log.i(TAG, "Filtered " + removed + " Discover feed node(s) from " + nodes.size());
        }
        return filtered;
    }

    private static boolean isLikelyAdNode(Object node) {
        String text = describe(node, 0, Collections.newSetFromMap(new IdentityHashMap<>()));
        String lower = text.toLowerCase(Locale.US);

        if (containsAny(lower, "class=fuyc", " fuyc{", ".fuyc{", ".fusn{", "duplo_ad_video")) {
            return true;
        }

        if (containsAny(lower, "adsreporting", "googleapp_discover_video_card_click")) {
            return true;
        }

        if (containsAny(lower, "googleadservices", "doubleclick", "adchoices", "ad_choices")) {
            return true;
        }

        if (containsAny(lower, "ad_lightbox", "native_ad", "ad_unit", "adunit", "ad_video")) {
            return true;
        }

        return containsAny(
                lower,
                "sponsored",
                "gesponsord",
                "anzeige",
                "advertisement",
                "paid content",
                "promoted")
                && containsAny(lower, "streamnode", "renderableunit", "contentid", "topLevelContentId".toLowerCase(Locale.US));
    }

    private static void logSampleNode(Object node) {
        if (debugNodeCount >= MAX_DEBUG_NODES) {
            return;
        }
        debugNodeCount++;
        Log.d(TAG, "Discover node sample " + debugNodeCount + ": " + compactNodeSummary(node));
    }

    private static String compactNodeSummary(Object node) {
        String text = describe(node, 0, Collections.newSetFromMap(new IdentityHashMap<>()));
        text = text.replace('\n', ' ').replace('\r', ' ');
        return text.length() > 1200 ? text.substring(0, 1200) + "..." : text;
    }

    private static boolean containsAny(String text, String... needles) {
        for (String needle : needles) {
            if (text.contains(needle)) {
                return true;
            }
        }
        return false;
    }

    private static String describe(Object value, int depth, Set<Object> seen) {
        if (value == null) {
            return "null";
        }
        if (depth > 3 || seen.contains(value)) {
            return String.valueOf(value);
        }

        Class<?> type = value.getClass();
        if (isScalar(type)) {
            return String.valueOf(value);
        }

        seen.add(value);
        StringBuilder builder = new StringBuilder();
        appendLimited(builder, "class=");
        appendLimited(builder, type.getName());
        appendLimited(builder, "{toString=");
        appendLimited(builder, safeToString(value));

        Class<?> cursor = type;
        while (cursor != null && cursor != Object.class) {
            for (Field field : cursor.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) {
                    continue;
                }
                try {
                    field.setAccessible(true);
                    Object fieldValue = field.get(value);
                    appendLimited(builder, ", ");
                    appendLimited(builder, cursor.getSimpleName());
                    appendLimited(builder, ".");
                    appendLimited(builder, field.getName());
                    appendLimited(builder, "=");
                    if (fieldValue instanceof Iterable) {
                        appendIterable(builder, (Iterable) fieldValue, depth, seen);
                    } else {
                        appendLimited(builder, describe(fieldValue, depth + 1, seen));
                    }
                } catch (Throwable ignored) {
                    appendLimited(builder, ", ");
                    appendLimited(builder, cursor.getSimpleName());
                    appendLimited(builder, ".");
                    appendLimited(builder, field.getName());
                    appendLimited(builder, "=<inaccessible>");
                }
                if (builder.length() >= MAX_TEXT_CHARS) {
                    break;
                }
            }
            if (builder.length() >= MAX_TEXT_CHARS) {
                break;
            }
            cursor = cursor.getSuperclass();
        }

        appendLimited(builder, "}");
        return builder.toString();
    }

    private static void appendIterable(StringBuilder builder, Iterable values, int depth, Set<Object> seen) {
        appendLimited(builder, "[");
        int index = 0;
        for (Object value : values) {
            if (index > 0) {
                appendLimited(builder, ", ");
            }
            if (index >= 8) {
                appendLimited(builder, "...");
                break;
            }
            appendLimited(builder, describe(value, depth + 1, seen));
            index++;
        }
        appendLimited(builder, "]");
    }

    private static boolean isScalar(Class<?> type) {
        return type.isPrimitive()
                || type == String.class
                || Number.class.isAssignableFrom(type)
                || Boolean.class == type
                || Character.class == type
                || Enum.class.isAssignableFrom(type);
    }

    private static String safeToString(Object value) {
        try {
            return String.valueOf(value);
        } catch (Throwable throwable) {
            return "<toString failed: " + throwable.getClass().getSimpleName() + ">";
        }
    }

    private static void appendLimited(StringBuilder builder, String text) {
        if (builder.length() >= MAX_TEXT_CHARS) {
            return;
        }
        int remaining = MAX_TEXT_CHARS - builder.length();
        builder.append(text, 0, Math.min(text.length(), remaining));
    }
}
