package dev.materialtidal.extension.tidal.navbar;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.os.SystemClock;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;

import java.util.ArrayList;
import java.util.List;

import dev.materialtidal.extension.tidal.theme.MaterialYouColorEngine;
import dev.materialtidal.extension.tidal.theme.MaterialYouConfig;

/**
 * Material 3 Expressive Split-Pill Floating Navigation Bar.
 *
 * <p>Shares aligned {@code 64dp} height, {@code 3dp} outer shadow padding, {@code 10dp} gutter,
 * and {@link ExpressiveDockGlass} directional frosted-glass specular rims with
 * {@link ExpressiveMiniPlayerView} so both components act as one unified floating dock:
 * <ul>
 *   <li>Liquid asymmetric spring pill with velocity-based vertical squash-and-stretch and specular
 *       top rim.</li>
 *   <li>Touch-drag tab scrubbing across left capsule slots with live pill tracking and haptics.</li>
 *   <li>Per-slot damped press springs, spatial momentum kick, and coupled vertical settle nudge
 *       when the mini-player enters/exits or is pulled upward.</li>
 *   <li>Crossfaded Home silhouette, spinning Explore vinyl grooves, lifted Library card stack,
 *       and tilting detached Search button.</li>
 * </ul>
 */
@SuppressWarnings("unused")
public final class ExpressiveNavbarView extends View {

    private static final String TAB_HOME = "HOME";
    private static final String TAB_FEED = "FEED";
    private static final String TAB_UPLOADS = "UPLOADS";
    private static final String TAB_COLLECTION = "COLLECTION";
    private static final String TAB_SEARCH = "SEARCH";

    private static final float CAPSULE_HEIGHT_DP = ExpressiveDockGlass.BAR_HEIGHT_DP;
    private static final float HORIZ_PAD_DP = ExpressiveDockGlass.HORIZ_PAD_DP;
    private static final float TOP_PAD_DP = 3f;
    private static final float BOTTOM_PAD_DP = 5f;
    private static final float TOTAL_HEIGHT_DP = TOP_PAD_DP + CAPSULE_HEIGHT_DP + BOTTOM_PAD_DP;
    private static final float SEARCH_GAP_DP = ExpressiveDockGlass.GAP_DP;
    private static final float INNER_PILL_INSET_DP = 6f;
    private static final float EXTRA_ACTIVE_WEIGHT = 0.85f;

    private static final class TabItem {
        final String tabType;
        final String label;

        TabItem(String tabType, String label) {
            this.tabType = tabType;
            this.label = label;
        }
    }

    private final float density;
    private final List<TabItem> leftTabs = new ArrayList<>(4);
    private final ExpressiveDockGlass.DockPillShaderCache capsuleGlass =
            new ExpressiveDockGlass.DockPillShaderCache();
    private final ExpressiveDockGlass.DockPillShaderCache searchGlass =
            new ExpressiveDockGlass.DockPillShaderCache();

    // Committed & live scrubbing state
    private String selectedTab = TAB_HOME;
    private boolean showUploadTab;
    private boolean showFeedBadge;
    private boolean hasInitializedSprings;
    private boolean scrubbingCapsule;
    private String scrubPreviewTab;

    // Springs for each left tab expansion fraction [0..1]
    private final float[] slotFrac = new float[4];
    private final float[] slotVel = new float[4];

    // Damped per-slot press scale springs [0.91..1.0]
    private final float[] slotPressScale = new float[]{1f, 1f, 1f, 1f};
    private final float[] slotPressVel = new float[4];
    private float searchPressScale = 1f;
    private float searchPressVel = 0f;

    // Normalized [0..1] X edges inside the left capsule for the liquid inner active pill
    private float pillLeftPos = 0f;
    private float pillLeftVel = 0f;
    private float pillRightPos = 0.48f;
    private float pillRightVel = 0f;
    private float pillTargetLeft = 0f;
    private float pillTargetRight = 0.48f;

    // Alpha of the left-capsule inner pill (fades cleanly when SEARCH is active)
    private float leftPillAlpha = 1f;
    private float leftPillAlphaVel = 0f;

    // Detached Search button springs
    private float searchActiveFrac = 0f;
    private float searchActiveVel = 0f;
    private float searchTiltDeg = 0f;
    private float searchTiltVel = 0f;

    // Spatial capsule inertia + coupled Mini-Player interaction springs
    private float capsuleMomentumX = 0f;
    private float capsuleMomentumVel = 0f;
    private float dockNudgeY = 0f;
    private float dockNudgeVel = 0f;
    private float pullUpOffsetY = 0f;
    private boolean lastKnownMiniVisible = false;

    // Expressive icon springs
    private float popProgress = 1f;
    private String poppingTab = TAB_HOME;
    private float exploreSpinDeg = 0f;
    private float exploreSpinTargetDeg = 0f;
    private float exploreSpinVel = 0f;
    private float libraryLift = 0f;
    private float libraryLiftVel = 0f;

    // Press feedback
    private String pressedTab;

    // Frame-delta spring integration
    private long lastFrameTimeMs;
    private boolean isAnimating;
    private final Runnable frameTick = this::stepAnimations;

    // Reusable Paints & Paths
    private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint textPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Paint badgePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path iconPath = new Path();
    private final Path auxPath = new Path();

    private final RectF capsuleRect = new RectF();
    private final RectF searchRect = new RectF();
    private final RectF innerPillRect = new RectF();
    private final RectF tempRect = new RectF();
    private final float[] slotLeftX = new float[4];
    private final float[] slotRightX = new float[4];

