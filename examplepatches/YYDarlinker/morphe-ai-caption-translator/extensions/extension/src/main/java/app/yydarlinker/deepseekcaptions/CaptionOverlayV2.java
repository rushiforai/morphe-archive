package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;

/** Stable Activity-root caption overlay backed by a fixed-width player-relative anchor. */
final class CaptionOverlay {
    interface RenderGuard {
        boolean isValid();
    }

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final String ANCHOR_TAG = "yydarlinker.deepseek.caption.anchor";
    private static final String TEXT_TAG = "yydarlinker.deepseek.caption.overlay";
    private static final String[] PLAYER_IDS = {
            "inset_overlay_view_layout", "player_overlays", "player_overlay", "watch_player"
    };
    private static final long DRAG_LONG_PRESS_MS = 350L;

    private static WeakReference<Activity> activityRef = new WeakReference<>(null);
    private static WeakReference<FrameLayout> hostRef = new WeakReference<>(null);
    private static WeakReference<FrameLayout> playerRef = new WeakReference<>(null);
    private static WeakReference<FrameLayout> anchorRef = new WeakReference<>(null);
    private static WeakReference<TextView> textRef = new WeakReference<>(null);

    private static String pendingText = "";
    private static java.util.function.Supplier<String> overflowSource;
    private static boolean pendingStatus;
    private static boolean suppressed;
    private static boolean guardedExpansion;
    private static boolean geometryPosted;
    private static int lastLeft = -1;
    private static int lastTop = -1;
    private static int lastWidth = -1;
    private static int lastHeight = -1;
    private static int lastMaxWidth = -1;
    private static boolean lastStatus;
    private static long lastSurfaceScan;
    private static long lastGeometryCheck;
    private static boolean wasShorts;
    private static long lastSurfaceDiagnostic;
    private static String lastOverflowText="";
    private static int lastOverflowWidth;

    private static Runnable armDrag;
    private static boolean dragging;
    private static float downRawY;
    private static float dragStartY;

    private static final android.view.ViewTreeObserver.OnPreDrawListener GEOMETRY_DRAW = () -> {
        long now=android.os.SystemClock.uptimeMillis();
        if(now-lastGeometryCheck>=80 && !dragging && !suppressed && !guardedExpansion && !pendingText.isEmpty()){lastGeometryCheck=now;syncGeometry();}
        return true;
    };

    private static final View.OnLayoutChangeListener HOST_LAYOUT =
            (v, l, t, r, b, ol, ot, or, ob) -> {
                if (guardedExpansion) return;
                if (l != ol || t != ot || r != or || b != ob) {
                    resetGeometry();
                    scheduleGeometry();
                }
            };

    private static final View.OnLayoutChangeListener PLAYER_LAYOUT =
            (v, l, t, r, b, ol, ot, or, ob) -> {
                if (guardedExpansion) return;
                if (l != ol || t != ot || r != or || b != ob) scheduleGeometry();
            };

    private CaptionOverlay() {}

    static void setActivity(Activity activity) {
        runMain(() -> {
            Activity old = activityRef.get();
            if (old != activity) detach();
            activityRef = new WeakReference<>(activity);
            CaptionSurface.activity(activity);
            if (!pendingText.isEmpty() && !guardedExpansion) render();
        });
    }

    static void refreshSurface(){runMain(()->{
        long now=android.os.SystemClock.uptimeMillis();if(now-lastSurfaceScan<500)return;lastSurfaceScan=now;
        CaptionSurface.refresh();boolean current=CaptionSurface.isShorts();
        if(current!=wasShorts){wasShorts=current;unbindPlayer();resetGeometry();}
        if(current){suppressed=false;guardedExpansion=false;if(!pendingText.isEmpty())render();}
        else scheduleGeometry();
    });}

    static void showCaption(String text,RenderGuard guard,java.util.function.Supplier<String> source) {
        show(text,false,guard,source);
    }
    static void showCaption(String text) { show(text, false, null); }
    static void showStatus(String text) { show(text, true, null); }
    static void showCaption(String text, RenderGuard guard) { show(text, false, guard); }
    static void showStatus(String text, RenderGuard guard) { show(text, true, guard); }

