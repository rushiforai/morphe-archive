package app.morphe.extension.chmate;

/** Display-only reporter suffixes are removable without touching the URL or title body. */
public final class ReporterCopyText {
    public static String clean(String text,boolean include){
        if(text==null||include||!text.matches("(?s).*https?://(?:bbs\\.eddibb\\.cc|bbs\\.eddibb\\.net|kenmo\\.org)/.*"))return text;
        return text.replaceAll("(?m)[ \t]+\\[[^\\[\\]\\s]+★\\](?=\\r?$|[ \t]+https?://)","");
    }
    private ReporterCopyText(){}
}