    public ExpressiveNavbarView(Context context) {
        super(context);
        this.density = context.getResources().getDisplayMetrics().density;
        setWillNotDraw(false);
        setForceDarkAllowed(false);
        setClickable(true);
        setFocusable(true);

        textPaint.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        textPaint.setTextSize(15f * density);
        textPaint.setTextAlign(Paint.Align.LEFT);

        strokePaint.setStyle(Paint.Style.STROKE);
        strokePaint.setStrokeCap(Paint.Cap.ROUND);
        strokePaint.setStrokeJoin(Paint.Join.ROUND);

        rebuildTabList();
        resetSpringsImmediate();
    }

    private void rebuildTabList() {
        leftTabs.clear();
        leftTabs.add(new TabItem(TAB_HOME, "Home"));
        leftTabs.add(new TabItem(TAB_FEED, "Explore"));
        if (showUploadTab && !MaterialYouConfig.isHideUploadTab()) {
            leftTabs.add(new TabItem(TAB_UPLOADS, "Uploads"));
        }
        leftTabs.add(new TabItem(TAB_COLLECTION, "Library"));
    }

    public void updateState(String newSelectedTab, boolean newShowUploads, boolean newShowFeedBadge) {
        String normalized = (newSelectedTab == null || newSelectedTab.isEmpty()) ? TAB_HOME : newSelectedTab;
        boolean tabsChanged = this.showUploadTab != newShowUploads;
        boolean tabChanged = !normalized.equals(this.selectedTab);
        boolean badgeChanged = this.showFeedBadge != newShowFeedBadge;

        if (!tabsChanged && !tabChanged && !badgeChanged && hasInitializedSprings) {
            return;
        }

        int prevIdx = findLeftTabIndex(this.selectedTab);
        this.selectedTab = normalized;
        this.showUploadTab = newShowUploads;
        this.showFeedBadge = newShowFeedBadge;
        if (!scrubbingCapsule) {
            this.scrubPreviewTab = null;
        }

        if (tabsChanged) {
            rebuildTabList();
        }

        String visualTab = getActiveVisualTab();
        computeNormalizedTargetPillBounds(visualTab);

        if (!hasInitializedSprings || tabsChanged) {
            resetSpringsImmediate();
            hasInitializedSprings = true;
            invalidate();
            return;
        }

        if (tabChanged) {
            triggerTabImpulse(prevIdx, normalized);
        }

        startAnimationLoop();
    }

    void onMiniPlayerPresenceChanged(boolean visible) {
        if (lastKnownMiniVisible == visible) {
            return;
        }
        lastKnownMiniVisible = visible;
        if (!hasInitializedSprings) {
            return;
        }
        dockNudgeVel += (visible ? 22f : -18f) * density;
        startAnimationLoop();
    }

    void onMiniPlayerPullUp(float pullFraction) {
        float clamped = Math.max(0f, Math.min(1f, pullFraction));
        float target = clamped * 4.5f * density;
        setTranslationY(clamped * 20f * density);
        float scale = 1f - 0.038f * clamped;
        setScaleX(scale);
        setScaleY(scale);
        setAlpha(1f - 0.65f * Math.min(1f, clamped * 1.6f));
        if (Math.abs(target - pullUpOffsetY) > 0.1f) {
            pullUpOffsetY = target;
            invalidate();
        }
    }

    private void triggerTabImpulse(int prevLeftIdx, String newTab) {
        poppingTab = newTab;
        popProgress = 0f;

        int newLeftIdx = findLeftTabIndex(newTab);
        if (prevLeftIdx >= 0 && newLeftIdx >= 0 && prevLeftIdx != newLeftIdx) {
            float dir = newLeftIdx > prevLeftIdx ? 1f : -1f;
            capsuleMomentumVel += dir * 18f * density;
        }
        if (TAB_FEED.equals(newTab)) {
            exploreSpinTargetDeg += 180f;
        } else if (TAB_SEARCH.equals(newTab)) {
            searchTiltVel = -200f;
        }
    }

    private String getActiveVisualTab() {
        return (scrubbingCapsule && scrubPreviewTab != null) ? scrubPreviewTab : selectedTab;
    }

    private int findLeftTabIndex(String tab) {
        for (int i = 0; i < leftTabs.size(); i++) {
            if (leftTabs.get(i).tabType.equals(tab)) {
                return i;
            }
        }
        return -1;
    }

    private void computeNormalizedTargetPillBounds(String tab) {
        int count = leftTabs.size();
        int activeIdx = findLeftTabIndex(tab);
        if (activeIdx < 0) {
            return;
        }
        float totalWeight = count + EXTRA_ACTIVE_WEIGHT;
        float cursor = 0f;
        for (int i = 0; i < count; i++) {
            float w = 1f + (i == activeIdx ? EXTRA_ACTIVE_WEIGHT : 0f);
            float fracW = w / totalWeight;
            if (i == activeIdx) {
                pillTargetLeft = cursor;
                pillTargetRight = cursor + fracW;
                break;
            }
            cursor += fracW;
        }
    }