    /** Normal player-shape changes are event-driven; no multi-frame geometry polling is used. */
    static void setPlayerType(String rawType) {
        String type = rawType == null ? "" : rawType.trim();
        MAIN.post(() -> {
            boolean next = !CaptionSurface.isShorts() && compact(type);
            if (next == suppressed) {
                if (!next && !guardedExpansion && !pendingText.isEmpty()) scheduleGeometry();
                return;
            }
            suppressed = next;
            if (next) {
                hideAnchorOnly();
                unbindPlayer();
            } else if (!guardedExpansion && !pendingText.isEmpty()) {
                unbindPlayer();
                render();
            }
        });
    }

    /**
     * Enter the miniplayer transition quarantine. From here until restoreAfterGuardedExpansion(),
     * caption text may change in memory but no extension layout listener or renderer may touch the
     * player transition.
     */
    static void beginGuardedExpansion() {
        runMain(() -> {
            guardedExpansion = true;
            suppressed = true;
            geometryPosted = false;
            hideAnchorOnly();
            unbindPlayer();
        });
    }

    /** Restore exactly once after the read-only transition guard has observed stable geometry. */
    static void restoreAfterGuardedExpansion(String rawType) {
        String type = rawType == null ? "" : rawType.trim();
        runMain(() -> {
            boolean next = !CaptionSurface.isShorts() && compact(type);
            guardedExpansion = false;
            suppressed = next;
            geometryPosted = false;
            if (next) {
                hideAnchorOnly();
                return;
            }
            unbindPlayer();
            if (!pendingText.isEmpty()) render();
        });
    }

    static void hide() { hide(null); }

    static void hide(RenderGuard guard) {
        runMain(() -> {
            if (!allows(guard)) return;
            pendingText = "";
            overflowSource=null;
            FrameLayout anchor = anchorRef.get();
            TextView text = textRef.get();
            if (text != null) text.setClickable(false);
            if (anchor != null) anchor.setVisibility(View.GONE);
        });
    }

    static void clear() {
        runMain(() -> {
            pendingText = "";
            overflowSource=null;
            pendingStatus = false;
            guardedExpansion = false;
            detachOverlay();
        });
    }

    static void refreshStyle(Context ignored) {
        runMain(() -> {
            if (!pendingText.isEmpty() && !guardedExpansion) render();
        });
    }

    private static void hideAnchorOnly() {
        cancelDrag();
        dragging = false;
        FrameLayout host = hostRef.get();
        if (host != null) host.requestDisallowInterceptTouchEvent(false);
        FrameLayout anchor = anchorRef.get();
        TextView text = textRef.get();
        if (text != null) text.setClickable(false);
        if (anchor != null) anchor.setVisibility(View.GONE);
    }

    private static void show(String text, boolean status, RenderGuard guard) { show(text,status,guard,null); }
    private static void show(String text,boolean status,RenderGuard guard,java.util.function.Supplier<String> source) {
        String clean = text == null ? "" : text.trim();
        runMain(() -> {
            if (!allows(guard)) return;
            pendingText = clean;
            overflowSource=source;
            pendingStatus = status;
            if (clean.isEmpty() || suppressed || guardedExpansion) {
                FrameLayout anchor = anchorRef.get();
                TextView view = textRef.get();
                if (view != null) view.setClickable(false);
                if (anchor != null) anchor.setVisibility(View.GONE);
            } else {
                render();
            }
        });
    }

