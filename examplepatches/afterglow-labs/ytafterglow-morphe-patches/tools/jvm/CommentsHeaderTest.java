package app.afterglow.extension.interfaceui;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.AfterglowPrefs;

public final class CommentsHeaderTest {
    private static int checks;
    private static void check(boolean value, String label) { checks++; if (!value) throw new AssertionError(label); }
    public static void main(String[] args) {
        String[] comments = {"comment-item-section", "PAwatch_mobile_top_level_comments",
                "engagement-panel-comments-section", "shorts-comments-panel"};
        AfterglowPrefs.mode = 1;
        for (String panel : comments) check(!CommentsHeaderPolicy.keepVisible(panel), "uninstalled remains native: " + panel);
        check(AfterglowPrefs.reads == 0, "uninstalled does not read preference");
        InstalledTweaks.installed = true;
        for (int mode : new int[]{0, 2, -1, 3}) {
            AfterglowPrefs.mode = mode;
            for (String panel : comments) check(!CommentsHeaderPolicy.keepVisible(panel), "only pinned mode redirects collapse: " + mode);
        }
        AfterglowPrefs.mode = 1;
        for (String panel : comments) check(CommentsHeaderPolicy.keepVisible(panel), "pinned known comments identity: " + panel);
        int reads = AfterglowPrefs.reads;
        for (String panel : new String[]{null, "", "engagement-panel-timeline-view-consolidated", "PAmodern_transcript_view",
                "comment-item-section-replies", "engagement-panel-shopping", "comment-item-section "})
            check(!CommentsHeaderPolicy.keepVisible(panel), "unknown or noncomments panel stays native: " + panel);
        check(reads == AfterglowPrefs.reads, "unrelated panels never read own preference");
        check(CommentsHeaderPolicy.keepVisible(comments[0]) && !CommentsHeaderPolicy.keepVisible("PAmodern_transcript_view")
                && CommentsHeaderPolicy.keepVisible(comments[1]), "current identity changes are not cached across reused panels");
        AfterglowPrefs.fail = true;
        for (String panel : comments) check(!CommentsHeaderPolicy.keepVisible(panel), "storage failure keeps native collapse");
        check(Afterglow.errors == 1, "storage failure logged once");
        AfterglowPrefs.fail = false;
        check(CommentsHeaderPolicy.keepVisible(comments[0]), "storage recovery does not poison policy class");
        AfterglowPrefs.mode = 0;
        check(!CommentsHeaderPolicy.keepVisible(comments[0]), "reset immediately restores native collapse");
        System.out.println("PASS " + checks + " comments header identity/ownership/fallback checks");
    }
}
