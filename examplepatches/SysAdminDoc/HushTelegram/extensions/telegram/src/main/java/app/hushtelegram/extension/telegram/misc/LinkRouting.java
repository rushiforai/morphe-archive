/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.text.Editable;
import android.view.View;
import android.widget.EditText;

import java.net.URI;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.BooleanSetting;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/** Local HTTP(S) routing and optional cleaning at verified browser and Share Link chooser sinks. */
public final class LinkRouting {
    private LinkRouting() {}

    /**
     * Case-sensitive, unencoded keys only. If any other query key appears, the entire URL stays
     * untouched. This intentionally leaves mixed queries alone instead of guessing whether an
     * unknown parameter authenticates or signs a link. No remote lookup or message rewrite occurs.
     */
    private static final Set<String> TRACKING = new HashSet<>(Arrays.asList(
            "utm_source", "utm_medium", "utm_campaign", "utm_term", "utm_content", "gclid", "fbclid"));
    private static final Set<String> PROTECTED_PATHS = new HashSet<>(Arrays.asList(
            "login", "signin", "sign-in", "auth", "oauth", "oauth2", "authorize", "authorization",
            "callback", "payment", "payments", "pay", "checkout", "invoice", "invoices", "account",
            "password", "reset", "verify", "unsubscribe", "logout"));