    private static boolean allows(RenderGuard guard) {
        if (guard == null) return true;
        try {
            return guard.isValid();
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void render() {
        if (suppressed || guardedExpansion || pendingText.isEmpty()) return;
        Activity activity = activityRef.get();
        TextView view = ensureView();
        FrameLayout anchor = anchorRef.get();
        if (activity == null || view == null || anchor == null) {
            MAIN.postDelayed(CaptionOverlay::render, 32L);
            return;
        }
        Rect bounds = resolveBounds(activity);
        if (bounds == null) {
            hideAnchorOnly();
            MAIN.postDelayed(CaptionOverlay::render, 32L);
            return;
        }

        boolean changed = !pendingText.contentEquals(view.getText()) || pendingStatus != lastStatus;
        if (changed || anchor.getVisibility() != View.VISIBLE) {
            anchor.setVisibility(View.INVISIBLE);
            view.setClickable(false);
        }

        configure(anchor, view, activity, bounds);
        anchor.setVisibility(View.VISIBLE);
        anchor.setElevation(dp(activity,32));
        surfaceDiagnostic(activity,"OVERLAY_VIEW_VISIBLE","shorts="+CaptionSurface.isShorts()+";bounds="+bounds.toShortString());
        view.setClickable(true);
        anchor.postOnAnimation(() -> {
            if (anchor != anchorRef.get() || dragging || suppressed || guardedExpansion) return;
            Activity current = activityRef.get();
            Rect currentBounds = current == null ? null : resolveBounds(current);
            if (currentBounds != null) {
                positionAnchor(anchor, currentBounds,
                        Math.max(1, anchor.getMeasuredWidth()),
                        Math.max(1, anchor.getMeasuredHeight()));
            }
        });
    }

    private static void surfaceDiagnostic(Activity activity,String stage,String detail){
        long now=android.os.SystemClock.uptimeMillis();if(now-lastSurfaceDiagnostic<5000)return;lastSurfaceDiagnostic=now;
        CaptionDiagnostics.mark(activity,stage,detail);
    }
    private static TextView ensureView() {
        Activity activity = activityRef.get();
        if (activity == null || activity.isFinishing() || guardedExpansion) return null;
        FrameLayout host = findHost(activity);
        if (host == null) return null;
        bindHost(host);
        FrameLayout player = findPlayer(activity, host);
        if (player == null && !CaptionSurface.isShorts()) return null;
        if(player!=null && !CaptionSurface.isShorts())bindPlayer(player);

        FrameLayout anchor = anchorRef.get();
        TextView text = textRef.get();
        if (anchor != null && anchor.getParent() == host && text != null && text.getParent() == anchor) {
            return text;
        }

        if (anchor != null && anchor.getParent() instanceof ViewGroup) {
            ((ViewGroup) anchor.getParent()).removeView(anchor);
        }
        View stale = host.findViewWithTag(TEXT_TAG);
        if (stale instanceof TextView && stale.getParent() == host) host.removeView(stale);

        anchor = new FrameLayout(activity);
        anchor.setTag(ANCHOR_TAG);
        anchor.setClipChildren(false);
        anchor.setClipToPadding(false);
        anchor.setFocusable(false);
        anchor.setClickable(false);
        anchor.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        anchor.setVisibility(View.INVISIBLE);
        host.addView(anchor, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.TOP | Gravity.START));

        text = new TextView(activity);
        text.setTag(TEXT_TAG);
        text.setGravity(Gravity.CENTER);
        text.setIncludeFontPadding(false);
        text.setFocusable(false);
        text.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        text.setShadowLayer(dp(activity, 3), 0f, dp(activity, 1), Color.BLACK);
        int h = dp(activity, 9);
        int v = dp(activity, 5);
        text.setPadding(h, v, h, v);
        text.setElevation(dp(activity, 16));
        text.setSingleLine(false);
        text.setMaxLines(2);
        text.setClickable(false);
        text.setOnTouchListener(CaptionOverlay::touch);
        anchor.addView(text, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.TOP | Gravity.CENTER_HORIZONTAL));

        anchorRef = new WeakReference<>(anchor);
        textRef = new WeakReference<>(text);
        resetGeometry();
        return text;
    }

    private static void configure(FrameLayout anchor, TextView view, Activity activity, Rect bounds) {
        DeepSeekConfig.Snapshot style = DeepSeekConfig.displayStyle(activity);
        int anchorWidth = Math.max(1, Math.round(bounds.width() * (CaptionSurface.isShorts()?0.78f:0.90f)));
        int configured = pendingStatus
                ? Math.max(DeepSeekConfig.MIN_CAPTION_TEXT_SIZE, style.captionTextSize - 4)
                : style.captionTextSize;
        float preferredSp = scaledTextSize(activity, configured, bounds);
        float minimumSp = scaledTextSize(activity, DeepSeekConfig.MIN_CAPTION_TEXT_SIZE, bounds);
        float finalSp = fittedSize(activity, view, pendingText, preferredSp, minimumSp, anchorWidth);

        view.setBreakStrategy(Layout.BREAK_STRATEGY_BALANCED);
        view.setHyphenationFrequency(Layout.HYPHENATION_FREQUENCY_NONE);
        String shown=pendingText;
        int available=Math.max(1,anchorWidth-view.getPaddingLeft()-view.getPaddingRight());
        if(lineCount(activity,shown,finalSp,available)>2) {
            // Never crop a translated paragraph or turn it into tiny text. It is a labelled
            // source fallback, not a successful translation; actual lines remain readable.
            String source=overflowSource==null?"":overflowSource.get();
            shown=source==null?"":source;
            if(shown.isEmpty()||lineCount(activity,shown,finalSp,available)>2)
                shown=CaptionStrings.get(activity,"caption_overflow");
            if(lineCount(activity,shown,finalSp,available)>2)shown="…";
        }
        view.setText(shown);
        view.setSingleLine(false);
        view.setMaxLines(2); // setSingleLine(false) resets maxLines on Android.
        try { view.setAutoSizeTextTypeWithDefaults(TextView.AUTO_SIZE_TEXT_TYPE_NONE); }
        catch (Throwable ignored) {}
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, finalSp);
        view.setTextColor(pendingStatus ? 0xE6FFFFFF : Color.WHITE);
        view.setAlpha(1f);
        applyBackground(view, activity, style.backgroundOpacity);
        if (lastMaxWidth != anchorWidth) {
            lastMaxWidth = anchorWidth;
            view.setMaxWidth(anchorWidth);
        }

