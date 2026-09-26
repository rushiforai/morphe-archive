package app.anondev.patches.zotero.extension;

/**
 * Recovery helpers for attachment metadata the client cannot use as it stands.
 *
 * <p>Kept free of application classes on purpose: the extension is compiled on its own and merged
 * into the patched app, so it must depend on nothing but the JDK.
 */
public class AttachmentMtime {

    /**
     * Returns an epoch-milliseconds value for an attachment's stored {@code mtime} field.
     *
     * <p>The client's upload reader parses that field and skips the attachment entirely when the
     * result is null, which permanently prevents the file from being uploaded: the file never
     * uploads, so the field is never repaired, so the attachment is skipped forever. Substituting
     * the current time lets the upload proceed; the client then stores the file's own modification
     * time after the upload, so this value is transient.
     *
     * @param value the stored field value, possibly null, empty or malformed
     * @return the parsed value, or the current time when it cannot be parsed
     */
    public static Long mtimeOrNow(String value) {
        if (value != null) {
            String trimmed = value.trim();
            if (!trimmed.isEmpty()) {
                try {
                    return Long.parseLong(trimmed);
                } catch (NumberFormatException ignored) {
                    // fall through to the substitute below
                }
            }
        }
        return System.currentTimeMillis();
    }
}
