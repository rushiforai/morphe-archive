package app.onlynazril.extension.tiktok;

/**
 * The name a mention is inserted with, before the comment composer puts its own "@" in front.
 * <p>
 * The handle stamp returns "@handle" for display, and the composer takes that name, prepends
 * another "@" and inserts it: the mention read "@@handle". Removing the leading "@" here leaves
 * the composer's single one. A name the stamp did not touch has none to remove and is returned
 * unchanged.
 */
public final class MentionText {
    private MentionText() {}

    public static String withoutLeadingAt(String name) {
        if (name == null) return null;
        int start = 0;
        while (start < name.length() && name.charAt(start) == '@') start++;
        return start == 0 ? name : name.substring(start);
    }
}