        FrameLayout.LayoutParams textParams = (FrameLayout.LayoutParams) view.getLayoutParams();
        textParams.width = ViewGroup.LayoutParams.WRAP_CONTENT;
        textParams.height = ViewGroup.LayoutParams.WRAP_CONTENT;
        textParams.gravity = Gravity.TOP | Gravity.CENTER_HORIZONTAL;
        view.setLayoutParams(textParams);

        FrameLayout.LayoutParams anchorParams = (FrameLayout.LayoutParams) anchor.getLayoutParams();
        anchorParams.width = anchorWidth;
        anchorParams.height = ViewGroup.LayoutParams.WRAP_CONTENT;
        anchorParams.gravity = Gravity.TOP | Gravity.START;
        anchor.setLayoutParams(anchorParams);

        int unspecified = View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED);
        view.measure(View.MeasureSpec.makeMeasureSpec(anchorWidth, View.MeasureSpec.AT_MOST), unspecified);
        anchor.measure(View.MeasureSpec.makeMeasureSpec(anchorWidth, View.MeasureSpec.EXACTLY), unspecified);
        positionAnchor(anchor, bounds, anchorWidth, Math.max(1, anchor.getMeasuredHeight()));
        remember(bounds);
        lastStatus = pendingStatus;
    }

    private static float fittedSize(Activity activity, TextView view, String text,
                                    float preferred, float minimum, int maxWidth) {
        int available = Math.max(1, maxWidth - view.getPaddingLeft() - view.getPaddingRight());
        float size = Math.max(minimum, preferred);
        while (size > minimum + 0.24f && lineCount(activity, text, size, available) > 2) {
            size = Math.max(minimum, size - 0.5f);
        }
        if (lineCount(activity,text,size,available)>2) {
            if(!text.equals(lastOverflowText)||lastOverflowWidth!=available){
                lastOverflowText=text;lastOverflowWidth=available;
                CaptionDiagnostics.mark(activity,"OVERLAY_READABILITY_FALLBACK",
                        "minimum_font_preserved=true;chars="+text.length()+";sp="+size);
            }
        }
        return size;
    }

    @SuppressWarnings("deprecation")
    private static int lineCount(Activity activity, String text, float sp, int width) {
        TextPaint paint = new TextPaint(Paint.ANTI_ALIAS_FLAG | Paint.SUBPIXEL_TEXT_FLAG);
        paint.setTextSize(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_SP, sp, activity.getResources().getDisplayMetrics()));
        StaticLayout layout = StaticLayout.Builder.obtain(text, 0, text.length(), paint, Math.max(1, width))
                .setAlignment(Layout.Alignment.ALIGN_CENTER).setIncludePad(false)
                .setBreakStrategy(Layout.BREAK_STRATEGY_BALANCED)
                .setHyphenationFrequency(Layout.HYPHENATION_FREQUENCY_NONE).build();
        return layout.getLineCount();
    }

    private static void positionAnchor(FrameLayout anchor, Rect bounds, int width, int height) {
        Activity activity = activityRef.get();
        if (activity == null || bounds.width() <= 0 || bounds.height() <= 0) return;
        boolean landscape = isLandscape(activity);
        float ratio = DeepSeekConfig.hasCaptionPosition(activity, landscape)
                ? DeepSeekConfig.captionPositionY(activity, landscape)
                : (landscape ? 0.80f : 0.82f);
        if(CaptionSurface.isShorts()) {
            Float nativeY=CaptionSurface.nativeCenter(hostRef.get(),bounds);
            ratio=DeepSeekConfig.hasShortsPosition(activity)?DeepSeekConfig.shortsPosition(activity):nativeY!=null?nativeY:.72f;
        }
        float x = bounds.left + (bounds.width() - width) / 2f;
        float y = bounds.top + ratio * bounds.height() - height / 2f;
        anchor.setX(clamp(x, bounds.left, Math.max(bounds.left, bounds.right - width)));
        anchor.setY(clamp(y, bounds.top, Math.max(bounds.top, bounds.bottom - height)));
    }

    private static FrameLayout findHost(Activity activity) {
        View content = activity.findViewById(android.R.id.content);
        if (content instanceof FrameLayout && content.isAttachedToWindow()) return (FrameLayout) content;
        View root = activity.getWindow() == null ? null : activity.getWindow().getDecorView();
        return root instanceof FrameLayout && root.isAttachedToWindow() ? (FrameLayout) root : null;
    }

    private static FrameLayout findPlayer(Activity activity, FrameLayout host) {
        View root = activity.getWindow() == null ? null : activity.getWindow().getDecorView();
        if (root == null) return null;
        FrameLayout remembered = playerRef.get();
        FrameLayout best = null;
        double bestScore = Double.NEGATIVE_INFINITY;
        for (String name : PLAYER_IDS) {
            int id = activity.getResources().getIdentifier(name, "id", activity.getPackageName());
            if (id == 0) continue;
            View candidate = root.findViewById(id);
            FrameLayout frame = candidate instanceof FrameLayout
                    ? (FrameLayout) candidate
                    : candidate != null && candidate.getParent() instanceof FrameLayout
                    ? (FrameLayout) candidate.getParent() : null;
            double score = playerScore(activity, host, frame, frame == remembered);
            if (score > bestScore) {
                bestScore = score;
                best = frame;
            }
        }
        double rememberedScore = playerScore(activity, host, remembered, true);
        return rememberedScore > bestScore ? remembered : best;
    }

    private static double playerScore(Activity activity, FrameLayout host,
                                      FrameLayout candidate, boolean remembered) {
        if (candidate == null || !candidate.isAttachedToWindow() || !candidate.isShown() ||
                candidate.getAlpha() <= 0.01f) return Double.NEGATIVE_INFINITY;
        Rect hostRect = new Rect();
        Rect rect = new Rect();
        if (!host.getGlobalVisibleRect(hostRect) || !candidate.getGlobalVisibleRect(rect) ||
                !rect.intersect(hostRect)) return Double.NEGATIVE_INFINITY;
        int w = rect.width();
        int h = rect.height();
        if (w <= 1 || h <= 1) return Double.NEGATIVE_INFINITY;
        double area = (double) w * h;
        double wr = Math.min(1d, w / (double) Math.max(1, hostRect.width()));
        double hr = Math.min(1d, h / (double) Math.max(1, hostRect.height()));
        double aspect = w / (double) h;
        double fit = 1d / (1d + Math.abs(Math.log(Math.max(0.01d, aspect / (16d / 9d)))));
        double score;
        if (isLandscape(activity)) {
            score = area * (2d + wr + hr);
            if (wr < 0.5d) score *= 0.35d;
        } else {
            score = area * (1d + 2.2d * fit + wr);
            if (aspect < 1.05d) score *= 0.15d;
            if (hr > 0.82d) score *= 0.25d;
        }
        return remembered ? score * 1.02d : score;
    }

    private static Rect resolveBounds(Activity activity) {
        FrameLayout host = hostRef.get();
        if (host == null || !host.isAttachedToWindow()) return null;
        Rect shorts=CaptionSurface.bounds(host);if(shorts!=null){Rect video=CaptionSurface.renderedBounds(CaptionSurface.refresh(),host);return video!=null?video:shorts;}
        FrameLayout best = findPlayer(activity, host);
        if (best != null) bindPlayer(best);
        FrameLayout player = playerRef.get();
        if (player == null || !player.isAttachedToWindow()) return null;
        Rect rendered=CaptionSurface.renderedBounds(player,host);
        if(rendered!=null)return rendered;
        // Controls can be siblings of the video surface; inspect other named player containers,
        // never climb to the entire Activity or scan comment/media previews outside the player.
        View root=activity.getWindow().getDecorView();
        for(String name:PLAYER_IDS){int id=activity.getResources().getIdentifier(name,"id",activity.getPackageName());
            if(id==0)continue;View container=root.findViewById(id);
            if(container==null || container==host)continue;
            rendered=CaptionSurface.renderedBounds(container,host);if(rendered!=null)return rendered;
        }
        Rect hostRect = new Rect();
        Rect playerRect = new Rect();
        if (!host.getGlobalVisibleRect(hostRect) || !player.getGlobalVisibleRect(playerRect)) return null;
        playerRect.offset(-hostRect.left, -hostRect.top);
        int left = Math.max(0, playerRect.left);
        int top = Math.max(0, playerRect.top);
        int right = Math.min(host.getWidth(), playerRect.right);
        int bottom = Math.min(host.getHeight(), playerRect.bottom);
        return right > left && bottom > top ? new Rect(left, top, right, bottom) : null;
    }

    private static void bindHost(FrameLayout host) {
        FrameLayout old = hostRef.get();
        if (old == host) return;
        if (old != null) {old.removeOnLayoutChangeListener(HOST_LAYOUT);old.getViewTreeObserver().removeOnPreDrawListener(GEOMETRY_DRAW);}
        hostRef = new WeakReference<>(host);
        host.addOnLayoutChangeListener(HOST_LAYOUT);
        host.getViewTreeObserver().addOnPreDrawListener(GEOMETRY_DRAW);
        resetGeometry();
    }

    private static void bindPlayer(FrameLayout player) {
        FrameLayout old = playerRef.get();
        if (old == player) return;
        if (old != null) old.removeOnLayoutChangeListener(PLAYER_LAYOUT);
        playerRef = new WeakReference<>(player);
        player.addOnLayoutChangeListener(PLAYER_LAYOUT);
        resetGeometry();
    }

    private static void unbindPlayer() {
        FrameLayout old = playerRef.get();
        if (old != null) old.removeOnLayoutChangeListener(PLAYER_LAYOUT);
        playerRef = new WeakReference<>(null);
        resetGeometry();
    }

    private static void scheduleGeometry() {
        if (guardedExpansion || suppressed || pendingText.isEmpty() || geometryPosted) return;
        geometryPosted = true;
        View target = anchorRef.get();
        Runnable action = () -> {
            geometryPosted = false;
            syncGeometry();
        };
        if (target != null) target.postOnAnimation(action); else MAIN.post(action);
    }

    private static void syncGeometry() {
        if (guardedExpansion || suppressed || pendingText.isEmpty()) return;
        Activity activity = activityRef.get();
        FrameLayout anchor = anchorRef.get();
        TextView view = textRef.get();
        if (activity == null || anchor == null || view == null) return;
        Rect bounds = resolveBounds(activity);
        if (bounds == null) {hideAnchorOnly();return;}
        boolean changed = bounds.left != lastLeft || bounds.top != lastTop ||
                bounds.width() != lastWidth || bounds.height() != lastHeight;
        if (!changed && anchor.getVisibility()==View.VISIBLE) return;
        configure(anchor, view, activity, bounds);
        anchor.setVisibility(View.VISIBLE);
        anchor.setElevation(dp(activity,32));
        surfaceDiagnostic(activity,"OVERLAY_VIEW_VISIBLE","shorts="+CaptionSurface.isShorts()+";bounds="+bounds.toShortString());
        view.setClickable(true);
    }

    private static boolean touch(View touched, MotionEvent event) {
        if (!(touched instanceof TextView)) return false;
        TextView view = (TextView) touched;
        FrameLayout anchor = anchorRef.get();
        FrameLayout host = hostRef.get();
        Activity activity = activityRef.get();
        Rect bounds = activity == null ? null : resolveBounds(activity);
        if (anchor == null || host == null || activity == null || bounds == null) return false;
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                cancelDrag();
                dragging = false;
                downRawY = event.getRawY();
                dragStartY = anchor.getY();
                host.requestDisallowInterceptTouchEvent(true);
                armDrag = () -> {
                    if (view == textRef.get() && view.isShown()) {
                        dragging = true;
                        view.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
                    }
                };
                MAIN.postDelayed(armDrag, DRAG_LONG_PRESS_MS);
                return true;
            case MotionEvent.ACTION_MOVE:
                if (!dragging) {
                    if (Math.abs(event.getRawY() - downRawY) >
                            ViewConfiguration.get(activity).getScaledTouchSlop()) cancelDrag();
                    return true;
                }
                int height = Math.max(1, anchor.getMeasuredHeight());
                anchor.setY(clamp(dragStartY + event.getRawY() - downRawY,
                        bounds.top, Math.max(bounds.top, bounds.bottom - height)));
                return true;
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                cancelDrag();
                Rect finalBounds = resolveBounds(activity);
                if (dragging && finalBounds != null && finalBounds.height() > 0) {
                    boolean landscape = isLandscape(activity);
                    float centerY = anchor.getY() + Math.max(1, anchor.getMeasuredHeight()) / 2f;
                    if(CaptionSurface.isShorts())DeepSeekConfig.saveShortsPosition(activity,(centerY-finalBounds.top)/finalBounds.height());
                    else DeepSeekConfig.saveCaptionPosition(activity, landscape,
                            (centerY - finalBounds.top) / finalBounds.height());
                } else if (event.getActionMasked() == MotionEvent.ACTION_UP) {
                    view.performClick();
                }
                dragging = false;
                host.requestDisallowInterceptTouchEvent(false);
                return true;
            default:
                return true;
        }
    }

    private static void applyBackground(TextView view, Activity activity, int opacity) {
        view.setBackground(new CaptionTextBackground(view, opacity, dp(activity, 5)));
    }

    private static float scaledTextSize(Activity activity, int configuredSp, Rect bounds) {
        float density = activity.getResources().getDisplayMetrics().density;
        if (density <= 0f || bounds.width() <= 0 || bounds.height() <= 0) return configuredSp;
        float shortDp = Math.min(bounds.width(), bounds.height()) / density;
        return SubtitleStyleMetrics.scaledSp(configuredSp,shortDp);
    }

    private static void remember(Rect bounds) {
        lastLeft = bounds.left;
        lastTop = bounds.top;
        lastWidth = bounds.width();
        lastHeight = bounds.height();
    }

    private static void resetGeometry() {
        lastLeft = lastTop = lastWidth = lastHeight = lastMaxWidth = -1;
    }

    private static void cancelDrag() {
        if (armDrag != null) MAIN.removeCallbacks(armDrag);
        armDrag = null;
    }

    private static void detach() {
        cancelDrag();
        dragging = false;
        guardedExpansion = false;
        detachOverlay();
    }

    private static void detachOverlay() {
        FrameLayout anchor = anchorRef.get();
        if (anchor != null && anchor.getParent() instanceof ViewGroup) {
            ((ViewGroup) anchor.getParent()).removeView(anchor);
        }
        FrameLayout host = hostRef.get();
        if (host != null) {host.removeOnLayoutChangeListener(HOST_LAYOUT);host.getViewTreeObserver().removeOnPreDrawListener(GEOMETRY_DRAW);}
        FrameLayout player = playerRef.get();
        if (player != null) player.removeOnLayoutChangeListener(PLAYER_LAYOUT);
        anchorRef = new WeakReference<>(null);
        textRef = new WeakReference<>(null);
        hostRef = new WeakReference<>(null);
        playerRef = new WeakReference<>(null);
        geometryPosted = false;
        resetGeometry();
    }

    private static boolean compact(String type) {
        if (type.isEmpty()) return false;
        return type.equals("NONE") || type.equals("HIDDEN") || type.equals("INLINE_MINIMAL") ||
                type.equals("WATCH_WHILE_PICTURE_IN_PICTURE") || type.contains("MINIMAL") ||
                type.contains("MINIMIZED") || type.contains("PICTURE_IN_PICTURE") ||
                type.contains("DISMISSED");
    }

    private static boolean isLandscape(Activity activity) {
        return activity.getResources().getConfiguration().orientation ==
                Configuration.ORIENTATION_LANDSCAPE;
    }

    private static int dp(Activity activity, int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }

    private static float clamp(float value, float min, float max) {
        return Math.max(min, Math.min(max, value));
    }

    private static void runMain(Runnable action) {
        if (Looper.myLooper() == Looper.getMainLooper()) action.run(); else MAIN.post(action);
    }
}
