package app.morphe.extension.tiktok;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import org.junit.Test;

/**
 * Holds the payload to the Android 17 audit, so the next write or the next address is read
 * before it ships rather than after a phone stops doing what it used to.
 *
 * <p>Patched apps inherit TikTok's target, 36 today. Three of Android 17's changes reach injected
 * code when that becomes 37. A {@code static final} field stops being writable through reflection
 * and JNI. Certificate Transparency is enforced for every host unless a network security config
 * opts a domain out, and this bundle ships no resources at all, so there would be nothing to opt
 * out in. Background audio is silenced without a visible activity or a media foreground service.
 *
 * <p>The audit on 2026-09-15 found nothing to change, which is a claim worth keeping true rather
 * than a conclusion to file away. Both lists below carry the verdict for every row, and the
 * counts are asserted exactly: a new write or a new address fails here, with the reason the old
 * ones were judged safe printed beside it.
 *
 * <p>Not covered here, because source text cannot show it: what the three patches that emit
 * {@code sput} write into. All three take their field from an instruction already in TikTok's own
 * method and two of them refuse to patch unless the host writes that field itself, which is what
 * says the field is not final in the shipped dex. {@code ResumeVideoAfterScrollPatch},
 * {@code PlaybackSpeedPatch} and {@code DisableTelemetryPatch} are the three, and
 * {@code ProgressStore} carries the check.
 */
public class AndroidTargetChangesGuardTest {
    /** A reflective write, and why Android 17 leaves it alone. */
    private static final class ReviewedWrites {
        final String file;
        final int writes;
        final String verdict;

        ReviewedWrites(String file, int writes, String verdict) {
            this.file = file;
            this.writes = writes;
            this.verdict = verdict;
        }
    }

    /**
     * Every reflective field write in the payload, with what it writes to.
     *
     * <p>Safe means the receiver is an object, so the field is an instance field whatever its
     * modifiers say: Android 17 changed what a {@code static final} field accepts, and an
     * instance field is not one.
     */
    private static final List<ReviewedWrites> REVIEWED_WRITES = Arrays.asList(
            new ReviewedWrites("comment/CommentTools.java", 1,
                    "safe: writes pollInfo on a comment model instance, and skips static fields "
                            + "where it reads them"),
            new ReviewedWrites("featuregatelab/StructuredConfigController.java", 3,
                    "safe: writes an instance this class just built with newInstance, and "
                            + "instanceFields() and isEditable() both drop Modifier.isStatic "
                            + "before anything is written"),
            new ReviewedWrites("feed/SensitiveWarnings.java", 2,
                    "safe: writes the mask and the Aweme the host handed it, and already catches "
                            + "a refusal and reports it as a diagnostic row"),
            new ReviewedWrites("feedfilter/FeedItemsFilter.java", 2,
                    "safe: writes mItems and friendFeedData on the response instance the hook "
                            + "was given"));

    /**
     * Addresses written into the payload, and what is done with them.
     *
     * <p>Nothing here is fetched. Every URL the transport opens arrives from TikTok's own model
     * objects, is required to be https, and is re-resolved and re-checked on every redirect hop,
     * so there is no host list in this repository to opt out of Certificate Transparency even if
     * one were wanted. A CT refusal arrives as an SSLHandshakeException, which is not in
     * MediaBudget.isRetryableTransport, so it is not retried, and RemoteMedia names the exception
     * class in the message a reader sees.
     */
    private static final Map<String, String> REVIEWED_ADDRESSES = new LinkedHashMap<>();

