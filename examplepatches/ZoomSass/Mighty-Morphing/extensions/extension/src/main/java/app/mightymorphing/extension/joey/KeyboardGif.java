package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputConnectionWrapper;
import android.view.inputmethod.InputContentInfo;

import java.util.Collections;

/**
 * Markdown comment box only. A keyboard GIF uses the same Reddit upload as the image button.
 */
public final class KeyboardGif {
    private static final ThreadLocal<EditorInfo> PENDING = new ThreadLocal<>();
    private static final String[] TYPES = {"image/gif", "image/png", "image/webp", "image/jpeg", "image/jpg"};

    private KeyboardGif() {
    }

    public static void remember(EditorInfo info) {
        PENDING.set(info);
    }

    public static InputConnection wrap(View view, InputConnection connection) {
        EditorInfo info = PENDING.get();
        PENDING.remove();
        if (connection == null || info == null || !replyEditor(view)) return connection;
        info.contentMimeTypes = TYPES;
        return new GifConnection(connection, view);
    }

    private static boolean replyEditor(View view) {
        int id = view.getResources().getIdentifier("ReplyEditor", "id", view.getContext().getPackageName());
        if (id == 0 || view.getId() != id) return false;
        Context context = view.getContext();
        while (context instanceof ContextWrapper) {
            if ("o.o.joey.Activities.ReplyActivity".equals(context.getClass().getName())) return true;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return false;
    }

    private static boolean image(InputContentInfo info) {
        if (info == null || info.getDescription() == null) return false;
        for (int i = 0; i < info.getDescription().getMimeTypeCount(); i++) {
            String mime = info.getDescription().getMimeType(i);
            for (String type : TYPES) {
                if (type.equalsIgnoreCase(mime)) return true;
            }
        }
        return false;
    }

    private static Context activity(View view) {
        Context context = view.getContext();
        while (context instanceof ContextWrapper) {
            if ("o.o.joey.Activities.ReplyActivity".equals(context.getClass().getName())) return context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return view.getContext();
    }

    private static void upload(Context context, Uri uri) {
        if (!(context instanceof Activity)) return;
        EditorUpload.still((Activity) context, Collections.singletonList(uri), false);
    }

    private static final class GifConnection extends InputConnectionWrapper {
        private final View view;

        GifConnection(InputConnection target, View view) {
            super(target, false);
            this.view = view;
        }

        @Override
        public boolean commitContent(InputContentInfo inputContentInfo, int flags, Bundle opts) {
            if (!image(inputContentInfo)) return super.commitContent(inputContentInfo, flags, opts);
            try {
                if ((flags & InputConnection.INPUT_CONTENT_GRANT_READ_URI_PERMISSION) != 0) {
                    inputContentInfo.requestPermission();
                }
                upload(activity(view), inputContentInfo.getContentUri());
                return true;
            } catch (Throwable ignored) {
                return false;
            }
        }
    }
}
