package app.polishapps.extension.orange;

import android.view.View;

@SuppressWarnings("unused")
public final class NotificationPromptPatch {

    private NotificationPromptPatch() {
    }

    public static void close(View root) {
        if (root == null || root.getAlpha() == 0f) {
            return;
        }
        root.setAlpha(0f);

        int id = root.getResources().getIdentifier("closeLayout", "id", root.getContext().getPackageName());
        final View close = id == 0 ? null : root.findViewById(id);
        if (close == null) {
            return;
        }
        root.post(new Runnable() {
            @Override
            public void run() {
                close.performClick();
            }
        });
    }
}
