package app.hushmessenger.extension;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * The Report a problem row's GitHub link: a new issue with the versions, the phone and the controls that are on
 * filled in, and the two questions left for the person to answer. The repository has no issue form, so it all goes in
 * the body and the title is left for them.
 *
 * <p>It carries only what a report needs: version names, the Messenger build it was patched from (which Spoof package
 * version hides from Android's version code), the phone's maker and model, Android's version, whether
 * changes are paused or in safe mode, the English titles of the controls that are on, and for a crash in the last three
 * days the exception's class names and top code frames (never its message). No account, serial number, package name,
 * file path or log line goes in. The text is for the maintainer, so it stays English whatever the
 * phone's language. The whole address is held to MAX_LENGTH characters: the list of controls is shortened first,
 * ending with how many were left out, so the questions always fit.
 */
final class ProblemReport {
    static final String NEW_ISSUE = "https://github.com/SysAdminDoc/HushMessenger/issues/new";
    /** The longest address handed to the browser. GitHub and browsers take more, but not much more. */
    static final int MAX_LENGTH = 6000;
    /** No single fact gets longer than this, so a strange model name can't crowd out the questions. */
    static final int MAX_FACT = 120;
    static final String WHAT_HAPPENED = "What happened:";
    static final String WHAT_EXPECTED = "What I expected:";

    private ProblemReport() { }

    /** The Messenger build the patch started from, as HostScreens.originalBuild carries it: name, code and mapping. */
    static final Pattern ORIGINAL =Pattern.compile("([0-9][0-9A-Za-z.]{0,31})\\|([1-9][0-9]{0,9})\\|([0-9A-Za-z]{1,16})");

    /**
     * "584.1.0.61.98 (346816935, base mapping)": the build the patch started from, which Android's own version code
     * stops saying once Spoof package version is in. "unknown" for a build patched before the patch wrote it down or a
     * value that doesn't parse, never a guess from the installed version.
     */
    static String patchedFrom(String original, boolean preview) {
        if (preview) return "none, UI preview";
        Matcher parts = ORIGINAL.matcher(original == null ? "" : original);
        if (!parts.matches()) return "unknown";
        return parts.group(1) + " (" + parts.group(2) + ", " + parts.group(3) + " mapping)";
    }

    /** What the report says about this install. Built from the phone by SettingsActivity, or by hand in a test. */
    static final class Facts {
        final String hushVersion, messengerVersion, patchedFrom, manufacturer, model, androidRelease;
        final long messengerCode;
        final int sdk;
        final boolean paused, safeMode;
        final List<String> controlsOn;
        final String galleryOutcome;
        final String lastCrash;

        Facts(String hushVersion, String messengerVersion, long messengerCode, String patchedFrom, String manufacturer,
                String model, String androidRelease, int sdk, boolean paused, boolean safeMode, List<String> controlsOn) {
            this(hushVersion, messengerVersion, messengerCode, patchedFrom, manufacturer, model, androidRelease, sdk,
                paused, safeMode, controlsOn, "NOT_USED");
        }

        Facts(String hushVersion, String messengerVersion, long messengerCode, String patchedFrom, String manufacturer,
                String model, String androidRelease, int sdk, boolean paused, boolean safeMode, List<String> controlsOn,
                String galleryOutcome) {
            this(hushVersion, messengerVersion, messengerCode, patchedFrom, manufacturer, model, androidRelease, sdk,
                paused, safeMode, controlsOn, galleryOutcome, "");
        }

        Facts(String hushVersion, String messengerVersion, long messengerCode, String patchedFrom, String manufacturer,
                String model, String androidRelease, int sdk, boolean paused, boolean safeMode, List<String> controlsOn,
                String galleryOutcome, String lastCrash) {
            this.hushVersion = clean(hushVersion);
            this.messengerVersion = clean(messengerVersion);
            this.messengerCode = messengerCode;
            this.patchedFrom = clean(patchedFrom);
            this.manufacturer = clean(manufacturer);
            this.model = clean(model);
            this.androidRelease = clean(androidRelease);
            this.sdk = sdk;
            this.paused = paused;
            this.safeMode = safeMode;
            List<String> titles = new ArrayList<>();
            if (controlsOn != null) for (String title : controlsOn) if (!clean(title).isEmpty()) titles.add(clean(title));
            this.controlsOn = Collections.unmodifiableList(titles);
            // Only fixed categories are included. Provider URIs and exception text never enter a report.
            this.galleryOutcome = galleryCategory(galleryOutcome);
            // Class names and code frames only, as LastCrash saved them. Cleaned again so nothing else can ride along.
            this.lastCrash = LastCrash.clean(lastCrash);
        }
    }

    private static String galleryCategory(String value) {
        if (value == null) return "NOT_USED";
        switch (value) {
            case "PICKER_MISSING": case "COMPONENT_MISSING": case "LAUNCH_FAILED": case "RESULT_INVALID":
            case "RESULT_REVOKED": case "RESULT_TIMEOUT": case "RESULT_BUSY": case "CANCELED": case "SELECTED":
                return value;
            default: return "NOT_USED";
        }
    }

    /** "HushMessenger 0.23.0 on Messenger 582.0.0.33.110 (346415686)". */
    static String versionsLine(Facts facts) {
        String code = facts.messengerCode > 0 ? " (" + facts.messengerCode + ")" : "";
        return "HushMessenger " + orUnknown(facts.hushVersion) + " on Messenger " + orUnknown(facts.messengerVersion) + code;
    }

    /** "samsung SM-S901U, Android 16 (SDK 36)". The maker is left out when the model already starts with it. */
    static String phoneLine(Facts facts) {
        String maker = facts.manufacturer, model = facts.model;
        String phone = maker.isEmpty() || model.toLowerCase(Locale.ROOT).startsWith(maker.toLowerCase(Locale.ROOT)) ? model : maker + " " + model;
        if (phone.trim().isEmpty()) phone = "unknown phone";
        return phone.trim() + ", Android " + orUnknown(facts.androidRelease) + " (SDK " + facts.sdk + ")";
    }

    /** The controls line with the first [shown] titles, and how many more there are. */
    static String controlsLine(List<String> titles, int shown) {
        if (titles.isEmpty()) return "Controls on: none";
        int kept = Math.max(0, Math.min(shown, titles.size()));
        StringBuilder line = new StringBuilder("Controls on: ");
        for (int i = 0; i < kept; i++) line.append(i > 0 ? ", " : "").append(titles.get(i));
        int left = titles.size() - kept;
        if (left > 0) line.append(kept > 0 ? ", and " : "").append(left).append(" more");
        return line.toString();
    }

    /** Everything the report says: the versions, the phone, any pause, the controls, then the two questions. */
    static String body(Facts facts) { return body(facts, facts.controlsOn.size()); }

    static String body(Facts facts, int shown) {
        StringBuilder body = new StringBuilder()
            .append("Versions: ").append(versionsLine(facts)).append('\n')
            .append("Patched from: ").append(orUnknown(facts.patchedFrom)).append('\n')
            .append("Phone: ").append(phoneLine(facts)).append('\n');
        if (facts.safeMode) body.append("Safe mode: on\n");
        if (facts.paused) body.append("Pause all changes: on\n");
        if (!"NOT_USED".equals(facts.galleryOutcome)) body.append("Gallery result: ").append(facts.galleryOutcome).append('\n');
        if (!facts.lastCrash.isEmpty()) body.append("Last crash: ").append(facts.lastCrash).append('\n');
        return body.append(controlsLine(facts.controlsOn, shown)).append("\n\n")
            .append(WHAT_HAPPENED).append("\n\n\n").append(WHAT_EXPECTED).append("\n\n").toString();
    }

    /** The new-issue address with [facts] filled in, at most MAX_LENGTH characters. Control titles come off the end first. */
    static String issueUrl(Facts facts) {
        for (int shown = facts.controlsOn.size(); shown >= 0; shown--) {
            String url = url(body(facts, shown));
            if (url.length() <= MAX_LENGTH) return url;
        }
        // Not reached in practice: five free-text facts of 120 characters, nine each once encoded, come to 5,400, and the
        // patched-from line is a short ASCII line patchedFrom built. A crash line adds at most 1,200 more, and only when
        // every free-text fact is at its longest does this run. Kept so odd facts can't push the questions out.
        return url(WHAT_HAPPENED + "\n\n\n" + WHAT_EXPECTED + "\n\n");
    }

    private static String url(String body) {
        return NEW_ISSUE + "?title=&body=" + encode(body);
    }

    /** Percent-encoded for a query, a space as %20 rather than the + a form would send. */
    static String encode(String value) {
        try {
            return URLEncoder.encode(value, "UTF-8").replace("+", "%20");
        } catch (UnsupportedEncodingException impossible) {
            throw new IllegalStateException(impossible);
        }
    }

    private static String orUnknown(String value) { return value.isEmpty() ? "unknown" : value; }

    /** One line with no control characters, so a title or model name can't add lines of its own, and no longer than MAX_FACT. */
    static String clean(String value) {
        if (value == null) return "";
        String line = value.replaceAll("[\\p{Cc}\\p{Cf}]+", " ").replaceAll("\\s+", " ").trim();
        if (line.length() <= MAX_FACT) return line;
        // Never split a surrogate pair, which would leave half an emoji to encode.
        int end = Character.isHighSurrogate(line.charAt(MAX_FACT - 1)) ? MAX_FACT - 1 : MAX_FACT;
        return line.substring(0, end);
    }
}
