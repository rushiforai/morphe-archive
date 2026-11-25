package dev.materialtidal.extension.tidal.player;

import java.util.Locale;

/**
 * Pure-Java responsive geometry & formatting solver for the Material 3 Expressive player
 * on tablets, foldables, Chromebooks/DeX, and wide landscape viewports.
 *
 * <p>Has zero {@code android.*} dependencies so it can be unit-tested directly on the JVM
 * while guaranteeing zero control overlaps across all supported screen dimensions.
 */
public final class PlayerDesktopLayoutSolver {

    public static final int MODE_PHONE_PORTRAIT = 0;
    public static final int MODE_DESKTOP_LANDSCAPE = 1;
    public static final int MODE_TABLET_PORTRAIT = 2;

    private PlayerDesktopLayoutSolver() {
    }

    /**
     * Lightweight mutable rectangle matching {@code android.graphics.RectF} semantics.
     */
    public static final class RectBox {
        public float left;
        public float top;
        public float right;
        public float bottom;

        public void set(float l, float t, float r, float b) {
            this.left = l;
            this.top = t;
            this.right = r;
            this.bottom = b;
        }

        public void clear() {
            this.left = 0f;
            this.top = 0f;
            this.right = 0f;
            this.bottom = 0f;
        }

        public float width() {
            return right - left;
        }

        public float height() {
            return bottom - top;
        }

        public float centerX() {
            return (left + right) * 0.5f;
        }

        public float centerY() {
            return (top + bottom) * 0.5f;
        }

        public boolean isEmpty() {
            return right <= left || bottom <= top;
        }
    }

    /**
     * Complete computed geometry for {@link #MODE_DESKTOP_LANDSCAPE}.
     */
    public static final class DesktopLayoutResult {
        public final RectBox collapseBox = new RectBox();
        public final RectBox sourceChipBox = new RectBox();
        public final RectBox panelToggleBox = new RectBox();
        public final RectBox moreBox = new RectBox();

        public final RectBox leftPaneBox = new RectBox();
        public final RectBox coverBox = new RectBox();

        public final RectBox panelBox = new RectBox();
        public final RectBox panelHeaderBox = new RectBox();
        public final RectBox tabQueueBox = new RectBox();
        public final RectBox tabLyricsBox = new RectBox();
        public final RectBox openFullQueueBox = new RectBox();
        public final RectBox panelBodyBox = new RectBox();
        public final RectBox syncPillBox = new RectBox();

        public final RectBox dockBox = new RectBox();
        public final RectBox titleAreaBox = new RectBox();
        public final RectBox favoriteBox = new RectBox();

        public final RectBox shuffleBox = new RectBox();
        public final RectBox prevBox = new RectBox();
        public final RectBox playBox = new RectBox();
        public final RectBox nextBox = new RectBox();
        public final RectBox repeatBox = new RectBox();

        public final RectBox seekBarTrackBox = new RectBox();
        public final RectBox elapsedTimeBox = new RectBox();
        public final RectBox durationTimeBox = new RectBox();
        public final RectBox badgeBox = new RectBox();

        public final RectBox lyricsBtnBox = new RectBox();
        public final RectBox queueBtnBox = new RectBox();
        public final RectBox castBtnBox = new RectBox();
        public final RectBox volumeIconBox = new RectBox();
        public final RectBox volumeSliderBox = new RectBox();

        public float headerTitleX;
        public float headerTitleMaxRight;
        public boolean compactHeight;
        public boolean showVolumeSlider;
        public boolean showSourceChip;
        public boolean showFullQueueBtn;
        public boolean showLyricsBtn;
    }

    /**
     * Centered editorial constraints for {@link #MODE_TABLET_PORTRAIT}.
     */
    public static final class TabletPortraitMetrics {
        public float headerLeft;
        public float headerRight;
        public float contentLeft;
        public float contentRight;
        public float capsuleLeft;
        public float capsuleRight;
        public float maxCoverSize;
        public float lyricsColLeft;
        public float lyricsColRight;
        public boolean showSourceChip;
    }

