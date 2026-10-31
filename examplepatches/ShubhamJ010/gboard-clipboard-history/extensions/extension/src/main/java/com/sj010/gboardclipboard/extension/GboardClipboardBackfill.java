package com.sj010.gboardclipboard.extension;

import android.content.ClipData;
import android.content.ClipDescription;
import android.content.ClipboardManager;
import android.content.Context;
import android.net.Uri;
import android.util.Log;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

/**
 * Backfills clipboard entries that were copied while another keyboard or app was active.
 */
public final class GboardClipboardBackfill {

    static final String TAG = "GboardClipboard";
    private static final int RECENT_ENTRY_SCAN_LIMIT = 25;
    private static final int MAX_TEXT_LENGTH = 100000;

    private GboardClipboardBackfill() {
    }

    public static final class PrimaryClip {
        public final String text;
        public final String htmlText;
        public final String uri;
        public final long timestamp;
        public final boolean sensitive;

        PrimaryClip(String text, String htmlText, String uri, long timestamp, boolean sensitive) {
            this.text = text;
            this.htmlText = htmlText;
            this.uri = uri;
            this.timestamp = timestamp;
            this.sensitive = sensitive;
        }

        public boolean hasText() {
            return text != null && !text.isEmpty();
        }
    }

    public static PrimaryClip readPrimaryClip(Context context) {
        if (context == null) {
            return null;
        }
        Context lookupContext = lookupContext(context);
        try {
            ClipboardManager cm = (ClipboardManager) lookupContext.getSystemService(Context.CLIPBOARD_SERVICE);
            if (cm == null || !cm.hasPrimaryClip()) {
                return null;
            }
            ClipData clip = cm.getPrimaryClip();
            if (clip == null || clip.getItemCount() == 0) {
                return null;
            }
            ClipData.Item item = clip.getItemAt(0);
            ClipDescription description = clip.getDescription();
            if (item == null) {
                return null;
            }

            String text = null;
            String htmlText = null;
            String uri = null;

            CharSequence itemText = item.getText();
            if (itemText != null && itemText.length() > 0) {
                text = itemText.toString();
            }
            String itemHtml = item.getHtmlText();
            if (itemHtml != null && !itemHtml.isEmpty()) {
                htmlText = itemHtml;
            }

            Uri itemUri = item.getUri();
            if (text == null && htmlText == null && itemUri != null) {
                if (isTextMimeType(description)) {
                    CharSequence coerced = item.coerceToText(lookupContext);
                    if (coerced != null && coerced.length() > 0) {
                        text = coerced.toString();
                    } else {
                        uri = itemUri.toString();
                    }
                } else {
                    uri = itemUri.toString();
                }
            } else if (text == null && htmlText == null) {
                CharSequence coerced = item.coerceToText(lookupContext);
                if (coerced != null && coerced.length() > 0) {
                    text = coerced.toString();
                }
            }

            return new PrimaryClip(
                    text,
                    htmlText,
                    uri,
                    resolveTimestamp(description),
                    isSensitive(description));
        } catch (Throwable t) {
            Log.w(TAG, "Failed reading primary clip", t);
            return null;
        }
    }

    public static boolean backfillPrimaryClip(Context context) {
        if (context == null) {
            return false;
        }
        Context lookupContext = lookupContext(context);
        try {
            PrimaryClip primary = readPrimaryClip(lookupContext);
            if (primary == null || !primary.hasText()) {
                return false;
            }
            if (primary.text.length() > MAX_TEXT_LENGTH) {
                return false;
            }

            String marker = buildMarker(primary.text);
            String lastMarker = GboardClipboardHistorySettings.getBackfillMarker(lookupContext);
            if (marker.equals(lastMarker)) {
                return false;
            }

            long rowId = GboardClipboardHistoryRepository.insertClipIfAbsent(
                    lookupContext, primary.text, primary.timestamp, primary.sensitive, RECENT_ENTRY_SCAN_LIMIT);

            if (rowId < 0L) {
                return false;
            }
            GboardClipboardHistorySettings.setBackfillMarker(lookupContext, marker);
            if (rowId == 0L) {
                return false;
            }
            Log.i(TAG, "Backfilled primary clip copied under another keyboard");
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "Failed during clipboard backfill", t);
            return false;
        }
    }

    /**
     * The clipboard service belongs to the application, so the application
     * context is the one to read it through.
     */
    private static Context lookupContext(Context context) {
        Context appContext = context.getApplicationContext();
        return appContext != null ? appContext : context;
    }

    static String buildMarker(String text) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] digest = md.digest(text.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder(digest.length * 2);
            for (byte b : digest) {
                sb.append(Character.forDigit((b >> 4) & 0xF, 16));
                sb.append(Character.forDigit(b & 0xF, 16));
            }
            return sb.toString();
        } catch (Throwable ignored) {
            return Integer.toHexString(text.hashCode());
        }
    }

    private static long resolveTimestamp(ClipDescription description) {
        if (description != null) {
            try {
                if (description.getTimestamp() > 0L) {
                    return description.getTimestamp();
                }
            } catch (Throwable ignored) {
            }
        }
        return System.currentTimeMillis();
    }

    private static boolean isTextMimeType(ClipDescription description) {
        if (description == null || description.getMimeTypeCount() == 0) {
            return false;
        }
        try {
            String mimeType = description.getMimeType(0);
            return mimeType != null && mimeType.startsWith("text/")
                    && !"text/uri-list".equals(mimeType);
        } catch (Throwable ignored) {
            return false;
        }
    }

    static boolean isSensitive(ClipDescription description) {
        if (description == null) {
            return false;
        }
        try {
            android.os.PersistableBundle extras = description.getExtras();
            if (extras == null) {
                return false;
            }
            if (extras.containsKey(ClipDescription.EXTRA_IS_SENSITIVE)) {
                return extras.getBoolean(ClipDescription.EXTRA_IS_SENSITIVE);
            }
            return extras.getBoolean("android.content.extra.IS_SENSITIVE");
        } catch (Throwable ignored) {
            return false;
        }
    }
}
