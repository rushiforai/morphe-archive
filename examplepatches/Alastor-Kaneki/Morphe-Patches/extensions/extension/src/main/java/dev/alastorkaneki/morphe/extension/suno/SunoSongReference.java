package dev.alastorkaneki.morphe.extension.suno;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.ArrayDeque;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Extracts a Suno song UUID from links, shared text, the clipboard, or visible views. */
final class SunoSongReference {
    private static final String UUID_PATTERN =
            "[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}";
    private static final Pattern SONG_URL = Pattern.compile(
            "https?://(?:www\\.)?suno\\.com/song/(" + UUID_PATTERN + ")",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern UUID = Pattern.compile(UUID_PATTERN);
    private static final int MAX_VIEW_NODES = 2_000;

    private SunoSongReference() {
    }

    static String fromIntent(Intent intent) {
        if (intent == null) {
            return null;
        }

        String songId = extract(intent.getDataString());
        if (songId != null) {
            return songId;
        }

        CharSequence text = intent.getCharSequenceExtra(Intent.EXTRA_TEXT);
        songId = extract(text == null ? null : text.toString());
        if (songId != null) {
            return songId;
        }

        CharSequence subject = intent.getCharSequenceExtra(Intent.EXTRA_SUBJECT);
        return extract(subject == null ? null : subject.toString());
    }

    static String fromClipboard(Context context) {
        if (context == null) {
            return null;
        }
        ClipboardManager clipboard =
                (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
        if (clipboard == null || !clipboard.hasPrimaryClip()) {
            return null;
        }
        ClipData clip = clipboard.getPrimaryClip();
        if (clip == null) {
            return null;
        }
        for (int index = 0; index < clip.getItemCount(); index++) {
            CharSequence text = clip.getItemAt(index).coerceToText(context);
            String songId = extract(text == null ? null : text.toString());
            if (songId != null) {
                return songId;
            }
        }
        return null;
    }

    static String fromViewTree(View root) {
        if (root == null) {
            return null;
        }

        ArrayDeque<View> queue = new ArrayDeque<>();
        queue.add(root);
        int inspected = 0;
        while (!queue.isEmpty() && inspected < MAX_VIEW_NODES) {
            View view = queue.removeFirst();
            inspected++;

            String songId = extract(view.getContentDescription() == null
                    ? null
                    : view.getContentDescription().toString());
            if (songId != null) {
                return songId;
            }

            Object tag = view.getTag();
            songId = extract(tag == null ? null : tag.toString());
            if (songId != null) {
                return songId;
            }

            if (view instanceof TextView) {
                CharSequence text = ((TextView) view).getText();
                songId = extract(text == null ? null : text.toString());
                if (songId != null) {
                    return songId;
                }
            }

            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int childIndex = 0; childIndex < group.getChildCount(); childIndex++) {
                    View child = group.getChildAt(childIndex);
                    if (child != null) {
                        queue.addLast(child);
                    }
                }
            }
        }
        return null;
    }

    static String extract(String value) {
        if (value == null) {
            return null;
        }
        String trimmed = value.trim();
        if (trimmed.isEmpty()) {
            return null;
        }

        Matcher urlMatcher = SONG_URL.matcher(trimmed);
        if (urlMatcher.find()) {
            return urlMatcher.group(1).toLowerCase(Locale.US);
        }

        Matcher uuidMatcher = UUID.matcher(trimmed);
        if (uuidMatcher.find()) {
            return uuidMatcher.group().toLowerCase(Locale.US);
        }
        return null;
    }

    static Uri toSongUri(String songId) {
        return Uri.parse("https://suno.com/song/" + songId);
    }

    static String sanitizeFileBase(String title, String songId) {
        String candidate = title == null ? "" : title;
        candidate = candidate
                .replaceAll("(?i)\\s*[|–—-]\\s*Suno\\s*$", "")
                .replaceAll("[\\x00-\\x1F\\x7F\\\\/:*?\"<>|]", "_")
                .replaceAll("\\s+", " ")
                .trim();
        if (candidate.isEmpty() || candidate.equalsIgnoreCase("Suno")) {
            candidate = "suno-" + songId;
        }
        if (candidate.length() > 96) {
            candidate = candidate.substring(0, 96).trim();
        }
        return candidate;
    }
}
