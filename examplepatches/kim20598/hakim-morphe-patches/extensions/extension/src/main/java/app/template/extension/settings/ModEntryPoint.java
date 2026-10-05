package app.template.extension.settings;

import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;

/**
 * In-app entry point to {@link ModSettingsActivity}: a long-press on the settings icon (the
 * navigation icon of the "Me" tab toolbar) opens the mod settings screen. Injected into
 * {@code MeFragment.configure} by the "Mod settings" patch.
 */
public final class ModEntryPoint {

    private ModEntryPoint() {}

    private static final View.OnLongClickListener OPEN = new View.OnLongClickListener() {
        @Override
        public boolean onLongClick(View v) {
            try {
                Context context = v.getContext();
                Intent intent = new Intent()
                        .setClassName(
                                context.getPackageName(),
                                "app.template.extension.settings.ModSettingsActivity")
                        .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                context.startActivity(intent);
                return true;
            } catch (Throwable t) {
                return false;
            }
        }
    };

    /** Injected at the top of {@code MeFragment.configure} with the tab's toolbar. */
    public static void attachToToolbar(final View toolbar) {
        try {
            toolbar.setOnLongClickListener(OPEN);
            // The navigation icon is a child ImageButton added a little later; bind it too so the
            // gesture works when the press lands on the icon itself.
            toolbar.post(new Runnable() {
                @Override
                public void run() {
                    bindImageButtons(toolbar);
                }
            });
        } catch (Throwable ignored) {
        }
    }

    private static void bindImageButtons(View toolbar) {
        try {
            if (!(toolbar instanceof ViewGroup)) return;
            ViewGroup group = (ViewGroup) toolbar;
            for (int i = 0; i < group.getChildCount(); i++) {
                View child = group.getChildAt(i);
                if (child instanceof ImageButton) {
                    child.setOnLongClickListener(OPEN);
                }
            }
        } catch (Throwable ignored) {
        }
    }
}