    private void resetSpringsImmediate() {
        String activeTab = getActiveVisualTab();
        int activeIdx = findLeftTabIndex(activeTab);
        int count = leftTabs.size();
        for (int i = 0; i < count; i++) {
            slotFrac[i] = (i == activeIdx) ? 1f : 0f;
            slotVel[i] = 0f;
            slotPressScale[i] = 1f;
            slotPressVel[i] = 0f;
        }
        computeNormalizedTargetPillBounds(activeTab);
        pillLeftPos = pillTargetLeft;
        pillRightPos = pillTargetRight;
        pillLeftVel = 0f;
        pillRightVel = 0f;
        leftPillAlpha = (activeIdx >= 0) ? 1f : 0f;
        leftPillAlphaVel = 0f;
        searchActiveFrac = TAB_SEARCH.equals(activeTab) ? 1f : 0f;
        searchActiveVel = 0f;
        searchPressScale = 1f;
        searchPressVel = 0f;
        searchTiltDeg = 0f;
        searchTiltVel = 0f;
        capsuleMomentumX = 0f;
        capsuleMomentumVel = 0f;
        dockNudgeY = 0f;
        dockNudgeVel = 0f;
        exploreSpinDeg = 0f;
        exploreSpinTargetDeg = 0f;
        exploreSpinVel = 0f;
        libraryLift = TAB_COLLECTION.equals(activeTab) ? 1f : 0f;
        libraryLiftVel = 0f;
        popProgress = 1f;
    }

    private void startAnimationLoop() {
        if (!isAnimating) {
            isAnimating = true;
            lastFrameTimeMs = SystemClock.uptimeMillis();
            postOnAnimation(frameTick);
        }
    }

