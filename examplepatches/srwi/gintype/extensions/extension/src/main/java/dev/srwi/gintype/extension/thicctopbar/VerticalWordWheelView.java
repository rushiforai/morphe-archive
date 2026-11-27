package dev.srwi.gintype.extension.thicctopbar;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.animation.DecelerateInterpolator;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * A vertical 3-row column view displaying word alternatives:
 * - Top: Previous alternative (smaller, muted)
 * - Middle: Current Word (larger, bold, highlighted with Material pill when active)
 * - Bottom: Next alternative (smaller, muted)
 *
 * Supports discrete vertical flick gestures (one word swap per flick, no endless spinning),
 * and tapping anywhere in the column to select/commit the current word.
 */
public class VerticalWordWheelView extends LinearLayout {

    public interface OnWordCommitListener {
        void onWordCommitted(int index, String word);
    }

    public interface OnWordChangeListener {
        void onWordChanged(int index, String word);
    }

    public interface OnWordActionListener {
        void onWordSwapped(int newIndex, String newWord);
    }

    public interface OnCenterClickListener {
        void onCenterClicked(int index, String word);
    }

    public interface OnLayoutScrollSyncListener {
        void onWheelLaidOut(VerticalWordWheelView wheel, int left, int right);
    }

    private final TextView topView;
    private final TextView centerView;
    private final TextView bottomView;

    private List<String> alternatives = Collections.emptyList();
    private int selectedIndex = 0;
    private boolean isActiveWord = false;
    private boolean widthAnimActive = false;
    private int widthAnimTargetWidth = 0;
    private float widthAnimViewportCenterX = 0f;
    private OnLayoutScrollSyncListener layoutScrollSyncListener;
    private float scaleFactor = GboardThiccTopBarSettings.DEFAULT_TOPBAR_SCALE;
    private boolean invertVerticalSwipe = GboardThiccTopBarSettings.DEFAULT_INVERT_SWIPE;

    /** Set whether vertical flick gestures use the inverted direction instead of wheel-roll default. */
    public void setInvertVerticalSwipe(boolean invert) {
        this.invertVerticalSwipe = invert;
    }

    static int computeSwappedIndex(int currentIndex, int size, boolean flickUp, boolean invert) {
        if (size <= 0) {
            return 0;
        }
        int delta = (flickUp ^ invert) ? 1 : -1;
        return (currentIndex + delta + size) % size;
    }

    /** Update the top bar scale factor and refresh fonts and spacing if changed. */
    public void setScaleFactor(float scale) {
        float sanitized = GboardThiccTopBarSettings.sanitizeTopbarScale(scale);
        if (Math.abs(this.scaleFactor - sanitized) < 0.001f) {
            return;
        }
        this.scaleFactor = sanitized;
        applyScaledPadding();
        updateColors();
        requestLayout();
    }

    private void applyScaledPadding() {
        int padH = dpToPx(3f * scaleFactor);
        setPadding(padH, 0, padH, 0);
    }

