/*
 * Adapted from https://github.com/brosssh/instagram-morphe-patches-library
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.extension.extension;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

@SuppressWarnings("unused")
public final class InstagramFilterStoriesListPatch {
    private static final String SENTINEL = "BOGUS";
    public static final Set<String> BLOCKED_STORY_TYPES;

    // Populated at patch time; the sentinel entry keeps <clinit> registers allocated.
    static {
        BLOCKED_STORY_TYPES = new HashSet<>();
        BLOCKED_STORY_TYPES.add(SENTINEL);
    }

    private InstagramFilterStoriesListPatch() {
    }

    /**
     * Injection point.
     */
    public static List<Object> removeSuggestedStories(
            List<Object> storiesList,
            String reelTypeFieldName
    ) throws IllegalAccessException, NoSuchFieldException {
        if (storiesList == null) return null;
        List<Object> patchedStoryList = new ArrayList<>(storiesList);

        Iterator<Object> iterator = patchedStoryList.iterator();
        while (iterator.hasNext()) {
            Object storyItem = iterator.next();
            if (storyItem == null) continue;
            Field f = storyItem.getClass().getDeclaredField(reelTypeFieldName);
            f.setAccessible(true);
            Object storyType = f.get(storyItem);
            if (storyType == null) continue;
            String currentStoryType = storyType.toString();
            if (!SENTINEL.equals(currentStoryType) && BLOCKED_STORY_TYPES.contains(currentStoryType)) {
                iterator.remove();
            }
        }
        return patchedStoryList;
    }

    /**
     * Injection point.
     */
    public static void addStoryIfNotBlocked(
            List<Object> storiesList,
            Object currentStory,
            String reelTypeFieldName
    ) throws NoSuchFieldException, IllegalAccessException {
        if (storiesList == null || currentStory == null) return;
        Field f = currentStory.getClass().getDeclaredField(reelTypeFieldName);
        f.setAccessible(true);
        Object storyType = f.get(currentStory);
        if (storyType == null) {
            storiesList.add(currentStory);
            return;
        }

        String currentStoryType = storyType.toString();
        if (!SENTINEL.equals(currentStoryType) && BLOCKED_STORY_TYPES.contains(currentStoryType)) {
            return;
        }

        storiesList.add(currentStory);
    }
}
