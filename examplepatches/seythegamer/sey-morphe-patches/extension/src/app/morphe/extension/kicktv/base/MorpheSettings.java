package app.morphe.extension.kicktv.base;

import android.app.Activity;
import android.app.Dialog;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/**
 * TV friendly SEYTTINGS dialog, built from plain Android views so it
 * does not depend on the obfuscated Compose UI of the app.
 *
 * <p>The dialog only renders the header and the Close button. Every feature
 * patch contributes its own section through {@link MorpheSection}; the class
 * names are resolved at runtime, so a section is shown only when the matching
 * feature extension was merged into the app.</p>
 */
public final class MorpheSettings {

    /**
     * Sections shipped by feature patches. A name only resolves when the
     * feature patch is applied, because each feature bundles its own DEX.
     */
    private static final String[] SECTION_CLASSES = {
            "app.morphe.extension.kicktv.emotes.EmoteSection",
            "app.morphe.extension.kicktv.chat.ChatSizeSection",
            "app.morphe.extension.kicktv.chattext.ChatTextSection",
            "app.morphe.extension.kicktv.chatexpand.ChatExpandSection",
    };

    private MorpheSettings() {
    }

    public static void show(final Activity activity) {
        if (activity == null || activity.isFinishing()) {
            return;
        }
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                showInternal(activity);
            }
        });
    }

    private static void showInternal(final Activity activity) {
        final Dialog dialog = new Dialog(activity, android.R.style.Theme_DeviceDefault_Dialog_NoActionBar);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        final int pad = MorpheTheme.dp(activity, 26);

        final LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(pad, pad, pad, pad);
        root.setBackgroundColor(MorpheTheme.COLOR_BG);

        // Dialog width, shared by the window and the height measurement below.
        final int dialogWidth = MorpheTheme.dp(activity, 620);

        // Red accent bar gives the dialog its Morphe look.
        View accent = new View(activity);
        accent.setBackgroundColor(MorpheTheme.COLOR_ACCENT);
        root.addView(accent, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                MorpheTheme.dp(activity, 4)));

        TextView title = new TextView(activity);
        title.setText("SEYTTINGS");
        title.setTextColor(MorpheTheme.COLOR_ACCENT);
        title.setTextSize(24);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setGravity(Gravity.START);
        title.setPadding(0, MorpheTheme.dp(activity, 14), 0, 0);
        root.addView(title);

        TextView subtitle = new TextView(activity);
        subtitle.setText("KICK TV tweaks");
        subtitle.setTextColor(MorpheTheme.COLOR_MUTED);
        subtitle.setTextSize(14);
        subtitle.setPadding(0, MorpheTheme.dp(activity, 4), 0, MorpheTheme.dp(activity, 14));
        root.addView(subtitle);

        View divider = new View(activity);
        divider.setBackgroundColor(MorpheTheme.COLOR_ACCENT_DARK);
        root.addView(divider, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                MorpheTheme.dp(activity, 2)));

        LinearLayout sections = new LinearLayout(activity);
        sections.setOrientation(LinearLayout.VERTICAL);
        sections.setPadding(0, MorpheTheme.dp(activity, 12), 0, MorpheTheme.dp(activity, 6));

        // The tweak list grows with every feature patch, so it lives in a
        // ScrollView: the header and the Close button stay put and the sections
        // scroll when they do not fit the screen.
        final ScrollView scroll = new ScrollView(activity);
        scroll.setFillViewport(false);
        scroll.setFocusable(false);
        scroll.addView(sections, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        root.addView(scroll, MorpheTheme.matchWidth());

        int installed = 0;
        for (String className : SECTION_CLASSES) {
            MorpheSection section = createSection(className);
            if (section != null) {
                section.addTo(activity, sections);
                installed++;
            }
        }

        if (installed == 0) {
            TextView empty = new TextView(activity);
            empty.setText("No tweaks installed. Apply a feature patch such as EMOTES, "
                    + "CHAT SIZE, CHAT TEXT SIZE or EXPAND CHAT together with SEYTTINGS.");
            empty.setTextColor(MorpheTheme.COLOR_MUTED);
            empty.setTextSize(15);
            empty.setPadding(0, MorpheTheme.dp(activity, 6), 0, MorpheTheme.dp(activity, 10));
            sections.addView(empty, MorpheTheme.matchWidth());
        }

        final Button close = new Button(activity);
        close.setAllCaps(false);
        close.setText("Close");
        close.setTextColor(MorpheTheme.COLOR_ACCENT);
        close.setTextSize(18);
        MorpheTheme.makeFocusable(activity, close);
        close.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
            }
        });
        root.addView(close, MorpheTheme.matchWidth());

        // Measure the natural dialog height, then cap the scrolling area so the
        // dialog always fits the screen and every section stays reachable.
        root.measure(
                View.MeasureSpec.makeMeasureSpec(dialogWidth, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
        int naturalHeight = root.getMeasuredHeight();
        int maxHeight = (int) (activity.getResources().getDisplayMetrics().heightPixels * 0.9f);
        if (naturalHeight > maxHeight) {
            ViewGroup.LayoutParams scrollParams = scroll.getLayoutParams();
            scrollParams.height = Math.max(
                    MorpheTheme.dp(activity, 120),
                    scroll.getMeasuredHeight() - (naturalHeight - maxHeight));
            scroll.setLayoutParams(scrollParams);
        }

        dialog.setContentView(root);
        dialog.setCanceledOnTouchOutside(true);
        dialog.show();

        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(MorpheTheme.COLOR_BG));
            window.setLayout(dialogWidth, ViewGroup.LayoutParams.WRAP_CONTENT);
        }

        // Start on the first feature control so a remote can toggle it right away.
        if (!focusFirst(sections)) {
            close.requestFocus();
        }
    }

    private static MorpheSection createSection(String className) {
        try {
            Class<?> type = Class.forName(className);
            Object instance = type.getDeclaredConstructor().newInstance();
            if (instance instanceof MorpheSection) {
                return (MorpheSection) instance;
            }
        } catch (Throwable ignored) {
            // The feature patch is not applied, so its extension is not merged.
        }
        return null;
    }

    private static boolean focusFirst(ViewGroup group) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child.isFocusable()) {
                child.requestFocus();
                return true;
            }
            if (child instanceof ViewGroup && focusFirst((ViewGroup) child)) {
                return true;
            }
        }
        return false;
    }
}
