package app.morphe.extension.chmate;

import java.nio.charset.Charset;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class VerifyTalkDatEncoding {
    private static final Charset MS932 = Charset.forName("MS932");
    private static final Pattern NUMERIC_ENTITY = Pattern.compile("&#(\\d+);");

    public static void main(String[] args) {
        String title = "Talk 😀スレ";
        String body = "本文🧑‍💻と異体字𠮷";
        String dat = "名無しさん<><>2026/09/23 ID:test<>" + body + "<>" + title + "\n";

        String encoded = new String(TalkDatEncoding.encode(dat), MS932);
        require(encoded.contains("本文&#129489;&#8205;&#128187;と異体字&#134071;"));
        require(encoded.endsWith("<>Talk &#128512;スレ\n"));
        require(dat.equals(decodeNumericEntities(encoded)));

        String smile = "日本国　貧困弁当が流行る☺️";
        String encodedSmile = new String(TalkDatEncoding.encode(smile), MS932);
        require(encodedSmile.equals("日本国　貧困弁当が流行る&#9786;"));
        require(!encodedSmile.contains("�"));

        System.out.println("Talk DAT Unicode encoding verification passed");
    }

    private static String decodeNumericEntities(String value) {
        Matcher matcher = NUMERIC_ENTITY.matcher(value);
        StringBuffer decoded = new StringBuffer();
        while (matcher.find()) {
            int codePoint = Integer.parseInt(matcher.group(1));
            matcher.appendReplacement(
                    decoded,
                    Matcher.quoteReplacement(new String(Character.toChars(codePoint)))
            );
        }
        matcher.appendTail(decoded);
        return decoded.toString();
    }

    private static void require(boolean condition) {
        if (!condition) throw new AssertionError();
    }
}
