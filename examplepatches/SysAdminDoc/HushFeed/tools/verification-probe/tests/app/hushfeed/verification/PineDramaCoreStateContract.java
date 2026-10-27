package app.hushfeed.verification;

/** Synthetic route facts only. No device execution or native behavior is asserted. */
public final class PineDramaCoreStateContract {
    private static int checks;
    private static final class Fake implements PineDramaCoreState.Facts {
        String packageName = PineDramaCoreState.PACKAGE, version = "47.5.3", route = "main";
        boolean identity = true, owned = true, row = true, restored;
        int actions;
        @Override public String packageName() { return packageName; }
        @Override public String versionName() { return version; }
        @Override public boolean installedIdentityMatches() { return identity; }
        @Override public boolean foregroundOwned() { return owned; }
        @Override public boolean mainVisible() { return "main".equals(route); }
        @Override public boolean homeVisible() { return "home".equals(route); }
        @Override public boolean commentsVisible() { return "comments".equals(route); }
        @Override public boolean commentsRowPresent() { return row; }
        @Override public boolean nativeOwnerRestored() { return restored; }
        @Override public boolean openSettings() { actions++; route = "home"; return true; }
        @Override public boolean openComments() { actions++; route = "comments"; return true; }
        @Override public boolean back() { actions++; route = "comments".equals(route) ? "home" : "main"; restored = "main".equals(route); return true; }
    }
    private static void require(boolean condition, String message) {
        checks++;
        if (!condition) throw new AssertionError(message);
    }
    private static String run(Fake fake, String action) { return PineDramaCoreState.run(fake, PineDramaCoreState.PROFILE, action); }
    public static void main(String[] arguments) {
        Fake fake = new Fake();
        require(run(fake, "snapshot").contains("nativeMainForeground=true"), "Native main snapshot missing");
        require(fake.actions == 0, "Snapshot changed native state");
        String before = run(fake, "open-settings");
        require(before.contains("nativeMainForeground=true") && before.contains("settingsHomeForeground=false"), "Action response invented its destination");
        require(run(fake, "snapshot").contains("settingsHomeForeground=true"), "Settings destination missing");
        require(run(fake, "open-comments").contains("actionAccepted=true"), "Owned Comments menu not used");
        require(run(fake, "snapshot").contains("commentsForeground=true"), "Comments destination missing");
        require(run(fake, "back-home").contains("actionAccepted=true"), "Comments Back rejected");
        require(run(fake, "snapshot").contains("settingsHomeForeground=true"), "Back did not restore home");
        require(run(fake, "back-native").contains("actionAccepted=true"), "Home Back rejected");
        require(run(fake, "snapshot").contains("nativeOwnerRestored=true"), "Original native owner not restored");
        require(fake.actions == 4, "Wrong number of route actions");
        for (String action : new String[]{"dump","set","tap","comments","follow","send","publish","OPEN-SETTINGS","open-settings "}) {
            fake = new Fake();
            require(run(fake, action).contains("requestAccepted=false") && fake.actions == 0, "Unsupported global/UI action escaped");
        }
        for (int mutation = 0; mutation < 4; mutation++) {
            fake = new Fake();
            if (mutation == 0) fake.packageName = "com.zhiliaoapp.musically";
            if (mutation == 1) fake.version = "47.4.3";
            if (mutation == 2) fake.identity = false;
            String profile = mutation == 3 ? "pinedrama-47.5.3-capabilities-v1" : PineDramaCoreState.PROFILE;
            require(PineDramaCoreState.run(fake, profile, "open-settings").contains("requestAccepted=false") && fake.actions == 0,
                    "Wrong package/version/APK/profile reached a UI action");
        }
        for (String action : new String[]{"open-settings","open-comments","back-home","back-native"}) {
            fake = new Fake(); fake.owned = false;
            require(run(fake, action).contains("actionAccepted=false") && fake.actions == 0, "Foreign window accepted input");
            fake = new Fake(); fake.route = "unreviewed";
            require(run(fake, action).contains("actionAccepted=false") && fake.actions == 0, "Unreviewed route accepted input");
        }
        fake = new Fake(); fake.route = "home"; fake.row = false;
        require(run(fake, "open-comments").contains("actionAccepted=false") && fake.actions == 0, "Missing owned menu row accepted input");
        fake = new Fake();
        require(run(fake, "back-native").contains("actionAccepted=false") && fake.actions == 0, "Back from native main escaped the app");
        System.out.println("PineDrama core route contracts passed (" + checks + " assertions). Synthetic facts only.");
    }
}
