package app.morphed.extension.twitch.hls;

import org.junit.Test;

import java.util.Random;

import app.morphed.extension.twitch.Playlists;

import static org.junit.Assert.assertArrayEquals;

public class LinesTest {
    private static void same(String text) {
        assertArrayEquals(text.replace("\r", "\\r").replace("\n", "\\n"), text.split("\r?\n"), Lines.of(text));
    }

    @Test
    public void splitsLikeTheRegularExpression() {
        String[] cases = {"", "a", "\n", "\n\n", "a\n", "a\r\n", "\r\n", "a\nb", "a\r\nb\r\n", "\na", "\r\na",
                "a\r\r\nb", "a\rb", "a\n\n\nb\n\n", "a\n\r\nb", "\r", "a\r", Playlists.media("n", 100, "llaa", true),
                Playlists.media("n", 100, "llll", false).replace("\n", "\r\n")};
        for (String text : cases) same(text);
    }

    @Test
    public void splitsRandomTextLikeTheRegularExpression() {
        Random random = new Random(3);
        char[] alphabet = {'a', '#', '\r', '\n', ' '};
        for (int i = 0; i < 20_000; i++) {
            StringBuilder text = new StringBuilder();
            int length = random.nextInt(12);
            for (int j = 0; j < length; j++) text.append(alphabet[random.nextInt(alphabet.length)]);
            same(text.toString());
        }
    }
}
