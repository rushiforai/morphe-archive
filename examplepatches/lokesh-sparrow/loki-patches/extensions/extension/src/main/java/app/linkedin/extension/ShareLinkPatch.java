package app.linkedin.extension;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Intent;

/**
 * Every ClipboardManager.setPrimaryClip and Intent.putExtra(String, String) call in LinkedIn's
 * code is redirected here at patch time, so links are cleaned wherever they are copied or shared.
 */
@SuppressWarnings("unused")
public final class ShareLinkPatch {

    public static void setPrimaryClip(ClipboardManager clipboard, ClipData clip) {
        clipboard.setPrimaryClip(cleanClip(clip));
    }

    public static Intent putExtra(Intent intent, String name, String value) {
        String cleaned = value;
        if (Intent.EXTRA_TEXT.equals(name) && Settings.sanitizeShareLinks()) {
            cleaned = cleanLogged(value);
        }
        return intent.putExtra(name, cleaned);
    }

    private static ClipData cleanClip(ClipData clip) {
        try {
            if (clip == null || !Settings.sanitizeShareLinks() || clip.getItemCount() != 1) return clip;
            CharSequence text = clip.getItemAt(0).getText();
            if (text == null) return clip;
            String cleaned = cleanLogged(text.toString());
            if (cleaned.equals(text.toString())) return clip;
            CharSequence label = clip.getDescription() == null ? null : clip.getDescription().getLabel();
            return ClipData.newPlainText(label, cleaned);
        } catch (Throwable t) {
            Diagnostics.error("cleanClip failed", t);
            return clip;
        }
    }

    private static String cleanLogged(String text) {
        String cleaned = LinkCleaner.clean(text);
        if (cleaned != null && !cleaned.equals(text)) Settings.debugLog("share link cleaned");
        return cleaned;
    }
}