    private void stepAnimations() {
        if (!isAnimating) {
            return;
        }
        long now = SystemClock.uptimeMillis();
        float dt = Math.min(0.032f, Math.max(0.004f, (now - lastFrameTimeMs) / 1000f));
        lastFrameTimeMs = now;

        String visualTab = getActiveVisualTab();
        int activeIdx = findLeftTabIndex(visualTab);
        boolean settled = true;

        // 1. Slot width & damped press scale springs
        int count = leftTabs.size();
        for (int i = 0; i < count; i++) {
            float target = (i == activeIdx) ? 1f : 0f;
            float[] res = stepSpring(slotFrac[i], slotVel[i], target, 360f, 0.78f, dt);
            slotFrac[i] = Math.max(-0.04f, Math.min(1.12f, res[0]));
            slotVel[i] = res[1];
            if (!isSettled(slotFrac[i], slotVel[i], target)) {
                settled = false;
            } else {
                slotFrac[i] = target;
                slotVel[i] = 0f;
            }

            float targetPress = leftTabs.get(i).tabType.equals(pressedTab) ? 0.91f : 1f;
            float[] pRes = stepSpring(slotPressScale[i], slotPressVel[i], targetPress, 680f, 0.68f, dt);
            slotPressScale[i] = Math.max(0.84f, Math.min(1.06f, pRes[0]));
            slotPressVel[i] = pRes[1];
            if (!isSettled(slotPressScale[i], slotPressVel[i], targetPress)) {
                settled = false;
            } else {
                slotPressScale[i] = targetPress;
                slotPressVel[i] = 0f;
            }
        }

        // 2. Liquid pill leading/trailing asymmetric edge springs
        float leftStiffness = 380f;
        float rightStiffness = 380f;
        if (pillTargetRight > pillRightPos + 0.01f) {
            rightStiffness = 560f;
            leftStiffness = 260f;
        } else if (pillTargetLeft < pillLeftPos - 0.01f) {
            leftStiffness = 560f;
            rightStiffness = 260f;
        }
        float[] leftEdge = stepSpring(pillLeftPos, pillLeftVel, pillTargetLeft, leftStiffness, 0.72f, dt);
        float[] rightEdge = stepSpring(pillRightPos, pillRightVel, pillTargetRight, rightStiffness, 0.72f, dt);
        pillLeftPos = clamp01WithOvershoot(leftEdge[0]);
        pillLeftVel = leftEdge[1];
        pillRightPos = clamp01WithOvershoot(rightEdge[0]);
        pillRightVel = rightEdge[1];
        if (!isSettled(pillLeftPos, pillLeftVel, pillTargetLeft)
                || !isSettled(pillRightPos, pillRightVel, pillTargetRight)) {
            settled = false;
        } else {
            pillLeftPos = pillTargetLeft;
            pillRightPos = pillTargetRight;
            pillLeftVel = 0f;
            pillRightVel = 0f;
        }

        // 3. Left capsule inner pill visibility
        float targetLeftAlpha = (activeIdx >= 0) ? 1f : 0f;
        float[] alphaRes = stepSpring(leftPillAlpha, leftPillAlphaVel, targetLeftAlpha, 440f, 0.90f, dt);
        leftPillAlpha = Math.max(0f, Math.min(1f, alphaRes[0]));
        leftPillAlphaVel = alphaRes[1];
        if (!isSettled(leftPillAlpha, leftPillAlphaVel, targetLeftAlpha)) {
            settled = false;
        } else {
            leftPillAlpha = targetLeftAlpha;
            leftPillAlphaVel = 0f;
        }

        // 4. Detached Search button springs (active fraction, press scale, tilt)
        float targetSearch = TAB_SEARCH.equals(visualTab) ? 1f : 0f;
        float[] searchRes = stepSpring(searchActiveFrac, searchActiveVel, targetSearch, 420f, 0.72f, dt);
        searchActiveFrac = Math.max(0f, Math.min(1.12f, searchRes[0]));
        searchActiveVel = searchRes[1];
        if (!isSettled(searchActiveFrac, searchActiveVel, targetSearch)) {
            settled = false;
        } else {
            searchActiveFrac = targetSearch;
            searchActiveVel = 0f;
        }

        float targetSearchPress = TAB_SEARCH.equals(pressedTab) ? 0.90f : 1f;
        float[] spRes = stepSpring(searchPressScale, searchPressVel, targetSearchPress, 680f, 0.66f, dt);
        searchPressScale = Math.max(0.84f, Math.min(1.06f, spRes[0]));
        searchPressVel = spRes[1];
        if (!isSettled(searchPressScale, searchPressVel, targetSearchPress)) {
            settled = false;
        } else {
            searchPressScale = targetSearchPress;
            searchPressVel = 0f;
        }

        if (Math.abs(searchTiltDeg) > 0.05f || Math.abs(searchTiltVel) > 0.5f) {
            float[] stRes = stepSpring(searchTiltDeg, searchTiltVel, 0f, 320f, 0.64f, dt);
            searchTiltDeg = Math.max(-24f, Math.min(16f, stRes[0]));
            searchTiltVel = stRes[1];
            if (Math.abs(searchTiltDeg) < 0.05f && Math.abs(searchTiltVel) < 0.5f) {
                searchTiltDeg = 0f;
                searchTiltVel = 0f;
            } else {
                settled = false;
            }
        }

        // 5. Spatial capsule momentum & coupled dock vertical nudge
        if (Math.abs(capsuleMomentumX) > 0.05f || Math.abs(capsuleMomentumVel) > 0.5f) {
            float[] cmRes = stepSpring(capsuleMomentumX, capsuleMomentumVel, 0f, 320f, 0.68f, dt);
            capsuleMomentumX = Math.max(-3.5f * density, Math.min(3.5f * density, cmRes[0]));
            capsuleMomentumVel = cmRes[1];
            if (Math.abs(capsuleMomentumX) < 0.05f && Math.abs(capsuleMomentumVel) < 0.5f) {
                capsuleMomentumX = 0f;
                capsuleMomentumVel = 0f;
            } else {
                settled = false;
            }
        }

        if (Math.abs(dockNudgeY) > 0.05f || Math.abs(dockNudgeVel) > 0.5f) {
            float[] dnRes = stepSpring(dockNudgeY, dockNudgeVel, 0f, 340f, 0.66f, dt);
            dockNudgeY = Math.max(-2.6f * density, Math.min(2.6f * density, dnRes[0]));
            dockNudgeVel = dnRes[1];
            if (Math.abs(dockNudgeY) < 0.05f && Math.abs(dockNudgeVel) < 0.5f) {
                dockNudgeY = 0f;
                dockNudgeVel = 0f;
            } else {
                settled = false;
            }
        }

        // 6. Explore vinyl spin & Library card lift springs
        if (Math.abs(exploreSpinDeg - exploreSpinTargetDeg) > 0.1f || Math.abs(exploreSpinVel) > 0.5f) {
            float[] esRes = stepSpring(exploreSpinDeg, exploreSpinVel, exploreSpinTargetDeg, 280f, 0.68f, dt);
            exploreSpinDeg = esRes[0];
            exploreSpinVel = esRes[1];
            if (Math.abs(exploreSpinDeg - exploreSpinTargetDeg) < 0.1f && Math.abs(exploreSpinVel) < 0.5f) {
                exploreSpinDeg = exploreSpinTargetDeg % 360f;
                exploreSpinTargetDeg = exploreSpinDeg;
                exploreSpinVel = 0f;
            } else {
                settled = false;
            }
        }

        float targetLibraryLift = TAB_COLLECTION.equals(visualTab) ? 1f : 0f;
        float[] libRes = stepSpring(libraryLift, libraryLiftVel, targetLibraryLift, 380f, 0.66f, dt);
        libraryLift = Math.max(-0.08f, Math.min(1.16f, libRes[0]));
        libraryLiftVel = libRes[1];
        if (!isSettled(libraryLift, libraryLiftVel, targetLibraryLift)) {
            settled = false;
        } else {
            libraryLift = targetLibraryLift;
            libraryLiftVel = 0f;
        }

        // 7. Icon pop progress
        if (popProgress < 1f) {
            popProgress = Math.min(1f, popProgress + dt / 0.28f);
            settled = false;
        }

        invalidate();

        if (!settled) {
            postOnAnimation(frameTick);
        } else {
            isAnimating = false;
        }
    }

    private static float[] stepSpring(
            float pos,
            float vel,
            float target,
            float stiffness,
            float dampingRatio,
            float dt
    ) {
        float damping = 2f * dampingRatio * (float) Math.sqrt(stiffness);
        float force = -stiffness * (pos - target) - damping * vel;
        vel += force * dt;
        pos += vel * dt;
        return new float[]{pos, vel};
    }

    private static boolean isSettled(float pos, float vel, float target) {
        return Math.abs(pos - target) < 0.001f && Math.abs(vel) < 0.005f;
    }

    private static float clamp01WithOvershoot(float v) {
        return Math.max(-0.02f, Math.min(1.02f, v));
    }

    @Override
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        removeCallbacks(frameTick);
        isAnimating = false;
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int desiredWidth = MeasureSpec.getMode(widthMeasureSpec) == MeasureSpec.UNSPECIFIED
                ? Math.round(360f * density)
                : MeasureSpec.getSize(widthMeasureSpec);
        int desiredHeight = Math.round(TOTAL_HEIGHT_DP * density);
        setMeasuredDimension(desiredWidth, desiredHeight);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int w = getWidth();
        int h = getHeight();
        if (w <= 0 || h <= 0) {
            return;
        }

