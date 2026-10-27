package app.hushfeed.verification;

/** Synthetic inline route facts only. This is not device qualification. */
public final class PineDramaInlineCoreStateContract {
    private static int checks;
    private static final class Fake implements PineDramaInlineCoreState.Facts {
        String packageName = PineDramaCoreState.PACKAGE, version = "47.5.3", route = "main";
        boolean identity = true, owned = true, row = true, expanded, collapsed = true, retained, restored;
        int actions, backs;
        @Override public String packageName() { return packageName; }
        @Override public String versionName() { return version; }
        @Override public boolean installedIdentityMatches() { return identity; }
        @Override public boolean foregroundOwned() { return owned; }
        @Override public boolean mainVisible() { return "main".equals(route); }
        @Override public boolean homeVisible() { return "home".equals(route); }
        @Override public boolean commentsVisible() { return false; }
        @Override public boolean commentsRowPresent() { return row; }
        @Override public boolean nativeOwnerRestored() { return restored; }
        @Override public boolean commentsExpanded() { return expanded; }
        @Override public boolean commentsCollapsed() { return collapsed; }
        @Override public boolean settingsOwnerRetained() { return retained; }
        @Override public boolean openSettings() { actions++; route = "home"; return true; }
        @Override public boolean openComments() { throw new AssertionError("Legacy Comments page action used"); }
        @Override public boolean toggleComments() { actions++; expanded = !expanded; collapsed = !expanded; retained = true; return true; }
        @Override public boolean back() { actions++; backs++; route = "main"; restored = true; return true; }
    }
    private static void require(boolean condition, String message) {
        checks++;
        if (!condition) throw new AssertionError(message);
    }
    private static String run(Fake fake, String action) { return PineDramaInlineCoreState.run(fake, PineDramaInlineCoreState.PROFILE, action); }
    public static void main(String[] arguments) {
        Fake fake = new Fake();
        require(run(fake, "snapshot").contains("nativeMainForeground=true") && fake.actions == 0, "Snapshot changed native state");
        String before = run(fake, "open-settings");
        require(before.contains("nativeMainForeground=true") && before.contains("settingsHomeForeground=false"), "Action invented destination");
        require(run(fake, "snapshot").contains("commentsCollapsed=true"), "Initial collapsed header missing");
        before = run(fake, "expand-comments");
        require(before.contains("actionAccepted=true") && before.contains("commentsExpanded=false"), "Expansion invented destination");
        String expanded = run(fake, "snapshot");
        require(expanded.contains("commentsExpanded=true") && expanded.contains("settingsHomeForeground=true")
                && expanded.contains("settingsOwnerRetained=true"), "Expansion left the retained main settings page");
        require(run(fake, "expand-comments").contains("actionAccepted=false"), "Repeated expansion collapsed the group");
        require(run(fake, "back-native").contains("actionAccepted=false"), "Back skipped collapse proof");
        require(run(fake, "collapse-comments").contains("actionAccepted=true") && fake.backs == 0, "Collapse used Back");
        require(run(fake, "snapshot").contains("commentsCollapsed=true"), "Collapse did not remove controls");
        require(run(fake, "collapse-comments").contains("actionAccepted=false"), "Repeated collapse expanded the group");
        require(run(fake, "back-native").contains("actionAccepted=true"), "Native Back rejected");
        require(run(fake, "snapshot").contains("nativeOwnerRestored=true") && fake.actions == 4 && fake.backs == 1, "Original native owner was not restored once");
        for (String action : new String[]{"open-comments", "back-home", "dump", "set", "tap", "follow", "send", "publish", "EXPAND-COMMENTS"}) {
            fake = new Fake();
            require(run(fake, action).contains("requestAccepted=false") && fake.actions == 0, "Legacy or unreviewed action escaped");
        }
        for (int mutation = 0; mutation < 4; mutation++) {
            fake = new Fake();
            if (mutation == 0) fake.packageName = "com.zhiliaoapp.musically";
            if (mutation == 1) fake.version = "47.4.3";
            if (mutation == 2) fake.identity = false;
            String profile = mutation == 3 ? PineDramaCoreState.PROFILE : PineDramaInlineCoreState.PROFILE;
            require(PineDramaInlineCoreState.run(fake, profile, "open-settings").contains("requestAccepted=false")
                    && fake.actions == 0, "Wrong identity/profile reached a native action");
        }
        for (String action : new String[]{"open-settings", "expand-comments", "collapse-comments", "back-native"}) {
            fake = new Fake(); fake.owned = false;
            require(run(fake, action).contains("actionAccepted=false") && fake.actions == 0, "Foreign window accepted input");
            fake = new Fake(); fake.route = "search";
            require(run(fake, action).contains("actionAccepted=false") && fake.actions == 0, "Search accepted route input");
        }
        fake = new Fake(); fake.route = "home"; fake.row = false;
        require(run(fake, "expand-comments").contains("actionAccepted=false"), "Missing section header accepted input");
        fake = new Fake(); fake.route = "home"; fake.expanded = true; fake.collapsed = false;
        require(run(fake, "collapse-comments").contains("actionAccepted=false"), "Replaced settings owner accepted collapse");
        fake.collapsed = true; fake.retained = true;
        require(run(fake, "collapse-comments").contains("actionAccepted=false"), "Conflicting adapter states accepted input");
        System.out.println("PineDrama inline core contracts passed (" + checks + " assertions). Synthetic facts only.");
    }
}
