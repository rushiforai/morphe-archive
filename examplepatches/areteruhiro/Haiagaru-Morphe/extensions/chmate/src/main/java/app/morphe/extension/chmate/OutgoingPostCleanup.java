package app.morphe.extension.chmate;

/** Strip replacement glyphs from the outgoing body only; spaces, drafts and valid Unicode stay intact. */
final class OutgoingPostCleanup {
    private static final java.util.regex.Pattern REPLACEMENT=java.util.regex.Pattern.compile("(?i)&#(?:0*65533|x0*fffd);");
    static String apply(String body){
        if(body==null||body.isEmpty())return body;
        String text=body.replace("\ufffd","");
        return text.indexOf("&#")<0?text:REPLACEMENT.matcher(text).replaceAll("");
    }
    private OutgoingPostCleanup(){}
}
