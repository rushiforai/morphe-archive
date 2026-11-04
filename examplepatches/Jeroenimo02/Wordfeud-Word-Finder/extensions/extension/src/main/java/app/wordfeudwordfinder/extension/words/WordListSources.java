package app.wordfeudwordfinder.extension.words;

/**
 * Word list per ruleset id (spec section 6.1). The lists live in this project's repository (wordlists/, built by
 * tools/wordlists/build.py from open sources); {@link WordListManifest} is generated from wordlists/manifest.json at
 * build time. Each URL is pinned to the commit the patch was built from, on raw.githubusercontent.com, one of the
 * only hosts besides api.wordfeud.com that the patch may contact. The SHA-256 of the (gzip) file is checked after
 * download; raising the version makes clients re-download.
 *
 * <p>Rulesets without an open word list report WL-NONE.
 */
public final class WordListSources {
    static final String HOST = "https://raw.githubusercontent.com/";

    /** One downloadable word list. */
    public static final class Source {
        /** https URL of a fixed file version. */
        public final String url;
        /** Expected SHA-256 of the raw downloaded bytes, lowercase hex. */
        public final String sha256;
        /** List version; a stored file with a lower version is replaced. */
        public final int version;
        /** Charset name of the text file, e.g. "UTF-8". */
        public final String charset;

        public Source(String url, String sha256, int version, String charset) {
            this.url = url;
            this.sha256 = sha256;
            this.version = version;
            this.charset = charset;
        }

        /** Whether the file is gzip-compressed (the lists in the repository are). */
        public boolean gzip() {
            return url.endsWith(".gz");
        }
    }

    private WordListSources() {}

    /** The source for a ruleset id, or null when there is none (WL-NONE). */
    public static Source get(int rulesetId) {
        String id = Integer.toString(rulesetId);
        for (String[] e : WordListManifest.ENTRIES) {
            if (e[0].equals(id)) {
                return new Source(HOST + WordListManifest.REPOSITORY + "/" + WordListManifest.COMMIT + "/" + e[1],
                        e[2], Integer.parseInt(e[3]), "UTF-8");
            }
        }
        return null;
    }
}