    static {
        REVIEWED_ADDRESSES.put("https://www.tiktok.com/@",
                "not fetched: built for an ACTION_SEND extra handed to another installed app");
        REVIEWED_ADDRESSES.put("https://www.tiktok.com/music/x-",
                "not fetched: built for the clipboard");
        REVIEWED_ADDRESSES.put("https://github.com/SysAdminDoc/hushfeed",
                "not fetched: the source link on the About row, opened in the reader's browser");
        REVIEWED_ADDRESSES.put("https://",
                "not a host: the scheme itself, put in front of an address that arrived without "
                        + "one before a browser is asked to open it, and asked about before a "
                        + "share link is reused");
        REVIEWED_ADDRESSES.put("https://github.com/SysAdminDoc/hushfeed/blob/main/LICENSE",
                "not fetched: the button beside the notice, opened in the reader's browser");
        REVIEWED_ADDRESSES.put("https://github.com/MorpheApp/morphe-patches",
                "not fetched: printed inside the notice the Licenses row shows");
        REVIEWED_ADDRESSES.put("https://github.com/MorpheApp/morphe-patches-library",
                "not fetched: printed inside the notice the Licenses row shows");
        REVIEWED_ADDRESSES.put("https://www.gnu.org/licenses/gpl-3.0.html",
                "not fetched: printed inside the notice the Licenses row shows");
    }

    /** Where a java.lang.reflect.Field lands in a local, a field or a parameter. */
    private static final Pattern FIELD_NAMED =
            Pattern.compile("\\bField\\s+(\\w+)\\s*[=,;)]");

    private static final Pattern ADDRESS =
            Pattern.compile("\"(https?://[^\"]*)\"");

    @Test
    public void everyReflectiveWriteInThePayloadHasBeenReadAgainstAndroidSeventeen()
            throws IOException {
        List<Path> sources = payloadSources();
        assertTrue("no payload sources were found to check", sources.size() > 100);

        Map<String, Integer> found = new LinkedHashMap<>();
        for (Path source : sources) {
            String text = read(source);
            int writes = countReflectiveWrites(text);
            if (writes > 0) found.put(relativeName(source), writes);
        }

        Map<String, Integer> reviewed = new LinkedHashMap<>();
        for (ReviewedWrites row : REVIEWED_WRITES) reviewed.put(row.file, row.writes);

        assertEquals("the reflective writes in the payload are not the ones that were read "
                        + "against Android 17. Verdicts on the reviewed ones: " + verdicts()
                        + ". A new write needs its own: a write to a static final field stops "
                        + "working when TikTok targets 37",
                reviewed, found);
    }

    /**
     * A regex that matched nothing would pass the case above without reading a line of it, so the
     * count it is asserting is itself asserted here.
     */
    @Test
    public void theWriteCountIsTheOneTheInventoryWasBuiltFrom() throws IOException {
        int total = 0;
        for (Path source : payloadSources()) {
            total += countReflectiveWrites(read(source));
        }
        int reviewed = REVIEWED_WRITES.stream().mapToInt(row -> row.writes).sum();
        assertEquals("the reviewed total no longer matches what the scan finds", reviewed, total);
        assertEquals("the audit counted eight reflective writes on 2026-09-15", 8, total);
    }

    @Test
    public void everyAddressWrittenIntoThePayloadHasBeenReadAgainstCertificateTransparency()
            throws IOException {
        Set<String> found = new HashSet<>();
        for (Path source : payloadSources()) {
            String text = withoutComments(read(source));
            Matcher address = ADDRESS.matcher(text);
            while (address.find()) {
                // A notice is carried as one string literal per line, so the address at the end
                // of a line arrives with the newline escape still on it. Reviewing
                // "https://example/\n" and "https://example/" as two different addresses would
                // be silly, and the second is the one a reader recognises.
                found.add(address.group(1).replaceAll("(?:\\\\n)+$", ""));
            }
        }

        // Both directions. Asserting only that nothing unreviewed turned up would pass just as
        // happily if the scan found nothing at all, which is what a broken pattern looks like.
        assertEquals("the addresses written into the payload are not the ones that were read "
                        + "against Certificate Transparency. Nothing here fetches a hardcoded host "
                        + "today: every URL the transport opens comes from TikTok's own model "
                        + "objects. The bundle ships no resources either, so a host that needed a "
                        + "network security config opt-out would have nowhere to be opted out. "
                        + "Verdicts on the reviewed ones: " + REVIEWED_ADDRESSES,
                new TreeSet<>(REVIEWED_ADDRESSES.keySet()), new TreeSet<>(found));
    }

    /** Files.readString is not on the Android bootclasspath this module compiles against. */
    private static String read(Path source) throws IOException {
        return new String(Files.readAllBytes(source), StandardCharsets.UTF_8);
    }

