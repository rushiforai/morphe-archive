package dev.materialtidal.extension.tidal.collection;

import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.TextPaint;
import android.text.TextUtils;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.SoundEffectConstants;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.OvershootInterpolator;

import java.util.ArrayList;
import java.util.List;

import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;

/**
 * Custom Material 3 Expressive Bento tile grid replacing TIDAL's flat Collection category list.
 *
 * <p>Features a 2-column responsive Bento layout with promoted hero cards for Playlists & Tracks,
 * zero-orphan dynamic packing (7, 8, or 9 visible items), dynamic Monet tonal gradients, subtle
 * oversized rotated icon watermarks, official TIDAL vector icon badges, auto-fitting bold labels,
 * and shape-morphing spring press animations.
 */
public final class ExpressiveCollectionGridView extends View {

    private static final int ROLE_HERO_PRIMARY = 0;
    private static final int ROLE_HERO_TERTIARY = 1;
    private static final int ROLE_STANDARD = 2;
    private static final int ROLE_DOWNLOADS = 3;

    private static final DecelerateInterpolator PRESS_INTERP = new DecelerateInterpolator(1.6f);
    private static final OvershootInterpolator RELEASE_SPRING_INTERP = new OvershootInterpolator(1.5f);

    private static final class Tile {
        final int eventKey;
        final int role;
        final boolean useTertiaryBadge;
        final String label;
        final Drawable iconDrawable;
        final RectF bounds = new RectF();
        final Path clipPath = new Path();
        final RectF borderRect = new RectF();

        int span = 1;
        float baseRadiusPx;
        float pressedRadiusPx;

        float pressProgress;
        float rippleAlpha;
        float rippleRadiusFrac;
        float rippleCx;
        float rippleCy;
        ValueAnimator pressAnim;
        ValueAnimator rippleAnim;

        // Cached gradient state to avoid per-frame allocations during animations
        int cachedStartColor;
        int cachedEndColor;
        float cachedLeft;
        float cachedTop;
        float cachedRight;
        float cachedBottom;
        LinearGradient cachedGradient;

        Tile(int eventKey, int role, boolean useTertiaryBadge, String label, Drawable iconDrawable) {
            this.eventKey = eventKey;
            this.role = role;
            this.useTertiaryBadge = useTertiaryBadge;
            this.label = label;
            this.iconDrawable = iconDrawable;
        }

        void cancelAnimations() {
            if (pressAnim != null) {
                pressAnim.cancel();
                pressAnim = null;
            }
            if (rippleAnim != null) {
                rippleAnim.cancel();
                rippleAnim = null;
            }
        }
    }

    private final float density;
    private final float fontScale;
    private final int touchSlop;

