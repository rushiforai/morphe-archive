/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.privacy;

import android.content.ClipData;
import android.content.Intent;
import android.net.Uri;

import java.util.Arrays;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/** Only outgoing shared or copied text is cleaned. Navigation and sign-in URLs stay untouched. */
public final class LinkTracking {
    private LinkTracking() {}

    private static final Pattern URL = Pattern.compile("https?://[^\\s<>\\\"\\u0000-\\u001f]+", Pattern.CASE_INSENSITIVE);
    private static final Set<String> TRACKING = new HashSet<>(Arrays.asList(
            "fbclid", "gclid", "dclid", "msclkid", "gbraid", "wbraid", "igshid",
            "mc_cid", "mc_eid", "_ga", "_gl", "epik", "srsltid"));
    private static final Set<String> PINTEREST_TRACKING = new HashSet<>(Arrays.asList(
            "sender", "sender_id", "tracking_id", "share_uid"));
    private static final Set<String> SIGNED = new HashSet<>(Arrays.asList(
            "signature", "sig", "token", "access_token", "auth", "authorization", "code",
            "x-amz-signature", "x-goog-signature", "oauth_signature"));

    private static boolean active() {
        try {
            return Utils.settingsReady() && Settings.STRIP_LINK_TRACKING.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STRIP_LINK_TRACKING, "switch read", failure);
            return false;
        }
    }

    /** Preserves labels, non-link text, nulls and styled text when no URL changes. */
    public static CharSequence cleanText(CharSequence text) {
        HookStatus.invoked(FamilyNames.STRIP_LINK_TRACKING);
        if (text == null || !active()) return text;
        try {
            Matcher matcher = URL.matcher(text);
            StringBuffer result = null;
            while (matcher.find()) {
                String original = matcher.group();
                int end = original.length();
                while (end > 0 && ".,!?;:)]}".indexOf(original.charAt(end - 1)) >= 0) end--;
                String cleaned = cleanUrl(original.substring(0, end)) + original.substring(end);
                if (result != null || !cleaned.equals(original)) {
                    if (result == null) result = new StringBuffer();
                    matcher.appendReplacement(result, Matcher.quoteReplacement(cleaned));
                }
            }
            if (result == null) return text;
            matcher.appendTail(result);
            HookStatus.counted(FamilyNames.STRIP_LINK_TRACKING, "shared or copied URL cleaned");
            return result.toString();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STRIP_LINK_TRACKING, "outgoing URL", failure);
            return text;
        }
    }

    /** Keeps raw parameter spelling and order. Signed links are preserved in full. */
    static String cleanUrl(String original) {
        int question = original.indexOf('?');
        int hash = original.indexOf('#');
        if (question < 0 || (hash >= 0 && hash < question)) return original;
        Uri uri = Uri.parse(original);
        String scheme = uri.getScheme();
        String host = uri.getHost();
        if (host == null || !("https".equalsIgnoreCase(scheme) || "http".equalsIgnoreCase(scheme))) return original;
        host = host.toLowerCase(Locale.ROOT);
        // A short-link token itself isn't a removable query parameter. No resolver request is made.
        boolean pinterest = host.equals("pinterest.com") || host.endsWith(".pinterest.com") || host.equals("pin.it");
        int queryEnd = hash < 0 ? original.length() : hash;
        String[] parts = original.substring(question + 1, queryEnd).split("&", -1);
        for (String part : parts) {
            String name = name(part);
            if (SIGNED.contains(name) || name.startsWith("x-amz-") || name.startsWith("x-goog-")) return original;
        }
        ArrayList<String> kept = new ArrayList<>();
        boolean changed = false;
        for (String part : parts) {
            String name = name(part);
            if (name.startsWith("utm_") || TRACKING.contains(name) || (pinterest && PINTEREST_TRACKING.contains(name))) {
                changed = true;
            } else {
                kept.add(part);
            }
        }
        if (!changed) return original;
        return original.substring(0, question) + (kept.isEmpty() ? "" : "?" + String.join("&", kept))
                + original.substring(queryEnd);
    }

    private static String name(String part) {
        int equals = part.indexOf('=');
        return Uri.decode(equals < 0 ? part : part.substring(0, equals)).toLowerCase(Locale.ROOT);
    }

    public static Intent putStringExtra(Intent intent, String key, String value) {
        CharSequence clean = Intent.EXTRA_TEXT.equals(key) ? cleanText(value) : value;
        return intent.putExtra(key, clean == value ? value : clean == null ? null : clean.toString());
    }

    public static Intent putTextExtra(Intent intent, String key, CharSequence value) {
        return intent.putExtra(key, Intent.EXTRA_TEXT.equals(key) ? cleanText(value) : value);
    }

    public static ClipData newPlainText(CharSequence label, CharSequence text) {
        CharSequence cleaned = cleanText(text);
        CharSequence safeLabel = label != null && text != null && label.toString().equals(text.toString())
                ? cleaned : label;
        return ClipData.newPlainText(safeLabel, cleaned);
    }
}
