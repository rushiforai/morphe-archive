package app.mahirsn.extension.youtube.history;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * "Keep watching · 12:34" in the player, drawn the way YouTube draws its "Skip ad" button and
 * SponsorBlock its "Skip segment" button, and placed where they are.
 */
@SuppressLint("ViewConstructor")
final class ResumeChip extends FrameLayout {
    private final Paint background = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final View pill;

    ResumeChip(Context ctx, String label, Runnable onClick) {
        super(ctx);
        setWillNotDraw(false);
        background.setColor(Ui.color(ctx, "skip_ad_button_background_color", 0xCC000000));
        int fg = Ui.color(ctx, "skip_ad_button_foreground_color", 0xFFFFFFFF);
        int icon = Ui.id(ctx, "drawable", "mahirsn_history_resume");

        // SponsorBlock's layout of the same button, when that patch is there.
        int layout = Ui.id(ctx, "layout", "morphe_sb_skip_sponsor_button");
        View inflated = null;
        if (layout != 0) {
            try {
                LayoutInflater.from(ctx).inflate(layout, this, true);
                inflated = Ui.find(this, "morphe_sb_skip_sponsor_button_container");
                TextView text = (TextView) Ui.find(this, "morphe_sb_skip_sponsor_button_text");
                ImageView image = (ImageView) Ui.find(this, "morphe_sb_skip_sponsor_button_icon");
                if (inflated == null || text == null) throw new IllegalStateException();
                text.setText(label);
                if (image != null && icon != 0) image.setImageResource(icon);
            } catch (Exception e) {
                removeAllViews();
                inflated = null;
            }
        }
        if (inflated == null) {
            LinearLayout row = new LinearLayout(ctx);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(Ui.dp(ctx, 14), Ui.dp(ctx, 5), Ui.dp(ctx, 8), Ui.dp(ctx, 5));
            row.addView(Ui.text(ctx, label, 13, fg));
            if (icon != 0) {
                ImageView image = new ImageView(ctx);
                image.setImageResource(icon);
                image.setAlpha(0.8f);
                image.setPadding(Ui.dp(ctx, 6), Ui.dp(ctx, 3), 0, Ui.dp(ctx, 3));
                row.addView(image, new LinearLayout.LayoutParams(Ui.dp(ctx, 26), Ui.dp(ctx, 26)));
            }
            addView(row, new LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, Ui.dp(ctx, 32), Gravity.CENTER_VERTICAL));
            inflated = row;
        }
        pill = inflated;
        setMinimumHeight(Ui.dimen(ctx, "ad_skip_ad_button_min_height", Ui.dp(ctx, 40)));
        pill.setOnClickListener(v -> onClick.run());
    }

    @Override
    protected void dispatchDraw(Canvas canvas) {
        float r = pill.getHeight() / 2f;
        canvas.drawRoundRect(new RectF(pill.getLeft(), pill.getTop(), pill.getRight(), pill.getBottom()), r, r, background);
        super.dispatchDraw(canvas);
    }

    /**
     * Shows the chip in the player: next to SponsorBlock's skip button (same parent, same place),
     * else in the bottom corner of the player overlay where YouTube puts "Skip ad".
     */
    boolean attach(View root) {
        View sponsorSkip = Ui.find(root, "morphe_sb_skip_sponsor_button");
        if (sponsorSkip != null && sponsorSkip.getParent() instanceof ViewGroup) {
            ViewGroup parent = (ViewGroup) sponsorSkip.getParent();
            try {
                ViewGroup.LayoutParams lp = sponsorSkip.getLayoutParams();
                ViewGroup.LayoutParams copy = lp.getClass().getConstructor(lp.getClass()).newInstance(lp);
                copy.width = ViewGroup.LayoutParams.WRAP_CONTENT;
                parent.addView(this, copy);
                setPadding(sponsorSkip.getPaddingLeft(), sponsorSkip.getPaddingTop(),
                        sponsorSkip.getPaddingRight(), sponsorSkip.getPaddingBottom());
                return true;
            } catch (Exception ignored) {
                // Fall through to the overlay.
            }
        }
        View overlay = Ui.find(root, "youtube_controls_overlay");
        if (!(overlay instanceof FrameLayout)) return false;
        Context ctx = getContext();
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM | Gravity.END);
        lp.bottomMargin = Ui.dimen(ctx, "skip_button_default_bottom_margin", Ui.dp(ctx, 60)) + Ui.dp(ctx, 10);
        ((FrameLayout) overlay).addView(this, lp);
        return true;
    }

    void detach() {
        if (getParent() instanceof ViewGroup) ((ViewGroup) getParent()).removeView(this);
    }
}
