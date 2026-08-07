package dev.alastorkaneki.morphe.extension.suno;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Color;
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

/** Adds a small floating Lyrics button without relying on Suno's obfuscated UI classes. */
public final class SunoLyricsOverlayController implements Application.ActivityLifecycleCallbacks {
    private static final String BUTTON_TAG =
            "dev.alastorkaneki.morphe.extension.suno.TIMESTAMPED_LYRICS_BUTTON";
    private static final AtomicBoolean INSTALLED = new AtomicBoolean(false);

    private SunoLyricsOverlayController() {
    }

    public static void install(Application application) {
        if (INSTALLED.compareAndSet(false, true)) {
            application.registerActivityLifecycleCallbacks(new SunoLyricsOverlayController());
        }
    }

    @Override
    public void onActivityResumed(Activity activity) {
        if (!(activity instanceof SunoLyricsExportActivity)) {
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
        if (existing != null) {
            existing.bringToFront();
            return;
        }

        TextView button = new TextView(activity);
        button.setTag(BUTTON_TAG);
        button.setText("LRC ↓");
        button.setContentDescription("Download timestamped lyrics for a Suno song");
        button.setTextColor(Color.WHITE);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        button.setTypeface(Typeface.DEFAULT_BOLD);
        button.setGravity(Gravity.CENTER);
        button.setClickable(true);
        button.setFocusable(true);
        button.setElevation(dp(activity, 14));
        button.setPadding(dp(activity, 14), dp(activity, 10), dp(activity, 14), dp(activity, 10));

        GradientDrawable shape = new GradientDrawable();
        shape.setColor(Color.rgb(21, 18, 31));
        shape.setCornerRadius(dp(activity, 24));
        shape.setStroke(dp(activity, 2), Color.rgb(139, 92, 246));
        button.setBackground(new RippleDrawable(
                ColorStateList.valueOf(Color.argb(90, 255, 255, 255)),
                shape,
                null
        ));
        button.setOnClickListener(view -> openExporter(activity));
        button.setOnLongClickListener(view -> {
            detachButton(activity);
            Toast.makeText(
                    activity,
                    "Lyrics button hidden until this screen is reopened.",
                    Toast.LENGTH_SHORT
            ).show();
            return true;
        });

        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.END | Gravity.BOTTOM
        );
        params.setMargins(dp(activity, 16), dp(activity, 16), dp(activity, 16), dp(activity, 96));
        activity.addContentView(button, params);
        button.bringToFront();
    }

    private static void openExporter(Activity activity) {
        String songId = SunoSongReference.fromIntent(activity.getIntent());
        if (songId == null) {
            songId = SunoSongReference.fromViewTree(activity.getWindow().getDecorView());
        }
        if (songId == null) {
            songId = SunoSongReference.fromClipboard(activity);
        }

        if (songId != null) {
            launch(activity, songId);
        } else {
            showSongDialog(activity);
        }
    }

    private static void showSongDialog(Activity activity) {
        EditText input = new EditText(activity);
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI);
        input.setHint("https://suno.com/song/… or song UUID");

        String clipboardSongId = SunoSongReference.fromClipboard(activity);
        if (clipboardSongId != null) {
            input.setText(SunoSongReference.toSongUri(clipboardSongId).toString());
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
                .setTitle("Timestamped Lyrics")
                .setMessage(
                        "Suno did not expose a song ID in the visible screen. " +
                                "Paste the song link or UUID below."
                )
                .setView(container)
                .setNegativeButton(android.R.string.cancel, null)
                .setPositiveButton("Open exporter", (dialog, which) -> {
                    String songId = SunoSongReference.extract(input.getText().toString());
                    if (songId == null) {
                        Toast.makeText(
                                activity,
                                "That is not a valid Suno song link or UUID.",
                                Toast.LENGTH_LONG
                        ).show();
                        return;
                    }
                    launch(activity, songId);
                })
                .show();
    }

    private static void launch(Activity activity, String songId) {
        Intent intent = new Intent(activity, SunoLyricsExportActivity.class);
        intent.setData(SunoSongReference.toSongUri(songId));
        activity.startActivity(intent);
    }

    private static void detachButton(Activity activity) {
        View button = activity.getWindow().getDecorView().findViewWithTag(BUTTON_TAG);
        if (button != null && button.getParent() instanceof ViewGroup) {
            ((ViewGroup) button.getParent()).removeView(button);
        }
    }

    private static int dp(Activity activity, int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }

    @Override public void onActivityCreated(Activity activity, Bundle state) { }
    @Override public void onActivityStarted(Activity activity) { }
    @Override public void onActivityStopped(Activity activity) { }
    @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
}