    /**
     * Resolves which layout architecture to render for the current viewport size in dp.
     */
    public static int resolveLayoutMode(float wDp, float hDp, boolean tabletDesktopEnabled) {
        if (!tabletDesktopEnabled || wDp < 600f) {
            return MODE_PHONE_PORTRAIT;
        }
        if (wDp > hDp * 1.05f || (wDp >= 740f && hDp >= 480f && wDp >= hDp * 0.92f)) {
            return MODE_DESKTOP_LANDSCAPE;
        }
        return MODE_TABLET_PORTRAIT;
    }

    /**
     * Computes all non-overlapping element bounds for the TIDAL Desktop-inspired two-pane
     * landscape/large-tablet player layout.
     */
    public static void computeDesktopLandscape(
            float w,
            float h,
            float density,
            float insetLeft,
            float insetTop,
            float insetRight,
            float insetBottom,
            float panelReveal,
            boolean showLyricsButton,
            boolean hasSourceName,
            float measuredBadgeWidthPx,
            float measuredSourceWidthPx,
            float measuredSyncPillWidthPx,
            DesktopLayoutResult out
    ) {
        float d = Math.max(0.5f, density);
        float wDp = w / d;
        float hDp = h / d;
        boolean compact = hDp < 520f;
        out.compactHeight = compact;
        out.showLyricsBtn = showLyricsButton;

        float sidePad = clamp(w * 0.025f, 18f * d, 34f * d);
        float safeLeft = insetLeft + sidePad;
        float safeRight = w - insetRight - sidePad;
        if (safeRight - safeLeft < 300f * d) {
            safeLeft = Math.max(0f, insetLeft + 8f * d);
            safeRight = Math.min(w, w - insetRight - 8f * d);
        }
        float safeW = Math.max(240f * d, safeRight - safeLeft);

        float topY = insetTop + (compact ? 6f : 12f) * d;
        float botY = h - insetBottom - (compact ? 8f : 14f) * d;

        // 1. Top Slim Header Bar
        float headerH = (compact ? 38f : 44f) * d;
        out.collapseBox.set(safeLeft, topY, safeLeft + headerH, topY + headerH);

        float topBtnW = (compact ? 40f : 44f) * d;
        float splitGap = 3f * d;
        out.moreBox.set(safeRight - topBtnW, topY, safeRight, topY + headerH);
        out.panelToggleBox.set(
                out.moreBox.left - splitGap - topBtnW,
                topY,
                out.moreBox.left - splitGap,
                topY + headerH
        );

        float titleX = out.collapseBox.right + 14f * d;
        out.headerTitleX = titleX;

        float sourceReserveAfterTitle = 114f * d;
        float sourceLeft = titleX + sourceReserveAfterTitle;
        float maxSourceRight = out.panelToggleBox.left - 12f * d;
        float availSourceW = maxSourceRight - sourceLeft;
        if (hasSourceName && availSourceW >= 96f * d) {
            float chipW = Math.min(availSourceW, Math.max(96f * d, measuredSourceWidthPx));
            float chipH = (compact ? 30f : 34f) * d;
            float chipCy = out.collapseBox.centerY();
            out.sourceChipBox.set(sourceLeft, chipCy - chipH * 0.5f, sourceLeft + chipW, chipCy + chipH * 0.5f);
            out.headerTitleMaxRight = sourceLeft - 10f * d;
            out.showSourceChip = true;
        } else {
            out.sourceChipBox.clear();
            out.headerTitleMaxRight = out.panelToggleBox.left - 10f * d;
            out.showSourceChip = false;
        }

        // 2. Floating 3-Zone Desktop Bottom Dock
        float dockH = (compact ? 82f : 104f) * d;
        float dockTop = Math.max(out.collapseBox.bottom + 140f * d, botY - dockH);
        // If viewport height is unusually short, keep dock bottom anchored cleanly to botY.
        if (botY - dockH < out.collapseBox.bottom + 110f * d) {
            dockTop = Math.max(out.collapseBox.bottom + 90f * d, botY - dockH);
        }
        out.dockBox.set(safeLeft, dockTop, safeRight, Math.max(dockTop + 68f * d, botY));

        float dockPadH = (compact ? 16f : 22f) * d;
        float dockPadV = (compact ? 9f : 12f) * d;
        float innerL = out.dockBox.left + dockPadH;
        float innerR = out.dockBox.right - dockPadH;
        float innerW = Math.max(200f * d, innerR - innerL);
        float innerTop = out.dockBox.top + dockPadV;
        float innerBot = out.dockBox.bottom - dockPadV;
        float innerH = Math.max(48f * d, innerBot - innerTop);
        float dockCx = out.dockBox.centerX();

        float zoneGap = 14f * d;
        float maxCenterForSideZones = Math.max(180f * d, innerW - 200f * d - zoneGap * 2f);
        float centerW = clamp(innerW * 0.42f, Math.min(240f * d, maxCenterForSideZones), 520f * d);
        float centerL = dockCx - centerW * 0.5f;
        float centerR = dockCx + centerW * 0.5f;

        // 2a. Left Zone: Track Info + Favorite Heart
        float leftZoneL = innerL;
        float leftZoneR = Math.max(leftZoneL + 56f * d, centerL - zoneGap);
        float favSize = Math.min((compact ? 34f : 38f) * d, Math.max(24f * d, leftZoneR - leftZoneL));
        float favCy = out.dockBox.centerY();
        out.favoriteBox.set(leftZoneR - favSize, favCy - favSize * 0.5f, leftZoneR, favCy + favSize * 0.5f);
        float infoH = Math.min(innerH, (compact ? 48f : 56f) * d);
        out.titleAreaBox.set(
                leftZoneL,
                favCy - infoH * 0.5f,
                Math.max(leftZoneL, out.favoriteBox.left - 10f * d),
                favCy + infoH * 0.5f
        );

        // 2b. Center Zone: Upper Transport Row [Shuffle | Prev | Play | Next | Repeat] + Lower Seek Row
        float transH = Math.min(innerH * 0.62f, (compact ? 38f : 46f) * d);
        float seekRowH = Math.min(innerH * 0.36f, (compact ? 22f : 26f) * d);
        float transTop = innerTop;
        float transBot = transTop + transH;
        float transCy = (transTop + transBot) * 0.5f;

        float baseSideAuxW = (compact ? 32f : 36f) * d;
        float basePrevW = (compact ? 48f : 54f) * d;
        float basePlayW = (compact ? 62f : 70f) * d;
        float baseNextW = basePrevW;
        float baseTransGap = 8f * d;
        float unscaledTotal = baseSideAuxW * 2f + basePrevW + basePlayW + baseNextW + baseTransGap * 4f;
        float availTransportW = Math.max(120f * d, centerW - 10f * d);
        float tScale = Math.min(1f, availTransportW / unscaledTotal);

        float auxW = baseSideAuxW * tScale;
        float auxH = Math.min(transH, (compact ? 32f : 36f) * d);
        float prevW = basePrevW * tScale;
        float playW = basePlayW * tScale;
        float nextW = baseNextW * tScale;
        float tGap = Math.max(4f * d, baseTransGap * tScale);

        out.playBox.set(dockCx - playW * 0.5f, transTop, dockCx + playW * 0.5f, transBot);
        out.prevBox.set(out.playBox.left - tGap - prevW, transTop, out.playBox.left - tGap, transBot);
        out.nextBox.set(out.playBox.right + tGap, transTop, out.playBox.right + tGap + nextW, transBot);
        out.shuffleBox.set(
                out.prevBox.left - tGap - auxW,
                transCy - auxH * 0.5f,
                out.prevBox.left - tGap,
                transCy + auxH * 0.5f
        );
        out.repeatBox.set(
                out.nextBox.right + tGap,
                transCy - auxH * 0.5f,
                out.nextBox.right + tGap + auxW,
                transCy + auxH * 0.5f
        );

        float seekBot = innerBot;
        float seekTop = Math.max(transBot + 2f * d, seekBot - seekRowH);
        float timeW = Math.min(44f * d, centerW * 0.18f);
        out.elapsedTimeBox.set(centerL, seekTop, centerL + timeW, seekBot);
        out.durationTimeBox.set(centerR - timeW, seekTop, centerR, seekBot);
        out.seekBarTrackBox.set(
                out.elapsedTimeBox.right + 6f * d,
                seekTop,
                out.durationTimeBox.left - 6f * d,
                seekBot
        );

        // 2c. Right Zone: Upper [Lyrics | Queue | Cast] + [Volume] ; Lower [Quality Spec Pill]
        float rightZoneL = centerR + zoneGap;
        float rightZoneR = innerR;
        float rightZoneW = Math.max(40f * d, rightZoneR - rightZoneL);

        boolean showVol = (wDp >= 940f) && !compact && (rightZoneW >= 245f * d);
        out.showVolumeSlider = showVol;

        float pillH = Math.min(transH, (compact ? 32f : 36f) * d);
        float pillTop = transCy - pillH * 0.5f;
        float pillBot = transCy + pillH * 0.5f;
        float pillGap = 3f * d;

        float cursorR = rightZoneR;
        if (showVol) {
            float sliderW = 72f * d;
            float sliderH = 26f * d;
            out.volumeSliderBox.set(
                    cursorR - sliderW,
                    transCy - sliderH * 0.5f,
                    cursorR,
                    transCy + sliderH * 0.5f
            );
            float volIconS = 32f * d;
            float volIconR = out.volumeSliderBox.left - 4f * d;
            out.volumeIconBox.set(
                    volIconR - volIconS,
                    transCy - volIconS * 0.5f,
                    volIconR,
                    transCy + volIconS * 0.5f
            );
            cursorR = out.volumeIconBox.left - 10f * d;
        } else {
            out.volumeSliderBox.clear();
            out.volumeIconBox.clear();
        }

        int pillCount = showLyricsButton ? 3 : 2;
        float availPillsW = Math.max(54f * d, cursorR - rightZoneL);
        float rawPillW = (compact ? 34f : 38f) * d;
        float pillW = Math.min(rawPillW, (availPillsW - pillGap * (pillCount - 1)) / pillCount);

        out.castBtnBox.set(cursorR - pillW, pillTop, cursorR, pillBot);
        out.queueBtnBox.set(
                out.castBtnBox.left - pillGap - pillW,
                pillTop,
                out.castBtnBox.left - pillGap,
                pillBot
        );
        if (showLyricsButton) {
            out.lyricsBtnBox.set(
                    out.queueBtnBox.left - pillGap - pillW,
                    pillTop,
                    out.queueBtnBox.left - pillGap,
                    pillBot
            );
        } else {
            out.lyricsBtnBox.clear();
        }

        float badgeH = Math.min(seekRowH, (compact ? 20f : 22f) * d);
        float badgeCy = (seekTop + seekBot) * 0.5f;
        float maxBadgeW = Math.max(0f, rightZoneW);
        float desiredBadgeW = Math.max(Math.min(72f * d, maxBadgeW), measuredBadgeWidthPx);
        float badgeW = Math.min(maxBadgeW, desiredBadgeW);
        out.badgeBox.set(rightZoneR - badgeW, badgeCy - badgeH * 0.5f, rightZoneR, badgeCy + badgeH * 0.5f);

        // 3. Middle Two-Pane Stage (Hero Cover Left <-> Queue/Lyrics Side Panel Right)
        float stageGap = (compact ? 10f : 16f) * d;
        float stageTop = out.collapseBox.bottom + stageGap;
        float stageBot = Math.max(stageTop + 110f * d, out.dockBox.top - stageGap);
        float stageH = stageBot - stageTop;

        float pr = clamp(panelReveal, 0f, 1f);
        float panelTargetW = clamp(safeW * 0.47f, Math.min(280f * d, safeW * 0.48f), 580f * d);
        float gutter = 24f * d;
        float reservedRight = (panelTargetW + gutter) * pr;

        float leftPaneRight = Math.max(safeLeft + 110f * d, safeRight - reservedRight);
        out.leftPaneBox.set(safeLeft, stageTop, leftPaneRight, stageBot);

        float coverCap = (pr < 0.5f ? 500f : 460f) * d;
        float maxCoverW = Math.max(80f * d, out.leftPaneBox.width() - 24f * d);
        float maxCoverH = Math.max(80f * d, stageH * (compact ? 0.90f : 0.86f));
        float coverSize = Math.min(coverCap, Math.min(maxCoverW, maxCoverH));
        float coverCx = out.leftPaneBox.centerX();
        float coverCy = out.leftPaneBox.centerY();
        out.coverBox.set(
                coverCx - coverSize * 0.5f,
                coverCy - coverSize * 0.5f,
                coverCx + coverSize * 0.5f,
                coverCy + coverSize * 0.5f
        );

        float panelLeft = safeRight - panelTargetW;
        out.panelBox.set(panelLeft, stageTop, safeRight, stageBot);

        float pPadH = 14f * d;
        float pPadTop = (compact ? 10f : 12f) * d;
        float pHeaderH = (compact ? 38f : 44f) * d;
        out.panelHeaderBox.set(
                out.panelBox.left + pPadH,
                out.panelBox.top + pPadTop,
                out.panelBox.right - pPadH,
                out.panelBox.top + pPadTop + pHeaderH
        );

        float fullBtnS = (compact ? 32f : 36f) * d;
        out.openFullQueueBox.set(
                out.panelHeaderBox.right - fullBtnS,
                out.panelHeaderBox.centerY() - fullBtnS * 0.5f,
                out.panelHeaderBox.right,
                out.panelHeaderBox.centerY() + fullBtnS * 0.5f
        );
        out.showFullQueueBtn = true;

        float segOuterL = out.panelHeaderBox.left;
        float segOuterR = Math.max(segOuterL + 100f * d, out.openFullQueueBox.left - 10f * d);
        float segPad = 3f * d;
        float segGap = 4f * d;
        float segInnerL = segOuterL + segPad;
        float segInnerR = segOuterR - segPad;
        float segTabW = Math.max(36f * d, (segInnerR - segInnerL - segGap) * 0.5f);
        float segTop = out.panelHeaderBox.top + segPad;
        float segBot = out.panelHeaderBox.bottom - segPad;
        out.tabQueueBox.set(segInnerL, segTop, segInnerL + segTabW, segBot);
        out.tabLyricsBox.set(out.tabQueueBox.right + segGap, segTop, segInnerR, segBot);

        float bodyTop = out.panelHeaderBox.bottom + (compact ? 6f : 10f) * d;
        float bodyBot = Math.max(bodyTop + 60f * d, out.panelBox.bottom - (compact ? 6f : 10f) * d);
        out.panelBodyBox.set(out.panelBox.left, bodyTop, out.panelBox.right, bodyBot);

        float syncW = Math.min(
                Math.max(60f * d, out.panelBodyBox.width() - 32f * d),
                Math.max(88f * d, measuredSyncPillWidthPx)
        );
        float syncH = 34f * d;
        out.syncPillBox.set(
                out.panelBodyBox.right - 16f * d - syncW,
                out.panelBodyBox.bottom - 12f * d - syncH,
                out.panelBodyBox.right - 16f * d,
                out.panelBodyBox.bottom - 12f * d
        );
    }

