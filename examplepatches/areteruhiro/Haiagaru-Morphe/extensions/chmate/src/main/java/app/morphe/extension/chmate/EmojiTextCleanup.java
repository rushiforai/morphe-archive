package app.morphe.extension.chmate;

/** Remove only emoji/text presentation selectors, retaining ZWJ, keycaps and IVS. */
final class EmojiTextCleanup {
    static volatile boolean enabled=true;
    private static final java.util.regex.Pattern SELECTORS=java.util.regex.Pattern.compile("(?i)&#(?:6503[89]|x0*fe0[ef]);");
    static String apply(String input){
        if(!enabled||input==null||input.isEmpty())return input;
        String text=input.replace("\ufe0e","").replace("\ufe0f","");
        return text.indexOf("&#")<0?text:SELECTORS.matcher(text).replaceAll("");
    }
    private EmojiTextCleanup(){}
}
