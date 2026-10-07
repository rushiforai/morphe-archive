package app.morphe.extension.reddit.profile;

import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;

import java.nio.charset.StandardCharsets;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ProfileShareActions {

    private static final Pattern PROFILE_LINK =
            Pattern.compile("^https?://(www\\.|old\\.)?reddit\\.com/(?:user|u)/([^/?#]+).*", Pattern.CASE_INSENSITIVE);

    public static String extractUsername(String url) {
        if (url == null || url.isEmpty()) {
            return null;
        }
        Matcher matcher = PROFILE_LINK.matcher(url.trim());
        if (matcher.matches()) {
            return matcher.group(2);
        }
        return null;
    }

    public static String ghostdditUrl(String username) {
        if (username == null || username.isEmpty()) {
            return null;
        }
        return "https://ghostddit.aeddit.com/user/" + encodeUsername(username) + "/";
    }

    public static void copyUsername(Context ctx, String username) {
        if (ctx == null || username == null || username.isEmpty()) {
            return;
        }
        ClipboardManager clipboard =
                (ClipboardManager) ctx.getSystemService(Context.CLIPBOARD_SERVICE);
        if (clipboard != null) {
            clipboard.setPrimaryClip(ClipData.newPlainText("username", username));
        }
        Toast.makeText(ctx, "Username copied", Toast.LENGTH_SHORT).show();
    }

    public static void openGhostddit(Context ctx, String username) {
        if (ctx == null || username == null || username.isEmpty()) {
            return;
        }
        String url = ghostdditUrl(username);
        if (url == null) {
            return;
        }
        try {
            ctx.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url))
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        } catch (ActivityNotFoundException e) {
            Toast.makeText(ctx, "No app found to open link", Toast.LENGTH_SHORT).show();
        }
    }

    // TEMPORARY DEBUG (revert with the smali toasts): thread-proof toast —
    // safe to call from any thread (suspend/coroutine contexts included).
    public static void dbgToast(Context ctx, String message) {
        if (ctx == null || message == null) {
            return;
        }
        final Context appCtx = ctx.getApplicationContext();
        final Context useCtx = appCtx != null ? appCtx : ctx;
        try {
            new Handler(Looper.getMainLooper()).post(new Runnable() {
                @Override
                public void run() {
                    Toast.makeText(useCtx, message, Toast.LENGTH_LONG).show();
                }
            });
        } catch (Throwable ignored) {
        }
    }

    // Same output as android.net.Uri.encode(username), which is unavailable in
    // unit tests (android.jar stub throws). Leaves A-Z a-z 0-9 and -_.!~'()*
    // unescaped, percent-encodes everything else as UTF-8 with uppercase hex.
    private static String encodeUsername(String username) {
        byte[] bytes = username.getBytes(StandardCharsets.UTF_8);
        StringBuilder encoded = new StringBuilder(bytes.length);
        for (byte b : bytes) {
            int c = b & 0xFF;
            if ((c >= 'a' && c <= 'z')
                    || (c >= 'A' && c <= 'Z')
                    || (c >= '0' && c <= '9')
                    || "-_.!~'()*".indexOf(c) >= 0) {
                encoded.append((char) c);
            } else {
                encoded.append('%');
                encoded.append(Character.toUpperCase(Character.forDigit(c >>> 4, 16)));
                encoded.append(Character.toUpperCase(Character.forDigit(c & 0xF, 16)));
            }
        }
        return encoded.toString();
    }
}