    private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint borderPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint badgePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint ripplePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint textPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);

    private final List<Tile> tiles = new ArrayList<>(9);
    private Drawable chevronDrawable;

    private boolean showPurchases;
    private boolean showSaveForLater;
    private boolean isOffline;
    private boolean rosterInitialized;

    private int pressedIndex = -1;
    private float downX;
    private float downY;
    private int lastLayoutWidth = -1;

    public ExpressiveCollectionGridView(Context context) {
        super(context);
        this.density = context.getResources().getDisplayMetrics().density;
        this.fontScale = context.getResources().getConfiguration().fontScale;
        this.touchSlop = ViewConfiguration.get(context).getScaledTouchSlop();

        setWillNotDraw(false);
        setClickable(true);
        if (Build.VERSION.SDK_INT >= 29) {
            setForceDarkAllowed(false);
        }

        fillPaint.setStyle(Paint.Style.FILL);
        borderPaint.setStyle(Paint.Style.STROKE);
        badgePaint.setStyle(Paint.Style.FILL);
        ripplePaint.setStyle(Paint.Style.FILL);

        textPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        textPaint.setSubpixelText(true);

        this.chevronDrawable = loadMutatedDrawable(context, "ic_chevron_right");
        rebuildRoster(false, false);
    }

    /** Updates visible optional categories and offline mode from TIDAL's Compose state. */
    public void updateState(boolean showPurchases, boolean showSaveForLater, boolean isOffline) {
        boolean rosterChanged = !rosterInitialized
                || this.showPurchases != showPurchases
                || this.showSaveForLater != showSaveForLater;
        boolean offlineChanged = this.isOffline != isOffline;

        this.showPurchases = showPurchases;
        this.showSaveForLater = showSaveForLater;
        this.isOffline = isOffline;
        this.rosterInitialized = true;

        if (rosterChanged) {
            rebuildRoster(showPurchases, showSaveForLater);
            lastLayoutWidth = -1;
            requestLayout();
        }
        if (rosterChanged || offlineChanged) {
            invalidate();
        }
    }

    private void rebuildRoster(boolean includePurchases, boolean includeSaveForLater) {
        for (Tile t : tiles) {
            t.cancelAnimations();
        }
        tiles.clear();
        pressedIndex = -1;

        Context ctx = getContext();
        // Hero top row
        addTile(ctx, ExpressiveCollectionBridge.ITEM_PLAYLISTS, ROLE_HERO_PRIMARY, false,
                "ic_playlists", "playlists", "Playlists");
        addTile(ctx, ExpressiveCollectionBridge.ITEM_TRACKS, ROLE_HERO_TERTIARY, true,
                "ic_tracks", "tracks", "Tracks");

        // Core 2-column grid (alternating badge accents)
        addTile(ctx, ExpressiveCollectionBridge.ITEM_ALBUMS, ROLE_STANDARD, false,
                "ic_album", "albums", "Albums");
        addTile(ctx, ExpressiveCollectionBridge.ITEM_ARTISTS, ROLE_STANDARD, true,
                "ic_artist", "artists", "Artists");
        addTile(ctx, ExpressiveCollectionBridge.ITEM_MIXES_RADIO, ROLE_STANDARD, false,
                "ic_radio", "mixes_and_radio", "Mixes & Radio");
        addTile(ctx, ExpressiveCollectionBridge.ITEM_VIDEOS, ROLE_STANDARD, true,
                "ic_videos", "videos", "Videos");

        if (includePurchases) {
            addTile(ctx, ExpressiveCollectionBridge.ITEM_PURCHASES, ROLE_STANDARD, (tiles.size() & 1) != 0,
                    "ic_menu_my_collection", "my_collection_purchases", "Purchases");
        }
        if (includeSaveForLater) {
            addTile(ctx, ExpressiveCollectionBridge.ITEM_SAVE_FOR_LATER, ROLE_STANDARD, (tiles.size() & 1) != 0,
                    "ic_bookmark", "save_for_later", "Save for Later");
        }

        int onlineCount = tiles.size();
        Tile downloads = new Tile(
                ExpressiveCollectionBridge.ITEM_DOWNLOADS,
                ROLE_DOWNLOADS,
                false,
                resolveString(ctx, "my_collection_downloads", "Downloads"),
                loadMutatedDrawable(ctx, "ic_downloaded")
        );
        // Dynamic zero-orphan packing: full-width banner when onlineCount is even, paired card when odd.
        downloads.span = (onlineCount % 2 == 0) ? 2 : 1;
        tiles.add(downloads);

        for (Tile t : tiles) {
            if (t.role == ROLE_HERO_PRIMARY || t.role == ROLE_HERO_TERTIARY) {
                t.baseRadiusPx = dp(26f);
                t.pressedRadiusPx = dp(16f);
            } else if (t.role == ROLE_DOWNLOADS && t.span == 2) {
                t.baseRadiusPx = dp(24f);
                t.pressedRadiusPx = dp(16f);
            } else {
                t.baseRadiusPx = dp(22f);
                t.pressedRadiusPx = dp(14f);
            }
        }
    }

    private void addTile(
            Context ctx,
            int eventKey,
            int role,
            boolean useTertiaryBadge,
            String drawableName,
            String stringName,
            String fallbackLabel
    ) {
        tiles.add(new Tile(
                eventKey,
                role,
                useTertiaryBadge,
                resolveString(ctx, stringName, fallbackLabel),
                loadMutatedDrawable(ctx, drawableName)
        ));
    }

    private int layoutTiles(int totalWidth) {
        float padH = dp(16f);
        float padTop = dp(6f);
        float padBottom = dp(4f);
        float colGap = dp(10f);
        float rowGap = dp(10f);

        float usableWidth = Math.max(0f, totalWidth - padH * 2f);
        float halfWidth = Math.max(0f, (usableWidth - colGap) * 0.5f);

        // Gently scale row heights up if user enlarged system font size.
        float fontScaleExtra = Math.max(0f, Math.min(0.45f, fontScale - 1f)) * dp(18f);
        float heroH = dp(102f) + fontScaleExtra;
        float stdH = dp(84f) + fontScaleExtra;
        float bannerH = dp(64f) + fontScaleExtra * 0.65f;

        float y = padTop;
        int i = 0;
        int count = tiles.size();
        while (i < count) {
            Tile first = tiles.get(i);
            if (first.span == 2 || i + 1 >= count) {
                float h = (first.role == ROLE_DOWNLOADS && first.span == 2)
                        ? bannerH
                        : (first.role == ROLE_HERO_PRIMARY || first.role == ROLE_HERO_TERTIARY ? heroH : stdH);
                first.bounds.set(padH, y, padH + usableWidth, y + h);
                y += h;
                i += 1;
            } else {
                Tile second = tiles.get(i + 1);
                float h = (first.role == ROLE_HERO_PRIMARY || first.role == ROLE_HERO_TERTIARY) ? heroH : stdH;
                first.bounds.set(padH, y, padH + halfWidth, y + h);
                second.bounds.set(padH + halfWidth + colGap, y, padH + usableWidth, y + h);
                y += h;
                i += 2;
            }
            if (i < count) {
                y += rowGap;
            }
        }

        lastLayoutWidth = totalWidth;
        return Math.round(y + padBottom);
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int width = MeasureSpec.getSize(widthMeasureSpec);
        if (MeasureSpec.getMode(widthMeasureSpec) == MeasureSpec.UNSPECIFIED || width <= 0) {
            width = getResources().getDisplayMetrics().widthPixels;
        }
        int desiredHeight = layoutTiles(width);
        setMeasuredDimension(width, resolveSize(desiredHeight, heightMeasureSpec));
    }

    @Override
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (w > 0) {
            layoutTiles(w);
        }
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        invalidate();
    }

    @Override
    public void onWindowFocusChanged(boolean hasWindowFocus) {
        super.onWindowFocusChanged(hasWindowFocus);
        if (hasWindowFocus) {
            invalidate();
        }
    }

    @Override
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        for (Tile t : tiles) {
            t.cancelAnimations();
        }
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int width = getWidth();
        if (width <= 0) {
            return;
        }
        if (lastLayoutWidth != width) {
            layoutTiles(width);
        }

        int surfaceContainer = MaterialYouColorEngine.getSurfaceContainer();
        int surfaceContainerHigh = MaterialYouColorEngine.getSurfaceContainerHigh();
        int surfaceContainerHighest = MaterialYouColorEngine.getSurfaceContainerHighest();
        int primaryAccent = MaterialYouColorEngine.getPrimaryAccent();
        int primaryContainer = MaterialYouColorEngine.getPrimaryContainer();
        int onPrimary = MaterialYouColorEngine.getOnPrimary();
        int tertiaryAccent = MaterialYouColorEngine.getTertiaryAccent();
        int tertiaryContainer = MaterialYouColorEngine.getTertiaryContainer();
        int onTertiary = MaterialYouColorEngine.getOnTertiary();
        int onSurface = MaterialYouColorEngine.getOnSurface();
        int onSurfaceVariant = MaterialYouColorEngine.getOnSurfaceVariant();
        int outlineVariant = MaterialYouColorEngine.getOutlineVariant();

        for (int i = 0, n = tiles.size(); i < n; i++) {
            drawTile(
                    canvas,
                    tiles.get(i),
                    surfaceContainer,
                    surfaceContainerHigh,
                    surfaceContainerHighest,
                    primaryAccent,
                    primaryContainer,
                    onPrimary,
                    tertiaryAccent,
                    tertiaryContainer,
                    onTertiary,
                    onSurface,
                    onSurfaceVariant,
                    outlineVariant
            );
        }
    }

    private void drawTile(
            Canvas canvas,
            Tile tile,
            int surfaceContainer,
            int surfaceContainerHigh,
            int surfaceContainerHighest,
            int primaryAccent,
            int primaryContainer,
            int onPrimary,
            int tertiaryAccent,
            int tertiaryContainer,
            int onTertiary,
            int onSurface,
            int onSurfaceVariant,
            int outlineVariant
    ) {
        RectF bounds = tile.bounds;
        if (bounds.isEmpty()) {
            return;
        }

        boolean isDownloads = tile.role == ROLE_DOWNLOADS;
        boolean dimmed = isOffline && !isDownloads;
        boolean isHero = tile.role == ROLE_HERO_PRIMARY || tile.role == ROLE_HERO_TERTIARY;
        boolean isBanner = isDownloads && tile.span == 2;

        // Resolve gradient, border, badge & icon colors per role + offline state
        int gradStart;
        int gradEnd;
        int borderColor;
        float strokeWidthPx;
        int badgeBg;
        int iconTint;
        int watermarkTint;
        int watermarkAlpha;
        int rippleColor;

        if (dimmed) {
            gradStart = surfaceContainer;
            gradEnd = surfaceContainer;
            borderColor = MaterialYouColorEngine.withAlpha(outlineVariant, 0x38);
            strokeWidthPx = Math.max(1f, dp(1f));
            badgeBg = surfaceContainerHighest;
            iconTint = onSurfaceVariant;
            watermarkTint = onSurface;
            watermarkAlpha = 10;
            rippleColor = onSurfaceVariant;
        } else if (tile.role == ROLE_HERO_PRIMARY) {
            gradStart = MaterialYouColorEngine.blendRgb(surfaceContainerHigh, primaryContainer, 0.72f);
            gradEnd = MaterialYouColorEngine.blendRgb(surfaceContainer, primaryContainer, 0.44f);
            borderColor = MaterialYouColorEngine.withAlpha(primaryAccent, 0x4C);
            strokeWidthPx = Math.max(1f, dp(1f));
            badgeBg = primaryAccent;
            iconTint = onPrimary;
            watermarkTint = primaryAccent;
            watermarkAlpha = 24;
            rippleColor = primaryAccent;
        } else if (tile.role == ROLE_HERO_TERTIARY) {
            gradStart = MaterialYouColorEngine.blendRgb(surfaceContainerHigh, tertiaryContainer, 0.72f);
            gradEnd = MaterialYouColorEngine.blendRgb(surfaceContainer, tertiaryContainer, 0.44f);
            borderColor = MaterialYouColorEngine.withAlpha(tertiaryAccent, 0x4C);
            strokeWidthPx = Math.max(1f, dp(1f));
            badgeBg = tertiaryAccent;
            iconTint = onTertiary;
            watermarkTint = tertiaryAccent;
            watermarkAlpha = 24;
            rippleColor = tertiaryAccent;
        } else if (isDownloads) {
            if (isOffline) {
                gradStart = MaterialYouColorEngine.blendRgb(surfaceContainerHigh, primaryContainer, 0.78f);
                gradEnd = MaterialYouColorEngine.blendRgb(surfaceContainer, primaryContainer, 0.48f);
                borderColor = MaterialYouColorEngine.withAlpha(primaryAccent, 0x8A);
                strokeWidthPx = Math.max(1.5f, dp(1.5f));
                badgeBg = primaryAccent;
                iconTint = onPrimary;
                watermarkAlpha = 22;
            } else {
                gradStart = MaterialYouColorEngine.blendRgb(surfaceContainerHigh, primaryContainer, 0.34f);
                gradEnd = surfaceContainer;
                borderColor = MaterialYouColorEngine.withAlpha(primaryAccent, 0x44);
                strokeWidthPx = Math.max(1f, dp(1f));
                badgeBg = MaterialYouColorEngine.blendRgb(surfaceContainerHighest, primaryAccent, 0.30f);
                iconTint = primaryAccent;
                watermarkAlpha = 15;
            }
            watermarkTint = primaryAccent;
            rippleColor = primaryAccent;
        } else {
            int accent = tile.useTertiaryBadge ? tertiaryAccent : primaryAccent;
            gradStart = MaterialYouColorEngine.blendRgb(surfaceContainer, surfaceContainerHigh, 0.55f);
            gradEnd = surfaceContainer;
            borderColor = MaterialYouColorEngine.withAlpha(outlineVariant, 0x60);
            strokeWidthPx = Math.max(1f, dp(1f));
            badgeBg = MaterialYouColorEngine.blendRgb(surfaceContainerHighest, accent, 0.24f);
            iconTint = accent;
            watermarkTint = onSurface;
            watermarkAlpha = 13;
            rippleColor = accent;
        }

        // Rebuild gradient only if geometry or gradient endpoints changed
        if (tile.cachedGradient == null
                || tile.cachedStartColor != gradStart
                || tile.cachedEndColor != gradEnd
                || tile.cachedLeft != bounds.left
                || tile.cachedTop != bounds.top
                || tile.cachedRight != bounds.right
                || tile.cachedBottom != bounds.bottom) {
            float endX = (tile.role == ROLE_STANDARD) ? bounds.left : bounds.right;
            tile.cachedGradient = new LinearGradient(
                    bounds.left, bounds.top,
                    endX, bounds.bottom,
                    gradStart, gradEnd,
                    Shader.TileMode.CLAMP
            );
            tile.cachedStartColor = gradStart;
            tile.cachedEndColor = gradEnd;
            tile.cachedLeft = bounds.left;
            tile.cachedTop = bounds.top;
            tile.cachedRight = bounds.right;
            tile.cachedBottom = bounds.bottom;
        }

        float p = tile.pressProgress;
        float radius = tile.baseRadiusPx - (tile.baseRadiusPx - tile.pressedRadiusPx) * p;
        float scale = 1f - 0.045f * p;

        canvas.save();
        if (p > 0.001f) {
            canvas.scale(scale, scale, bounds.centerX(), bounds.centerY());
        }

        // 1. Tile background gradient fill
        fillPaint.setShader(tile.cachedGradient);
        canvas.drawRoundRect(bounds, radius, radius, fillPaint);

        // 2. Clipped interior content (watermark, badge + icon, label, ripple)
        tile.clipPath.reset();
        tile.clipPath.addRoundRect(bounds, radius, radius, Path.Direction.CW);

        canvas.save();
        canvas.clipPath(tile.clipPath);

        int contentAlpha = dimmed ? 118 : 255;

        // Oversized rotated background watermark icon
        if (tile.iconDrawable != null) {
            float wmSize = isHero ? dp(58f) : (isBanner ? dp(46f) : dp(42f));
            float wmCx = isHero
                    ? bounds.right - dp(22f)
                    : (isBanner ? bounds.right - dp(78f) : bounds.right - dp(16f));
            float wmCy = isHero
                    ? bounds.top + dp(30f)
                    : (isBanner ? bounds.centerY() : bounds.top + dp(24f));
            drawTintedIcon(canvas, tile.iconDrawable, wmCx, wmCy, wmSize, -12f, watermarkTint, watermarkAlpha);
        }

        if (isBanner) {
            // Horizontal layout for full-width Downloads banner tile
            float padSide = dp(14f);
            float badgeSize = dp(40f);
            float badgeCx = bounds.left + padSide + badgeSize * 0.5f;
            float badgeCy = bounds.centerY();

            badgePaint.setColor(badgeBg);
            badgePaint.setAlpha(contentAlpha);
            canvas.drawCircle(badgeCx, badgeCy, badgeSize * 0.5f, badgePaint);

            if (tile.iconDrawable != null) {
                drawTintedIcon(canvas, tile.iconDrawable, badgeCx, badgeCy, dp(20f), 0f, iconTint, contentAlpha);
            }

            // Trailing chevron pill
            float chevronPillSize = dp(30f);
            float chevCx = bounds.right - padSide - chevronPillSize * 0.5f;
            float chevCy = bounds.centerY();
            int chevBg = MaterialYouColorEngine.blendRgb(surfaceContainerHighest, primaryAccent, 0.24f);
            badgePaint.setColor(chevBg);
            badgePaint.setAlpha(contentAlpha);
            canvas.drawCircle(chevCx, chevCy, chevronPillSize * 0.5f, badgePaint);
            if (chevronDrawable != null) {
                drawTintedIcon(canvas, chevronDrawable, chevCx, chevCy, dp(15f), 0f, primaryAccent, contentAlpha);
            }

            float textX = bounds.left + padSide + badgeSize + dp(14f);
            float maxTextWidth = Math.max(dp(40f), (chevCx - chevronPillSize * 0.5f - dp(10f)) - textX);
            drawFittedLabel(
                    canvas, tile.label, textX, bounds.centerY(), true,
                    maxTextWidth, sp(15.5f), sp(12f), onSurface, contentAlpha
            );
        } else {
            // Vertical Bento stack (badge top-left, bold title bottom-left)
            float padSide = isHero ? dp(14f) : dp(13f);
            float padTopInner = isHero ? dp(14f) : dp(12f);
            float badgeSize = isHero ? dp(40f) : dp(36f);
            float iconSize = isHero ? dp(21f) : dp(19f);

            float badgeCx = bounds.left + padSide + badgeSize * 0.5f;
            float badgeCy = bounds.top + padTopInner + badgeSize * 0.5f;

            badgePaint.setColor(badgeBg);
            badgePaint.setAlpha(contentAlpha);
            canvas.drawCircle(badgeCx, badgeCy, badgeSize * 0.5f, badgePaint);

            if (tile.iconDrawable != null) {
                drawTintedIcon(canvas, tile.iconDrawable, badgeCx, badgeCy, iconSize, 0f, iconTint, contentAlpha);
            }

            float textPadX = isHero ? dp(15f) : dp(14f);
            float textPadBottom = isHero ? dp(15f) : dp(13f);
            float textX = bounds.left + textPadX;
            float baselineY = bounds.bottom - textPadBottom;
            float maxTextWidth = Math.max(dp(40f), bounds.width() - textPadX * 2f);
            float startTextSize = isHero ? sp(16.5f) : sp(14.5f);

            drawFittedLabel(
                    canvas, tile.label, textX, baselineY, false,
                    maxTextWidth, startTextSize, sp(12f), onSurface, contentAlpha
            );
        }

        // Clipped radial press ripple
        if (tile.rippleAlpha > 0.005f) {
            int alpha = Math.max(0, Math.min(255, Math.round(tile.rippleAlpha * 56f)));
            ripplePaint.setColor(MaterialYouColorEngine.withAlpha(rippleColor, alpha));
            float maxR = Math.max(bounds.width(), bounds.height()) * 1.15f;
            canvas.drawCircle(tile.rippleCx, tile.rippleCy, dp(16f) + maxR * tile.rippleRadiusFrac, ripplePaint);
        }

        canvas.restore(); // End tile clip

        // 3. Crisp inset border stroke
        float halfStroke = strokeWidthPx * 0.5f;
        tile.borderRect.set(
                bounds.left + halfStroke,
                bounds.top + halfStroke,
                bounds.right - halfStroke,
                bounds.bottom - halfStroke
        );
        borderPaint.setColor(borderColor);
        borderPaint.setStrokeWidth(strokeWidthPx);
        float borderRadius = Math.max(0f, radius - halfStroke);
        canvas.drawRoundRect(tile.borderRect, borderRadius, borderRadius, borderPaint);

        canvas.restore();
    }

    private void drawTintedIcon(
            Canvas canvas,
            Drawable drawable,
            float cx,
            float cy,
            float sizePx,
            float rotationDeg,
            int tintColor,
            int alpha
    ) {
        int half = Math.round(sizePx * 0.5f);
        int left = Math.round(cx) - half;
        int top = Math.round(cy) - half;
        drawable.setAlpha(255);
        drawable.setColorFilter(new PorterDuffColorFilter(
                MaterialYouColorEngine.withAlpha(tintColor, alpha),
                PorterDuff.Mode.SRC_IN));
        drawable.setBounds(left, top, left + half * 2, top + half * 2);
        if (rotationDeg != 0f) {
            canvas.save();
            canvas.rotate(rotationDeg, cx, cy);
            drawable.draw(canvas);
            canvas.restore();
        } else {
            drawable.draw(canvas);
        }
    }

    private void drawFittedLabel(
            Canvas canvas,
            String label,
            float x,
            float anchorY,
            boolean centerVertically,
            float maxWidth,
            float initialSizePx,
            float minSizePx,
            int color,
            int alpha
    ) {
        if (label == null || label.isEmpty()) {
            return;
        }
        float size = initialSizePx;
        textPaint.setTextSize(size);
        float measured = textPaint.measureText(label);
        while (measured > maxWidth && size > minSizePx) {
            size = Math.max(minSizePx, size - sp(0.75f));
            textPaint.setTextSize(size);
            measured = textPaint.measureText(label);
        }

        String display = measured > maxWidth
                ? TextUtils.ellipsize(label, textPaint, maxWidth, TextUtils.TruncateAt.END).toString()
                : label;

        textPaint.setColor(color);
        textPaint.setAlpha(alpha);

        Paint.FontMetrics fm = textPaint.getFontMetrics();
        float drawY = centerVertically
                ? anchorY - (fm.ascent + fm.descent) * 0.5f
                : anchorY - fm.descent * 0.35f;
        canvas.drawText(display, x, drawY, textPaint);
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        int action = event.getActionMasked();
        float x = event.getX();
        float y = event.getY();

        switch (action) {
            case MotionEvent.ACTION_DOWN: {
                int hit = findTileAt(x, y);
                if (hit < 0) {
                    return false;
                }
                pressedIndex = hit;
                downX = x;
                downY = y;
                Tile tile = tiles.get(hit);
                startPressAnim(tile, x, y);
                return true;
            }
            case MotionEvent.ACTION_MOVE: {
                if (pressedIndex >= 0 && pressedIndex < tiles.size()) {
                    Tile tile = tiles.get(pressedIndex);
                    float dx = x - downX;
                    float dy = y - downY;
                    if (dx * dx + dy * dy > touchSlop * touchSlop || !tile.bounds.contains(x, y)) {
                        startReleaseAnim(tile);
                        pressedIndex = -1;
                    }
                }
                return true;
            }
            case MotionEvent.ACTION_CANCEL: {
                if (pressedIndex >= 0 && pressedIndex < tiles.size()) {
                    startReleaseAnim(tiles.get(pressedIndex));
                }
                pressedIndex = -1;
                return false;
            }
            case MotionEvent.ACTION_UP: {
                int hit = pressedIndex;
                pressedIndex = -1;
                if (hit >= 0 && hit < tiles.size()) {
                    Tile tile = tiles.get(hit);
                    startReleaseAnim(tile);
                    float dx = x - downX;
                    float dy = y - downY;
                    if (dx * dx + dy * dy <= touchSlop * touchSlop && tile.bounds.contains(x, y)) {
                        performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
                        playSoundEffect(SoundEffectConstants.CLICK);
                        ExpressiveCollectionBridge.onTileClicked(tile.eventKey);
                        return true;
                    }
                }
                return false;
            }
            default:
                return super.onTouchEvent(event);
        }
    }

    private int findTileAt(float x, float y) {
        for (int i = 0, n = tiles.size(); i < n; i++) {
            if (tiles.get(i).bounds.contains(x, y)) {
                return i;
            }
        }
        return -1;
    }

    private void startPressAnim(Tile tile, float touchX, float touchY) {
        if (tile.pressAnim != null) {
            tile.pressAnim.cancel();
        }
        if (tile.rippleAnim != null) {
            tile.rippleAnim.cancel();
        }

        tile.rippleCx = touchX;
        tile.rippleCy = touchY;
        tile.rippleRadiusFrac = 0f;
        tile.rippleAlpha = 1f;

        ValueAnimator pa = ValueAnimator.ofFloat(tile.pressProgress, 1f);
        pa.setDuration(110L);
        pa.setInterpolator(PRESS_INTERP);
        pa.addUpdateListener(anim -> {
            tile.pressProgress = (float) anim.getAnimatedValue();
            invalidate();
        });
        pa.start();
        tile.pressAnim = pa;

        ValueAnimator ra = ValueAnimator.ofFloat(0f, 1f);
        ra.setDuration(260L);
        ra.setInterpolator(PRESS_INTERP);
        ra.addUpdateListener(anim -> {
            tile.rippleRadiusFrac = (float) anim.getAnimatedValue();
            invalidate();
        });
        ra.start();
        tile.rippleAnim = ra;
    }

    private void startReleaseAnim(Tile tile) {
        if (tile.pressAnim != null) {
            tile.pressAnim.cancel();
        }
        if (tile.rippleAnim != null) {
            tile.rippleAnim.cancel();
        }

        ValueAnimator pa = ValueAnimator.ofFloat(tile.pressProgress, 0f);
        pa.setDuration(240L);
        pa.setInterpolator(RELEASE_SPRING_INTERP);
        pa.addUpdateListener(anim -> {
            tile.pressProgress = Math.max(0f, (float) anim.getAnimatedValue());
            invalidate();
        });
        pa.start();
        tile.pressAnim = pa;

        ValueAnimator ra = ValueAnimator.ofFloat(tile.rippleAlpha, 0f);
        ra.setDuration(220L);
        ra.setInterpolator(PRESS_INTERP);
        ra.addUpdateListener(anim -> {
            tile.rippleAlpha = Math.max(0f, (float) anim.getAnimatedValue());
            invalidate();
        });
        ra.start();
        tile.rippleAnim = ra;
    }

    private static Drawable loadMutatedDrawable(Context ctx, String name) {
        try {
            Resources res = ctx.getResources();
            int id = res.getIdentifier(name, "drawable", ctx.getPackageName());
            if (id != 0) {
                Drawable d = res.getDrawable(id, ctx.getTheme());
                if (d != null) {
                    return d.mutate();
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static String resolveString(Context ctx, String name, String fallback) {
        try {
            Resources res = ctx.getResources();
            int id = res.getIdentifier(name, "string", ctx.getPackageName());
            if (id != 0) {
                CharSequence text = res.getText(id);
                if (text != null && text.length() > 0) {
                    return text.toString();
                }
            }
        } catch (Throwable ignored) {
        }
        return fallback;
    }

    private float dp(float dp) {
        return dp * density;
    }

    private float sp(float sp) {
        return sp * fontScale * density;
    }
}