    /**
     * Computes centered editorial column bounds for {@link #MODE_TABLET_PORTRAIT}.
     */
    public static void computeTabletPortraitMetrics(
            float w,
            float h,
            float density,
            float insetLeft,
            float insetTop,
            float insetRight,
            float insetBottom,
            TabletPortraitMetrics out
    ) {
        float d = Math.max(0.5f, density);
        float safeLeft = insetLeft + 24f * d;
        float safeRight = w - insetRight - 24f * d;
        if (safeRight - safeLeft < 280f * d) {
            safeLeft = insetLeft + 12f * d;
            safeRight = w - insetRight - 12f * d;
        }
        float safeW = Math.max(260f * d, safeRight - safeLeft);
        float cx = (safeLeft + safeRight) * 0.5f;

        float headerW = Math.min(safeW, 720f * d);
        out.headerLeft = cx - headerW * 0.5f;
        out.headerRight = cx + headerW * 0.5f;

        float contentW = Math.min(Math.max(240f * d, safeW - 16f * d), 540f * d);
        out.contentLeft = cx - contentW * 0.5f;
        out.contentRight = cx + contentW * 0.5f;

        float capsuleW = Math.min(contentW, 440f * d);
        out.capsuleLeft = cx - capsuleW * 0.5f;
        out.capsuleRight = cx + capsuleW * 0.5f;

        out.maxCoverSize = Math.min(contentW, 440f * d);

        float lyricsW = Math.min(Math.max(240f * d, safeW - 16f * d), 620f * d);
        out.lyricsColLeft = cx - lyricsW * 0.5f;
        out.lyricsColRight = cx + lyricsW * 0.5f;

        out.showSourceChip = (headerW / d) >= 460f;
    }