        float horizPad = HORIZ_PAD_DP * density;
        float top = TOP_PAD_DP * density + dockNudgeY + pullUpOffsetY;
        float capH = CAPSULE_HEIGHT_DP * density;
        float bottom = top + capH;
        float gap = SEARCH_GAP_DP * density;
        float usableBarW = Math.max(capH, w - 2f * horizPad);
        float searchDia = Math.min(capH, usableBarW * 0.20f);
        float leftCapsuleRight = Math.max(horizPad + capH, w - horizPad - searchDia - gap);

        capsuleRect.set(
                horizPad + capsuleMomentumX,
                top,
                leftCapsuleRight + capsuleMomentumX,
                bottom);
        searchRect.set(
                w - horizPad - searchDia + capsuleMomentumX * 0.18f,
                top,
                w - horizPad + capsuleMomentumX * 0.18f,
                bottom);

        int capsuleColor = MaterialYouColorEngine.getNavbarCapsuleColor();
        int borderColor = MaterialYouColorEngine.getNavbarCapsuleBorderColor();
        int activePillColor = MaterialYouColorEngine.getNavbarActivePillColor();
        int activeContentColor = MaterialYouColorEngine.getNavbarActiveContentColor();
        int inactiveContentColor = MaterialYouColorEngine.getNavbarInactiveContentColor();
        int shadowBase = MaterialYouColorEngine.getNavbarShadowColor();
        boolean frostedNav = ExpressiveDockGlass.isFrostedDockEnabled();

        // 1. Left Main Pill Capsule (shared ExpressiveDockGlass lighting & directional specular rim)
        ExpressiveDockGlass.drawGlassPill(
                canvas,
                capsuleRect,
                capH * 0.5f,
                density,
                capsuleColor,
                borderColor,
                shadowBase,
                frostedNav,
                0,
                0f,
                capsuleGlass);

        // 2. Liquid Inner Active Pill with velocity squash-and-stretch + delicate specular top rim
        float inset = INNER_PILL_INSET_DP * density;
        float usableLeft = capsuleRect.left + inset;
        float usableWidth = Math.max(1f, capsuleRect.width() - inset * 2f);
        if (leftPillAlpha > 0.01f) {
            float pLeft = usableLeft + Math.max(0f, pillLeftPos) * usableWidth;
            float pRight = usableLeft + Math.min(1f, pillRightPos) * usableWidth;
            float innerH = capH - inset * 2f;
            if (pRight - pLeft < innerH) {
                float mid = (pLeft + pRight) * 0.5f;
                pLeft = Math.max(usableLeft, mid - innerH * 0.5f);
                pRight = Math.min(usableLeft + usableWidth, pLeft + innerH);
            }
            float edgeSpeed = Math.abs(pillLeftVel) + Math.abs(pillRightVel);
            float squashPx = Math.min(3.4f * density, edgeSpeed * 0.42f * density);
            innerPillRect.set(
                    pLeft,
                    top + inset + squashPx * 0.5f,
                    pRight,
                    bottom - inset - squashPx * 0.5f);
            float innerRadius = Math.max(1f, innerPillRect.height() * 0.5f);
            int alphaByte = Math.round(255f * Math.max(0f, Math.min(1f, leftPillAlpha)));

            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(MaterialYouColorEngine.withAlpha(activePillColor, alphaByte));
            canvas.drawRoundRect(innerPillRect, innerRadius, innerRadius, fillPaint);

            if (frostedNav) {
                float rimHalf = 0.42f * density;
                tempRect.set(innerPillRect);
                tempRect.inset(rimHalf, rimHalf);
                strokePaint.setStrokeWidth(0.85f * density);
                int sheenAlpha = MaterialYouColorEngine.isLightMode() ? 0x38 : 0x28;
                strokePaint.setColor(MaterialYouColorEngine.withAlpha(
                        0xFFFFFFFF, Math.round(sheenAlpha * Math.max(0f, Math.min(1f, leftPillAlpha)))));
                canvas.drawRoundRect(
                        tempRect,
                        Math.max(1f, innerRadius - rimHalf),
                        Math.max(1f, innerRadius - rimHalf),
                        strokePaint);
            }
        }

        // 3. Compute current slot frames and draw each tab inside the left capsule
        int count = leftTabs.size();
        float totalW = 0f;
        for (int i = 0; i < count; i++) {
            totalW += 1f + EXTRA_ACTIVE_WEIGHT * Math.max(0f, slotFrac[i]);
        }
        float cursorX = usableLeft;
        float centerY = capsuleRect.centerY();

        for (int i = 0; i < count; i++) {
            TabItem item = leftTabs.get(i);
            float weight = 1f + EXTRA_ACTIVE_WEIGHT * Math.max(0f, slotFrac[i]);
            float slotW = usableWidth * (weight / Math.max(0.01f, totalW));
            slotLeftX[i] = cursorX;
            slotRightX[i] = cursorX + slotW;
            cursorX += slotW;

            float f = Math.max(0f, Math.min(1f, slotFrac[i]));
            float pressScale = slotPressScale[i];
            float popBump = item.tabType.equals(poppingTab) && popProgress < 1f
                    ? 1f + 0.14f * (float) Math.sin(Math.PI * Math.min(1f, popProgress * 1.25f))
                    : 1f;
            float contentColorF = Math.min(1f, f * Math.max(0f, leftPillAlpha));
            int contentColor = MaterialYouColorEngine.blendRgb(
                    inactiveContentColor, activeContentColor, contentColorF);

            drawCapsuleTabContent(
                    canvas,
                    item,
                    slotLeftX[i],
                    slotRightX[i],
                    centerY,
                    f,
                    pressScale,
                    popBump,
                    contentColor,
                    activePillColor
            );
        }

