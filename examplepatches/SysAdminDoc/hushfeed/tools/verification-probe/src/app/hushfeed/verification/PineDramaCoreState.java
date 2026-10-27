package app.hushfeed.verification;

/** Small route contract, separate from the read-only capability inspection and global UI probe. */
final class PineDramaCoreState {
    static final String PROFILE = "pinedrama-47.5.3-core-walk-v1";
    static final String PACKAGE = "com.ss.android.ttmd.video";
    static final String MAIN = "com.ss.android.ugc.aweme.main.MainActivity";
    static final String SETTINGS = PineDramaCapabilities.SETTINGS_ACTIVITY;

    interface Facts {
        String packageName();
        String versionName();
        boolean installedIdentityMatches();
        boolean foregroundOwned();
        boolean mainVisible();
        boolean homeVisible();
        boolean commentsVisible();
        boolean commentsRowPresent();
        boolean nativeOwnerRestored();
        boolean openSettings();
        boolean openComments();
        boolean back();
    }

    static String run(Facts facts, String profile, String action) {
        boolean target = PACKAGE.equals(facts.packageName()) && "47.5.3".equals(facts.versionName());
        boolean identity = target && facts.installedIdentityMatches();
        boolean allowed = "snapshot".equals(action) || "open-settings".equals(action)
                || "open-comments".equals(action) || "back-home".equals(action) || "back-native".equals(action);
        boolean accepted = PROFILE.equals(profile) && identity && allowed;
        boolean owned = accepted && facts.foregroundOwned();
        boolean main = owned && facts.mainVisible();
        boolean home = owned && facts.homeVisible();
        boolean comments = owned && facts.commentsVisible();
        boolean row = home && facts.commentsRowPresent();
        boolean restored = main && facts.nativeOwnerRestored();
        boolean acted = false;
        if (accepted) {
            switch (action) {
                case "snapshot": acted = true; break;
                case "open-settings": acted = main && facts.openSettings(); break;
                case "open-comments": acted = row && facts.openComments(); break;
                case "back-home": acted = comments && facts.back(); break;
                case "back-native": acted = home && facts.back(); break;
                default: break;
            }
        }
        // These are the observed pre-action route and acceptance, never an inferred destination.
        return "pine-core-v1 requestAccepted=" + accepted + " targetMatches=" + target
                + " installedIdentityMatches=" + identity + " foregroundOwned=" + owned
                + " nativeMainForeground=" + main + " settingsHomeForeground=" + home
                + " commentsForeground=" + comments + " commentsRowPresent=" + row
                + " nativeOwnerRestored=" + restored + " actionAccepted=" + acted;
    }

    private PineDramaCoreState() { }
}
