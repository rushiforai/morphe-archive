package app.ahmedyarub.extension.instagram;

import java.util.List;

import app.morphe.extension.shared.Logger;
import app.morphe.library.extension.instagram.patches.FilterStoriesListPatch;

@SuppressWarnings("unused")
public final class StoryTray {
    private static volatile boolean failureLogged;

    private StoryTray() {
    }

    /**
     * Injection point, in place of the story tray parser's own {@code list.add(story)}.
     *
     * <p>The library's filter reads the story's reel type by reflection and lets any exception
     * out. Inside the tray parser that exception abandons the whole tray, so every story
     * disappears because one item was not the shape the filter expected. Here a failure only
     * costs filtering that one story: it is added as the app would have added it.
     */
    public static void addStoryIfNotBlocked(List<Object> stories, Object story, String reelTypeFieldName) {
        try {
            FilterStoriesListPatch.addStoryIfNotBlocked(stories, story, reelTypeFieldName);
        } catch (Throwable ex) {
            if (!failureLogged) {
                failureLogged = true;
                Logger.printException(() -> "Could not filter a story tray item of "
                        + (story == null ? "null" : story.getClass().getName()), ex);
            }
            stories.add(story);
        }
    }
}