        // 4. Detached Circular Search Button
        float sf = Math.max(0f, Math.min(1f, searchActiveFrac));
        float searchPop = TAB_SEARCH.equals(poppingTab) && popProgress < 1f
                ? 1f + 0.10f * (float) Math.sin(Math.PI * popProgress)
                : 1f;
        float searchScale = (1f + 0.03f * sf) * searchPressScale * searchPop;

        canvas.save();
        canvas.scale(searchScale, searchScale, searchRect.centerX(), searchRect.centerY());

        int searchRgb = MaterialYouColorEngine.blendRgb(capsuleColor, activePillColor, sf);
        int searchFill = frostedNav
                ? MaterialYouColorEngine.withAlpha(searchRgb, Math.round(0xCC + sf * (0xEC - 0xCC)))
                : searchRgb;
        int searchBorder = MaterialYouColorEngine.withAlpha(
                borderColor, Math.round((1f - 0.55f * sf) * ((borderColor >>> 24) & 0xFF)));
        ExpressiveDockGlass.drawGlassPill(
                canvas,
                searchRect,
                searchRect.height() * 0.5f,
                density,
                searchFill,
                searchBorder,
                shadowBase,
                frostedNav && sf < 0.7f,
                sf > 0.15f ? activePillColor : 0,
                sf * 0.45f,
                searchGlass);

        int searchIconColor = MaterialYouColorEngine.blendRgb(
                inactiveContentColor, activeContentColor, sf);
        canvas.save();
        canvas.rotate(searchTiltDeg, searchRect.centerX(), searchRect.centerY());
        drawSearchIcon(canvas, searchRect.centerX(), searchRect.centerY(), 10.5f * density, searchIconColor);
        canvas.restore();

