import app.morphe.extension.chmate.TwimgImageUrls;
import java.util.Arrays;
import java.util.Objects;

public final class VerifyTwimgImageUrls {
    private static void check(String expected, String input) {
        String actual = TwimgImageUrls.canonical(input);
        if (!Objects.equals(expected, actual)) throw new AssertionError(input + " -> " + actual);
    }
    public static void main(String[] args) {
        check("https://pbs.twimg.com/media/HTVwz6DaEAAis2z.webp?format=webp&name=large",
                "https://pbs.twimg.com/media/HTVwz6DaEAAis2z?format=webp&name=large");
        String hostPath = "pbs.twimg.com/media/HUL_2IXaEAAne0T";
        String query = "?format=png&name=900x900";
        String expected = "https://" + hostPath + ".png" + query;
        for (String prefix : new String[]{"https://", "http://", "ttps://", "ttp://", "//", ""}) {
            check(expected, prefix + hostPath + query);
            if (!Arrays.equals(TwimgImageUrls.extract("画像: " + prefix + hostPath + query), new String[]{expected})) throw new AssertionError("Extraction " + prefix);
        }
        check(expected, "https://" + hostPath + "?format=png&amp;name=900x900");
        check(expected, expected);
        check(expected, "https://" + hostPath + query + "#photo");
        for (String format : new String[]{"jpg", "jpeg", "png", "gif", "webp"}) {
            check("https://" + hostPath + "." + format + "?name=orig&format=" + format,
                    "https://" + hostPath + "?name=orig&format=" + format);
        }
        check("https://" + hostPath + ".png?format=%70ng&name=small", "https://" + hostPath + "?format=%70ng&name=small");
        check(null, null);
        for (String bad : new String[]{"https://" + hostPath, "https://" + hostPath + "?format=html",
                "https://" + hostPath + "?format=png&format=gif", "https://" + hostPath + "?format=%ZZ",
                "https://evil." + hostPath + query, "https://user@" + hostPath + query,
                "https://pbs.twimg.com:443/media/abc?format=png", "ftp://" + hostPath + query,
                "https://pbs.twimg.com/media/../secret?format=png"}) check(null, bad);
        for (String bad : new String[]{"https://evil." + hostPath + query, "ftp://" + hostPath + query,
                "user@" + hostPath + query}) {
            if (TwimgImageUrls.extract(bad).length != 0) throw new AssertionError("Invalid extraction " + bad);
        }
        if (!Arrays.equals(TwimgImageUrls.extract("https://" + hostPath + query + " " + expected), new String[]{expected})) throw new AssertionError("Duplicates");
        System.out.println("PASS X query-format images: formats, size preservation, incomplete URLs, host validation and deduplication");
    }
}
