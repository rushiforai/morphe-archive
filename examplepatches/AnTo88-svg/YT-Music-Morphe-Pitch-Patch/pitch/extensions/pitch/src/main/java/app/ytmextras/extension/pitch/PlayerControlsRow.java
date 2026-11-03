package app.ytmextras.extension.pitch;

import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Locale;

/**
 * The row below the player buttons, declared in the layout of the player controls.
 * The pitch is below the shuffle button and the share button is below the repeat button.
 * The empty space between them does not take touches, so the play button can still be pressed.
 */
public final class PlayerControlsRow extends LinearLayout {

    private static final String TAG = "YtmExtrasPitch";
    private static final String SHARE_URL = "https://music.youtube.com/watch?v=";
    private static final String SHARE_ICON = "yt_outline_share_vd_theme_24";

    // The same size as the buttons of the player.
    private static final int BUTTON_SIZE_DP = 48;
    // Moves the row up beside the large play button, right below the shuffle and repeat buttons:
    // half of the size difference of the two buttons, plus the bottom margin of the buttons.
    private static final int TOP_MARGIN_DP = 20;
    private static final int ICON_PADDING_DP = 12;
    private static final int VALUE_WIDTH_DP = 28;
    private static final int BUTTON_TEXT_SIZE_SP = 20;
    private static final int VALUE_TEXT_SIZE_SP = 16;
    private static final float DISABLED_ALPHA = 0.4f;

    private final View pitchControls;
    private final TextView minus;
    private final TextView plus;
    private final TextView value;
    private final Runnable refresh = this::refresh;

    public PlayerControlsRow(Context context, AttributeSet attributes) {
        super(context, attributes);

        setOrientation(HORIZONTAL);
        setGravity(Gravity.CENTER_VERTICAL);
        setLayoutDirection(LAYOUT_DIRECTION_LTR);

        minus = createButton("−", () -> changePitch(-1));
        plus = createButton("+", () -> changePitch(1));

        value = new TextView(context);
        value.setTextColor(Color.WHITE);
        value.setTextSize(TypedValue.COMPLEX_UNIT_SP, VALUE_TEXT_SIZE_SP);
        value.setGravity(Gravity.CENTER);

        LinearLayout pitch = new LinearLayout(context);
        pitch.setOrientation(HORIZONTAL);
        pitch.setGravity(Gravity.CENTER_VERTICAL);
        pitch.addView(minus, new LayoutParams(dp(BUTTON_SIZE_DP), dp(BUTTON_SIZE_DP)));
        pitch.addView(value, new LayoutParams(dp(VALUE_WIDTH_DP), LayoutParams.WRAP_CONTENT));
        pitch.addView(plus, new LayoutParams(dp(BUTTON_SIZE_DP), dp(BUTTON_SIZE_DP)));
        pitchControls = pitch;

        addView(pitch, new LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT));
        addView(new View(context), new LayoutParams(0, 0, 1f));
        addView(createShareButton(), new LayoutParams(dp(BUTTON_SIZE_DP), dp(BUTTON_SIZE_DP)));

        refresh();
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();

        // Set here because a negative value cannot be encoded in the patched layout.
        if (getLayoutParams() instanceof MarginLayoutParams) {
            MarginLayoutParams params = (MarginLayoutParams) getLayoutParams();
            if (params.topMargin != -dp(TOP_MARGIN_DP)) {
                params.topMargin = -dp(TOP_MARGIN_DP);
                setLayoutParams(params);
            }
        }

        PitchPatch.addListener(refresh);
        refresh();
    }

    @Override
    protected void onDetachedFromWindow() {
        PitchPatch.removeListener(refresh);
        super.onDetachedFromWindow();
    }

    private int dp(int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, getResources().getDisplayMetrics()));
    }

    private void setRipple(View view) {
        TypedValue ripple = new TypedValue();
        if (getContext().getTheme().resolveAttribute(
                android.R.attr.selectableItemBackgroundBorderless, ripple, true)) {
            view.setBackgroundResource(ripple.resourceId);
        }
    }

    private TextView createButton(String text, Runnable action) {
        TextView button = new TextView(getContext());
        button.setText(text);
        button.setTextColor(Color.WHITE);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, BUTTON_TEXT_SIZE_SP);
        button.setGravity(Gravity.CENTER);
        setRipple(button);
        button.setOnClickListener(view -> action.run());
        return button;
    }

    private ImageView createShareButton() {
        ImageView button = new ImageView(getContext());
        // A 48dp button with a 24dp icon, the same as the shuffle and repeat buttons.
        button.setScaleType(ImageView.ScaleType.FIT_CENTER);
        button.setPadding(dp(ICON_PADDING_DP), dp(ICON_PADDING_DP), dp(ICON_PADDING_DP), dp(ICON_PADDING_DP));
        button.setContentDescription(PitchSettingsActivity.shareDescription());
        setRipple(button);

        final int icon = getResources().getIdentifier(
                SHARE_ICON, "drawable", getContext().getPackageName());
        if (icon != 0) {
            Drawable drawable = getContext().getDrawable(icon);
            if (drawable != null) {
                drawable.mutate().setColorFilter(Color.WHITE, PorterDuff.Mode.SRC_IN);
                button.setImageDrawable(drawable);
            }
        }

        button.setOnClickListener(view -> share());
        return button;
    }

    private void changePitch(int change) {
        try {
            PitchPatch.setSemitones(getContext(), PitchPatch.getSemitones() + change);
        } catch (Exception ex) {
            Log.e(TAG, "Could not change the pitch", ex);
        }
    }

    private void refresh() {
        pitchControls.setVisibility(PitchPatch.isEnabled() ? VISIBLE : INVISIBLE);

        final int semitones = PitchPatch.getSemitones();
        value.setText(String.format(Locale.ROOT, semitones > 0 ? "+%d" : "%d", semitones));
        setButtonEnabled(minus, semitones > PitchPatch.MIN_SEMITONES);
        setButtonEnabled(plus, semitones < PitchPatch.MAX_SEMITONES);
    }

    private static void setButtonEnabled(View button, boolean enabled) {
        button.setEnabled(enabled);
        button.setAlpha(enabled ? 1f : DISABLED_ALPHA);
    }

    private void share() {
        try {
            final String videoId = PitchPatch.getVideoId();
            if (videoId == null || videoId.isEmpty()) {
                Toast.makeText(getContext(), PitchSettingsActivity.shareUnavailable(), Toast.LENGTH_SHORT).show();
                return;
            }

            Intent intent = new Intent(Intent.ACTION_SEND)
                    .setType("text/plain")
                    .putExtra(Intent.EXTRA_TEXT, SHARE_URL + videoId);
            getContext().startActivity(Intent.createChooser(intent, null));
        } catch (Exception ex) {
            Log.e(TAG, "Could not share the track", ex);
        }
    }
}
