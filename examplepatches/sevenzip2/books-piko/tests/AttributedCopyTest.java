import app.morphe.extension.playbooks.copy.AttributedCopy;
import java.util.Arrays;
import java.util.Collections;

public final class AttributedCopyTest {
    private static void equal(String expected, String actual) {
        if (!expected.equals(actual)) throw new AssertionError("Expected: " + expected + "\nActual: " + actual);
    }

    public static void main(String[] args) {
        String text = "www.sallmanart.org에서\n두 번째 문장 🌱";
        if (AttributedCopy.shouldAttribute(10, 100, 1) || AttributedCopy.shouldAttribute(0, 0, 2)) {
            throw new AssertionError("Permitted copies must remain plain text");
        }
        if (!AttributedCopy.shouldAttribute(0, 0, 1) || !AttributedCopy.shouldAttribute(0, 100, 1) ||
                !AttributedCopy.shouldAttribute(-1, 100, 1) || !AttributedCopy.shouldAttribute(1, 1, 0)) {
            throw new AssertionError("Blocked, exhausted and unknown quotas require attribution");
        }
        equal(text, AttributedCopy.copyText(text, null, false));
        AttributedCopy.remember("book-a", "지금 우리에게 예수는 누구인가?", Arrays.asList("정경일", "공저자"));
        equal(text + "\n\n- <지금 우리에게 예수는 누구인가?>, 정경일 · 공저자 - Google Play 북\n"
                + "https://play.google.com/store/books/details?id=book-a", AttributedCopy.format(text, "book-a"));
        equal(AttributedCopy.format(text, "book-a"), AttributedCopy.copyText(text, "book-a", true));

        // Changing books must never reuse the previous book's attribution.
        equal("문장\n\n- Google Play 북\nhttps://play.google.com/store/books/details?id=uploaded%3Aa+b",
                AttributedCopy.format("문장", "uploaded:a b"));
        AttributedCopy.remember("book-b", "다른 책", Collections.emptyList());
        equal("문장\n\n- <다른 책> - Google Play 북\nhttps://play.google.com/store/books/details?id=book-b",
                AttributedCopy.format("문장", "book-b"));
        AttributedCopy.remember("book-b", "수정된 제목", null);
        equal("문장\n\n- <수정된 제목> - Google Play 북\nhttps://play.google.com/store/books/details?id=book-b",
                AttributedCopy.format("문장", "book-b"));
        for (int i = 0; i < 129; i++) AttributedCopy.remember("extra-" + i, "제목", null);
        equal("문장\n\n- Google Play 북\nhttps://play.google.com/store/books/details?id=book-a",
                AttributedCopy.format("문장", "book-a"));

        // Regression: an existing offline book may never pass through a model constructor hook.
        // It must still get its title and authors by resolving its ID when the user copies.
        final String reportedId = "utJSEQAAQBAJ";
        final int[] lookups = {0};
        AttributedCopy.MetadataLookup database = id -> {
            equal(reportedId, id);
            lookups[0]++;
            return new AttributedCopy.Metadata("현재 읽는 책", Arrays.asList("작가 A", "작가 B"));
        };
        String expectedAttribution = text + "\n\n- <현재 읽는 책>, 작가 A · 작가 B - Google Play 북\n"
                + "https://play.google.com/store/books/details?id=" + reportedId;
        equal(text, AttributedCopy.copyText(text, reportedId, false, database));
        if (lookups[0] != 0) throw new AssertionError("Plain copies must not query metadata");
        equal(expectedAttribution, AttributedCopy.copyText(text, reportedId, true, database));
        for (int i = 0; i < 129; i++) AttributedCopy.remember("other-" + i, "다른 책", null);
        equal(expectedAttribution, AttributedCopy.copyText(text, reportedId, true, database));
        if (lookups[0] != 2) throw new AssertionError("A cache eviction must not lose attribution");
        AttributedCopy.remember(reportedId, " ", Collections.emptyList());
        equal(expectedAttribution, AttributedCopy.copyText(text, reportedId, true, id -> null));
        try {
            AttributedCopy.format(text, "");
            throw new AssertionError("Missing IDs must not silently produce an unattributed copy");
        } catch (IllegalArgumentException expected) {
            // No clipboard write can happen with this result.
        }
        System.out.println("Attributed copy tests passed");
    }
}
