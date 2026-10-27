package app.hushfeed.verification;

/** Inline settings route. The v1 page/Back contract stays separate for historical evidence. */
final class PineDramaInlineCoreState {
    static final String PROFILE = "pinedrama-47.5.3-core-walk-v2";

    interface Facts extends PineDramaCoreState.Facts {
        boolean commentsExpanded();
        boolean commentsCollapsed();
        boolean settingsOwnerRetained();
        boolean toggleComments();
    }

    static String run(Facts facts, String profile, String action) {
        boolean target = PineDramaCoreState.PACKAGE.equals(facts.packageName()) && "47.5.3".equals(facts.versionName());
        boolean identity = target && facts.installedIdentityMatches();
        boolean allowed = "snapshot".equals(action) || "open-settings".equals(action)
                || "expand-comments".equals(action) || "collapse-comments".equals(action) || "back-native".equals(action);
        boolean accepted = PROFILE.equals(profile) && identity && allowed;
        boolean owned = accepted && facts.foregroundOwned();
        boolean main = owned && facts.mainVisible();
        boolean home = owned && facts.homeVisible();
        boolean row = home && facts.commentsRowPresent();
        boolean expanded = row && facts.commentsExpanded();
        boolean collapsed = row && facts.commentsCollapsed();
        boolean retained = home && facts.settingsOwnerRetained();
        boolean restored = main && facts.nativeOwnerRestored();
        boolean acted = false;
        if (accepted) {
            switch (action) {
                case "snapshot": acted = true; break;
                case "open-settings": acted = main && facts.openSettings(); break;
                case "expand-comments": acted = collapsed && !expanded && facts.toggleComments(); break;
                case "collapse-comments": acted = expanded && !collapsed && retained && facts.toggleComments(); break;
                case "back-native": acted = collapsed && !expanded && retained && facts.back(); break;
                default: break;
            }
        }
        // Observed pre-action state only. A separate snapshot must prove each destination.
        return "pine-core-v2 requestAccepted=" + accepted + " targetMatches=" + target
                + " installedIdentityMatches=" + identity + " foregroundOwned=" + owned
                + " nativeMainForeground=" + main + " settingsHomeForeground=" + home
                + " commentsExpanded=" + expanded + " commentsCollapsed=" + collapsed
                + " commentsRowPresent=" + row + " settingsOwnerRetained=" + retained
                + " nativeOwnerRestored=" + restored + " actionAccepted=" + acted;
    }

    private PineDramaInlineCoreState() { }
}
