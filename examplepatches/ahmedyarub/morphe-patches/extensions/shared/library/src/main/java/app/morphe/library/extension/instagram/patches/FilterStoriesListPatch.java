package app.morphe.library.extension.instagram.patches;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import app.morphe.extension.shared.Logger;

@SuppressWarnings("unused")
public class FilterStoriesListPatch {

    private static final Set<String> BLOCKED_STORY_TYPES;

    // Populated at patch time
    // The BOGUS key is there just to expand the static clinit registers count
    static {
        BLOCKED_STORY_TYPES = new HashSet<>();

        BLOCKED_STORY_TYPES.add("BOGUS");
    }

    /**
     * Injection point.
     */
    public static List<Object> removeSuggestedStories(
            List<Object> storiesList,
            String reelTypeFieldName
    )
            throws IllegalAccessException, NoSuchFieldException {
        List<Object> patchedStoryList = new ArrayList<>(storiesList);

        Iterator<Object> iterator = patchedStoryList.iterator();
        while (iterator.hasNext()) {
            Object storyItem = iterator.next();
            Field f = storyItem.getClass().getDeclaredField(reelTypeFieldName);
            Object storyType = f.get(storyItem);
            if (storyType == null) continue;
            String currentStoryType = storyType.toString();
            Logger.printInfo(() -> "Current story type:" + currentStoryType);

            if (BLOCKED_STORY_TYPES.contains(currentStoryType)) {
                Logger.printInfo(() -> "Removing story type:" + currentStoryType);
                iterator.remove();
            }
        }
        return patchedStoryList;
    }

    public static void addStoryIfNotBlocked(
            List<Object> storiesList,
            Object currentStory,
            String reelTypeFieldName
    ) throws NoSuchFieldException, IllegalAccessException {
        Field f = currentStory.getClass().getDeclaredField(reelTypeFieldName);
        f.setAccessible(true);
        Object storyType = f.get(currentStory);
        if (storyType == null) return;

        String currentStoryType = storyType.toString();
        Logger.printInfo(() -> "Current story type:" + currentStoryType);

        if (BLOCKED_STORY_TYPES.contains(currentStoryType)) {
            Logger.printInfo(() -> "Not adding story with type:" + currentStoryType);
            return;
        }

        Logger.printInfo(() -> "Adding story type with type:" + currentStoryType);
        storiesList.add(currentStory);
    }
}
