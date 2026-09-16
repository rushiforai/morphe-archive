/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.comment;

import app.morphe.extension.shared.Logger;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.List;

/**
 * What the comment publish entry saw, and where it went.
 *
 * <p>A comment that will not send looks like nothing at all: the text stays in the box, no
 * toast, nothing in the log. TikTok's publish entry returns without a word from a dozen
 * places before the request is built. The patch calls in here at the entry, before every
 * return and before the hand-off to the request, so a report from a phone where comments
 * never post says whether the send was asked for, what it had in hand, and which exit it took.
 * The comment's text is never written, only its length.
 */
public final class CommentPublishDiagnostics {
    private static final String TAG = "[Morphe TikTok CommentPublish] ";

    private CommentPublishDiagnostics() {}

    /** Called first thing in the publish entry, with the view model and the publish parameters. */
    public static void onPublishRequested(Object viewModel, Object params) {
        String state;
        try {
            state = describe(viewModel, params);
        } catch (Throwable failure) {
            state = "state could not be read: " + failure;
        }
        String line = state;
        Logger.printInfo(() -> TAG + "requested with " + line);
    }

    /**
     * Called before each return that leaves the entry without building a request. The
     * number is the instruction index of that return; on a build that splits the entry
     * in two, the second method's exits count from 1000.
     */
    public static void onPublishExit(int exit) {
        Logger.printInfo(() -> TAG + "returned before the request at exit " + exit);
    }

    /** Called just before the entry hands the comment to the request builder. */
    public static void onPublishHandedOff() {
        Logger.printInfo(() -> TAG + "handed to the request");
    }

    /**
     * The parameters' shape by type, since every field name is R8's: the first text field's
     * length, each list's size in declaration order, whether a gift or a reply target is set,
     * and whether the view model still holds the comment context and its video.
     */
    static String describe(Object viewModel, Object params) throws ReflectiveOperationException {
        StringBuilder state = new StringBuilder();
        int textLength = -1;
        StringBuilder lists = new StringBuilder();
        boolean gift = false;
        boolean reply = false;
        if (params != null) {
            for (Field field : params.getClass().getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                field.setAccessible(true);
                Object value = field.get(params);
                Class<?> type = field.getType();
                if (textLength < 0 && CharSequence.class.isAssignableFrom(type)) {
                    textLength = value == null ? 0 : ((CharSequence) value).length();
                } else if (List.class.isAssignableFrom(type)) {
                    if (lists.length() > 0) lists.append(',');
                    lists.append(value == null ? "null" : String.valueOf(((List<?>) value).size()));
                } else if (type.getSimpleName().endsWith("GiftStruct")) {
                    gift |= value != null;
                } else if (type.getSimpleName().equals("Comment")) {
                    reply |= value != null;
                }
            }
        }
        state.append("text=").append(Math.max(textLength, 0)).append(" chars")
                .append(", lists=[").append(lists).append(']')
                .append(", gift=").append(gift ? "yes" : "no")
                .append(", reply=").append(reply ? "yes" : "no");

        Object context = contextOf(viewModel);
        state.append(", context=").append(context == null ? "no" : "yes");
        Object video = null;
        if (context != null) {
            Method common = context.getClass().getMethod("getCommonModel");
            Object commonModel = common.invoke(context);
            if (commonModel != null) {
                Field aweme = commonModel.getClass().getField("aweme");
                video = aweme.get(commonModel);
            }
        }
        state.append(", video=").append(video == null ? "no" : "yes");
        return state.toString();
    }

    /** The view model's own no-argument getter for the comment context, found by its return type. */
    private static Object contextOf(Object viewModel) throws ReflectiveOperationException {
        if (viewModel == null) return null;
        for (Method method : viewModel.getClass().getDeclaredMethods()) {
            if (method.getParameterTypes().length != 0) continue;
            if (!method.getReturnType().getSimpleName().endsWith("CommentContextSource")) continue;
            method.setAccessible(true);
            return method.invoke(viewModel);
        }
        return null;
    }
}
