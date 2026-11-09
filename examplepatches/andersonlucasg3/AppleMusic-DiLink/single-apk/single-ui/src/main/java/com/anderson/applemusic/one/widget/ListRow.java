package com.anderson.applemusic.one.widget;

import android.content.Context;
import android.text.TextUtils;
import android.view.Gravity;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.anderson.applemusic.one.media.ArtworkLoader;
import com.anderson.applemusic.one.theme.Inter;
import com.anderson.applemusic.one.theme.Shapes;
import com.anderson.applemusic.one.theme.Tokens;

/**
 * Compact list entry: 52 dp cover, title/subtitle and an optional chevron for browsable
 * nodes. 72 dp tall, so the D-pad target is comfortable and the list stays scannable.
 *
 * <p>{@link #bind} lets a {@code ListView} recycle the row for another item (the cover
 * loader tags the {@link ImageView}, so a late decode never paints the wrong cover).
 */
public final class ListRow extends LinearLayout {

    private final ImageView cover;
    private final TextView titleView;
    private final TextView subtitleView;
    private final IconView chevron;

    public ListRow(Context context, ArtworkLoader artwork, String title, String subtitle,
                   String artworkUri, boolean browsable) {
        super(context);
        setOrientation(HORIZONTAL);
        setGravity(Gravity.CENTER_VERTICAL);
        setPadding(Tokens.dp(10), Tokens.dp(8), Tokens.dp(14), Tokens.dp(8));
        setMinimumHeight(Tokens.dp(68));
        setBackground(Shapes.rounded(Tokens.SURFACE, Tokens.RADIUS_CONTROL));
        Shapes.clip(this, Tokens.RADIUS_CONTROL);

        cover = new ImageView(context);
        cover.setScaleType(ImageView.ScaleType.CENTER_CROP);
        cover.setBackgroundColor(Tokens.SURFACE_HOVER);
        cover.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        LinearLayout.LayoutParams coverParams =
                new LinearLayout.LayoutParams(Tokens.dp(52), Tokens.dp(52));
        coverParams.rightMargin = Tokens.dp(14);
        addView(cover, coverParams);

        LinearLayout textBlock = new LinearLayout(context);
        textBlock.setOrientation(VERTICAL);
        titleView = Inter.text(context, "", Tokens.CARD, Inter.SEMIBOLD, Tokens.TEXT);
        titleView.setMaxLines(1);
        titleView.setEllipsize(TextUtils.TruncateAt.END);
        textBlock.addView(titleView);
        subtitleView = Inter.text(context, "", Tokens.CAPTION, Inter.REGULAR, Tokens.TEXT_DIM);
        subtitleView.setMaxLines(1);
        subtitleView.setEllipsize(TextUtils.TruncateAt.END);
        LinearLayout.LayoutParams subtitleParams = new LinearLayout.LayoutParams(
                LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
        subtitleParams.topMargin = Tokens.dp(3);
        textBlock.addView(subtitleView, subtitleParams);
        addView(textBlock, new LinearLayout.LayoutParams(0,
                LayoutParams.WRAP_CONTENT, 1f));

        chevron = new IconView(context, Icons.CHEVRON_RIGHT, Tokens.TEXT_DIM);
        addView(chevron, new LinearLayout.LayoutParams(Tokens.dp(18), Tokens.dp(18)));

        Focus.attach(this, Tokens.RADIUS_CONTROL, Tokens.SURFACE, Tokens.SURFACE_HOVER, null);
        setLayoutParams(new LinearLayout.LayoutParams(
                LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));
        bind(artwork, title, subtitle, artworkUri, browsable);
    }

    /** Rebinds a recycled row (ListView {@code convertView}) to another item. */
    public void bind(ArtworkLoader artwork, String title, String subtitle, String artworkUri,
                     boolean browsable) {
        boolean hasArtwork = artworkUri != null && artworkUri.length() > 0;
        if (artwork != null) artwork.load(hasArtwork ? artworkUri : null, cover);
        if (hasArtwork) {
            cover.setPadding(0, 0, 0, 0);
        } else {
            cover.setImageDrawable(new Icons.IconDrawable(Icons.NOTE, Tokens.TEXT_DIM));
            int pad = Tokens.dp(13);
            cover.setPadding(pad, pad, pad, pad);
        }
        titleView.setText(title);
        subtitleView.setText(subtitle == null ? "" : subtitle);
        subtitleView.setVisibility(subtitle == null || subtitle.length() == 0
                ? GONE : VISIBLE);
        chevron.setVisibility(browsable ? VISIBLE : GONE);
        setContentDescription(subtitle == null || subtitle.length() == 0
                ? title : title + ", " + subtitle);
    }

    public ImageView cover() {
        return cover;
    }
}
