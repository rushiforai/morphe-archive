/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;

import androidx.annotation.Nullable;

import java.util.regex.Pattern;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticCategory;

/**
 * Hands a video's link to another app instead of saving the video, for people who'd rather have a
 * downloader such as YTDLnis or Seal fetch it (#41).
 *
 * <p>Only a link built here from the video's numeric id is ever sent, as plain text: never a
 * caption, a player address or anything else from the post. That keeps what reaches the other app
 * to a facebook.com address it can read on its own, with nothing in it another app could take as
 * an option.
 */
public final class SendLink {
    private static final String SOURCE = "SendLink";

    /** A video id as Facebook's links carry it: digits only. */
    private static final Pattern VIDEO_ID = Pattern.compile("[0-9]{1,25}");

    /** An Android package name: two or more dot-separated parts, each starting with a letter. */
    private static final Pattern PACKAGE = Pattern.compile("[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+");

    /** The two downloaders people asked for, which the settings row names as examples. */
    public static final String YTDLNIS = "com.deniscerri.ytdl";
    public static final String SEAL = "com.junkfood.seal";

    private SendLink() {
    }

    /** What a tap on a Download button does. */
    public enum Action {
        /** Save the video into the phone's gallery, as Hushfacebook always has. */
        SAVE("save"),
        /** Send the video's link to another app. */
        SEND("send");

        /** What a settings file holds for this action. It never changes once written. */
        public final String fileValue;

        Action(String fileValue) {
            this.fileValue = fileValue;
        }

        /** The action a settings file names, or null when it names neither. */
        @Nullable
        public static Action fromFile(@Nullable Object value) {
            if (!(value instanceof String)) return null;
            for (Action action : values()) {
                if (action.fileValue.equals(value)) return action;
            }
            return null;
        }
    }

    /** Whether a Download tap sends the link now. False before the settings are ready. */
    public static boolean sending() {
        return Utils.settingsReady() && Settings.DOWNLOAD_ACTION.get() == Action.SEND;
    }

    /** The reel's own link, or null when [videoId] isn't a Facebook video id. */
    @Nullable
    public static String reelLink(@Nullable String videoId) {
        return isVideoId(videoId) ? "https://www.facebook.com/reel/" + videoId : null;
    }

    /** A feed or Watch video's link, or null when [videoId] isn't a Facebook video id. */
    @Nullable
    public static String videoLink(@Nullable String videoId) {
        return isVideoId(videoId) ? "https://www.facebook.com/watch/?v=" + videoId : null;
    }

    static boolean isVideoId(@Nullable String videoId) {
        return videoId != null && VIDEO_ID.matcher(videoId).matches();
    }

    /** The app the link goes to: the typed package when it's a package name, else null for Android's chooser. */
    @Nullable
    public static String targetPackage(@Nullable String typed) {
        if (typed == null) return null;
        String trimmed = typed.trim();
        return PACKAGE.matcher(trimmed).matches() ? trimmed : null;
    }

    /**
     * [typed] as a settings file holds it: the package name links go to, or blank for Android's
     * chooser, which is where anything that isn't a package name sends them.
     */
    public static String fileApp(@Nullable String typed) {
        String target = targetPackage(typed);
        return target == null ? "" : target;
    }

    /** Whether a settings file's [value] is one {@link #fileApp} writes: blank, or one package name as it stands. */
    public static boolean isFileApp(@Nullable Object value) {
        if (!(value instanceof String)) return false;
        String app = (String) value;
        return app.isEmpty() || app.equals(targetPackage(app));
    }

    /** The plain-text share of [link], aimed at [target] when there is one. */
    static Intent intent(String link, @Nullable String target) {
        Intent send = new Intent(Intent.ACTION_SEND);
        send.setType("text/plain");
        send.putExtra(Intent.EXTRA_TEXT, link);
        if (target != null) send.setPackage(target);
        send.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        return send;
    }

    /** Android's chooser over every app that takes shared text, for when no app is named or it's gone. */
    static Intent chooser(String link) {
        Intent chooser = Intent.createChooser(intent(link, null), L10n.t("Send the link to"));
        chooser.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        return chooser;
    }

    /**
     * Sends [link] to the app named in the settings, or to Android's chooser when none is named or
     * the named one isn't installed. True when an app or the chooser opened. Never throws.
     */
    public static boolean send(Context context, String link) {
        Context application = context == null ? Utils.getContext() : context.getApplicationContext();
        if (application == null || link == null) return false;
        String target = targetPackage(Settings.SEND_TO_APP.get());
        try {
            if (target != null) {
                try {
                    application.startActivity(intent(link, target));
                    Logger.diagnosticInfo(DiagnosticCategory.DOWNLOADS, SOURCE, () -> "sent a link to the chosen app");
                    return true;
                } catch (ActivityNotFoundException missing) {
                    Logger.diagnosticInfo(DiagnosticCategory.DOWNLOADS, SOURCE,
                        () -> "the chosen app takes no shared text or isn't installed, so the chooser opened");
                }
            }
            application.startActivity(chooser(link));
            return true;
        } catch (Throwable t) {
            Logger.diagnosticError(DiagnosticCategory.DOWNLOADS, SOURCE, () -> "could not send a link", t);
            Feedback.show(application, L10n.t(application, "Couldn't open an app for this link"), true);
            return false;
        }
    }

    /** Copies [link] and says so. Never throws. */
    public static void copy(Context context, String link) {
        Context application = context == null ? Utils.getContext() : context.getApplicationContext();
        if (application == null || link == null) return;
        try {
            ClipboardManager clipboard = (ClipboardManager) application.getSystemService(Context.CLIPBOARD_SERVICE);
            clipboard.setPrimaryClip(ClipData.newPlainText(L10n.t(application, "Video link"), link));
            Feedback.show(application, L10n.t(application, "Link copied"), false);
        } catch (Throwable t) {
            Logger.diagnosticError(DiagnosticCategory.DOWNLOADS, SOURCE, () -> "could not copy a link", t);
        }
    }
}