    private int dpToPx(float dp) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, dp, getResources().getDisplayMetrics());
    }

    private static final long SWAP_ANIM_DURATION_MS = 140L;

    private float downX = 0f;
    private float downY = 0f;
    private float touchSlop = 12f;
    private boolean hasFlicked = false;
    private boolean isFlickGesture = false;
    private ValueAnimator activeSwapAnimator;

    private OnWordCommitListener commitListener;
    private OnWordChangeListener changeListener;
    private OnWordActionListener wordActionListener;
    private OnCenterClickListener centerClickListener;

    public VerticalWordWheelView(Context context) {
        super(context);
        setOrientation(LinearLayout.VERTICAL);
        setGravity(Gravity.CENTER);
        setClickable(true);
        setFocusable(true);
        setClipChildren(false);
        setClipToPadding(false);

        applyScaledPadding();

        touchSlop = TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, 12f, getResources().getDisplayMetrics());

        setWeightSum(3.15f);

        topView = createWordView(context, 10.2f, 0.88f, false);
        centerView = createWordView(context, 12.5f, 1.0f, true);
        bottomView = createWordView(context, 10.2f, 0.88f, false);

        LinearLayout.LayoutParams topLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, 0, 1.0f);
        topLp.gravity = Gravity.CENTER_HORIZONTAL;

        LinearLayout.LayoutParams centerLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, 0, 1.15f);
        centerLp.gravity = Gravity.CENTER_HORIZONTAL;

        LinearLayout.LayoutParams bottomLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, 0, 1.0f);
        bottomLp.gravity = Gravity.CENTER_HORIZONTAL;

        addView(topView, topLp);
        addView(centerView, centerLp);
        addView(bottomView, bottomLp);

        updateColors();
        updateDisplay();
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        updateColors();
        post(this::updateColors);
    }

    public void setIsActiveWord(boolean active) {
        if (this.isActiveWord != active) {
            this.isActiveWord = active;
            updateColors();
            updateDisplay();
        }
    }

    public boolean isActiveWord() {
        return isActiveWord;
    }

    public void setOnWordCommitListener(OnWordCommitListener listener) {
        this.commitListener = listener;
    }

    public void setOnWordChangeListener(OnWordChangeListener listener) {
        this.changeListener = listener;
    }

    public void setOnWordActionListener(OnWordActionListener listener) {
        this.wordActionListener = listener;
    }

    public void setOnCenterClickListener(OnCenterClickListener listener) {
        this.centerClickListener = listener;
    }

    public void setOnLayoutScrollSyncListener(OnLayoutScrollSyncListener listener) {
        this.layoutScrollSyncListener = listener;
    }

    public void setAlternatives(List<String> words) {
        setAlternatives(words, 0);
    }

    public void setAlternatives(List<String> words, int preferredSelected) {
        setAlternatives(words, preferredSelected, false);
    }

    public void setAlternatives(List<String> words, int preferredSelected, boolean animateWidth) {
        if (words == null || words.isEmpty()) {
            cancelSwapAnimation();
            this.alternatives = Collections.emptyList();
            this.selectedIndex = 0;
            setVisibility(View.GONE);
            return;
        }

        int resolvedSelected = (preferredSelected >= 0 && preferredSelected < words.size()) ? preferredSelected : 0;
        if (resolvedSelected == this.selectedIndex && this.alternatives.equals(words) && getVisibility() == View.VISIBLE) {
            return;
        }

        int oldWidth = 0;
        if (animateWidth && getVisibility() == View.VISIBLE) {
            ViewGroup.LayoutParams currentLp = getLayoutParams();
            if (widthAnimActive && currentLp != null && currentLp.width > 0) {
                oldWidth = currentLp.width;
            } else {
                oldWidth = getWidth();
            }
        }
        int measureHeight = getHeight() > 0 ? getHeight() : getMeasuredHeight();
        float anchorCenterX = 0f;
        if (animateWidth && oldWidth > 0 && layoutScrollSyncListener == null) {
            HorizontalScrollView hsv = findParentScrollView();
            if (hsv != null) {
                anchorCenterX = getLeft() + oldWidth * 0.5f - hsv.getScrollX();
            }
        }
        cancelSwapAnimation();
        this.alternatives = new ArrayList<>(words);
        this.selectedIndex = resolvedSelected;

        setVisibility(View.VISIBLE);
        updateDisplay();

        if (animateWidth && oldWidth > 0 && measureHeight > 0) {
            measure(
                    MeasureSpec.makeMeasureSpec(0, MeasureSpec.UNSPECIFIED),
                    MeasureSpec.makeMeasureSpec(measureHeight, MeasureSpec.EXACTLY));
            int newWidth = getMeasuredWidth();
            if (newWidth > 0 && oldWidth != newWidth) {
                widthAnimViewportCenterX = anchorCenterX;
                animateSwap(false, false, oldWidth, newWidth);
            }
        }
    }

    public boolean isWidthAnimationActive() {
        return widthAnimActive;
    }

    public int getTargetWidth() {
        return (widthAnimActive && widthAnimTargetWidth > 0) ? widthAnimTargetWidth : getWidth();
    }

    public int getCurrentAnimatedWidth() {
        ViewGroup.LayoutParams lp = getLayoutParams();
        if (widthAnimActive && lp != null && lp.width > 0) {
            return lp.width;
        }
        return getWidth();
    }

    public void animateWidthFrom(int oldWidth, int height) {
        if (oldWidth <= 0 || height <= 0 || getLayoutParams() == null) {
            return;
        }
        measure(
                MeasureSpec.makeMeasureSpec(0, MeasureSpec.UNSPECIFIED),
                MeasureSpec.makeMeasureSpec(height, MeasureSpec.EXACTLY));
        int newWidth = getMeasuredWidth();
        if (newWidth > 0 && oldWidth != newWidth) {
            animateSwap(false, false, oldWidth, newWidth);
        }
    }

    public List<String> getAlternatives() {
        return alternatives;
    }

    public int getSelectedIndex() {
        return selectedIndex;
    }

    public String getSelectedWord() {
        if (selectedIndex >= 0 && selectedIndex < alternatives.size()) {
            return alternatives.get(selectedIndex);
        }
        return null;
    }

    private TextView createWordView(Context context, float spSize, float alpha, boolean bold) {
        TextView tv = new TextView(context);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, spSize);
        tv.setAlpha(alpha);
        tv.setSingleLine(true);
        tv.setMaxLines(1);
        tv.setEllipsize(null);
        tv.setIncludeFontPadding(false);
        tv.setGravity(Gravity.CENTER);
        if (bold) {
            tv.setTypeface(Typeface.DEFAULT_BOLD);
        }
        return tv;
    }

    public void updateColors() {
        boolean dark = ThiccTopBarGboardReflector.isKeyboardDark(this);
        int primaryColor = dark ? Color.WHITE : 0xff202124;
        int accentColor = ThiccTopBarGboardReflector.resolveNormalAccentColor(this, getContext(), dark);

        float sideTextSp = 10.2f * scaleFactor;
        float centerTextSp = 12.0f * scaleFactor;
        int pillPadH = dpToPx(6f * scaleFactor);
        int pillPadV = dpToPx(1f * scaleFactor);

        if (isActiveWord) {
            topView.setTextColor(primaryColor);
            topView.setAlpha(0.88f);
            topView.setTextSize(TypedValue.COMPLEX_UNIT_SP, sideTextSp);

            centerView.setTextColor(accentColor);
            centerView.setAlpha(1.0f);
            centerView.setTextSize(TypedValue.COMPLEX_UNIT_SP, centerTextSp);
            centerView.setTypeface(Typeface.DEFAULT_BOLD);

            // Active pill background matching the normal keyboard/trail accent
            boolean lightAccent = ThiccTopBarGboardReflector.perceivedLuminance(accentColor) >= 140f;
            int accentRgb = accentColor & 0x00ffffff;
            int fillColor = ((lightAccent ? 0x2E : 0x1F) << 24) | accentRgb;
            int strokeColor = ((lightAccent ? 0x4D : 0x33) << 24) | accentRgb;
            centerView.setBackground(createPillDrawable(fillColor, strokeColor, 9f * scaleFactor));
            centerView.setPadding(pillPadH, pillPadV, pillPadH, pillPadV);

            bottomView.setTextColor(primaryColor);
            bottomView.setAlpha(0.88f);
            bottomView.setTextSize(TypedValue.COMPLEX_UNIT_SP, sideTextSp);
        } else {
            topView.setTextColor(primaryColor);
            topView.setAlpha(0.85f);
            topView.setTextSize(TypedValue.COMPLEX_UNIT_SP, sideTextSp);

            centerView.setTextColor(primaryColor);
            centerView.setAlpha(1.0f);
            centerView.setTextSize(TypedValue.COMPLEX_UNIT_SP, centerTextSp);
            centerView.setTypeface(Typeface.DEFAULT_BOLD);
            centerView.setBackground(null);
            centerView.setPadding(pillPadH, pillPadV, pillPadH, pillPadV);

            bottomView.setTextColor(primaryColor);
            bottomView.setAlpha(0.85f);
            bottomView.setTextSize(TypedValue.COMPLEX_UNIT_SP, sideTextSp);
        }
    }

    private Drawable createPillDrawable(int fillColor, int strokeColor, float cornerRadiusDp) {
        GradientDrawable gd = new GradientDrawable();
        gd.setShape(GradientDrawable.RECTANGLE);
        gd.setColor(fillColor);
        float radiusPx = TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, cornerRadiusDp, getResources().getDisplayMetrics());
        gd.setCornerRadius(radiusPx);
        if (strokeColor != 0) {
            int strokeWidthPx = (int) TypedValue.applyDimension(
                    TypedValue.COMPLEX_UNIT_DIP, 1f, getResources().getDisplayMetrics());
            gd.setStroke(strokeWidthPx, strokeColor);
        }
        return gd;
    }

    public void updateDisplay() {
        int size = alternatives.size();
        if (size == 0) {
            topView.setText("");
            centerView.setText("");
            bottomView.setText("");
            setContentDescription("");
            return;
        }

        if (size == 1) {
            String word = alternatives.get(0);
            topView.setText("");
            topView.setVisibility(View.INVISIBLE);
            centerView.setText(word);
            centerView.setVisibility(View.VISIBLE);
            bottomView.setText("");
            bottomView.setVisibility(View.INVISIBLE);
            setContentDescription(word);
            return;
        }

        if (size == 2) {
            int other = (selectedIndex == 0) ? 1 : 0;
            String centerWord = alternatives.get(selectedIndex);
            topView.setText(alternatives.get(other));
            topView.setVisibility(View.VISIBLE);
            centerView.setText(centerWord);
            centerView.setVisibility(View.VISIBLE);
            bottomView.setText(alternatives.get(other));
            bottomView.setVisibility(View.VISIBLE);
            setContentDescription(centerWord);
            return;
        }

        // 3 or more alternatives
        int prev = (selectedIndex - 1 + size) % size;
        int next = (selectedIndex + 1) % size;
        String centerWord = alternatives.get(selectedIndex);

        topView.setText(alternatives.get(prev));
        topView.setVisibility(View.VISIBLE);

        centerView.setText(centerWord);
        setContentDescription(centerWord);
        centerView.setVisibility(View.VISIBLE);

        bottomView.setText(alternatives.get(next));
        bottomView.setVisibility(View.VISIBLE);
    }

    private void cancelSwapAnimation() {
        if (activeSwapAnimator != null) {
            activeSwapAnimator.cancel();
            activeSwapAnimator = null;
        }
        restoreWrapContentWidth();
        resetRowTransforms();
    }

    private void restoreWrapContentWidth() {
        widthAnimActive = false;
        widthAnimTargetWidth = 0;
        ViewGroup.LayoutParams lp = getLayoutParams();
        if (lp != null && lp.width != ViewGroup.LayoutParams.WRAP_CONTENT) {
            lp.width = ViewGroup.LayoutParams.WRAP_CONTENT;
            setLayoutParams(lp);
        }
    }

    private HorizontalScrollView findParentScrollView() {
        if (getParent() instanceof ViewGroup parent && parent.getParent() instanceof HorizontalScrollView hsv) {
            return hsv;
        }
        return null;
    }

    @Override
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        super.onLayout(changed, l, t, r, b);
        if (layoutScrollSyncListener != null) {
            layoutScrollSyncListener.onWheelLaidOut(this, l, r);
        } else if (widthAnimActive) {
            HorizontalScrollView hsv = findParentScrollView();
            if (hsv != null && getParent() instanceof ViewGroup contentLayout) {
                int maxScrollX = Math.max(0, contentLayout.getWidth() - hsv.getWidth());
                int targetScrollX = Math.round(l + (r - l) * 0.5f - widthAnimViewportCenterX);
                int minVisibleScrollX = r - hsv.getWidth();
                if (targetScrollX < minVisibleScrollX) {
                    targetScrollX = minVisibleScrollX;
                }
                if (targetScrollX > l) {
                    targetScrollX = l;
                }
                int clampedScrollX = Math.max(0, Math.min(maxScrollX, targetScrollX));
                if (hsv.getScrollX() != clampedScrollX) {
                    hsv.scrollTo(clampedScrollX, hsv.getScrollY());
                }
            }
        }
    }

    private void resetRowTransforms() {
        float sideAlpha = isActiveWord ? 0.88f : 0.85f;
        topView.setTranslationY(0f);
        topView.setAlpha(sideAlpha);
        centerView.setTranslationY(0f);
        centerView.setScaleX(1f);
        centerView.setScaleY(1f);
        centerView.setAlpha(1f);
        bottomView.setTranslationY(0f);
        bottomView.setAlpha(sideAlpha);
    }

    private void animateSwap(boolean flickUp, boolean animateVertical, int oldWidth, int newWidth) {
        cancelSwapAnimation();
        boolean animateWidth = oldWidth > 0 && newWidth > 0 && oldWidth != newWidth && getLayoutParams() != null;
        if (!animateVertical && !animateWidth) {
            return;
        }

        if (animateWidth) {
            ViewGroup.LayoutParams lp = getLayoutParams();
            lp.width = oldWidth;
            setLayoutParams(lp);
            widthAnimActive = true;
            widthAnimTargetWidth = newWidth;
        }

        int rowHeight = centerView.getHeight();
        int maxStepPx = dpToPx(18f * scaleFactor);
        float stepPx = rowHeight > 0 ? Math.min(rowHeight, maxStepPx) : dpToPx(14f * scaleFactor);
        float startY = flickUp ? stepPx : -stepPx;
        float sideAlphaTarget = isActiveWord ? 0.88f : 0.85f;

        ValueAnimator animator = ValueAnimator.ofFloat(0f, 1f);
        animator.setDuration(SWAP_ANIM_DURATION_MS);
        animator.setInterpolator(new DecelerateInterpolator(1.5f));
        animator.addUpdateListener(anim -> {
            float t = (Float) anim.getAnimatedValue();
            if (animateWidth) {
                ViewGroup.LayoutParams lp = getLayoutParams();
                if (lp != null) {
                    int w = Math.round(oldWidth + (newWidth - oldWidth) * t);
                    if (lp.width != w) {
                        lp.width = w;
                        setLayoutParams(lp);
                    }
                }
            }
            if (animateVertical) {
                float y = startY * (1f - t);
                float scale = 0.94f + 0.06f * t;
                float centerAlpha = 0.80f + 0.20f * t;
                float sideAlpha = sideAlphaTarget * (0.60f + 0.40f * t);

                topView.setTranslationY(y);
                topView.setAlpha(sideAlpha);
                centerView.setTranslationY(y);
                centerView.setScaleX(scale);
                centerView.setScaleY(scale);
                centerView.setAlpha(centerAlpha);
                bottomView.setTranslationY(y);
                bottomView.setAlpha(sideAlpha);
            }
        });
        animator.addListener(new AnimatorListenerAdapter() {
            @Override
            public void onAnimationEnd(Animator animation) {
                if (activeSwapAnimator == animation) {
                    activeSwapAnimator = null;
                }
                restoreWrapContentWidth();
                resetRowTransforms();
            }

            @Override
            public void onAnimationCancel(Animator animation) {
                if (activeSwapAnimator == animation) {
                    activeSwapAnimator = null;
                }
                restoreWrapContentWidth();
                resetRowTransforms();
            }
        });
        activeSwapAnimator = animator;
        animator.start();
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (alternatives.isEmpty()) {
            return super.onTouchEvent(event);
        }

        int size = alternatives.size();

        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                downX = event.getX();
                downY = event.getY();
                hasFlicked = false;
                isFlickGesture = false;
                return true;

            case MotionEvent.ACTION_MOVE:
                if (hasFlicked) {
                    // Discrete flick already completed for this stroke - do not rotate continuously!
                    return true;
                }
                float dY = event.getY() - downY;
                float dX = event.getX() - downX;
                if (Math.abs(dY) > touchSlop && Math.abs(dY) > Math.abs(dX) * 1.1f) {
                    // Vertical flick gesture detected
                    ViewParent parent = getParent();
                    if (parent != null) {
                        parent.requestDisallowInterceptTouchEvent(true);
                    }
                    hasFlicked = true;
                    isFlickGesture = true;

                    boolean flickUp = dY < -touchSlop;
                    if (flickUp) {
                        selectedIndex = computeSwappedIndex(selectedIndex, size, true, invertVerticalSwipe);
                    } else if (dY > touchSlop) {
                        selectedIndex = computeSwappedIndex(selectedIndex, size, false, invertVerticalSwipe);
                    }

                    int oldWidth = getWidth();
                    if (layoutScrollSyncListener == null && oldWidth > 0) {
                        HorizontalScrollView hsv = findParentScrollView();
                        if (hsv != null) {
                            widthAnimViewportCenterX = getLeft() + oldWidth * 0.5f - hsv.getScrollX();
                        }
                    }
                    performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
                    updateDisplay();
                    int newWidth = 0;
                    if (oldWidth > 0 && getHeight() > 0) {
                        measure(
                                MeasureSpec.makeMeasureSpec(0, MeasureSpec.UNSPECIFIED),
                                MeasureSpec.makeMeasureSpec(getHeight(), MeasureSpec.EXACTLY));
                        newWidth = getMeasuredWidth();
                    }
                    if (size >= 2) {
                        animateSwap(flickUp ^ invertVerticalSwipe, true, oldWidth, newWidth);
                    }

                    String newWord = getSelectedWord();
                    if (wordActionListener != null && newWord != null) {
                        wordActionListener.onWordSwapped(selectedIndex, newWord);
                    }
                    if (changeListener != null && newWord != null) {
                        changeListener.onWordChanged(selectedIndex, newWord);
                    }
                    return true;
                } else if (Math.abs(dX) > touchSlop && Math.abs(dX) > Math.abs(dY)) {
                    // Horizontal scroll gesture - allow parent HorizontalScrollView to scroll
                    ViewParent parent = getParent();
                    if (parent != null) {
                        parent.requestDisallowInterceptTouchEvent(false);
                    }
                }
                return true;

            case MotionEvent.ACTION_UP: {
                ViewParent parent = getParent();
                if (parent != null) {
                    parent.requestDisallowInterceptTouchEvent(false);
                }
                if (!isFlickGesture) {
                    performClick();
                }
                hasFlicked = false;
                isFlickGesture = false;
                return true;
            }

            case MotionEvent.ACTION_CANCEL: {
                ViewParent parent = getParent();
                if (parent != null) {
                    parent.requestDisallowInterceptTouchEvent(false);
                }
                hasFlicked = false;
                isFlickGesture = false;
                return true;
            }
        }

        return super.onTouchEvent(event);
    }

    @Override
    public boolean performClick() {
        super.performClick();
        String centerWord = getSelectedWord();
        if (centerWord != null) {
            // Tapping anywhere in the column selects/commits without swapping alternatives
            performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);
            if (centerClickListener != null) {
                centerClickListener.onCenterClicked(selectedIndex, centerWord);
            }
            if (commitListener != null) {
                commitListener.onWordCommitted(selectedIndex, centerWord);
            }
            return true;
        }
        return false;
    }
}
