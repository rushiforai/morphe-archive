package dev.materialtidal.extension.tidal.player;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.os.Handler;
import android.os.Looper;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.LruCache;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;

/**
 * Interactive 120fps Android Canvas renderer for the Desktop-inspired right-hand Play Queue panel
 * in {@link ExpressivePlayerView}.
 */
public final class DesktopQueuePanelRenderer {

    public static final int ACTION_NONE = 0;
    public static final int ACTION_PLAY_TRACK = 1;
    public static final int ACTION_REMOVE_TRACK = 2;
    public static final int ACTION_OPEN_FULL_QUEUE = 3;

    private static final int ROW_HEADER = 0;
    private static final int ROW_TRACK = 1;
    private static final int ROW_FOOTER_ACTION = 2;

    private static final int THUMB_CACHE_SIZE = 64;
    private static final LruCache<String, Bitmap> THUMB_CACHE = new LruCache<>(THUMB_CACHE_SIZE);
    private static final Set<String> IN_FLIGHT_COVERS = Collections.synchronizedSet(new HashSet<>());
    private static final ExecutorService THUMB_EXECUTOR = Executors.newFixedThreadPool(2);
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    public static final class QueueTrackItem {
        public final int queueIndex;
        public final String uid;
        public final String title;
        public final String artist;
        public final String coverId;
        public final int durationSec;
        public final boolean isExplicit;
        public final boolean isActive;
        public final boolean isCurrent;

        public QueueTrackItem(
                int queueIndex,
                String uid,
                String title,
                String artist,
                String coverId,
                int durationSec,
                boolean isExplicit,
                boolean isActive,
                boolean isCurrent
        ) {
            this.queueIndex = queueIndex;
            this.uid = uid != null ? uid : "";
            this.title = title != null ? title : "";
            this.artist = artist != null ? artist : "";
            this.coverId = coverId;
            this.durationSec = Math.max(0, durationSec);
            this.isExplicit = isExplicit;
            this.isActive = isActive;
            this.isCurrent = isCurrent;
        }
    }

    public static final class QueueSnapshot {
        public final List<QueueTrackItem> items;
        public final int currentPosition;
        public final int totalSize;
        public final String signature;

        public QueueSnapshot(
                List<QueueTrackItem> items,
                int currentPosition,
                int totalSize,
                String signature
        ) {
            this.items = items != null ? items : Collections.emptyList();
            this.currentPosition = currentPosition;
            this.totalSize = Math.max(0, totalSize);
            this.signature = signature != null ? signature : "";
        }
    }

    public static final class HitResult {
        public final int action;
        public final int queueIndex;

        public HitResult(int action, int queueIndex) {
            this.action = action;
            this.queueIndex = queueIndex;
        }
    }

    private static final class DisplayRow {
        final int kind;
        final String headerText;
        final QueueTrackItem item;
        float topY;
        float height;

        DisplayRow(int kind, String headerText, QueueTrackItem item) {
            this.kind = kind;
            this.headerText = headerText;
            this.item = item;
        }
    }

    private final float density;
    private final Runnable invalidateCallback;

    private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint bitmapPaint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
    private final Paint maskPaint = new Paint(Paint.ANTI_ALIAS_FLAG);

