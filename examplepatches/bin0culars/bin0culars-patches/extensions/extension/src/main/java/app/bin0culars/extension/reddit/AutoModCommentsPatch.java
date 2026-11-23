package app.bin0culars.extension.reddit;

import app.bin0culars.extension.reddit.settings.BinocularsMods;
import java.util.ArrayList;
import java.util.List;

public final class AutoModCommentsPatch {

    private static final String KEY = "automod_comments";
    private static final String CHOICE_COLLAPSE = "collapse";
    private static final String CHOICE_HIDE = "hide";
    private static final String AUTOMOD_AUTHOR = "AutoModerator";

    private AutoModCommentsPatch() {}

    public static List<?> filterComments(List<?> comments) {
        if (comments == null || comments.isEmpty()) {
            return comments;
        }

        String choice = BinocularsMods.getChoice(KEY);
        if (CHOICE_COLLAPSE.equals(choice)) {
            for (Object item : comments) {
                if (isAutoMod(item)) {
                    collapse(item, true);
                }
            }
            return comments;
        }

        if (CHOICE_HIDE.equals(choice)) {
            List<Object> result = new ArrayList<>(comments.size());
            boolean skipping = false;
            int hideDepth = -1;

            for (Object item : comments) {
                if (skipping) {
                    int depth = depthOf(item);
                    if (depth > hideDepth) {
                        continue;
                    }
                    skipping = false;
                }

                if (isAutoMod(item)) {
                    skipping = true;
                    hideDepth = depthOf(item);
                    continue;
                }

                result.add(item);
            }

            if (result.size() == comments.size()) {
                return comments;
            }
            return result;
        }

        return comments;
    }

    private static boolean isAutoMod(Object item) {
        return isComment(item) && AUTOMOD_AUTHOR.equalsIgnoreCase(authorOf(item));
    }

    private static boolean isComment(Object item) {
        // Modified during patching.
        return false;
    }

    private static String authorOf(Object comment) {
        // Modified during patching.
        return null;
    }

    private static int depthOf(Object comment) {
        // Modified during patching.
        return 0;
    }

    private static void collapse(Object comment, boolean collapsed) {
        // Modified during patching.
    }
}
