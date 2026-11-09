package com.anderson.applemusic.one.media;

import java.util.ArrayList;
import java.util.List;

/**
 * Plain-JVM test for the name normalisation shared by the library, the "Ver tudo" browser
 * and the search ({@link CatalogResolver}); no Android class is touched.
 */
public final class CatalogResolverTest {

    private static int checks;

    public static void main(String[] args) {
        lastSegment();
        normalizeTitles();
        stripQualifiers();
        pick();
        System.out.println("CatalogResolverTest: OK (" + checks + " checks)");
    }

    private static void lastSegment() {
        check("segment browse id", "albums".equals(
                CatalogResolver.lastSegment("__AUTO_ROOT__/library/albums")));
        check("segment persistent id", "6-123".equals(
                CatalogResolver.lastSegment("library/artist/6-123")));
        check("segment without slash", "songs".equals(CatalogResolver.lastSegment("songs")));
        check("segment null", "".equals(CatalogResolver.lastSegment(null)));
    }

    private static void normalizeTitles() {
        check("single suffix", "a capella".equals(
                CatalogResolver.normalize("A Capella - Single")));
        check("ep suffix", "a capella".equals(CatalogResolver.normalize("A Capella - EP")));
        check("case and spaces", "back in black".equals(
                CatalogResolver.normalize("  Back   In  Black  ")));
        check("no suffix", "a capella".equals(CatalogResolver.normalize("A Capella")));
        check("empty", "".equals(CatalogResolver.normalize(null)));
    }

    private static void stripQualifiers() {
        check("deluxe", "Back In Black".equals(
                CatalogResolver.stripQualifiers("Back In Black (Deluxe Version)")));
        check("remastered", "Back In Black".equals(
                CatalogResolver.stripQualifiers("Back In Black [Remastered]")));
        check("stacked", "Foo".equals(
                CatalogResolver.stripQualifiers("Foo (Deluxe) [Remastered]")));
        check("unbalanced", "Foo (Deluxe".equals(
                CatalogResolver.stripQualifiers("Foo (Deluxe")));
        check("empty", "".equals(CatalogResolver.stripQualifiers(null)));
    }

    private static void pick() {
        List<CatalogSearch.Result> items = new ArrayList<CatalogSearch.Result>();
        items.add(new CatalogSearch.Result("1", "Álbum", "Back In Black", "AC/DC", null));
        items.add(new CatalogSearch.Result("2", "Álbum", "Greatest Hits", "Other", null));
        items.add(new CatalogSearch.Result("3", "Álbum", "Greatest Hits", "AC/DC", null));

        check("exact", "1".equals(pick(items, "Back In Black", "AC/DC").id));
        check("single suffix", "1".equals(pick(items, "Back In Black - Single", "AC/DC").id));
        check("ep suffix", "1".equals(pick(items, "Back In Black - EP", "AC/DC").id));
        check("deluxe qualifier", "1".equals(
                pick(items, "Back In Black (Deluxe Version)", "AC/DC").id));
        check("bracket qualifier", "1".equals(
                pick(items, "Back In Black [Remastered]", "AC/DC").id));
        check("same title, artist wins", "3".equals(
                pick(items, "Greatest Hits", "AC/DC").id));
        check("title-only fallback", "2".equals(pick(items, "Greatest Hits", "Nobody").id));
        check("no artist", "1".equals(pick(items, "Back In Black", "").id));
        check("miss", pick(items, "Rock or Bust", "AC/DC") == null);
        check("empty", pick(new ArrayList<CatalogSearch.Result>(), "Back In Black", "AC/DC")
                == null);
    }

    private static CatalogSearch.Result pick(List<CatalogSearch.Result> items, String title,
                                             String artist) {
        return CatalogResolver.pick(items, title, artist);
    }

    private static void check(String label, boolean ok) {
        checks++;
        if (!ok) throw new AssertionError("FAILED: " + label);
    }
}
