// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.inbox;

import android.app.Activity;
import android.content.Intent;
import android.os.Parcelable;
import android.text.SpannableStringBuilder;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;

/**
 * "Reply" in the inbox opens the app's comment reply screen ("Reply to [user] in r/... as [you]", the replied text,
 * formatting and images) instead of the plain "Send message" form. Both post the same reply (api/comment to the
 * comment or message). Private messages are shown on it as a comment of the other person.
 */
@SuppressWarnings("unused")
public final class InboxReplyPatch {
    private static final String COMMENT = "com.onelouder.baconreader.reddit.Comment";
    private static final String MESSAGE = "com.onelouder.baconreader.reddit.Message";
    /** PostActivity's text for a comment without subreddit: a private message. */
    private static final String NO_SUBREDDIT = " in r/null";
    private static final String POST_COMMENT_ACTIVITY = "com.onelouder.baconreader.PostCommentActivity";
    /** PostActivity.EXTRA_COMMENT. */
    private static final String EXTRA_COMMENT = "EXTRA_COMMENT";

    private InboxReplyPatch() {
    }

    /**
     * Injected at the start of InboxHelper.replyMessage.
     *
     * @return If the comment reply screen was opened; else the app opens its "Send message" form.
     */
    public static boolean openReplyScreen(Activity activity, Object message) {
        try {
            if (message == null) return false;
            Class<?> commentClass = Class.forName(COMMENT);
            Object comment = commentClass.isInstance(message) ? message : asComment(message, commentClass);
            Intent intent = new Intent(activity, Class.forName(POST_COMMENT_ACTIVITY));
            intent.putExtra(EXTRA_COMMENT, (Parcelable) comment);
            activity.startActivity(intent);
            return true;
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not open the comment reply screen", ex);
            return false;
        }
    }

    /**
     * A private message as a Comment (its subclass), which the reply screen takes: the same fields, and as author the
     * other person (a sent message's author is the user).
     */
    private static Object asComment(Object message, Class<?> commentClass) throws Exception {
        Object comment = commentClass.newInstance();
        for (Field field : Class.forName(MESSAGE).getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers())) continue;
            field.setAccessible(true);
            field.set(comment, field.get(message));
        }
        for (Class<?> type = commentClass.getSuperclass().getSuperclass(); type != null; type = type.getSuperclass()) {
            for (Field field : type.getDeclaredFields()) { // ThingData: id, name.
                if (Modifier.isStatic(field.getModifiers())) continue;
                field.setAccessible(true);
                field.set(comment, field.get(message));
            }
        }
        Object me = Class.forName("com.onelouder.baconreader.data.SessionManager").getMethod("getUsername").invoke(null);
        Field author = commentClass.getField("author");
        Object dest = commentClass.getField("dest").get(comment);
        if (dest instanceof String && me != null && me.equals(author.get(comment))) author.set(comment, dest);
        return comment;
    }

    /**
     * Injected after the reply screen sets "Reply to [user] in r/[subreddit] as [you]": a private message has no
     * subreddit ("in r/null").
     */
    public static void fixReplyText(TextView textView) {
        CharSequence text = textView.getText();
        int index = text.toString().indexOf(NO_SUBREDDIT);
        if (index < 0) return;
        SpannableStringBuilder fixed = new SpannableStringBuilder(text);
        fixed.delete(index, index + NO_SUBREDDIT.length());
        textView.setText(fixed);
    }
}
