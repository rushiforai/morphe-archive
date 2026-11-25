package dev.materialtidal.extension.tidal.player.lyrics;

import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RecordingCanvas;
import android.graphics.RectF;
import android.graphics.RenderEffect;
import android.graphics.RenderNode;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.os.Build;
import android.text.TextPaint;

import java.util.ArrayList;
import java.util.List;

import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.LyricLineData;
import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.SyllableLyricsDocument;
import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.SyllableSpan;
import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.WordGroup;
import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * 120fps Android Canvas renderer for syllable- and word-synced lyrics.
 *
 * <p>Delivers:
 * <ul>
 *   <li>3-stop luminous feathered left-to-right syllable sweep via a single reused unit
 *       {@link LinearGradient} + {@link Matrix} (zero per-frame allocations)</li>
 *   <li>Progress-coupled buoyant active-word lift springs with vocal swell on sustained notes
 *       and staggered wave settle when a line finishes</li>
 *   <li>Hardware-accelerated progressive depth-of-field blur ({@link RenderNode} +
 *       {@link RenderEffect}) on inactive lines that clears smoothly on focus or scroll</li>
 *   <li>Elastic per-line cascade parallax scroll, duet right-alignment, stacked background
 *       vocals, and floating animated instrumental break dots</li>
 * </ul>
 */
public final class SyllableLyricsRenderer {

    private static final long ACTIVE_PRE_LEAD_MS = 90L;
    private static final long ACTIVE_POST_HOLD_MS = 110L;

    private final float density;
    private final TextPaint leadPaint;
    private final TextPaint bgPaint;
    private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF tempRect = new RectF();
    private final Matrix sweepMatrix = new Matrix();

    private LinearGradient sharedSweepShader;
    private int cachedSungRgb = 0;
    private int cachedUnsungRgb = 0;

    private SyllableLyricsDocument document;
    private final List<LineVisualSlot> lineSlots = new ArrayList<>();
    private int lastLayoutWidth = 0;
    private float lastViewportHeight = 0f;
    private float totalContentHeight = 0f;

    private int primaryActiveLineIndex = -1;
    private boolean activeLineChanged = false;

    private int tappedLineIndex = -1;
    private float tappedFlash = 0f;
    private float breakBreathPhase = 0f;

    private static final class SyllableSlice {
        final long startMs;
        final long endMs;
        final float offsetX;
        final float width;

        SyllableSlice(long startMs, long endMs, float offsetX, float width) {
            this.startMs = startMs;
            this.endMs = endMs;
            this.offsetX = offsetX;
            this.width = width;
        }
    }

    private static final class WordVisualSlot {
        final WordGroup word;
        final float x;
        final float baselineY;
        final float width;
        final float height;
        final float centerX;
        final float centerY;
        final SyllableSlice[] slices;

        float sweepPx = 0f;
        float lift = 0f;
        float liftVel = 0f;
        float glow = 0f;

        WordVisualSlot(
                WordGroup word,
                float x,
                float baselineY,
                float width,
                float height,
                float centerY,
                SyllableSlice[] slices
        ) {
            this.word = word;
            this.x = x;
            this.baselineY = baselineY;
            this.width = width;
            this.height = height;
            this.centerX = x + width * 0.5f;
            this.centerY = centerY;
            this.slices = slices;
        }
    }

    private static final class LineVisualSlot {
        final LyricLineData line;
        final int index;
        float topY;
        float height;
        final List<WordVisualSlot> leadWords = new ArrayList<>();
        final List<WordVisualSlot> bgWords = new ArrayList<>();

        float lineFocus = 0f;
        float currentBlurPx = 0f;
        float cascadeY = 0f;
        float cascadeVel = 0f;
        float breakProgress = 0f;
        float breakReveal = 0f;

        RenderNode blurNode;
        float appliedBlurPx = -1f;

        LineVisualSlot(LyricLineData line, int index) {
            this.line = line;
            this.index = index;
        }
    }

    public SyllableLyricsRenderer(float density) {
        this.density = density;

        this.leadPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG | Paint.SUBPIXEL_TEXT_FLAG);
        this.leadPaint.setTypeface(Typeface.create("sans-serif", Typeface.BOLD));
        this.leadPaint.setTextSize(27f * density);
        this.leadPaint.setLetterSpacing(-0.015f);
        this.leadPaint.setTextAlign(Paint.Align.LEFT);

        this.bgPaint = new TextPaint(Paint.ANTI_ALIAS_FLAG | Paint.SUBPIXEL_TEXT_FLAG);
        this.bgPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        this.bgPaint.setTextSize(17.5f * density);
        this.bgPaint.setLetterSpacing(-0.01f);
        this.bgPaint.setTextAlign(Paint.Align.LEFT);

