package app.bitchord.telegram;

public final class TelegramMatchTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    public static void main(String[] args) {
        check(
                !TelegramMatch.accepts("L-O-V-E", 156, "How I'd Love To Love You", 139),
                "A title containing the word isn't the song (the reported mix-up)");
        check(
                !TelegramMatch.accepts("L-O-V-E", 156, "How I'd Love To Love You", 156),
                "Not even at the same length");
        check(TelegramMatch.accepts("L-O-V-E", 156, "L-O-V-E", 158), "Same title");
        check(TelegramMatch.accepts("L-O-V-E", 156, "LOVE", 156), "Same letters");
        check(
                TelegramMatch.accepts("Crawling", 209, "Crawling (Remastered 2020)", 209),
                "Brackets aside, same title");
        check(TelegramMatch.accepts("Crawling", 209, "crawling", 218), "Within 10 seconds");
        check(!TelegramMatch.accepts("Crawling", 209, "Crawling", 225), "Too far apart");
        check(TelegramMatch.accepts("Crawling", null, "Crawling", 225), "Unknown length");
        check(
                TelegramMatch.accepts("Numb", 187, "Numb Encore", 189),
                "Containing title, almost the same length");
        check(
                !TelegramMatch.accepts("Numb", 187, "Numb Encore", 205),
                "Containing title, different length");
        check(
                !TelegramMatch.accepts("Numb", null, "Numb Encore", 205),
                "Containing title needs a length");
        check(!TelegramMatch.accepts("", 100, "Anything", 100), "Blank title");
        check(TelegramMatch.core("Song [Live] (2009 Remaster)").equals("Song"), "Core title");
        System.out.println("PASS: " + checks + " Telegram substitution match checks.");
    }
}