    /** Stock classification runs first. The caller's immutable URI and original message stay intact. */
    public static Uri cleanOpenedUri(Uri uri, boolean internal, boolean[] nativeFlags) {
        if (!enabled(Settings.STRIP_LINK_TRACKING, FamilyNames.STRIP_LINK_TRACKING)) return uri;
        try {
            if (internal || nativeFlags == null || nativeFlags.length != 1 || nativeFlags[0]) return uri;
            String cleaned = clean(uri);
            if (cleaned == null) return uri;
            Uri result = Uri.parse(cleaned);
            HookStatus.counted(FamilyNames.STRIP_LINK_TRACKING, "opened URLs cleaned");
            return result;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STRIP_LINK_TRACKING, "opened URL", failure);
            return uri;
        }
    }

    /** Only a plain single URL is changed, on a copied outgoing intent before its external chooser. */
    public static Intent cleanShareIntent(Intent intent) {
        if (!enabled(Settings.STRIP_LINK_TRACKING, FamilyNames.STRIP_LINK_TRACKING)) return intent;
        try {
            if (intent == null || !Intent.ACTION_SEND.equals(intent.getAction()) ||
                    !"text/plain".equals(intent.getType()) || intent.getData() != null ||
                    intent.getClipData() != null || intent.getComponent() != null || intent.getPackage() != null ||
                    intent.hasExtra(Intent.EXTRA_STREAM) || intent.hasExtra(Intent.EXTRA_HTML_TEXT)) return intent;
            CharSequence text = intent.getCharSequenceExtra(Intent.EXTRA_TEXT);
            if (!(text instanceof String)) return intent;
            String cleaned = clean(Uri.parse((String) text));
            if (cleaned == null) return intent;
            Intent copy = new Intent(intent).putExtra(Intent.EXTRA_TEXT, cleaned);
            HookStatus.counted(FamilyNames.STRIP_LINK_TRACKING, "shared URLs cleaned");
            return copy;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STRIP_LINK_TRACKING, "shared URL", failure);
            return intent;
        }
    }

    /**
     * The text Telegram is about to put on the clipboard. Only a plain String that is one link and
     * nothing else is rewritten; styled text, a message with words around a link and every other
     * copy come back as the same object.
     */
    public static CharSequence cleanCopiedLink(CharSequence text) {
        if (!enabled(Settings.STRIP_LINK_COPY_PASTE, FamilyNames.STRIP_LINK_TRACKING)) return text;
        try {
            if (!(text instanceof String)) return text;
            String cleaned = cleanLinkText((String) text);
            if (cleaned == null) return text;
            HookStatus.counted(FamilyNames.STRIP_LINK_TRACKING, "copied URLs cleaned");
            return cleaned;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STRIP_LINK_TRACKING, "copied URL", failure);
            return text;
        }
    }

    /**
     * Asked first by the message box's context menu action. A paste is let through as Telegram does it,
     * and once it has landed (the next pass of the main thread) a pasted piece that is one link and
     * nothing else is swapped for its cleaned form. The clipboard itself is never changed.
     */
    public static void watchPaste(View view, int action) {
        if (action != android.R.id.paste && action != android.R.id.pasteAsPlainText) return;
        if (!(view instanceof EditText) || !enabled(Settings.STRIP_LINK_COPY_PASTE, FamilyNames.STRIP_LINK_TRACKING)) return;
        try {
            EditText editor = (EditText) view;
            int from = Math.max(0, Math.min(editor.getSelectionStart(), editor.getSelectionEnd()));
            int to = Math.max(0, Math.max(editor.getSelectionStart(), editor.getSelectionEnd()));
            int kept = editor.getText().length() - (to - from);
            new android.os.Handler(android.os.Looper.getMainLooper()).post(() -> cleanPasted(editor, from, kept));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STRIP_LINK_TRACKING, "pasted URL", failure);
        }
    }

    private static void cleanPasted(EditText editor, int from, int kept) {
        try {
            Editable text = editor.getText();
            int length = text.length() - kept;
            if (length <= 0 || from + length > text.length()) return;
            String pasted = text.subSequence(from, from + length).toString();
            String cleaned = cleanLinkText(pasted);
            if (cleaned == null) return;
            boolean atEnd = editor.getSelectionStart() == from + length && editor.getSelectionEnd() == from + length;
            text.replace(from, from + length, cleaned);
            if (atEnd) editor.setSelection(from + cleaned.length());
            HookStatus.counted(FamilyNames.STRIP_LINK_TRACKING, "pasted URLs cleaned");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.STRIP_LINK_TRACKING, "pasted URL", failure);
        }
    }

    /** The cleaned form of a text that is a single link (spaces around it kept), or null when there's nothing to change. */
    static String cleanLinkText(String text) throws Exception {
        String link = text.trim();
        if (link.isEmpty()) return null;
        String cleaned = clean(Uri.parse(link));
        if (cleaned == null) return null;
        int start = text.indexOf(link);
        return text.substring(0, start) + cleaned + text.substring(start + link.length());
    }

    /**
     * Telegram adds the account's sign-in token to a link whose site its server lists for automatic
     * sign-in; {@code listed} is that check's answer. With the switch on the token is left off, so the
     * link opens as it is and still goes where Telegram would send it. The token is never read here.
     */
    public static boolean addAutologinToken(boolean listed) {
        if (!enabled(Settings.SKIP_AUTOLOGIN, FamilyNames.STRIP_LINK_TRACKING) || !listed) return listed;
        HookStatus.counted(FamilyNames.STRIP_LINK_TRACKING, "sign-in tokens left off");
        return false;
    }

    /**
     * Returns true only after a browser or browser-only chooser starts. Native routes, login and
     * payment paths, Telegram auth/autologin domains and failures retain the full stock method.
     * The requested browser package is Telegram's own resolved browser choice, never a guessed ID.
     */
    public static boolean tryOpenExternal(Context context, Uri uri, boolean internal,
                                          boolean[] nativeFlags, String requestedPackage) {
        if (!enabled(Settings.OPEN_EXTERNAL_LINKS, FamilyNames.OPEN_EXTERNAL_LINKS)) return false;
        try {
            if (context == null || internal || nativeFlags == null || nativeFlags.length != 1 ||
                    nativeFlags[0] || !ordinaryHttp(uri) || protectedByTelegram(uri)) return false;
            String opened = launchBrowser(context, uri, requestedPackage);
            if (opened == null) return false;
            HookStatus.counted(FamilyNames.OPEN_EXTERNAL_LINKS, opened);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.OPEN_EXTERNAL_LINKS, "external browser", failure);
            return false;
        }
    }

    /**
     * Opens [uri] in a browser whatever Open links in your browser says, for a page this Telegram
     * would only take back (a t.me link). False when no browser could take it.
     */
    static boolean openInBrowser(Context context, Uri uri) {
        return launchBrowser(context, uri, null) != null;
    }

    /**
     * Starts [uri] in [requestedPackage] when that's a browser, else in the default browser, else
     * in a chooser of browsers. Null when none could take it; otherwise which of those it was.
     */
    private static String launchBrowser(Context context, Uri uri, String requestedPackage) {
        PackageManager manager = context.getPackageManager();
        List<String> packages = browserPackages(manager, context.getPackageName());
        if (packages.isEmpty()) return null;
        String chosen = requestedPackage;
        if (chosen != null && !chosen.isEmpty()) {
            if (!packages.contains(chosen)) return null;
        } else {
            ResolveInfo selected = manager.resolveActivity(Intent.makeMainSelectorActivity(
                    Intent.ACTION_MAIN, Intent.CATEGORY_APP_BROWSER), PackageManager.MATCH_DEFAULT_ONLY);
            chosen = selected != null && selected.activityInfo != null ? selected.activityInfo.packageName : null;
            if (!packages.contains(chosen)) chosen = packages.size() == 1 ? packages.get(0) : null;
        }
        Intent launch;
        if (chosen != null) launch = browserIntent(context, uri, chosen);
        else {
            launch = Intent.createChooser(browserIntent(context, uri, packages.get(0)), null);
            Intent[] others = new Intent[packages.size() - 1];
            for (int i = 1; i < packages.size(); i++) others[i - 1] = browserIntent(context, uri, packages.get(i));
            launch.putExtra(Intent.EXTRA_INITIAL_INTENTS, others);
            if (!(context instanceof Activity)) launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        }
        context.startActivity(launch);
        return chosen == null ? "browser chooser launches" : "external browser opens";
    }

    private static Intent browserIntent(Context context, Uri uri, String packageName) {
        Intent intent = new Intent(Intent.ACTION_VIEW, uri).addCategory(Intent.CATEGORY_BROWSABLE)
                .setPackage(packageName).putExtra("create_new_tab", true);
        if (!(context instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        return intent;
    }

    /** Domain-bound verified apps aren't browsers. Queries inspect local resolution only. */
    private static List<String> browserPackages(PackageManager manager, String ownPackage) {
        Map<String, Integer> support = new LinkedHashMap<>();
        for (int index = 0; index < 2; index++) {
            String scheme = index == 0 ? "http" : "https";
            Intent probe = new Intent(Intent.ACTION_VIEW, Uri.parse(scheme + "://"))
                    .addCategory(Intent.CATEGORY_BROWSABLE);
            List<ResolveInfo> matches = manager.queryIntentActivities(probe,
                    PackageManager.MATCH_DEFAULT_ONLY | PackageManager.GET_RESOLVED_FILTER);
            for (ResolveInfo match : matches) {
                ActivityInfo activity = match.activityInfo;
                IntentFilter filter = match.filter;
                // The query applies runtime enabled state; ActivityInfo.enabled is the manifest default.
                if (activity == null || !activity.exported || filter == null ||
                        !filter.hasDataScheme(scheme) || filter.countDataAuthorities() != 0 ||
                        filter.countDataSchemeSpecificParts() != 0 || activity.packageName == null ||
                        activity.packageName.equals(ownPackage) || activity.packageName.equals("android")) continue;
                support.put(activity.packageName, support.getOrDefault(activity.packageName, 0) | (1 << index));
            }
        }
        List<String> result = new ArrayList<>();
        for (Map.Entry<String, Integer> entry : support.entrySet()) if (entry.getValue() == 3) result.add(entry.getKey());
        return result;
    }

    /** Null means no change. URI parsing validates syntax but never normalizes the returned URL. */
    private static String clean(Uri uri) throws Exception {
        if (!ordinaryHttp(uri) || protectedByTelegram(uri)) return null;
        String original = uri.toString();
        String query = new URI(original).getRawQuery();
        if (query == null || query.isEmpty() || query.indexOf(';') >= 0) return null;
        String[] parts = query.split("&", -1);
        boolean removed = false;
        for (String part : parts) {
            if (part.isEmpty()) continue;
            int equals = part.indexOf('=');
            String key = equals < 0 ? part : part.substring(0, equals);
            if (!TRACKING.contains(key)) return null;
            removed = true;
        }
        if (!removed) return null;
        int question = original.indexOf('?');
        int fragment = original.indexOf('#', question);
        // Empty query segments carry no parameters. The path and fragment bytes remain exact.
        return original.substring(0, question) + (fragment < 0 ? "" : original.substring(fragment));
    }

    private static boolean ordinaryHttp(Uri uri) {
        if (uri == null) return false;
        try {
            String original = uri.toString();
            for (int i = 0; i < original.length(); i++) if (Character.isWhitespace(original.charAt(i)) ||
                    Character.isISOControl(original.charAt(i))) return false;
            URI parsed = new URI(original);
            String scheme = parsed.getScheme();
            String host = parsed.getHost();
            if (parsed.isOpaque() || host == null || parsed.getRawUserInfo() != null ||
                    !("http".equalsIgnoreCase(scheme) || "https".equalsIgnoreCase(scheme))) return false;
            host = host.toLowerCase(Locale.ROOT);
            if (host.endsWith(".")) host = host.substring(0, host.length() - 1);
            for (String domain : new String[]{"t.me", "telegram.me", "telegram.dog", "telegram.org", "fragment.com"}) {
                if (host.equals(domain) || host.endsWith("." + domain)) return false;
            }
            if (host.endsWith(".ton") || host.endsWith(".adnl")) return false;
            if (host.startsWith("login.") || host.startsWith("auth.") || host.startsWith("oauth.") ||
                    host.startsWith("pay.") || host.startsWith("payments.")) return false;
            String path = parsed.getPath();
            if (path != null) for (String segment : path.toLowerCase(Locale.ROOT).split("/")) {
                int delimiter = segment.indexOf(';');
                if (delimiter >= 0) segment = segment.substring(0, delimiter);
                delimiter = segment.indexOf('.');
                if (delimiter >= 0) segment = segment.substring(0, delimiter);
                if (PROTECTED_PATHS.contains(segment) || segment.startsWith("oauth") || segment.startsWith("login")) return false;
            }
            // Fragment authentication and hash-router payloads stay stock. Ordinary anchors survive.
            String fragment = parsed.getFragment();
            if (fragment != null && (fragment.contains("=") || fragment.startsWith("/") || fragment.startsWith("!"))) return false;
            String query = parsed.getRawQuery();
            if (query != null) for (String part : query.split("&", -1)) {
                int equals = part.indexOf('=');
                String key = Uri.decode(equals < 0 ? part : part.substring(0, equals)).toLowerCase(Locale.ROOT);
                if (key.matches(".*(auth|token|session|signature|credential|password|secret|oauth|payment|checkout|invoice).*")) return false;
                if (Arrays.asList("sig", "key", "code", "state", "nonce", "hash", "hmac", "policy", "expires",
                        "jwt", "ticket", "proof", "redirect", "redirect_uri", "return", "url", "continue", "email").contains(key)) return false;
            }
            return true;
        } catch (Throwable malformed) {
            return false;
        }
    }

    private static boolean enabled(BooleanSetting setting, String family) {
        HookStatus.invoked(family);
        try {
            return Utils.settingsReady() && setting.get();
        } catch (Throwable failure) {
            HookStatus.threw(family, "switch read", failure);
            return false;
        }
    }

    /** Patched with the discovered native classifier and kept account auth/autologin-domain sets. */
    @SuppressWarnings("SameReturnValue")
    static boolean protectedByTelegram(Uri uri) { return true; }
}
