/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.comments;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import androidx.annotation.Nullable;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Comment sheet options: the comment box without its GIF and sticker buttons, Like without the
 * reaction picker a long press opens, every comment's reply thread open from the start, and a way
 * to Facebook's own setting that hides reaction counts.
 *
 * <p>The comment box draws its buttons through a socket that asks a check of each button, by
 * number, whether it shows. The patch asks {@link #holdsButton} first in that check with the
 * button's name, and a yes answers no for that button. A long press on Like opens the reaction
 * picker through one method, and the patch asks {@link #skipReactionPicker} first there; a yes
 * returns before anything opens. A comment keeps whether its reply thread is open in its state,
 * which starts closed until a tap on View replies opens it. The patch hands
 * {@link #openReplyThreads} that flag as the state is first set up and writes back the answer.
 *
 * <p>Off, paused, before the settings are ready, or when anything here fails, the answers are
 * Facebook's own and its code runs as written.
 */
public final class CommentSheetOptions {
    /** The comment box's GIF button, as the socket's name table gives it. */
    public static final String GIF_BUTTON =
            "com.facebook.feedback.comments.plugins.commentcomposer.attachmentbutton.gif.GifAttachmentButtonPlugin";

    /** The comment box's sticker button. */
    public static final String STICKER_BUTTON =
            "com.facebook.feedback.comments.plugins.commentcomposer.attachmentbutton.sticker.StickerAttachmentButtonPlugin";

    /** Counted under the patch's name each time the GIF or sticker button is kept out of a comment box. */
    static final String BUTTON_HIDDEN = "Comment box button kept out";

    /** Counted each time a long press on Like doesn't open the reaction picker. */
    static final String PICKER_SKIPPED = "Reaction picker kept closed";

    /** Counted each time a comment starts with its reply thread open. */
    static final String THREAD_OPENED = "Reply thread opened";

    /** The member the report names once the comment box's socket has asked about the GIF or sticker button. */
    static final String BUTTONS = "comment box buttons";

    /** The member the report names once the reaction picker has been asked to open. */
    static final String PICKER = "reaction picker";

    /** The member the report names once a comment's state has been set up. */
    static final String REPLY_THREADS = "reply threads";

    /**
     * Facebook's own settings, a route its links table carries on 577, 580 and 581. Reaction
     * preferences sits under Preferences there.
     */
    static final String SETTINGS_ROUTE = "fb://facebook_settings/";

    private static final String FAMILY = FamilyNames.COMMENT_SHEET_OPTIONS;

    private CommentSheetOptions() {
    }

    /**
     * The hook, first thing in the comment box's check of whether a button shows, handed the
     * button's name. True answers no for the GIF and sticker buttons while the switch is on; false
     * leaves the check to Facebook, for every other button and otherwise.
     */
    public static boolean holdsButton(@Nullable String plugin) {
        try {
            HookStatus.invoked(FAMILY);
            if (!GIF_BUTTON.equals(plugin) && !STICKER_BUTTON.equals(plugin)) return false;
            HookStatus.bound(FAMILY, BUTTONS);
            if (!Utils.settingsReady() || !Settings.HIDE_COMMENT_GIF_STICKER_BUTTONS.get()) return false;
            HookStatus.counted(FAMILY, BUTTON_HIDDEN);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "comment box button check", failure);
            return false;
        }
    }

    /**
     * The hook, first thing where a long press on Like opens the reaction picker. True returns
     * before the picker opens while Like only is on; false lets it open.
     */
    public static boolean skipReactionPicker() {
        try {
            HookStatus.invoked(FAMILY);
            HookStatus.bound(FAMILY, PICKER);
            if (!Utils.settingsReady() || !Settings.LIKE_ONLY.get()) return false;
            HookStatus.counted(FAMILY, PICKER_SKIPPED);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "reaction picker", failure);
            return false;
        }
    }

    /**
     * The hook, as a comment's state is first set up, handed whether its reply thread starts open,
     * which Facebook leaves false. True opens it, the way a tap on View replies does, while Open
     * every reply thread is on; otherwise Facebook's own value comes back.
     */
    public static boolean openReplyThreads(boolean open) {
        try {
            HookStatus.invoked(FAMILY);
            HookStatus.bound(FAMILY, REPLY_THREADS);
            if (open || !Utils.settingsReady() || !Settings.OPEN_REPLY_THREADS.get()) return open;
            HookStatus.counted(FAMILY, THREAD_OPENED);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "reply thread", failure);
            return open;
        }
    }

    /** The route to Facebook's own settings, for this package only. */
    static Intent reactionSettingsIntent(Context context) {
        return new Intent(Intent.ACTION_VIEW, Uri.parse(SETTINGS_ROUTE)).setPackage(context.getPackageName());
    }

    /**
     * Opens Facebook's own settings from [context], inside the current task when it's an activity.
     * False when this build has no activity for the route or Android refused to start it.
     */
    public static boolean openReactionSettings(Context context) {
        try {
            Intent route = reactionSettingsIntent(context);
            ComponentName destination = route.resolveActivity(context.getPackageManager());
            if (destination == null || !context.getPackageName().equals(destination.getPackageName())) return false;
            route.setComponent(destination);
            if (!(context instanceof Activity)) route.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(route);
            return true;
        } catch (ActivityNotFoundException | SecurityException refused) {
            Logger.printInfo(() -> "Comment sheet options: Facebook's settings didn't open");
            return false;
        } catch (RuntimeException failure) {
            Logger.printException(() -> "Comment sheet options: could not open Facebook's settings", failure);
            return false;
        }
    }
}