    /**
     * Formats raw {@code "<bitDepth>|<sampleRate>|<codec>"} into a concise Desktop badge label,
     * e.g. {@code "24-BIT · 192 kHz FLAC"}.
     */
    public static String formatAudioStreamSpec(String rawPipeDelimited) {
        if (rawPipeDelimited == null) {
            return "";
        }
        String trimmed = rawPipeDelimited.trim();
        if (trimmed.isEmpty()) {
            return "";
        }
        String[] parts = trimmed.split("\\|", -1);
        int bitDepth = parsePositiveInt(parts.length > 0 ? parts[0] : null);
        int sampleRate = parsePositiveInt(parts.length > 1 ? parts[1] : null);
        String codec = parts.length > 2 && parts[2] != null ? parts[2].trim().toUpperCase(Locale.US) : "";
        if ("NULL".equals(codec)) {
            codec = "";
        }

        StringBuilder sb = new StringBuilder();
        if (bitDepth > 0) {
            sb.append(bitDepth).append("-BIT");
        }
        if (sampleRate > 0) {
            if (sb.length() > 0) {
                sb.append(" · ");
            }
            if (sampleRate >= 1000) {
                if (sampleRate % 1000 == 0) {
                    sb.append(sampleRate / 1000).append(" kHz");
                } else {
                    float khz = sampleRate / 1000f;
                    sb.append(String.format(Locale.US, "%.1f kHz", khz));
                }
            } else {
                sb.append(sampleRate).append(" Hz");
            }
        }
        if (!codec.isEmpty()) {
            if (sb.length() > 0) {
                sb.append(' ');
            }
            sb.append(codec);
        }
        return sb.toString();
    }

    /**
     * Formats integer track duration in seconds as {@code "M:SS"} or {@code "H:MM:SS"}.
     */
    public static String formatDurationSec(int seconds) {
        if (seconds <= 0) {
            return "0:00";
        }
        int h = seconds / 3600;
        int m = (seconds % 3600) / 60;
        int s = seconds % 60;
        if (h > 0) {
            return String.format(Locale.US, "%d:%02d:%02d", h, m, s);
        }
        return String.format(Locale.US, "%d:%02d", m, s);
    }

    private static int parsePositiveInt(String s) {
        if (s == null) {
            return 0;
        }
        String t = s.trim();
        if (t.isEmpty() || "null".equalsIgnoreCase(t)) {
            return 0;
        }
        try {
            int val = Integer.parseInt(t);
            return Math.max(0, val);
        } catch (NumberFormatException ignored) {
            return 0;
        }
    }

    private static float clamp(float val, float min, float max) {
        if (max < min) {
            return min;
        }
        return Math.max(min, Math.min(max, val));
    }
}
