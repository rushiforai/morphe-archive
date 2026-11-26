package app.pomee4.extension.commentswipe;

/**
 * Texts of the swipe actions of comments and posts, by action name (English).
 */
final class Labels {
    private Labels() {
    }

    static String action(Enum<?> action) {
        switch (action == null ? "NONE" : action.name()) {
            case "UPVOTE":
                return "Upvote";
            case "DOWNVOTE":
                return "Downvote";
            case "REPLY":
                return "Reply";
            case "SAVE":
                return "Save";
            case "SHARE":
                return "Share";
            case "TOGGLE_COLLAPSE":
                return "Collapse";
            case "COLLAPSE":
                return "Collapse thread";
            case "OVERFLOW":
                return "More options";
            case "PROFILE":
                return "Open profile";
            case "HIDE":
                return "Hide";
            case "OPEN_COMMENTS":
                return "Open comments";
            case "SUBREDDIT":
                return "Open subreddit";
            default:
                return "None";
        }
    }
}
