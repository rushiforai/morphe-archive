package dev.alastorkaneki.morphe.extension.operagx;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.text.InputType;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.util.concurrent.atomic.AtomicBoolean;

/** Adds the visible floating Download Mod button to Opera GX activities. */
public final class GxModOverlayController implements Application.ActivityLifecycleCallbacks {
    private static final String BUTTON_TAG =
            "dev.alastorkaneki.morphe.extension.operagx.DOWNLOAD_BUTTON";
    private static final AtomicBoolean INSTALLED = new AtomicBoolean(false);

    private GxModOverlayController() {
    }

    public static void install(Application application) {
        if (INSTALLED.compareAndSet(false, true)) {
            application.registerActivityLifecycleCallbacks(new GxModOverlayController());
        }
    }

    @Override
    public void onActivityResumed(Activity activity) {
        if (!(activity instanceof GxModDownloadActivity)) {
            attachButton(activity);
        }
    }

    @Override
    public void onActivityPaused(Activity activity) {
        detachButton(activity);
    }

    @Override
    public void onActivityDestroyed(Activity activity) {
        detachButton(activity);
    }

    private static void attachButton(Activity activity) {
        View decor = activity.getWindow().getDecorView();
        View existing = decor.findViewWithTag(BUTTON_TAG);
        if (existing instanceof TextView) {
            applyButtonTheme(activity, (TextView) existing);
            existing.bringToFront();
            return;
        }

        TextView button = new TextView(activity);
        button.setTag(BUTTON_TAG);
        button.setText("Download Mod  ↓");
        button.setContentDescription("Download the current GX Store mod as a file");
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        button.setTypeface(Typeface.DEFAULT_BOLD);
        button.setGravity(Gravity.CENTER);
        button.setClickable(true);
        button.setFocusable(true);
        button.setElevation(dp(activity, 12));
        button.setPadding(
                dp(activity, 18),
                dp(activity, 11),
                dp(activity, 18),
                dp(activity, 11)
        );
        applyButtonTheme(activity, button);
        button.setOnClickListener(view -> handleDownloadClick(activity));

        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.END | Gravity.BOTTOM
        );
        params.setMargins(
                dp(activity, 16),
                dp(activity, 16),
                dp(activity, 16),
                dp(activity, 92)
        );

        activity.addContentView(button, params);
        button.bringToFront();
    }

    private static void applyButtonTheme(Activity activity, TextView button) {
        GxThemePalette palette = GxThemePalette.resolve(activity);
        button.setTextColor(palette.textColor);

        GradientDrawable shape = new GradientDrawable();
        shape.setColor(palette.fillColor);
        shape.setCornerRadius(dp(activity, 28));
        shape.setStroke(dp(activity, 2), palette.strokeColor);

        RippleDrawable background = new RippleDrawable(
                ColorStateList.valueOf(palette.rippleColor),
                shape,
                null
        );
        button.setBackground(background);
    }

    private static void detachButton(Activity activity) {
        View button = activity.getWindow().getDecorView().findViewWithTag(BUTTON_TAG);
        if (button == null) {
            return;
        }
        if (button.getParent() instanceof ViewGroup) {
            ((ViewGroup) button.getParent()).removeView(button);
        }
    }

    private static void handleDownloadClick(Activity activity) {
        String currentUrl = GxCurrentPageUrlFinder.find(activity);
        if (currentUrl != null) {
            launchDownloader(activity, currentUrl);
            return;
        }
        showPasteDialog(activity);
    }

    private static void showPasteDialog(Activity activity) {
        EditText input = new EditText(activity);
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI);
        input.setHint("https://store.gx.me/mods/…");
        input.setSelectAllOnFocus(false);

        String clipboardUrl = GxCurrentPageUrlFinder.findClipboardUrl(activity);
        if (clipboardUrl != null) {
            input.setText(clipboardUrl);
            input.setSelection(input.length());
        }

        FrameLayout container = new FrameLayout(activity);
        int margin = dp(activity, 20);
        container.setPadding(margin, 0, margin, 0);
        container.addView(input, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        new AlertDialog.Builder(activity)
                .setTitle("Download GX Mod")
                .setMessage(
                        "Opera did not expose the complete current-tab URL. " +
                                "Paste the GX Store mod-page address below."
                )
                .setView(container)
                .setNegativeButton(android.R.string.cancel, null)
                .setPositiveButton("Download", (dialog, which) -> {
                    String url = GxModUrlResolver.extractStorePageUrl(
                            input.getText().toString()
                    );
                    if (url == null) {
                        Toast.makeText(
                                activity,
                                "That is not a GX Store mod-page URL.",
                                Toast.LENGTH_LONG
                        ).show();
                        return;
                    }
                    launchDownloader(activity, url);
                })
                .show();
    }

    private static void launchDownloader(Activity activity, String storeUrl) {
        Intent intent = new Intent(activity, GxModDownloadActivity.class);
        intent.setData(Uri.parse(storeUrl));
        activity.startActivity(intent);
    }

    private static int dp(Activity activity, int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }

    @Override public void onActivityCreated(Activity activity, Bundle state) { }
    @Override public void onActivityStarted(Activity activity) { }
    @Override public void onActivityStopped(Activity activity) { }
    @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
}
