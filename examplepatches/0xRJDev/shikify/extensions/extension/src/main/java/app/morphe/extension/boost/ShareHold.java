package app.morphe.extension.boost;

import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.os.Build;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.TextView;
import android.widget.Toast;

/**
 * Holding "Share…" in a post or comment menu copies the link to it, the same link Boost's
 * Share permalink option shares, and closes the menu.
 */
final class ShareHold {
    private ShareHold() { }

    static void attach(Dialog dialog, View menu) {
        Context context = menu.getContext();
        int id = context.getResources().getIdentifier("menu_submission_share", "string", context.getPackageName());
        if (id == 0) return;
        String label = context.getString(id);
        // The rows are a list that fills in after the menu shows, so look for the row as it lays out.
        ViewTreeObserver.OnGlobalLayoutListener listener = new ViewTreeObserver.OnGlobalLayoutListener() {
            @Override public void onGlobalLayout() { bind(dialog, menu, menu, label); }
        };
        menu.getViewTreeObserver().addOnGlobalLayoutListener(listener);
        bind(dialog, menu, menu, label);
    }

    private static void bind(Dialog dialog, View menu, View view, String label) {
        if (view instanceof TextView && label.contentEquals(((TextView) view).getText())) {
            View row = view;
            while (row.getParent() instanceof View && !(row.getParent().getClass().getName().contains("RecyclerView"))) row = (View) row.getParent();
            if (row.getTag(TAG) == null) {
                row.setTag(TAG, Boolean.TRUE);
                row.setOnLongClickListener(clicked -> copy(dialog, menu, clicked));
            }
            return;
        }
        if (view instanceof ViewGroup) for (int index = 0; index < ((ViewGroup) view).getChildCount(); index++) bind(dialog, menu, ((ViewGroup) view).getChildAt(index), label);
    }

    private static boolean copy(Dialog dialog, View menu, View row) {
        String link = link(menu);
        if (link == null || link.isEmpty()) return false;
        Context context = menu.getContext();
        ClipboardManager clipboard = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
        if (clipboard == null) return false;
        clipboard.setPrimaryClip(ClipData.newPlainText("Link", link));
        row.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
        // Android 13 and later show their own clipboard confirmation.
        if (Build.VERSION.SDK_INT < 33) Toast.makeText(context, "Link copied", Toast.LENGTH_SHORT).show();
        try { dialog.dismiss(); } catch (RuntimeException ignored) { }
        return true;
    }

    /** The menu's callback belongs to the comment or post it was opened for. */
    private static String link(View menu) {
        Object callback = CommentsChromeTweaks.field(menu, "c");
        if (callback == null) return null;
        for (Class<?> type = callback.getClass(); type != null && type != Object.class; type = type.getSuperclass())
            for (java.lang.reflect.Field field : type.getDeclaredFields()) {
                try {
                    field.setAccessible(true);
                    Object owner = field.get(callback);
                    String link = owner == null ? null : linkOf(owner);
                    if (link != null) return link;
                } catch (ReflectiveOperationException | RuntimeException ignored) { }
            }
        return linkOf(callback);
    }

    private static String linkOf(Object owner) {
        try {
            for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) {
                String name = type.getName();
                if (name.equals("com.rubenmayayo.reddit.ui.adapters.CommentViewHolder")) return ShareShortcuts.commentLink(owner);
                if (name.equals("com.rubenmayayo.reddit.ui.adapters.SubmissionViewHolder")) return ShareShortcuts.postLink(owner);
            }
        } catch (RuntimeException ignored) { }
        return null;
    }

    private static final int TAG = 0x7f5d0001;
}