        canvas.restore();
    }

    private void drawCapsuleTabContent(
            Canvas canvas,
            TabItem item,
            float left,
            float right,
            float centerY,
            float f,
            float pressScale,
            float popBump,
            int contentColor,
            int accentDotColor
    ) {
        float slotCenter = (left + right) * 0.5f;
        float slotWidth = right - left;
        float iconRadius = 10.5f * density;
        float gapBetweenIconAndText = 7f * density;

        textPaint.setTextSize(leftTabs.size() > 3 ? 13.5f * density : 15f * density);
        float textW = textPaint.measureText(item.label);
        float maxTextW = Math.max(0f, slotWidth - iconRadius * 2f - gapBetweenIconAndText - 18f * density);
        if (textW > maxTextW && textW > 1f) {
            float shrink = Math.max(0.82f, maxTextW / textW);
            textPaint.setTextSize(textPaint.getTextSize() * shrink);
            textW = textPaint.measureText(item.label);
        }

        float labelReveal = Math.max(0f, Math.min(1f, (f - 0.22f) / 0.78f));
        float groupWidth = iconRadius * 2f + labelReveal * (gapBetweenIconAndText + textW);
        float groupLeft = slotCenter - groupWidth * 0.5f;
        float iconCenterX = groupLeft + iconRadius;

        canvas.save();
        canvas.scale(pressScale, pressScale, slotCenter, centerY);

        canvas.save();
        canvas.scale(popBump, popBump, iconCenterX, centerY);
        switch (item.tabType) {
            case TAB_HOME:
                drawHomeIcon(canvas, iconCenterX, centerY, iconRadius, contentColor, f);
                break;
            case TAB_FEED:
                drawFeedDiscIcon(
                        canvas, iconCenterX, centerY, iconRadius, contentColor, f > 0.45f, accentDotColor);
                break;
            case TAB_UPLOADS:
                drawUploadsIcon(canvas, iconCenterX, centerY, iconRadius, contentColor);
                break;
            case TAB_COLLECTION:
                drawLibraryIcon(canvas, iconCenterX, centerY, iconRadius, contentColor);
                break;
            default:
                break;
        }
        canvas.restore();

        if (labelReveal > 0.04f) {
            textPaint.setColor(MaterialYouColorEngine.withAlpha(
                    contentColor, Math.round(255f * labelReveal)));
            Paint.FontMetrics fm = textPaint.getFontMetrics();
            float textBaseline = centerY - (fm.ascent + fm.descent) * 0.5f;
            float textX = iconCenterX + iconRadius + gapBetweenIconAndText - (1f - labelReveal) * 4f * density;
            canvas.drawText(item.label, textX, textBaseline, textPaint);
        }

        canvas.restore();
    }

    private void drawHomeIcon(Canvas canvas, float cx, float cy, float r, int color, float activeFrac) {
        float halfW = r * 0.86f;
        float topY = cy - r * 0.88f;
        float eaveY = cy - r * 0.14f;
        float botY = cy + r * 0.86f;
        float doorW = r * 0.30f;
        float doorTop = cy + r * 0.16f;

        float fillAlpha = Math.max(0f, Math.min(1f, (activeFrac - 0.18f) / 0.62f));
        float outlineAlpha = 1f - fillAlpha * 0.88f;

        if (outlineAlpha > 0.02f) {
            iconPath.reset();
            iconPath.moveTo(cx, topY + 0.5f * density);
            iconPath.lineTo(cx + halfW * 0.92f, eaveY);
            iconPath.lineTo(cx + halfW * 0.92f, botY);
            iconPath.lineTo(cx + doorW, botY);
            iconPath.lineTo(cx + doorW, doorTop);
            iconPath.lineTo(cx - doorW, doorTop);
            iconPath.lineTo(cx - doorW, botY);
            iconPath.lineTo(cx - halfW * 0.92f, botY);
            iconPath.lineTo(cx - halfW * 0.92f, eaveY);
            iconPath.close();

            strokePaint.setColor(MaterialYouColorEngine.withAlpha(color, Math.round(255f * outlineAlpha)));
            strokePaint.setStrokeWidth(2.0f * density);
            canvas.drawPath(iconPath, strokePaint);
        }

        if (fillAlpha > 0.02f) {
            iconPath.reset();
            iconPath.moveTo(cx, topY);
            iconPath.lineTo(cx + halfW, eaveY);
            iconPath.lineTo(cx + halfW, botY - 1.5f * density);
            iconPath.quadTo(cx + halfW, botY, cx + halfW - 1.5f * density, botY);
            iconPath.lineTo(cx + doorW, botY);
            iconPath.lineTo(cx + doorW, doorTop + 1.5f * density);
            iconPath.quadTo(cx + doorW, doorTop, cx, doorTop);
            iconPath.quadTo(cx - doorW, doorTop, cx - doorW, doorTop + 1.5f * density);
            iconPath.lineTo(cx - doorW, botY);
            iconPath.lineTo(cx - halfW + 1.5f * density, botY);
            iconPath.quadTo(cx - halfW, botY, cx - halfW, botY - 1.5f * density);
            iconPath.lineTo(cx - halfW, eaveY);
            iconPath.close();

            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(MaterialYouColorEngine.withAlpha(color, Math.round(255f * fillAlpha)));
            canvas.drawPath(iconPath, fillPaint);
        }
    }

    private void drawFeedDiscIcon(
            Canvas canvas,
            float cx,
            float cy,
            float r,
            int color,
            boolean active,
            int badgeAccent
    ) {
        float outerR = r * 0.80f;

        canvas.save();
        canvas.rotate(exploreSpinDeg, cx, cy);

        strokePaint.setColor(color);
        strokePaint.setStrokeWidth((active ? 2.4f : 2.1f) * density);
        canvas.drawCircle(cx, cy, outerR, strokePaint);

        // Two subtle opposite vinyl highlight groove arcs visible during spin
        float grooveR = r * 0.54f;
        tempRect.set(cx - grooveR, cy - grooveR, cx + grooveR, cy + grooveR);
        strokePaint.setColor(MaterialYouColorEngine.withAlpha(color, active ? 0xA8 : 0x70));
        strokePaint.setStrokeWidth(1.35f * density);
        canvas.drawArc(tempRect, -45f, 44f, false, strokePaint);
        canvas.drawArc(tempRect, 135f, 44f, false, strokePaint);

        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(color);
        canvas.drawCircle(cx, cy, r * (active ? 0.30f : 0.25f), fillPaint);

        canvas.restore();

        if (showFeedBadge) {
            badgePaint.setStyle(Paint.Style.FILL);
            badgePaint.setColor(badgeAccent);
            canvas.drawCircle(cx + r * 0.72f, cy - r * 0.72f, 3.0f * density, badgePaint);
        }
    }

    private void drawLibraryIcon(Canvas canvas, float cx, float cy, float r, int color) {
        float sw = 1.95f * density;
        float boxLeft = cx - r * 0.44f;
        float boxTop = cy - r * 0.82f;
        float boxRight = cx + r * 0.84f;
        float boxBottom = cy + r * 0.46f;
        float boxRadius = 2.4f * density;

        // Back L-shelf anchored stationary
        float shelfOffset = r * 0.34f;
        auxPath.reset();
        auxPath.moveTo(boxLeft - shelfOffset, boxTop + shelfOffset);
        auxPath.lineTo(boxLeft - shelfOffset, boxBottom + shelfOffset - boxRadius * 0.4f);
        auxPath.quadTo(boxLeft - shelfOffset, boxBottom + shelfOffset,
                boxLeft - shelfOffset + boxRadius * 0.4f, boxBottom + shelfOffset);
        auxPath.lineTo(boxRight - shelfOffset, boxBottom + shelfOffset);
        strokePaint.setColor(color);
        strokePaint.setStrokeWidth(sw);
        canvas.drawPath(auxPath, strokePaint);

        // Front rounded square + music note lift subtly up-right when Library is active
        float liftPx = 1.35f * density * Math.max(0f, libraryLift);
        tempRect.set(boxLeft + liftPx, boxTop - liftPx, boxRight + liftPx, boxBottom - liftPx);
        strokePaint.setStrokeWidth(sw);
        canvas.drawRoundRect(tempRect, boxRadius, boxRadius, strokePaint);

        float nx = tempRect.centerX();
        float ny = tempRect.centerY();
        float noteR = r * 0.19f;
        fillPaint.setStyle(Paint.Style.FILL);
        fillPaint.setColor(color);
        canvas.drawCircle(nx - noteR * 0.4f, ny + noteR * 1.15f, noteR, fillPaint);

        float stemX = nx + noteR * 0.45f;
        iconPath.reset();
        iconPath.moveTo(stemX, ny + noteR * 1.15f);
        iconPath.lineTo(stemX, ny - noteR * 1.65f);
        iconPath.lineTo(stemX + noteR * 1.4f, ny - noteR * 1.05f);
        strokePaint.setStrokeWidth(1.8f * density);
        canvas.drawPath(iconPath, strokePaint);
    }

    private void drawUploadsIcon(Canvas canvas, float cx, float cy, float r, int color) {
        strokePaint.setColor(color);
        strokePaint.setStrokeWidth(2.0f * density);
        iconPath.reset();
        iconPath.moveTo(cx, cy + r * 0.28f);
        iconPath.lineTo(cx, cy - r * 0.65f);
        iconPath.moveTo(cx - r * 0.38f, cy - r * 0.25f);
        iconPath.lineTo(cx, cy - r * 0.68f);
        iconPath.lineTo(cx + r * 0.38f, cy - r * 0.25f);
        iconPath.moveTo(cx - r * 0.68f, cy + r * 0.25f);
        iconPath.lineTo(cx - r * 0.68f, cy + r * 0.68f);
        iconPath.lineTo(cx + r * 0.68f, cy + r * 0.68f);
        iconPath.lineTo(cx + r * 0.68f, cy + r * 0.25f);
        canvas.drawPath(iconPath, strokePaint);
    }

    private void drawSearchIcon(Canvas canvas, float cx, float cy, float r, int color) {
        float lensCx = cx - r * 0.14f;
        float lensCy = cy - r * 0.14f;
        float lensR = r * 0.56f;
        strokePaint.setColor(color);
        strokePaint.setStrokeWidth(2.25f * density);
        canvas.drawCircle(lensCx, lensCy, lensR, strokePaint);

        float startD = lensR * 0.72f;
        float endD = lensR + r * 0.44f;
        canvas.drawLine(lensCx + startD, lensCy + startD, lensCx + endD, lensCy + endD, strokePaint);
    }

    private String hitTestLeftSlot(float x) {
        for (int i = 0; i < leftTabs.size(); i++) {
            if (x >= slotLeftX[i] && x <= slotRightX[i]) {
                return leftTabs.get(i).tabType;
            }
        }
        if (!leftTabs.isEmpty()) {
            return x < capsuleRect.centerX() ? leftTabs.get(0).tabType
                    : leftTabs.get(leftTabs.size() - 1).tabType;
        }
        return null;
    }

    private String hitTestTab(float x, float y) {
        if (y < capsuleRect.top - 8f * density || y > capsuleRect.bottom + 8f * density) {
            return null;
        }
        if (x >= searchRect.left - 4f * density) {
            return TAB_SEARCH;
        }
        if (x <= capsuleRect.right + 4f * density) {
            return hitTestLeftSlot(x);
        }
        return null;
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        float x = event.getX();
        float y = event.getY();
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN: {
                String hit = hitTestTab(x, y);
                if (hit != null) {
                    pressedTab = hit;
                    if (!TAB_SEARCH.equals(hit)) {
                        scrubbingCapsule = true;
                        scrubPreviewTab = hit;
                    } else {
                        scrubbingCapsule = false;
                        scrubPreviewTab = null;
                    }
                    startAnimationLoop();
                    return true;
                }
                return false;
            }
            case MotionEvent.ACTION_MOVE: {
                if (scrubbingCapsule) {
                    boolean withinBand = y >= capsuleRect.top - 24f * density
                            && y <= capsuleRect.bottom + 24f * density
                            && x <= capsuleRect.right + 10f * density;
                    String newScrub = withinBand ? hitTestLeftSlot(x) : null;
                    if (!String.valueOf(newScrub).equals(String.valueOf(scrubPreviewTab))) {
                        scrubPreviewTab = newScrub;
                        pressedTab = newScrub;
                        if (newScrub != null) {
                            performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                            poppingTab = newScrub;
                            popProgress = 0f;
                            if (TAB_FEED.equals(newScrub)) {
                                exploreSpinTargetDeg += 180f;
                            }
                        }
                        computeNormalizedTargetPillBounds(getActiveVisualTab());
                        startAnimationLoop();
                    }
                    return true;
                }
                String hit = hitTestTab(x, y);
                if (!String.valueOf(hit).equals(String.valueOf(pressedTab))) {
                    pressedTab = hit;
                    startAnimationLoop();
                }
                return true;
            }
            case MotionEvent.ACTION_UP: {
                String releasedTab;
                if (scrubbingCapsule) {
                    releasedTab = scrubPreviewTab;
                } else {
                    String upHit = hitTestTab(x, y);
                    releasedTab = (upHit != null && upHit.equals(pressedTab)) ? upHit : null;
                }
                scrubbingCapsule = false;
                scrubPreviewTab = null;
                pressedTab = null;

                if (releasedTab != null) {
                    performHapticFeedback(HapticFeedbackConstants.CLOCK_TICK);
                    if (!releasedTab.equals(selectedTab)) {
                        updateState(releasedTab, showUploadTab, showFeedBadge);
                    } else {
                        computeNormalizedTargetPillBounds(selectedTab);
                        startAnimationLoop();
                    }
                    ExpressiveScaffoldBridge.dispatchTabSelected(releasedTab);
                } else {
                    computeNormalizedTargetPillBounds(selectedTab);
                    startAnimationLoop();
                }
                return true;
            }
            case MotionEvent.ACTION_CANCEL: {
                scrubbingCapsule = false;
                scrubPreviewTab = null;
                pressedTab = null;
                computeNormalizedTargetPillBounds(selectedTab);
                startAnimationLoop();
                return true;
            }
            default:
                return super.onTouchEvent(event);
        }
    }
}