    private final TextPaint sectionPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint trackTitlePaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint trackArtistPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint durationPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint explicitPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint footerPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint emptyPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG);

    private final Path clipPath = new Path();
    private final RectF tempRect = new RectF();
    private final RectF artRect = new RectF();
    private final RectF removeRect = new RectF();

    private Shader edgeMaskShader;
    private float lastMaskTop = -1f;
    private float lastMaskHeight = -1f;

    private QueueSnapshot snapshot;
    private String lastSignature = "";
    private String lastSourceName = "";
    private final List<DisplayRow> rows = new ArrayList<>();
    private float totalContentHeight = 0f;

    private float scrollY = 0f;
    private float scrollVel = 0f;
    private float flingVel = 0f;

    private float eqPhase = 0f;
    private int tappedQueueIndex = -1;
    private float tappedFlash = 0f;

    public DesktopQueuePanelRenderer(float density, Runnable invalidateCallback) {
        this.density = density;
        this.invalidateCallback = invalidateCallback;

        sectionPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        sectionPaint.setTextSize(11.5f * density);
        sectionPaint.setLetterSpacing(0.08f);

        trackTitlePaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        trackTitlePaint.setTextSize(14.5f * density);

        trackArtistPaint.setTypeface(Typeface.create("sans-serif", Typeface.NORMAL));
        trackArtistPaint.setTextSize(12.5f * density);

        durationPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        durationPaint.setTextSize(12f * density);
        durationPaint.setFontFeatureSettings("tnum");
        durationPaint.setTextAlign(Paint.Align.RIGHT);

        explicitPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        explicitPaint.setTextSize(9.2f * density);
        explicitPaint.setTextAlign(Paint.Align.CENTER);

        footerPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        footerPaint.setTextSize(13f * density);
        footerPaint.setTextAlign(Paint.Align.CENTER);

        emptyPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        emptyPaint.setTextSize(14.5f * density);
        emptyPaint.setTextAlign(Paint.Align.CENTER);

        strokePaint.setStyle(Paint.Style.STROKE);
        strokePaint.setStrokeCap(Paint.Cap.ROUND);
        maskPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_IN));
    }

    public boolean setSnapshot(QueueSnapshot next, String sourceName) {
        String safeSource = sourceName != null ? sourceName.trim() : "";
        String nextSig = next != null ? next.signature : "";
        if (this.snapshot != null && nextSig.equals(this.lastSignature) && safeSource.equals(this.lastSourceName)) {
            return false;
        }
        this.snapshot = next;
        this.lastSignature = nextSig;
        this.lastSourceName = safeSource;
        rebuildRows(safeSource);
        return true;
    }

    public boolean hasSnapshot() {
        return snapshot != null && !snapshot.items.isEmpty();
    }

    public void resetScroll() {
        scrollY = 0f;
        scrollVel = 0f;
        flingVel = 0f;
    }

    public void cancelFling() {
        flingVel = 0f;
        scrollVel = 0f;
    }

    public void flashTappedQueueIndex(int queueIndex) {
        tappedQueueIndex = queueIndex;
        tappedFlash = 1f;
    }

    private void rebuildRows(String sourceName) {
        rows.clear();
        totalContentHeight = 0f;

        boolean de = "de".equals(Locale.getDefault().getLanguage());
        float topPad = 6f * density;
        float bottomPad = 14f * density;
        float headerH = 28f * density;
        float currentH = 66f * density;
        float itemH = 58f * density;
        float rowGap = 6f * density;

        float y = topPad;
        if (snapshot != null && !snapshot.items.isEmpty()) {
            List<QueueTrackItem> items = snapshot.items;
            QueueTrackItem currentItem = null;
            List<QueueTrackItem> manualUpNext = new ArrayList<>();
            List<QueueTrackItem> sourceUpcoming = new ArrayList<>();

            for (int i = 0; i < items.size(); i++) {
                QueueTrackItem it = items.get(i);
                if (it.isCurrent) {
                    currentItem = it;
                } else if (it.isActive) {
                    manualUpNext.add(it);
                } else {
                    sourceUpcoming.add(it);
                }
            }

            if (currentItem != null) {
                y = addHeaderRow(de ? "AKTUELLER TITEL" : "NOW PLAYING", y, headerH);
                y = addTrackRow(currentItem, y, currentH, rowGap);
            }

            if (!manualUpNext.isEmpty()) {
                y += 4f * density;
                y = addHeaderRow(de ? "ALS NÄCHSTES" : "UP NEXT", y, headerH);
                for (int i = 0; i < manualUpNext.size(); i++) {
                    y = addTrackRow(manualUpNext.get(i), y, itemH, rowGap);
                }
            }

            if (!sourceUpcoming.isEmpty()) {
                y += 4f * density;
                String secLabel;
                if (!sourceName.isEmpty()) {
                    secLabel = (de ? "WEITER AUS " : "NEXT FROM ") + sourceName.toUpperCase(Locale.US);
                } else {
                    secLabel = de ? "WEITER IN DER WARTESCHLANGE" : "NEXT IN QUEUE";
                }
                y = addHeaderRow(secLabel, y, headerH);
                for (int i = 0; i < sourceUpcoming.size(); i++) {
                    y = addTrackRow(sourceUpcoming.get(i), y, itemH, rowGap);
                }
            }
        }

        // Footer button to open TIDAL's full Expressive Play Queue & Suggested Tracks sheet
        y += 8f * density;
        DisplayRow footer = new DisplayRow(
                ROW_FOOTER_ACTION,
                de ? "Warteschlange & Vorschläge öffnen" : "Open Full Queue & Suggestions",
                null
        );
        footer.topY = y;
        footer.height = 44f * density;
        rows.add(footer);
        y += footer.height;

        totalContentHeight = y + bottomPad;
    }

    private float addHeaderRow(String title, float y, float h) {
        DisplayRow hdr = new DisplayRow(ROW_HEADER, title, null);
        hdr.topY = y;
        hdr.height = h;
        rows.add(hdr);
        return y + h;
    }

    private float addTrackRow(QueueTrackItem item, float y, float h, float gap) {
        DisplayRow row = new DisplayRow(ROW_TRACK, null, item);
        row.topY = y;
        row.height = h;
        rows.add(row);
        if (item.coverId != null && !item.coverId.isEmpty() && THUMB_CACHE.get(item.coverId) == null) {
            requestCoverAsync(item.coverId);
        }
        return y + h + gap;
    }

    public void onTouchScrollDelta(float deltaY, float dtSec, float viewportH) {
        float maxScroll = Math.max(0f, totalContentHeight - Math.max(1f, viewportH));
        float next = scrollY + deltaY;
        if (next < 0f || next > maxScroll) {
            next = scrollY + deltaY * 0.35f;
        }
        float maxOver = 44f * density;
        scrollY = Math.max(-maxOver, Math.min(maxScroll + maxOver, next));
        float instVel = deltaY / Math.max(0.004f, dtSec);
        flingVel = flingVel * 0.35f + instVel * 0.65f;
    }

    public void onTouchRelease(long msSinceLastMove) {
        if (msSinceLastMove > 80L) {
            flingVel = 0f;
        }
    }

    public boolean stepPhysics(float dt, boolean playing, boolean scrollingNow, float viewportH) {
        boolean animating = false;
        if (playing) {
            eqPhase = (eqPhase + 5.2f * dt) % ((float) (Math.PI * 2.0));
            if (snapshot != null) {
                for (int i = 0; i < snapshot.items.size(); i++) {
                    if (snapshot.items.get(i).isCurrent) {
                        animating = true;
                        break;
                    }
                }
            }
        }
        if (tappedFlash > 0f) {
            tappedFlash = Math.max(0f, tappedFlash - dt / 0.28f);
            if (tappedFlash > 0f) {
                animating = true;
            } else {
                tappedQueueIndex = -1;
            }
        }

        if (!scrollingNow) {
            float maxScroll = Math.max(0f, totalContentHeight - Math.max(1f, viewportH));
            if (Math.abs(flingVel) > 12f) {
                scrollY += flingVel * dt;
                float drag = (scrollY < 0f || scrollY > maxScroll) ? 14.0f : 3.6f;
                flingVel *= (float) Math.exp(-drag * dt);
                float maxOver = 44f * density;
                if (scrollY < -maxOver) {
                    scrollY = -maxOver;
                    flingVel = 0f;
                } else if (scrollY > maxScroll + maxOver) {
                    scrollY = maxScroll + maxOver;
                    flingVel = 0f;
                }
                animating = true;
            } else {
                flingVel = 0f;
                if (scrollY < 0f || scrollY > maxScroll) {
                    float edge = Math.max(0f, Math.min(maxScroll, scrollY));
                    float stiffness = 260f;
                    float damping = 2f * 0.84f * (float) Math.sqrt(stiffness);
                    float force = -stiffness * (scrollY - edge) - damping * scrollVel;
                    scrollVel += force * dt;
                    scrollY += scrollVel * dt;
                    if (Math.abs(scrollY - edge) > 0.5f || Math.abs(scrollVel) > 1f) {
                        animating = true;
                    } else {
                        scrollY = edge;
                        scrollVel = 0f;
                    }
                }
            }
        }
        return animating;
    }

    public HitResult hitTest(float localX, float localY, float viewportW) {
        float contentY = localY + scrollY;
        float padH = 14f * density;
        float cardL = padH;
        float cardR = viewportW - padH;
        if (localX < cardL || localX > cardR) {
            return new HitResult(ACTION_NONE, -1);
        }

        for (int i = 0; i < rows.size(); i++) {
            DisplayRow r = rows.get(i);
            if (contentY >= r.topY && contentY <= r.topY + r.height) {
                if (r.kind == ROW_FOOTER_ACTION) {
                    return new HitResult(ACTION_OPEN_FULL_QUEUE, -1);
                }
                if (r.kind == ROW_TRACK && r.item != null) {
                    if (!r.item.isCurrent) {
                        float removeBtnSize = 30f * density;
                        float removeRight = cardR - 8f * density;
                        float removeLeft = removeRight - removeBtnSize - 6f * density;
                        if (localX >= removeLeft && localX <= cardR) {
                            return new HitResult(ACTION_REMOVE_TRACK, r.item.queueIndex);
                        }
                    }
                    return new HitResult(ACTION_PLAY_TRACK, r.item.queueIndex);
                }
            }
        }
        return new HitResult(ACTION_NONE, -1);
    }

    public void draw(
            Canvas canvas,
            RectF bodyRect,
            float alpha,
            boolean playing,
            int primaryText,
            int secondaryText,
            int cardBg,
            int activeCardBg,
            int pillBg,
            int accentBg,
            int accentFg
    ) {
        if (alpha <= 0.01f || bodyRect.width() <= 20f || bodyRect.height() <= 20f) {
            return;
        }

        float padH = 14f * density;
        float vpW = bodyRect.width();
        float vpH = bodyRect.height();

        int vpLayer = canvas.saveLayer(bodyRect, null);
        canvas.save();
        canvas.translate(bodyRect.left, bodyRect.top);

        if (snapshot == null || snapshot.items.isEmpty()) {
            boolean de = "de".equals(Locale.getDefault().getLanguage());
            emptyPaint.setColor(MaterialYouColorEngine.withAlpha(secondaryText, Math.round(215f * alpha)));
            canvas.drawText(
                    de ? "Warteschlange wird geladen…" : "No upcoming tracks in queue",
                    vpW * 0.5f,
                    vpH * 0.36f,
                    emptyPaint
            );
        }

        for (int i = 0; i < rows.size(); i++) {
            DisplayRow r = rows.get(i);
            float rowTop = r.topY - scrollY;
            if (rowTop + r.height < -24f * density || rowTop > vpH + 24f * density) {
                continue;
            }
            if (r.kind == ROW_HEADER) {
                drawHeaderRow(canvas, r, rowTop, padH, vpW, alpha, secondaryText);
            } else if (r.kind == ROW_TRACK) {
                drawTrackRow(
                        canvas, r, rowTop, padH, vpW, alpha, playing,
                        primaryText, secondaryText, cardBg, activeCardBg, pillBg, accentBg, accentFg
                );
            } else if (r.kind == ROW_FOOTER_ACTION) {
                drawFooterRow(canvas, r, rowTop, padH, vpW, alpha, primaryText, pillBg);
            }
        }

        canvas.restore();

        // Top & bottom vertical soft edge fade mask
        if (edgeMaskShader == null
                || Math.abs(lastMaskTop - bodyRect.top) > 0.5f
                || Math.abs(lastMaskHeight - bodyRect.height()) > 0.5f) {
            lastMaskTop = bodyRect.top;
            lastMaskHeight = bodyRect.height();
            edgeMaskShader = new LinearGradient(
                    0f, bodyRect.top,
                    0f, bodyRect.bottom,
                    new int[]{0x00000000, 0xFF000000, 0xFF000000, 0x00000000},
                    new float[]{0f, 0.05f, 0.90f, 1f},
                    Shader.TileMode.CLAMP
            );
        }
        maskPaint.setShader(edgeMaskShader);
        canvas.drawRect(bodyRect, maskPaint);
        canvas.restoreToCount(vpLayer);
    }

    private void drawHeaderRow(
            Canvas canvas,
            DisplayRow row,
            float rowTop,
            float padH,
            float vpW,
            float alpha,
            int secondaryText
    ) {
        sectionPaint.setColor(MaterialYouColorEngine.withAlpha(secondaryText, Math.round(200f * alpha)));
        Paint.FontMetrics fm = sectionPaint.getFontMetrics();
        float baseline = rowTop + row.height * 0.58f - (fm.ascent + fm.descent) * 0.5f;
        String label = TextUtils.ellipsize(
                row.headerText, sectionPaint, Math.max(40f * density, vpW - padH * 2f), TextUtils.TruncateAt.END
        ).toString();
        canvas.drawText(label, padH + 4f * density, baseline, sectionPaint);
    }

    private void drawTrackRow(
            Canvas canvas,
            DisplayRow row,
            float rowTop,
            float padH,
            float vpW,
            float alpha,
            boolean playing,
            int primaryText,
            int secondaryText,
            int cardBg,
            int activeCardBg,
            int pillBg,
            int accentBg,
            int accentFg
    ) {
        QueueTrackItem item = row.item;
        if (item == null) {
            return;
        }

        float cardL = padH;
        float cardR = vpW - padH;
        float cardRRad = (item.isCurrent ? 18f : 16f) * density;
        tempRect.set(cardL, rowTop, cardR, rowTop + row.height);

        int bg = item.isCurrent ? activeCardBg : cardBg;
        int bgAlpha = Math.round(ColorAlpha(bg) * alpha);
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(MaterialYouColorEngine.withAlpha(bg, bgAlpha));
        canvas.drawRoundRect(tempRect, cardRRad, cardRRad, fillPaint);

        if (item.isCurrent) {
            strokePaint.setStrokeWidth(1.1f * density);
            strokePaint.setColor(MaterialYouColorEngine.withAlpha(accentBg, Math.round(92f * alpha)));
            canvas.drawRoundRect(tempRect, cardRRad, cardRRad, strokePaint);
        }

        if (item.queueIndex == tappedQueueIndex && tappedFlash > 0.01f) {
            fillPaint.setColor(MaterialYouColorEngine.withAlpha(
                    primaryText, Math.round(0x28 * tappedFlash * alpha)));
            canvas.drawRoundRect(tempRect, cardRRad, cardRRad, fillPaint);
        }

        // Artwork thumbnail
        float artPad = item.isCurrent ? 10f * density : 9f * density;
        float artSize = row.height - artPad * 2f;
        float artRad = (item.isCurrent ? 12f : 10f) * density;
        artRect.set(cardL + artPad, rowTop + artPad, cardL + artPad + artSize, rowTop + artPad + artSize);

        clipPath.reset();
        clipPath.addRoundRect(artRect, artRad, artRad, Path.Direction.CW);
        canvas.save();
        canvas.clipPath(clipPath);

        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(MaterialYouColorEngine.withAlpha(pillBg, Math.round(200f * alpha)));
        canvas.drawRect(artRect, fillPaint);

        Bitmap bmp = (item.coverId != null && !item.coverId.isEmpty()) ? THUMB_CACHE.get(item.coverId) : null;
        if (bmp != null && !bmp.isRecycled()) {
            bitmapPaint.setAlpha(Math.round(255f * alpha));
            canvas.drawBitmap(bmp, null, artRect, bitmapPaint);
        }

        if (item.isCurrent) {
            fillPaint.setColor(MaterialYouColorEngine.withAlpha(0xFF000000, Math.round(0x66 * alpha)));
            canvas.drawRect(artRect, fillPaint);
            drawPlayingEqBars(canvas, artRect, playing, alpha, accentFg);
        }
        canvas.restore();

        // Trailing controls: optional remove pill (×) + duration text
        float rightEdge = cardR - 10f * density;
        if (!item.isCurrent) {
            float btnSize = 26f * density;
            float btnCy = tempRect.centerY();
            removeRect.set(rightEdge - btnSize, btnCy - btnSize * 0.5f, rightEdge, btnCy + btnSize * 0.5f);
            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(MaterialYouColorEngine.withAlpha(pillBg, Math.round(145f * alpha)));
            canvas.drawOval(removeRect, fillPaint);

            strokePaint.setStrokeWidth(1.6f * density);
            strokePaint.setColor(MaterialYouColorEngine.withAlpha(secondaryText, Math.round(220f * alpha)));
            float xr = 4.2f * density;
            canvas.drawLine(removeRect.centerX() - xr, removeRect.centerY() - xr,
                    removeRect.centerX() + xr, removeRect.centerY() + xr, strokePaint);
            canvas.drawLine(removeRect.centerX() + xr, removeRect.centerY() - xr,
                    removeRect.centerX() - xr, removeRect.centerY() + xr, strokePaint);

            rightEdge = removeRect.left - 8f * density;
        }

        String durStr = item.durationSec > 0 ? PlayerDesktopLayoutSolver.formatDurationSec(item.durationSec) : "";
        float durW = 0f;
        if (!durStr.isEmpty()) {
            durationPaint.setColor(MaterialYouColorEngine.withAlpha(secondaryText, Math.round(210f * alpha)));
            Paint.FontMetrics dfm = durationPaint.getFontMetrics();
            float durBase = tempRect.centerY() - (dfm.ascent + dfm.descent) * 0.5f;
            canvas.drawText(durStr, rightEdge, durBase, durationPaint);
            durW = durationPaint.measureText(durStr) + 10f * density;
        }

        // Title + Explicit + Artist
        float textLeft = artRect.right + 12f * density;
        float textRight = Math.max(textLeft + 24f * density, rightEdge - durW);
        float maxTextW = textRight - textLeft;

        float explicitReserve = item.isExplicit ? 18f * density : 0f;
        trackTitlePaint.setColor(MaterialYouColorEngine.withAlpha(
                item.isCurrent ? primaryText : primaryText,
                Math.round(255f * alpha)
        ));
        String ellTitle = TextUtils.ellipsize(
                item.title, trackTitlePaint, Math.max(20f * density, maxTextW - explicitReserve),
                TextUtils.TruncateAt.END
        ).toString();
        float titleW = trackTitlePaint.measureText(ellTitle);

        trackArtistPaint.setColor(MaterialYouColorEngine.withAlpha(secondaryText, Math.round(220f * alpha)));
        String ellArtist = TextUtils.ellipsize(
                item.artist, trackArtistPaint, maxTextW, TextUtils.TruncateAt.END
        ).toString();

        float titleBase = tempRect.centerY() - 2.5f * density;
        float artistBase = tempRect.centerY() + 14.5f * density;
        canvas.drawText(ellTitle, textLeft, titleBase, trackTitlePaint);

        if (item.isExplicit && !ellTitle.isEmpty()) {
            float eSize = 13f * density;
            float eLeft = textLeft + titleW + 5f * density;
            float eTop = titleBase - eSize * 0.86f;
            tempRect.set(eLeft, eTop, eLeft + eSize, eTop + eSize);
            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(MaterialYouColorEngine.withAlpha(secondaryText, Math.round(0x36 * alpha)));
            canvas.drawRoundRect(tempRect, 3.2f * density, 3.2f * density, fillPaint);

            explicitPaint.setColor(MaterialYouColorEngine.withAlpha(primaryText, Math.round(255f * alpha)));
            Paint.FontMetrics efm = explicitPaint.getFontMetrics();
            canvas.drawText("E", tempRect.centerX(),
                    tempRect.centerY() - (efm.ascent + efm.descent) * 0.5f, explicitPaint);
        }

        canvas.drawText(ellArtist, textLeft, artistBase, trackArtistPaint);
    }

    private void drawPlayingEqBars(Canvas canvas, RectF box, boolean playing, float alpha, int color) {
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(MaterialYouColorEngine.withAlpha(color, Math.round(255f * alpha)));
        float barW = 3.0f * density;
        float barGap = 2.6f * density;
        float totalW = barW * 3f + barGap * 2f;
        float startX = box.centerX() - totalW * 0.5f;
        float bottomY = box.centerY() + 7.5f * density;
        float maxH = 14f * density;
        float minH = 4f * density;

        for (int b = 0; b < 3; b++) {
            float frac = playing
                    ? (0.5f + 0.5f * (float) Math.sin(eqPhase * (1.0f + b * 0.25f) + b * 1.4f))
                    : (b == 1 ? 0.55f : 0.30f);
            float bh = minH + (maxH - minH) * frac;
            float bx = startX + b * (barW + barGap);
            tempRect.set(bx, bottomY - bh, bx + barW, bottomY);
            canvas.drawRoundRect(tempRect, barW * 0.5f, barW * 0.5f, fillPaint);
        }
    }

    private void drawFooterRow(
            Canvas canvas,
            DisplayRow row,
            float rowTop,
            float padH,
            float vpW,
            float alpha,
            int primaryText,
            int pillBg
    ) {
        tempRect.set(padH, rowTop, vpW - padH, rowTop + row.height);
        float rad = row.height * 0.5f;
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(MaterialYouColorEngine.withAlpha(pillBg, Math.round(185f * alpha)));
        canvas.drawRoundRect(tempRect, rad, rad, fillPaint);

        footerPaint.setColor(MaterialYouColorEngine.withAlpha(primaryText, Math.round(240f * alpha)));
        Paint.FontMetrics fm = footerPaint.getFontMetrics();
        float base = tempRect.centerY() - (fm.ascent + fm.descent) * 0.5f;
        canvas.drawText(row.headerText, tempRect.centerX(), base, footerPaint);
    }

    private static int ColorAlpha(int argb) {
        return (argb >>> 24) & 0xFF;
    }

    private void requestCoverAsync(final String coverId) {
        if (coverId == null || coverId.isEmpty() || !IN_FLIGHT_COVERS.add(coverId)) {
            return;
        }
        THUMB_EXECUTOR.execute(() -> {
            HttpURLConnection conn = null;
            try {
                String trimmed = coverId.trim();
                String urlStr = trimmed.startsWith("http")
                        ? trimmed
                        : "https://resources.tidal.com/images/" + trimmed.replace('-', '/') + "/160x160.jpg";
                URL url = new URL(urlStr);
                conn = (HttpURLConnection) url.openConnection();
                conn.setConnectTimeout(4500);
                conn.setReadTimeout(4500);
                conn.setDoInput(true);
                conn.connect();
                if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
                    try (InputStream is = conn.getInputStream()) {
                        Bitmap bmp = BitmapFactory.decodeStream(is);
                        if (bmp != null) {
                            THUMB_CACHE.put(coverId, bmp);
                            if (invalidateCallback != null) {
                                MAIN_HANDLER.post(invalidateCallback);
                            }
                        }
                    }
                }
            } catch (Throwable ignored) {
            } finally {
                IN_FLIGHT_COVERS.remove(coverId);
                if (conn != null) {
                    conn.disconnect();
                }
            }
        });
    }
}
