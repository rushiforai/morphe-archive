package app.fblite.extension.video;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/** File names for what is downloaded: "Page Name-Reel-22 Oct_2026". */
final class FileNames {
    private static final int MAX_OWNER = 60;

    private FileNames() {
    }

    /** Owner-Type-d MMM_yyyy, without extension. The owner falls back to Facebook when the post's author is not known. */
    static String base(String owner, String type) {
        String who = owner == null ? "" : owner.replaceAll("[\\\\/:*?\"<>|\\p{Cntrl}]", "").replaceAll("\\s+", " ").trim();
        if (who.length() > MAX_OWNER) who = who.substring(0, MAX_OWNER).trim();
        while (who.endsWith(".")) who = who.substring(0, who.length() - 1).trim();
        if (who.isEmpty()) who = "Facebook";
        return who + "-" + type + "-" + new SimpleDateFormat("d MMM_yyyy", Locale.ENGLISH).format(new Date());
    }
}
