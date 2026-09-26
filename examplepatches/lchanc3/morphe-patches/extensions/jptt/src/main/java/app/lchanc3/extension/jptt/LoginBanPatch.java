package app.lchanc3.extension.jptt;

/**
 * Words the dialog JPTT shows when PTT refuses a login because the account is
 * temporarily banned, which JPTT does not recognise on its own.
 */
@SuppressWarnings("unused")
public final class LoginBanPatch {

    /**
     * Called from the method the patch adds to JSocket with the screen as
     * {@code getTerminalText()} renders it: one line per row, then a line with
     * the cursor position.
     */
    public static String message(String terminalText) {
        StringBuilder message = new StringBuilder();
        try {
            if (terminalText != null) {
                for (String line : terminalText.split("\n")) {
                    String trimmed = line.trim();
                    if (trimmed.isEmpty() || trimmed.startsWith("x=")) {
                        continue;
                    }
                    message.append(trimmed).append('\n');
                }
            }
        } catch (Throwable ex) {
            android.util.Log.e(JpttContext.LOG_TAG, "Could not read the ban message", ex);
        }
        if (message.length() > 0) {
            message.append('\n');
        }
        return message.append("JPTT 不會自動重試，請過一段時間再登入。").toString();
    }

    private LoginBanPatch() {
    }
}