        this.fillPaint.setStyle(Paint.Style.FILL);
    }

    public void setDocument(SyllableLyricsDocument doc) {
        this.document = doc;
        this.lineSlots.clear();
        this.lastLayoutWidth = 0;
        this.totalContentHeight = 0f;
        this.primaryActiveLineIndex = -1;
        this.activeLineChanged = false;
        this.tappedLineIndex = -1;
        this.tappedFlash = 0f;
        if (doc != null && doc.lines != null) {
            for (int i = 0; i < doc.lines.size(); i++) {
                lineSlots.add(new LineVisualSlot(doc.lines.get(i), i));
            }
        }
    }

    public SyllableLyricsDocument getDocument() {
        return document;
    }

    public boolean hasDocument() {
        return document != null && document.hasWordOrSyllableTiming && !lineSlots.isEmpty();
    }

    public void invalidateLayout() {
        lastLayoutWidth = 0;
    }

    public void flashTappedLine(int index) {
        if (index >= 0 && index < lineSlots.size()) {
            tappedLineIndex = index;
            tappedFlash = 1f;
        }
    }

    public void resetTransientState() {
        tappedLineIndex = -1;
        tappedFlash = 0f;
        for (int i = 0; i < lineSlots.size(); i++) {
            LineVisualSlot s = lineSlots.get(i);
            s.cascadeY = 0f;
            s.cascadeVel = 0f;
        }
    }

    public void ensureLayout(int contentWidthPx, float viewportHeightPx) {
        if (contentWidthPx <= 0 || lineSlots.isEmpty()) {
            return;
        }
        if (lastLayoutWidth == contentWidthPx && Math.abs(lastViewportHeight - viewportHeightPx) < 2f) {
            return;
        }
        lastLayoutWidth = contentWidthPx;
        lastViewportHeight = viewportHeightPx;

        float vpH = viewportHeightPx > 1f ? viewportHeightPx : 420f * density;
        float topPad = vpH * 0.28f;
        float bottomPad = vpH * 0.48f;
        float lineSpacing = 28f * density;

        Paint.FontMetrics leadFm = leadPaint.getFontMetrics();
        float leadLineH = leadFm.descent - leadFm.ascent;
        float leadRowStep = leadLineH + 7f * density;
        float leadSpaceW = leadPaint.measureText(" ");

        Paint.FontMetrics bgFm = bgPaint.getFontMetrics();
        float bgLineH = bgFm.descent - bgFm.ascent;
        float bgRowStep = bgLineH + 4.5f * density;
        float bgSpaceW = bgPaint.measureText(" ");

        float y = topPad;
        for (int i = 0; i < lineSlots.size(); i++) {
            LineVisualSlot slot = lineSlots.get(i);
            slot.leadWords.clear();
            slot.bgWords.clear();
            slot.topY = y;

            if (slot.line.isInstrumentalBreak) {
                slot.height = 36f * density;
                y += slot.height + lineSpacing;
                continue;
            }

            float curY = 0f;
            if (!slot.line.words.isEmpty()) {
                curY = layoutWordList(
                        slot.line.words,
                        leadPaint,
                        leadFm,
                        leadLineH,
                        leadRowStep,
                        leadSpaceW,
                        contentWidthPx,
                        slot.line.isOppositeSide,
                        curY,
                        slot.leadWords
                );
            }

            if (!slot.line.bgWords.isEmpty()) {
                if (curY > 0f) {
                    curY += 7f * density;
                }
                curY = layoutWordList(
                        slot.line.bgWords,
                        bgPaint,
                        bgFm,
                        bgLineH,
                        bgRowStep,
                        bgSpaceW,
                        contentWidthPx,
                        slot.line.isOppositeSide,
                        curY,
                        slot.bgWords
                );
            }

            slot.height = Math.max(leadLineH, curY);
            y += slot.height + lineSpacing;
        }
        totalContentHeight = y + bottomPad;
    }

    private static final class PlacedWordDraft {
        final WordGroup word;
        final float width;
        final float trailingSpaceW;
        float x;

        PlacedWordDraft(WordGroup word, float width, float trailingSpaceW) {
            this.word = word;
            this.width = width;
            this.trailingSpaceW = trailingSpaceW;
        }
    }

    private float layoutWordList(
            List<WordGroup> words,
            TextPaint paint,
            Paint.FontMetrics fm,
            float lineH,
            float rowStep,
            float spaceW,
            int maxWidthPx,
            boolean rightAlign,
            float startRelY,
            List<WordVisualSlot> out
    ) {
        List<List<PlacedWordDraft>> rows = new ArrayList<>();
        List<Float> rowWidths = new ArrayList<>();

        List<PlacedWordDraft> curRow = new ArrayList<>();
        float curW = 0f;
        float maxW = Math.max(80f * density, maxWidthPx * 0.95f);

        for (int i = 0; i < words.size(); i++) {
            WordGroup w = words.get(i);
            float wordW = Math.max(0.5f, paint.measureText(w.text));
            float gap = (w.trailingSpace && i + 1 < words.size()) ? spaceW : 0f;

            if (!curRow.isEmpty() && curW + wordW > maxW + 0.5f) {
                float trimmedW = trimTrailingGap(curRow, curW);
                rows.add(curRow);
                rowWidths.add(trimmedW);
                curRow = new ArrayList<>();
                curW = 0f;
            }

            PlacedWordDraft draft = new PlacedWordDraft(w, wordW, gap);
            draft.x = curW;
            curRow.add(draft);
            curW += wordW + gap;
        }
        if (!curRow.isEmpty()) {
            rows.add(curRow);
            rowWidths.add(trimTrailingGap(curRow, curW));
        }

        float relY = startRelY;
        for (int r = 0; r < rows.size(); r++) {
            List<PlacedWordDraft> row = rows.get(r);
            float rowW = rowWidths.get(r);
            float shiftX = rightAlign ? Math.max(0f, maxWidthPx - rowW) : 0f;
            float baselineY = relY - fm.ascent;
            float centerY = relY + lineH * 0.5f;

            for (int j = 0; j < row.size(); j++) {
                PlacedWordDraft d = row.get(j);
                SyllableSlice[] slices = measureSyllableSlices(d.word, paint, d.width);
                out.add(new WordVisualSlot(
                        d.word,
                        d.x + shiftX,
                        baselineY,
                        d.width,
                        lineH,
                        centerY,
                        slices
                ));
            }
            relY += (r + 1 < rows.size()) ? rowStep : lineH;
        }
        return relY;
    }

    private static float trimTrailingGap(List<PlacedWordDraft> row, float curW) {
        if (row.isEmpty()) return curW;
        PlacedWordDraft last = row.get(row.size() - 1);
        return Math.max(0f, curW - last.trailingSpaceW);
    }

    private static SyllableSlice[] measureSyllableSlices(WordGroup word, TextPaint paint, float totalW) {
        List<SyllableSpan> syls = word.syllables;
        if (syls == null || syls.isEmpty()) {
            return new SyllableSlice[]{new SyllableSlice(word.startMs, word.endMs, 0f, totalW)};
        }
        SyllableSlice[] slices = new SyllableSlice[syls.size()];
        int charCursor = 0;
        float prevX = 0f;
        int fullLen = word.text.length();
        for (int i = 0; i < syls.size(); i++) {
            SyllableSpan s = syls.get(i);
            charCursor = Math.min(fullLen, charCursor + s.text.length());
            float nextX = (i == syls.size() - 1)
                    ? totalW
                    : Math.min(totalW, paint.measureText(word.text, 0, charCursor));
            slices[i] = new SyllableSlice(s.startMs, s.endMs, prevX, Math.max(0.5f, nextX - prevX));
            prevX = nextX;
        }
        return slices;
    }

    /**
     * Advances per-line focus, progressive depth blur, cascade parallax, per-word lift springs,
     * luminous glows, and syllable sweep positions. Returns {@code true} if another animation
     * frame should be scheduled.
     */
    public boolean stepPhysics(
            long posMs,
            boolean playing,
            float browseBoost,
            float scrollVelPxPerSec,
            float dt
    ) {
        if (lineSlots.isEmpty()) {
            return false;
        }
        boolean stillAnimating = playing;

        if (playing) {
            breakBreathPhase = (breakBreathPhase + 3.1f * dt) % ((float) (Math.PI * 2.0));
        }

        if (tappedFlash > 0f) {
            tappedFlash = Math.max(0f, tappedFlash - dt / 0.34f);
            if (tappedFlash <= 0.001f) {
                tappedFlash = 0f;
                tappedLineIndex = -1;
            } else {
                stillAnimating = true;
            }
        }

        // Determine active line index for auto-scrolling, distance opacity, and progressive blur
        int activeLyricCandidate = -1;
        int activeBreakCandidate = -1;
        int lastStartedLyric = -1;

        for (int i = 0; i < lineSlots.size(); i++) {
            LineVisualSlot slot = lineSlots.get(i);
            LyricLineData line = slot.line;
            if (line.isInstrumentalBreak) {
                if (posMs >= line.startMs && posMs <= line.endMs) {
                    activeBreakCandidate = i;
                }
            } else {
                if (posMs >= line.startMs - ACTIVE_PRE_LEAD_MS) {
                    lastStartedLyric = i;
                }
                if (posMs >= line.startMs - ACTIVE_PRE_LEAD_MS && posMs <= line.endMs + ACTIVE_POST_HOLD_MS) {
                    activeLyricCandidate = i;
                }
            }
        }

        int newPrimary;
        if (activeLyricCandidate >= 0) {
            newPrimary = activeLyricCandidate;
        } else if (activeBreakCandidate >= 0) {
            newPrimary = activeBreakCandidate;
        } else if (lastStartedLyric >= 0) {
            int nextIdx = lastStartedLyric + 1;
            if (nextIdx < lineSlots.size()
                    && !lineSlots.get(nextIdx).line.isInstrumentalBreak
                    && lineSlots.get(nextIdx).line.startMs - posMs <= 500L) {
                newPrimary = nextIdx;
            } else {
                newPrimary = lastStartedLyric;
            }
        } else {
            newPrimary = 0;
        }

        if (newPrimary != primaryActiveLineIndex) {
            primaryActiveLineIndex = newPrimary;
            activeLineChanged = true;
        }

        float focusInLerp = 1f - (float) Math.exp(-10.5 * dt);
        float focusOutLerp = 1f - (float) Math.exp(-6.2 * dt);
        float blurSharpLerp = 1f - (float) Math.exp(-12.0 * dt);
        float blurSoftLerp = 1f - (float) Math.exp(-6.5 * dt);
        float glowInLerp = 1f - (float) Math.exp(-16.0 * dt);
        float glowOutLerp = 1f - (float) Math.exp(-6.8 * dt);
        float breakLerp = 1f - (float) Math.exp(-8.5 * dt);

        boolean blurEnabled = MaterialYouConfig.isLyricsProgressiveBlurEnabled();
        float blurMult = MaterialYouConfig.getLyricsBlurMultiplier();
        float browseClear = 1f - clamp01(browseBoost);

        for (int i = 0; i < lineSlots.size(); i++) {
            LineVisualSlot slot = lineSlots.get(i);
            LyricLineData line = slot.line;
            int dist = i - primaryActiveLineIndex;

            // Elastic per-line cascade parallax offset during auto-scroll
            int clampedDist = Math.max(-5, Math.min(5, dist));
            float targetCascade = Math.max(
                    -15f * density,
                    Math.min(15f * density, -scrollVelPxPerSec * 0.0052f * clampedDist)
            );
            if (Math.abs(slot.cascadeY - targetCascade) > 0.08f || Math.abs(slot.cascadeVel) > 0.25f) {
                float k = 118f;
                float c = 2f * 0.80f * (float) Math.sqrt(k);
                float force = -k * (slot.cascadeY - targetCascade) - c * slot.cascadeVel;
                slot.cascadeVel += force * dt;
                slot.cascadeY += slot.cascadeVel * dt;
                stillAnimating = true;
            } else {
                slot.cascadeY = targetCascade;
                slot.cascadeVel = 0f;
            }

            if (line.isInstrumentalBreak) {
                boolean active = posMs >= line.startMs && posMs <= line.endMs;
                float targetBreak = active ? 1f : 0f;
                if (Math.abs(slot.breakReveal - targetBreak) > 0.004f) {
                    slot.breakReveal += (targetBreak - slot.breakReveal) * breakLerp;
                    stillAnimating = true;
                } else {
                    slot.breakReveal = targetBreak;
                }
                if (active) {
                    float span = Math.max(1f, line.endMs - line.startMs);
                    slot.breakProgress = clamp01((posMs - line.startMs) / span);
                    stillAnimating = true;
                } else {
                    slot.breakProgress = posMs > line.endMs ? 1f : 0f;
                }
                continue;
            }

            boolean lineActive = posMs >= line.startMs - ACTIVE_PRE_LEAD_MS
                    && posMs <= line.endMs + ACTIVE_POST_HOLD_MS;
            float targetFocus = lineActive ? 1f : 0f;
            if (Math.abs(slot.lineFocus - targetFocus) > 0.003f) {
                slot.lineFocus += (targetFocus - slot.lineFocus) * (lineActive ? focusInLerp : focusOutLerp);
                stillAnimating = true;
            } else {
                slot.lineFocus = targetFocus;
            }

            // Progressive depth-of-field blur target (clears smoothly on focus or scroll browsing)
            float targetBlurPx = 0f;
            if (blurEnabled) {
                float baseDp = computeProgressiveBlurDp(dist);
                targetBlurPx = baseDp * density * blurMult * (1f - slot.lineFocus) * browseClear;
            }
            if (Math.abs(slot.currentBlurPx - targetBlurPx) > 0.08f) {
                float bLerp = targetBlurPx < slot.currentBlurPx ? blurSharpLerp : blurSoftLerp;
                slot.currentBlurPx += (targetBlurPx - slot.currentBlurPx) * bLerp;
                stillAnimating = true;
            } else {
                slot.currentBlurPx = targetBlurPx;
            }

            if (stepWordSlots(slot.leadWords, posMs, lineActive, line.endMs, dt, glowInLerp, glowOutLerp)) {
                stillAnimating = true;
            }
            if (stepWordSlots(slot.bgWords, posMs, lineActive, line.endMs, dt, glowInLerp, glowOutLerp)) {
                stillAnimating = true;
            }
        }

        return stillAnimating;
    }

    public static float computeProgressiveBlurDp(int signedDist) {
        if (signedDist == 0) return 0f;
        if (signedDist == 1) return 1.6f;
        if (signedDist == -1) return 2.2f;
        if (signedDist == 2) return 3.1f;
        if (signedDist == -2) return 3.8f;
        int abs = Math.abs(signedDist);
        if (abs == 3) return 4.8f;
        return 6.2f;
    }

    private boolean stepWordSlots(
            List<WordVisualSlot> words,
            long posMs,
            boolean lineActive,
            long lineEndMs,
            float dt,
            float glowInLerp,
            float glowOutLerp
    ) {
        boolean anim = false;
        for (int j = 0; j < words.size(); j++) {
            WordVisualSlot ws = words.get(j);
            WordGroup w = ws.word;

            // 1. Syllable-accurate pixel sweep
            float targetSweep;
            if (posMs <= w.startMs) {
                targetSweep = 0f;
            } else if (posMs >= w.endMs) {
                targetSweep = ws.width;
            } else {
                targetSweep = computeSyllableSweepPx(ws, posMs);
            }
            ws.sweepPx = targetSweep;

            // 2. Progress-coupled buoyant word lift + vocal swell + staggered wave settle
            boolean wordSinging = posMs >= w.startMs && posMs <= w.endMs;
            long settleStaggerMs = Math.min(240L, j * 24L);
            boolean inWaveHold = posMs > w.endMs && posMs <= lineEndMs + 90L + settleStaggerMs;

            float targetLift;
            float stiffness;
            float damping;
            float targetGlow;

            if (wordSinging) {
                long dur = Math.max(1L, w.endMs - w.startMs);
                float wp = clamp01((posMs - w.startMs) / (float) dur);
                float rise = 0.50f + 0.50f * easeOutCubic(Math.min(1f, wp * 1.75f));
                float swell = w.isLongSwell ? (1.0f + 0.18f * (float) Math.sin(wp * Math.PI)) : 1.0f;
                targetLift = rise * swell;
                stiffness = 175f;
                damping = 0.70f;
                targetGlow = 0.58f + 0.42f * (float) Math.sin(wp * Math.PI);
            } else if (lineActive && inWaveHold) {
                targetLift = 0.38f;
                stiffness = 105f;
                damping = 0.85f;
                targetGlow = 0f;
            } else if (inWaveHold) {
                // Brief staggered hold before cascading down
                targetLift = 0.24f;
                stiffness = 95f;
                damping = 0.88f;
                targetGlow = 0f;
            } else {
                targetLift = 0.0f;
                stiffness = 95f;
                damping = 0.90f;
                targetGlow = 0f;
            }

            if (Math.abs(ws.lift - targetLift) > 0.002f || Math.abs(ws.liftVel) > 0.004f) {
                float d = 2f * damping * (float) Math.sqrt(stiffness);
                float force = -stiffness * (ws.lift - targetLift) - d * ws.liftVel;
                ws.liftVel += force * dt;
                ws.lift = Math.max(-0.08f, Math.min(1.32f, ws.lift + ws.liftVel * dt));
                anim = true;
            } else {
                ws.lift = targetLift;
                ws.liftVel = 0f;
            }

            // 3. Soft luminous glow bloom while singing
            if (Math.abs(ws.glow - targetGlow) > 0.005f) {
                ws.glow += (targetGlow - ws.glow) * (wordSinging ? glowInLerp : glowOutLerp);
                anim = true;
            } else {
                ws.glow = targetGlow;
            }
        }
        return anim;
    }

    private static float computeSyllableSweepPx(WordVisualSlot ws, long posMs) {
        SyllableSlice[] slices = ws.slices;
        for (int k = 0; k < slices.length; k++) {
            SyllableSlice s = slices[k];
            if (posMs < s.startMs) {
                return s.offsetX;
            }
            if (posMs <= s.endMs) {
                long dur = Math.max(1L, s.endMs - s.startMs);
                float t = clamp01((posMs - s.startMs) / (float) dur);
                if (dur >= 320L) {
                    float smooth = t * t * (3f - 2f * t);
                    t = 0.72f * t + 0.28f * smooth;
                }
                return s.offsetX + s.width * t;
            }
        }
        return ws.width;
    }

    public boolean consumeActiveLineChanged() {
        boolean changed = activeLineChanged;
        activeLineChanged = false;
        return changed;
    }

    public int getPrimaryActiveLineIndex() {
        return primaryActiveLineIndex;
    }

    public float getTotalContentHeight() {
        return totalContentHeight;
    }

    public float computeAutoScrollY(float viewportHeight) {
        if (lineSlots.isEmpty()) {
            return 0f;
        }
        int idx = Math.max(0, Math.min(lineSlots.size() - 1, primaryActiveLineIndex));
        LineVisualSlot slot = lineSlots.get(idx);
        float vpH = viewportHeight > 1f ? viewportHeight : 420f * density;
        float itemCenter = slot.topY + slot.height * 0.5f;
        float viewCenter = vpH * 0.34f;
        float maxScroll = Math.max(0f, totalContentHeight - vpH);
        return Math.max(0f, Math.min(maxScroll, itemCenter - viewCenter));
    }

    public int hitTestLineIndex(float localY) {
        for (int i = 0; i < lineSlots.size(); i++) {
            LineVisualSlot slot = lineSlots.get(i);
            if (slot.line.isInstrumentalBreak) continue;
            float top = slot.topY - 8f * density;
            float bot = slot.topY + slot.height + 26f * density;
            if (localY >= top && localY <= bot) {
                return i;
            }
        }
        return -1;
    }

    public long getLineStartMs(int index) {
        if (index < 0 || index >= lineSlots.size()) {
            return 0L;
        }
        return lineSlots.get(index).line.startMs;
    }

    public void draw(
            Canvas canvas,
            int contentWidthPx,
            float viewportHeight,
            float scrollY,
            float browseBoost,
            float alphaReveal,
            int activeTextRgb,
            int inactiveTextRgb
    ) {
        if (alphaReveal <= 0.01f || lineSlots.isEmpty()) {
            return;
        }
        ensureLayout(contentWidthPx, viewportHeight);
        ensureShaders(activeTextRgb, inactiveTextRgb);

        float vpH = viewportHeight > 1f ? viewportHeight : 420f * density;
        float padTopCull = -72f * density;
        float padBotCull = vpH + 72f * density;

        int activeIdx = primaryActiveLineIndex >= 0 ? primaryActiveLineIndex : 0;
        boolean hwAccel = canvas.isHardwareAccelerated() && Build.VERSION.SDK_INT >= 31;

        for (int i = 0; i < lineSlots.size(); i++) {
            LineVisualSlot slot = lineSlots.get(i);
            float itemTop = slot.topY - scrollY + slot.cascadeY;
            if (itemTop + slot.height < padTopCull || itemTop > padBotCull) {
                continue;
            }

            if (slot.line.isInstrumentalBreak) {
                if (slot.breakReveal > 0.02f) {
                    drawInstrumentalDots(
                            canvas,
                            itemTop + slot.height * 0.5f,
                            slot.breakReveal * alphaReveal,
                            slot.breakProgress,
                            activeTextRgb,
                            inactiveTextRgb,
                            slot.line.isOppositeSide,
                            contentWidthPx
                    );
                }
                continue;
            }

            // Tap flash pill
            if (i == tappedLineIndex && tappedFlash > 0.01f) {
                tempRect.set(
                        -10f * density,
                        itemTop - 6f * density,
                        contentWidthPx + 10f * density,
                        itemTop + slot.height + 6f * density
                );
                fillPaint.setColor(MaterialYouColorEngine.withAlpha(
                        activeTextRgb, Math.round(0x2A * tappedFlash * alphaReveal)));
                canvas.drawRoundRect(tempRect, 14f * density, 14f * density, fillPaint);
            }

            int dist = i - activeIdx;
            float restingAlpha;
            if (dist == 0) {
                restingAlpha = 0.46f;
            } else if (dist == 1) {
                restingAlpha = 0.48f;
            } else if (dist == -1) {
                restingAlpha = 0.34f;
            } else if (dist == 2) {
                restingAlpha = 0.36f;
            } else if (dist == -2) {
                restingAlpha = 0.25f;
            } else if (dist > 2) {
                restingAlpha = 0.24f;
            } else {
                restingAlpha = 0.20f;
            }
            float unsungAlpha = Math.min(0.88f, restingAlpha + browseBoost * 0.36f);
            float lineScale = 1.0f + 0.048f * slot.lineFocus;
            float pivotX = slot.line.isOppositeSide ? contentWidthPx : 0f;

            if (hwAccel && slot.currentBlurPx >= 0.35f) {
                if (drawLineWithHardwareBlur(
                        canvas, slot, itemTop, contentWidthPx, lineScale, pivotX,
                        activeTextRgb, inactiveTextRgb, unsungAlpha, alphaReveal)) {
                    continue;
                }
            } else if (slot.blurNode != null && slot.appliedBlurPx > 0f && Build.VERSION.SDK_INT >= 31) {
                try {
                    slot.blurNode.setRenderEffect(null);
                } catch (Throwable ignored) {
                }
                slot.appliedBlurPx = 0f;
            }

            canvas.save();
            canvas.translate(0f, itemTop);
            if (lineScale > 1.0005f) {
                canvas.scale(lineScale, lineScale, pivotX, slot.height * 0.5f);
            }
            drawLineWordsInternal(
                    canvas, slot, activeTextRgb, inactiveTextRgb, unsungAlpha, alphaReveal);
            canvas.restore();
        }

        leadPaint.setShader(null);
        leadPaint.clearShadowLayer();
        bgPaint.setShader(null);
        bgPaint.clearShadowLayer();
    }

    private boolean drawLineWithHardwareBlur(
            Canvas canvas,
            LineVisualSlot slot,
            float itemTop,
            int contentWidthPx,
            float lineScale,
            float pivotX,
            int activeTextRgb,
            int inactiveTextRgb,
            float unsungAlpha,
            float alphaReveal
    ) {
        try {
            float blurPx = slot.currentBlurPx;
            int pad = Math.max(
                    Math.round(12f * density),
                    (int) Math.ceil(blurPx * 2.6f) + Math.round(6f * density)
            );
            int nodeW = Math.max(1, contentWidthPx + pad * 2);
            int nodeH = Math.max(1, Math.round(slot.height) + pad * 2);

            if (slot.blurNode == null) {
                slot.blurNode = new RenderNode("mt-syl-line-" + slot.index);
            }
            RenderNode node = slot.blurNode;
            node.setPosition(0, 0, nodeW, nodeH);
            node.setClipToBounds(false);
            node.setForceDarkAllowed(false);

            float qBlur = Math.max(0.5f, Math.round(blurPx * 4f) * 0.25f);
            if (Math.abs(qBlur - slot.appliedBlurPx) >= 0.20f) {
                node.setRenderEffect(RenderEffect.createBlurEffect(qBlur, qBlur, Shader.TileMode.DECAL));
                slot.appliedBlurPx = qBlur;
            }

            RecordingCanvas rc = node.beginRecording(nodeW, nodeH);
            try {
                rc.translate(pad, pad);
                if (lineScale > 1.0005f) {
                    rc.scale(lineScale, lineScale, pivotX, slot.height * 0.5f);
                }
                drawLineWordsInternal(
                        rc, slot, activeTextRgb, inactiveTextRgb, unsungAlpha, alphaReveal);
            } finally {
                node.endRecording();
            }

            canvas.save();
            canvas.translate(-pad, itemTop - pad);
            canvas.drawRenderNode(node);
            canvas.restore();
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private void drawLineWordsInternal(
            Canvas canvas,
            LineVisualSlot slot,
            int activeTextRgb,
            int inactiveTextRgb,
            float unsungAlpha,
            float alphaReveal
    ) {
        drawWordSlots(
                canvas,
                slot.leadWords,
                leadPaint,
                activeTextRgb,
                inactiveTextRgb,
                slot.lineFocus,
                unsungAlpha,
                alphaReveal,
                1f
        );

        if (!slot.bgWords.isEmpty()) {
            drawWordSlots(
                    canvas,
                    slot.bgWords,
                    bgPaint,
                    activeTextRgb,
                    inactiveTextRgb,
                    slot.lineFocus,
                    unsungAlpha,
                    alphaReveal,
                    0.82f
            );
        }
    }

    private void drawWordSlots(
            Canvas canvas,
            List<WordVisualSlot> words,
            TextPaint paint,
            int activeTextRgb,
            int inactiveTextRgb,
            float lineFocus,
            float unsungAlpha,
            float alphaReveal,
            float groupAlphaScale
    ) {
        float textSize = paint.getTextSize();
        float maxLiftDip = (paint == bgPaint ? 2.2f : 4.2f) * density;
        float maxScaleBoost = paint == bgPaint ? 0.022f : 0.040f;

        int unsungAlphaInt = Math.round(255f * unsungAlpha * alphaReveal * groupAlphaScale);
        int sungAlphaInt = Math.round(255f * (unsungAlpha + (1f - unsungAlpha) * lineFocus) * alphaReveal * groupAlphaScale);
        int unsungColor = MaterialYouColorEngine.withAlpha(inactiveTextRgb, unsungAlphaInt);
        int sungColor = MaterialYouColorEngine.withAlpha(
                MaterialYouColorEngine.blendRgb(inactiveTextRgb, activeTextRgb, Math.max(0.15f, lineFocus)),
                sungAlphaInt
        );
        int sweepOverallAlpha = Math.round(255f * alphaReveal * groupAlphaScale);

        for (int j = 0; j < words.size(); j++) {
            WordVisualSlot ws = words.get(j);
            WordGroup w = ws.word;

            float swellLiftScale = w.isLongSwell ? 1.25f : 1.0f;
            float swellScaleBoost = w.isLongSwell ? 1.32f : 1.0f;
            float liftPx = -ws.lift * maxLiftDip * swellLiftScale;
            float wordScale = 1.0f + ws.lift * maxScaleBoost * swellScaleBoost;

            if (ws.sweepPx <= 0.5f) {
                paint.setShader(null);
                paint.setColor(unsungColor);
            } else if (ws.sweepPx >= ws.width - 0.5f) {
                paint.setShader(null);
                paint.setColor(sungColor);
            } else {
                float p = clamp01(ws.sweepPx / Math.max(1f, ws.width));
                float feather = Math.max(
                        12f * density,
                        Math.min(textSize * 0.56f, Math.max(14f * density, ws.width * 0.74f))
                );
                float transLeft = ws.x + (ws.width + feather) * p - feather;
                sweepMatrix.setScale(feather, 1f);
                sweepMatrix.postTranslate(transLeft, 0f);
                sharedSweepShader.setLocalMatrix(sweepMatrix);
                paint.setShader(sharedSweepShader);
                paint.setAlpha(sweepOverallAlpha);
            }

            if (ws.glow > 0.02f) {
                int glowColor = MaterialYouColorEngine.withAlpha(
                        activeTextRgb, Math.round(0x42 * ws.glow * alphaReveal * groupAlphaScale));
                paint.setShadowLayer(12f * density * ws.glow, 0f, 1.2f * density, glowColor);
            } else {
                paint.clearShadowLayer();
            }

            if (Math.abs(liftPx) > 0.05f || wordScale > 1.001f) {
                canvas.save();
                canvas.translate(0f, liftPx);
                if (wordScale > 1.001f) {
                    canvas.scale(wordScale, wordScale, ws.centerX, ws.centerY);
                }
                canvas.drawText(w.text, ws.x, ws.baselineY, paint);
                canvas.restore();
            } else {
                canvas.drawText(w.text, ws.x, ws.baselineY, paint);
            }
        }
    }

    private void drawInstrumentalDots(
            Canvas canvas,
            float cy,
            float reveal,
            float progress,
            int activeTextRgb,
            int inactiveTextRgb,
            boolean rightAlign,
            int contentWidthPx
    ) {
        float scaleIn = 0.55f + 0.45f * easeOutCubic(reveal);
        float baseR = 4.8f * density * scaleIn;
        float spacing = 17f * density;
        float startX = rightAlign ? (contentWidthPx - 10f * density - spacing * 2f) : (10f * density);

        for (int d = 0; d < 3; d++) {
            float segStart = d / 3f;
            float segEnd = (d + 1) / 3f;
            float fillFrac = clamp01((progress - segStart) / (segEnd - segStart));
            float wave = (float) Math.sin(breakBreathPhase - d * 0.95f);
            float pulse = 0.5f + 0.5f * wave;
            float floatY = -wave * 2.4f * density * reveal;
            float r = baseR * (0.86f + 0.26f * pulse);
            int rgb = MaterialYouColorEngine.blendRgb(inactiveTextRgb, activeTextRgb, fillFrac);
            int alpha = Math.round(255f * (0.34f + 0.66f * fillFrac) * reveal);

            if (fillFrac > 0.05f && fillFrac < 0.98f) {
                fillPaint.setColor(MaterialYouColorEngine.withAlpha(activeTextRgb, Math.round(0x28 * fillFrac * reveal)));
                canvas.drawCircle(startX + d * spacing, cy + floatY, r * 1.75f, fillPaint);
            }
            fillPaint.setColor(MaterialYouColorEngine.withAlpha(rgb, alpha));
            canvas.drawCircle(startX + d * spacing, cy + floatY, r, fillPaint);
        }
    }

    private void ensureShaders(int activeTextRgb, int inactiveTextRgb) {
        int sung = MaterialYouColorEngine.withAlpha(activeTextRgb, 255);
        int unsung = MaterialYouColorEngine.withAlpha(inactiveTextRgb, 118);
        if (sharedSweepShader == null || cachedSungRgb != sung || cachedUnsungRgb != unsung) {
            cachedSungRgb = sung;
            cachedUnsungRgb = unsung;
            int peakGlow = MaterialYouColorEngine.withAlpha(
                    MaterialYouColorEngine.blendRgb(activeTextRgb, 0xFFFFFFFF, 0.30f),
                    255
            );
            sharedSweepShader = new LinearGradient(
                    0f, 0f, 1f, 0f,
                    new int[]{sung, peakGlow, unsung},
                    new float[]{0.0f, 0.44f, 1.0f},
                    Shader.TileMode.CLAMP
            );
        }
    }

    private static float easeOutCubic(float t) {
        float inv = 1f - clamp01(t);
        return 1f - inv * inv * inv;
    }

    private static float clamp01(float v) {
        return Math.max(0f, Math.min(1f, v));
    }
}
