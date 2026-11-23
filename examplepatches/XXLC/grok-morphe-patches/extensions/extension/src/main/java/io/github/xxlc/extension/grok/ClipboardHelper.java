package io.github.xxlc.extension.grok;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;

/** Copies prompt on the main thread, ignoring empty data and clipboard errors. */
public final class ClipboardHelper {
    private ClipboardHelper() {
    }

    /** Same condition as copyPrompt: menu is only shown when there is text to copy. */
    public static boolean canCopy(String prompt) {
        return prompt != null && !prompt.trim().isEmpty();
    }

    public static void copyPrompt(Context context, String prompt) {
        if (context == null || !canCopy(prompt)) {
            return;
        }
        new Handler(Looper.getMainLooper()).post(() -> {
            try {
                ClipboardManager clipboard = (ClipboardManager)
                        context.getSystemService(Context.CLIPBOARD_SERVICE);
                if (clipboard == null) {
                    return;
                }
                clipboard.setPrimaryClip(ClipData.newPlainText("Grok prompt", prompt));
                int copied = context.getResources().getIdentifier(
                        "grok_xxlc_copied", "string", context.getPackageName());
                if (copied != 0) {
                    Toast.makeText(context, copied, Toast.LENGTH_SHORT).show();
                }
            } catch (Exception ignored) {
                // Do not let clipboard or notification errors interrupt the menu.
            }
        });
    }
}
