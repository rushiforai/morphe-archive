package app.unlimited.sportsnet.extension;

/**
 * The app opens every Sportsnet+ game by switching to the Watch tab, so going back from the video
 * lands on Watch. When the game is opened from Scores, this opens it on top of Scores instead, so
 * going back returns to Scores. From anywhere else the app's own behaviour is kept.
 */
@SuppressWarnings("unused")
public final class StayOnScores {
    private static final String SCORES_TAB = "com.rogers.sportsnet.ui.navigation.ScoresTab";

    private StayOnScores() {
    }

    /** Called in place of navigateToTabRootThenRoute(watchTab, details) on the navigation controller. */
    public static void openDetails(Object controller, Object watchTab, Object details) {
        try {
            Object state = controller.getClass().getMethod("getState").invoke(controller);
            Object current = state.getClass().getMethod("getTopLevelRoute").invoke(state);
            Class<?> navKey = Class.forName("androidx.navigation3.runtime.NavKey");
            if (current != null && SCORES_TAB.equals(current.getClass().getName())) {
                controller.getClass().getMethod("navigate", navKey).invoke(controller, details);
                return;
            }
            controller.getClass().getMethod("navigateToTabRootThenRoute", navKey, navKey)
                    .invoke(controller, watchTab, details);
        } catch (Exception e) {
            Logger.error("Could not open the game", e);
        }
    }
}