    /** Writes through a java.lang.reflect.Field, which is what Android 17 changed. */
    static int countReflectiveWrites(String rawSource) {
        String source = withoutComments(rawSource);
        Set<String> fields = new HashSet<>();
        Matcher named = FIELD_NAMED.matcher(source);
        while (named.find()) fields.add(named.group(1));
        if (fields.isEmpty()) return 0;

        int writes = 0;
        for (String field : fields) {
            Matcher write = Pattern.compile(
                    "\\b" + Pattern.quote(field) + "\\.set(?:Boolean|Byte|Char|Double|Float|Int"
                            + "|Long|Short)?\\s*\\(").matcher(source);
            while (write.find()) writes++;
        }
        return writes;
    }

    /**
     * Blanks comments so a write named in prose, or the repository link every file header
     * carries, is not read as code. String literals are left alone, because the address scan
     * above is looking for exactly those. Lengths are preserved so nothing else shifts.
     */
    static String withoutComments(String source) {
        StringBuilder out = new StringBuilder(source.length());
        int index = 0;
        while (index < source.length()) {
            char current = source.charAt(index);

            // Step over a literal whole. Every address in this payload has a "//" in it, so a
            // scanner that does not know where a string starts reads "https://www.tiktok.com/@"
            // as a line comment and blanks the rest of the line. That is not a hypothetical: the
            // address case passed on an empty result until it was made to assert both directions.
            if (current == '"' || current == '\'') {
                char quote = current;
                out.append(current);
                index++;
                while (index < source.length()) {
                    char inside = source.charAt(index);
                    out.append(inside);
                    index++;
                    if (inside == '\\' && index < source.length()) {
                        out.append(source.charAt(index));
                        index++;
                        continue;
                    }
                    if (inside == quote || inside == '\n') break;
                }
                continue;
            }

            if (current == '/' && index + 1 < source.length()) {
                char next = source.charAt(index + 1);
                if (next == '/') {
                    while (index < source.length() && source.charAt(index) != '\n') {
                        out.append(' ');
                        index++;
                    }
                    continue;
                }
                if (next == '*') {
                    int end = source.indexOf("*/", index + 2);
                    int stop = end < 0 ? source.length() : end + 2;
                    for (int blank = index; blank < stop; blank++) {
                        out.append(source.charAt(blank) == '\n' ? '\n' : ' ');
                    }
                    index = stop;
                    continue;
                }
            }
            out.append(current);
            index++;
        }
        return out.toString();
    }

    private static String verdicts() {
        return REVIEWED_WRITES.stream()
                .map(row -> row.file + " (" + row.verdict + ")")
                .collect(Collectors.joining("; "));
    }

    private static String relativeName(Path source) {
        String name = source.toString().replace('\\', '/');
        int at = name.indexOf("/app/morphe/extension/tiktok/");
        if (at >= 0) return name.substring(at + "/app/morphe/extension/tiktok/".length());
        at = name.indexOf("/app/morphe/extension/shared/");
        if (at >= 0) return "shared/" + name.substring(at + "/app/morphe/extension/shared/".length());
        return name;
    }

    /** Both trees whose Java ends up in the payload TikTok runs. */
    private static List<Path> payloadSources() throws IOException {
        List<Path> roots = new ArrayList<>();
        for (String candidate : new String[]{
                "src/main/java",
                "extensions/tiktok/src/main/java",
                "../shared/library/src/main/java",
                "extensions/shared/library/src/main/java"}) {
            java.io.File directory = new java.io.File(candidate);
            if (directory.isDirectory()) roots.add(directory.toPath());
        }
        assertTrue("no payload source tree was found from " + new java.io.File(".").getAbsolutePath(),
                roots.size() >= 2);

        List<Path> sources = new ArrayList<>();
        for (Path root : roots) {
            try (Stream<Path> walk = Files.walk(root)) {
                sources.addAll(walk.filter(path -> path.getFileName().toString().endsWith(".java"))
                        .sorted()
                        .collect(Collectors.toList()));
            }
        }
        return sources;
    }
}
