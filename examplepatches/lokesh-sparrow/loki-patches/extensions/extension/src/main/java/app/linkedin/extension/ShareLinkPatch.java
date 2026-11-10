/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Intent;

/**
 * Replacement bodies for LinkedIn's clipboard write and share-intent putExtra. Every copy and every
 * share therefore passes through {@link LinkCleaner} before the user sees it.
 */
@SuppressWarnings("unused")
public final class ShareLinkPatch {

    /** Replaces ClipboardManager.setPrimaryClip(ClipData). */
    public static void setPrimaryClip(ClipboardManager clipboard, ClipData clip) {
        ClipData cleaned = sanitized(clip);
        clipboard.setPrimaryClip(cleaned);
    }

    /** Replaces Intent.putExtra(String, String) for share text. */
    public static Intent putExtra(Intent intent, String name, String value) {
        if (!Intent.EXTRA_TEXT.equals(name)) return intent.putExtra(name, value);
        if (!Settings.sanitizeShareLinks()) return intent.putExtra(name, value);
        return intent.putExtra(name, cleanAndLog(value));
    }

    /**
     * The clip with its single text item cleaned. Anything else is returned as it is: cleaning off,
     * more than one item, no text, no change, or any failure along the way.
     */
    private static ClipData sanitized(ClipData clip) {
        try {
            if (clip == null) return clip;
            if (!Settings.sanitizeShareLinks()) return clip;
            if (clip.getItemCount() != 1) return clip;
            CharSequence original = clip.getItemAt(0).getText();
            if (original == null) return clip;
            String cleaned = cleanAndLog(original.toString());
            if (cleaned.equals(original.toString())) return clip;
            android.content.ClipDescription description = clip.getDescription();
            CharSequence label = description == null ? null : description.getLabel();
            return ClipData.newPlainText(label, cleaned);
        } catch (Throwable failure) {
            Diagnostics.error("cleanClip failed", failure);
            return clip;
        }
    }

    /** Cleans one piece of text, and notes in the log when that changed anything. */
    private static String cleanAndLog(String text) {
        String sanitizedText = LinkCleaner.clean(text);
        if (sanitizedText == null || sanitizedText.equals(text)) return sanitizedText;
        Settings.debugLog("share link cleaned");
        return sanitizedText;
    }
}
