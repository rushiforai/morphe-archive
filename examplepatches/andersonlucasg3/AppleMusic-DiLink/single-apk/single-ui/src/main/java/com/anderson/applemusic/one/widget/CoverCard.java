package com.anderson.applemusic.one.widget;

import android.content.Context;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.anderson.applemusic.one.media.ArtworkLoader;
import com.anderson.applemusic.one.media.MediaClient;
import com.anderson.applemusic.one.theme.Inter;
import com.anderson.applemusic.one.theme.Shapes;
import com.anderson.applemusic.one.theme.Tokens;

/**
 * Cover-dominant card: square artwork with 16 dp corners, a bottom scrim and the
 * title/subtitle painted over it, exactly like the companions' shelf cards. The cover is
 * the whole card; text is truncated and never grows the card.
 */
public final class CoverCard extends FrameLayout {

    private final ImageView cover;
    private final TextView title;
    private final TextView subtitle;
    private final TextView action;
    private final View outline;

    public CoverCard(Context context, ArtworkLoader artwork, MediaClient.Item item, int sizePx) {
        super(context);
        setBackground(Shapes.rounded(Tokens.SURFACE, Tokens.RADIUS_CARD));
        Shapes.clip(this, Tokens.RADIUS_CARD);

        cover = new ImageView(context);
        cover.setScaleType(ImageView.ScaleType.CENTER_CROP);
        cover.setBackgroundColor(Tokens.SURFACE_HOVER);
        addView(cover, new FrameLayout.LayoutParams(
                LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));
        artwork.load(item.artworkUri, cover);
        if (item.artworkUri == null || item.artworkUri.length() == 0) {
            IconView fallback = new IconView(context, Icons.NOTE, Tokens.TEXT_DIM);
            fallback.setAlpha(0.55f);
            addView(fallback, new FrameLayout.LayoutParams(Tokens.dp(40), Tokens.dp(40),
                    Gravity.CENTER));
        }

        View scrim = new View(context);
        scrim.setBackground(Shapes.coverScrim());
        addView(scrim, new FrameLayout.LayoutParams(
                LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));

        LinearLayout textBlock = new LinearLayout(context);
        textBlock.setOrientation(LinearLayout.VERTICAL);
        textBlock.setPadding(Tokens.dp(12), 0, Tokens.dp(12), Tokens.dp(12));
        title = Inter.text(context, item.title, Tokens.CARD, Inter.SEMIBOLD, Tokens.TEXT);
        title.setMaxLines(2);
        title.setEllipsize(TextUtils.TruncateAt.END);
        textBlock.addView(title);
        subtitle = Inter.text(context, item.subtitle, Tokens.CAPTION, Inter.REGULAR, Tokens.TEXT_DIM);
        subtitle.setMaxLines(1);
        subtitle.setEllipsize(TextUtils.TruncateAt.END);
        if (item.subtitle.length() > 0) {
            LinearLayout.LayoutParams subtitleParams = new LinearLayout.LayoutParams(
                    LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
            subtitleParams.topMargin = Tokens.dp(3);
            textBlock.addView(subtitle, subtitleParams);
        }
        action = Inter.text(context, "Tocar", 11f, Inter.SEMIBOLD, Tokens.ACCENT);
        action.setVisibility(item.playable ? View.VISIBLE : View.GONE);
        LinearLayout.LayoutParams actionParams = new LinearLayout.LayoutParams(
                LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
        actionParams.topMargin = Tokens.dp(5);
        textBlock.addView(action, actionParams);

        FrameLayout.LayoutParams textParams = new FrameLayout.LayoutParams(
                LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT, Gravity.BOTTOM);
        addView(textBlock, textParams);

        outline = new View(context);
        outline.setBackground(Shapes.rounded(0x00000000, Tokens.RADIUS_CARD, Tokens.ACCENT, 2f));
        addView(outline, new FrameLayout.LayoutParams(
                LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));

        Focus.attach(this, Tokens.RADIUS_CARD, Tokens.SURFACE, Tokens.SURFACE_HOVER, outline);
        Focus.rippleOnTop(this, Tokens.RADIUS_CARD);
        setLayoutParams(new LinearLayout.LayoutParams(sizePx, sizePx));
    }

    public int cardSize() {
        return getLayoutParams() != null ? getLayoutParams().width : 0;
    }
}
