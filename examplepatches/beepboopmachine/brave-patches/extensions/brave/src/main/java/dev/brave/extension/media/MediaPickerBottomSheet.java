package dev.brave.extension.media;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.PathInterpolator;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import dev.brave.extension.core.ActiveTabTracker;
import dev.brave.extension.core.PatchPrefs;
import org.chromium.chrome.browser.tab.Tab;
import org.chromium.content_public.browser.WebContents;

public final class MediaPickerBottomSheet {
    private static final String TAG = "Brave_MediaPicker";
    private static final PathInterpolator M3_DECELERATE = new PathInterpolator(0.05f, 0.7f, 0.1f, 1.0f);
    private static final AccelerateInterpolator M3_DISMISS = new AccelerateInterpolator(1.4f);

    // Tracks in-flight downloads across dialog close/reopen cycles
    public static final Set<String> ACTIVE_DOWNLOAD_URLS = Collections.newSetFromMap(new ConcurrentHashMap<>());
    public static volatile boolean sBulkImagesDownloading = false;

    // Live UI callbacks for open bottom sheets when background service downloads finish
    private static final java.util.Map<String, java.util.function.Consumer<Boolean>> DOWNLOAD_UI_CALLBACKS =
            new ConcurrentHashMap<>();

    public static void notifyDownloadFinished(final String url, final boolean success) {
        if (url == null || url.isEmpty()) return;
        final java.util.function.Consumer<Boolean> cb = DOWNLOAD_UI_CALLBACKS.remove(url);
        if (cb != null) {
            new Handler(Looper.getMainLooper()).post(() -> {
                try { cb.accept(success); } catch (Throwable ignored) {}
            });
        }
    }

    private static void registerButtonCompletionCallback(final String url, final Activity activity, final Button dlBtn, final boolean isDark) {
        if (url == null || url.isEmpty() || dlBtn == null || activity == null) return;
        final java.lang.ref.WeakReference<Activity> actRef = new java.lang.ref.WeakReference<>(activity);
        final java.lang.ref.WeakReference<Button> btnRef = new java.lang.ref.WeakReference<>(dlBtn);
        DOWNLOAD_UI_CALLBACKS.put(url, success -> {
            Activity act = actRef.get();
            Button btn = btnRef.get();
            if (act == null || btn == null) return;
            if (success) {
                btn.setText("DOWNLOADED ✓");
                btn.setEnabled(true);
                styleButton(btn, Color.parseColor(isDark ? "#143D1A" : "#D4EDDA"), Color.parseColor(isDark ? "#81C784" : "#155724"), dp(act, 6));
            } else {
                btn.setText("Download");
                btn.setEnabled(true);
                styleButton(btn, Color.parseColor("#FF5500"), Color.WHITE, dp(act, 6));
            }
        });
    }

    private static volatile Method sNativeDownloadUrlMethod = null;
    private static volatile boolean sNativeDownloadLookupDone = false;

    /**
     * Nested ScrollView that seamlessly coordinates with GPU-accelerated translationY BottomSheet
     * drag gestures (zero requestLayout during drag).
     */
    public static class SheetScrollView extends ScrollView {
        public interface ScrollGestureListener {
            void onDragStart();
            void onDragDelta(float deltaY);
            void onDragRelease(float velocityY);
            boolean canExpand();
        }

        private ScrollGestureListener mListener;
        private float mDownY;
        private float mDownX;
        private float mLastY;
        private boolean mIsDraggingSheet;
        private VelocityTracker mVelocityTracker;
        private final int mTouchSlop;

        public SheetScrollView(Context context) {
            super(context);
            mTouchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
            setOverScrollMode(OVER_SCROLL_NEVER);
        }

        public void setScrollGestureListener(ScrollGestureListener listener) {
            this.mListener = listener;
        }

        @Override
        public boolean onInterceptTouchEvent(MotionEvent ev) {
            if (mListener == null) return super.onInterceptTouchEvent(ev);

            switch (ev.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    mDownY = ev.getRawY();
                    mDownX = ev.getRawX();
                    mLastY = mDownY;
                    mIsDraggingSheet = false;
                    if (mVelocityTracker == null) mVelocityTracker = VelocityTracker.obtain();
                    else mVelocityTracker.clear();
                    mVelocityTracker.addMovement(ev);
                    super.onInterceptTouchEvent(ev);
                    return false;

                case MotionEvent.ACTION_MOVE:
                    float curY = ev.getRawY();
                    float dy = curY - mDownY;
                    float dx = ev.getRawX() - mDownX;
                    if (Math.abs(dy) > mTouchSlop && Math.abs(dy) > Math.abs(dx)) {
                        if (dy > 0 && getScrollY() <= 0) {
                            mIsDraggingSheet = true;
                            mLastY = curY;
                            mListener.onDragStart();
                            if (mVelocityTracker != null) mVelocityTracker.addMovement(ev);
                            return true;
                        }
                        if (dy < 0 && mListener.canExpand()) {
                            mIsDraggingSheet = true;
                            mLastY = curY;
                            mListener.onDragStart();
                            if (mVelocityTracker != null) mVelocityTracker.addMovement(ev);
                            return true;
                        }
                    }
                    break;

                case MotionEvent.ACTION_CANCEL:
                case MotionEvent.ACTION_UP:
                    mIsDraggingSheet = false;
                    break;
            }
            return super.onInterceptTouchEvent(ev);
        }

        @Override
        public boolean onTouchEvent(MotionEvent ev) {
            if (mListener == null) return super.onTouchEvent(ev);

            if (mVelocityTracker == null) mVelocityTracker = VelocityTracker.obtain();
            mVelocityTracker.addMovement(ev);

            switch (ev.getActionMasked()) {
                case MotionEvent.ACTION_MOVE:
                    float curY = ev.getRawY();
                    if (!mIsDraggingSheet) {
                        float dy = curY - mDownY;
                        if ((dy > mTouchSlop && getScrollY() <= 0) || (dy < -mTouchSlop && mListener.canExpand())) {
                            mIsDraggingSheet = true;
                            mLastY = curY;
                            mListener.onDragStart();
                        }
                    }
                    if (mIsDraggingSheet) {
                        float step = curY - mLastY;
                        mLastY = curY;
                        mListener.onDragDelta(step);
                        return true;
                    }
                    break;

                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    if (mIsDraggingSheet) {
                        mIsDraggingSheet = false;
                        float vy = 0f;
                        if (mVelocityTracker != null) {
                            mVelocityTracker.computeCurrentVelocity(1000);
                            vy = mVelocityTracker.getYVelocity();
                            mVelocityTracker.recycle();
                            mVelocityTracker = null;
                        }
                        mListener.onDragRelease(vy);
                        return true;
                    }
                    if (mVelocityTracker != null) {
                        mVelocityTracker.recycle();
                        mVelocityTracker = null;
                    }
                    break;
            }
            return super.onTouchEvent(ev);
        }
    }

    public static void show(final Activity activity) {
        if (activity == null || activity.isFinishing()) return;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1 && activity.isDestroyed()) return;
        NetworkSafety.initContext(activity);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            if (activity.checkSelfPermission(android.Manifest.permission.POST_NOTIFICATIONS) != android.content.pm.PackageManager.PERMISSION_GRANTED) {
                try {
                    activity.requestPermissions(new String[]{android.Manifest.permission.POST_NOTIFICATIONS}, 101);
                } catch (Throwable ignored) {}
            }
        } else if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) {
            if (activity.checkSelfPermission(android.Manifest.permission.WRITE_EXTERNAL_STORAGE) != android.content.pm.PackageManager.PERMISSION_GRANTED) {
                try {
                    activity.requestPermissions(new String[]{android.Manifest.permission.WRITE_EXTERNAL_STORAGE}, 102);
                } catch (Throwable ignored) {}
            }
        }

        int resolvedTabId = ActiveTabTracker.getActiveTabId(activity);
        if (resolvedTabId < 0) {
            Tab tab = ActiveTabTracker.getActiveTab(activity);
            if (tab != null) {
                try {
                    resolvedTabId = tab.getId();
                } catch (Throwable ignored) {}
            }
        }
        final int tabId = resolvedTabId >= 0 ? resolvedTabId : 0;
        final List<MediaItem> videos = MediaRegistry.getMediaForTab(tabId);
        final List<MediaItem> images = MediaRegistry.getImagesForTab(tabId);

        final Dialog dialog = new Dialog(activity, android.R.style.Theme_Translucent_NoTitleBar);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        boolean isDark = isDarkTheme(activity);
        int bgColor = isDark ? Color.parseColor("#0A0A0C") : Color.WHITE;
        int textColor = isDark ? Color.parseColor("#E3E3E3") : Color.parseColor("#1F1F1F");
        int subTextColor = isDark ? Color.parseColor("#A0A0A0") : Color.parseColor("#666666");
        int cardBgColor = isDark ? Color.parseColor("#141416") : Color.parseColor("#F4F4F6");
        int accentColor = Color.parseColor("#FF5500");

        final DisplayMetrics dm = activity.getResources().getDisplayMetrics();
        final int screenHeight = dm.heightPixels;
        final int expandedHeight = (int) (screenHeight * 0.88f);
        final int normalHeight = (int) (screenHeight * 0.56f);
        final int halfOffset = expandedHeight - normalHeight;
        final boolean[] isExpanded = new boolean[]{false};
        final boolean[] isDismissing = new boolean[]{false};

        // Full-screen overlay container with animated scrim (ZERO window resizes, ZERO bottom gaps)
        final FrameLayout overlayContainer = new FrameLayout(activity);
        overlayContainer.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        final View scrim = new View(activity);
        scrim.setBackgroundColor(Color.BLACK);
        scrim.setAlpha(0f);
        scrim.setLayoutParams(new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        overlayContainer.addView(scrim);

        // Fixed-height bottom sheet anchored to bottom; all expansion/collapse/dismiss is 100% GPU translationY!
        final LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(activity, 18), dp(activity, 8), dp(activity, 18), 0);
        FrameLayout.LayoutParams rootLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, expandedHeight);
        rootLp.gravity = Gravity.BOTTOM;
        root.setLayoutParams(rootLp);
        root.setClickable(true);

        GradientDrawable rootBg = new GradientDrawable();
        rootBg.setColor(bgColor);
        float r = dp(activity, 20);
        rootBg.setCornerRadii(new float[]{r, r, r, r, 0, 0, 0, 0});
        root.setBackground(rootBg);
        overlayContainer.addView(root);

        // Top drag header containing ONLY the drag pill handle (zero branding)
        LinearLayout dragHeader = new LinearLayout(activity);
        dragHeader.setOrientation(LinearLayout.VERTICAL);
        dragHeader.setGravity(Gravity.CENTER_HORIZONTAL);
        dragHeader.setPadding(0, dp(activity, 6), 0, dp(activity, 12));
        dragHeader.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        View handle = new View(activity);
        LinearLayout.LayoutParams handleLp = new LinearLayout.LayoutParams(dp(activity, 48), dp(activity, 5));
        handleLp.gravity = Gravity.CENTER_HORIZONTAL;
        handle.setLayoutParams(handleLp);
        GradientDrawable handleBg = new GradientDrawable();
        handleBg.setColor(isDark ? Color.parseColor("#4A4A52") : Color.parseColor("#D0D0D4"));
        handleBg.setCornerRadius(dp(activity, 3));
        handle.setBackground(handleBg);
        dragHeader.addView(handle);
        root.addView(dragHeader);

        // Tab Selector Bar
        LinearLayout tabContainer = new LinearLayout(activity);
        tabContainer.setOrientation(LinearLayout.HORIZONTAL);
        LinearLayout.LayoutParams tabLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        tabLp.bottomMargin = dp(activity, 10);
        tabContainer.setLayoutParams(tabLp);

        Button tabVideos = createTabButton(activity, "Videos / Streams (" + videos.size() + ")", true, accentColor, textColor, cardBgColor);
        Button tabImages = createTabButton(activity, "Images (" + images.size() + ")", false, accentColor, textColor, cardBgColor);
        tabContainer.addView(tabVideos);
        tabContainer.addView(tabImages);
        root.addView(tabContainer);

        // Content Area fills remaining fixed height of sheet
        final FrameLayout contentArea = new FrameLayout(activity);
        contentArea.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1.0f));

        final SheetScrollView videoScrollView = new SheetScrollView(activity);
        videoScrollView.setClipToPadding(false);
        videoScrollView.setPadding(0, 0, 0, halfOffset + dp(activity, 24));
        LinearLayout videoList = new LinearLayout(activity);
        videoList.setOrientation(LinearLayout.VERTICAL);
        videoScrollView.addView(videoList);
        contentArea.addView(videoScrollView);

        final SheetScrollView imageScrollView = new SheetScrollView(activity);
        imageScrollView.setClipToPadding(false);
        imageScrollView.setPadding(0, 0, 0, halfOffset + dp(activity, 24));

        // Pure GPU translationY settle helper (120fps, zero requestLayout!)
        final Runnable updateScrollPadding = () -> {
            int padBottom = isExpanded[0] ? dp(activity, 24) : (halfOffset + dp(activity, 24));
            videoScrollView.setPadding(0, 0, 0, padBottom);
            imageScrollView.setPadding(0, 0, 0, padBottom);
        };

        final Runnable dismissSheet = () -> {
            if (isDismissing[0] || !dialog.isShowing()) return;
            isDismissing[0] = true;
            root.setLayerType(View.LAYER_TYPE_HARDWARE, null);
            scrim.animate().alpha(0f).setDuration(200).setInterpolator(M3_DISMISS).start();
            root.animate()
                    .translationY(expandedHeight)
                    .setDuration(200)
                    .setInterpolator(M3_DISMISS)
                    .withEndAction(() -> {
                        root.setLayerType(View.LAYER_TYPE_NONE, null);
                        try { dialog.dismiss(); } catch (Throwable ignored) {}
                    })
                    .start();
        };

        scrim.setOnClickListener(v -> dismissSheet.run());
        dialog.setOnKeyListener((d, keyCode, event) -> {
            if (keyCode == android.view.KeyEvent.KEYCODE_BACK && event.getAction() == android.view.KeyEvent.ACTION_UP) {
                dismissSheet.run();
                return true;
            }
            return false;
        });

        final java.util.function.Consumer<Boolean> animateToState = (expand) -> {
            isExpanded[0] = expand;
            float targetY = expand ? 0f : (float) halfOffset;
            float targetAlpha = 0.52f;
            root.setLayerType(View.LAYER_TYPE_HARDWARE, null);
            scrim.animate().alpha(targetAlpha).setDuration(240).setInterpolator(M3_DECELERATE).start();
            root.animate()
                    .translationY(targetY)
                    .setDuration(240)
                    .setInterpolator(M3_DECELERATE)
                    .withEndAction(() -> {
                        root.setLayerType(View.LAYER_TYPE_NONE, null);
                        updateScrollPadding.run();
                    })
                    .start();
        };

        final SheetScrollView.ScrollGestureListener scrollGestureListener = new SheetScrollView.ScrollGestureListener() {
            @Override
            public void onDragStart() {
                root.animate().cancel();
                scrim.animate().cancel();
                root.setLayerType(View.LAYER_TYPE_HARDWARE, null);
            }

            @Override
            public void onDragDelta(float deltaY) {
                float curY = root.getTranslationY() + deltaY;
                float clampedY = Math.max(0f, Math.min((float) expandedHeight, curY));
                root.setTranslationY(clampedY);
                float progress = 1f - (clampedY / (float) expandedHeight);
                scrim.setAlpha(Math.max(0f, Math.min(0.52f, 0.52f * progress)));
            }

            @Override
            public void onDragRelease(float velocityY) {
                float curY = root.getTranslationY();
                if (velocityY > 1100f) {
                    if (isExpanded[0] && curY < halfOffset) {
                        animateToState.accept(false);
                    } else {
                        dismissSheet.run();
                    }
                } else if (velocityY < -1100f) {
                    animateToState.accept(true);
                } else if (curY > halfOffset + dp(activity, 75)) {
                    dismissSheet.run();
                } else if (curY < halfOffset * 0.55f) {
                    animateToState.accept(true);
                } else {
                    animateToState.accept(false);
                }
            }

            @Override
            public boolean canExpand() {
                return !isExpanded[0];
            }
        };

        videoScrollView.setScrollGestureListener(scrollGestureListener);
        imageScrollView.setScrollGestureListener(scrollGestureListener);

        // Header drag & tap listener
        dragHeader.setOnTouchListener(new View.OnTouchListener() {
            private float downY;
            private float lastY;
            private long downTime;
            private VelocityTracker vt;

            @Override
            public boolean onTouch(View v, MotionEvent ev) {
                if (vt == null) vt = VelocityTracker.obtain();
                vt.addMovement(ev);
                switch (ev.getActionMasked()) {
                    case MotionEvent.ACTION_DOWN:
                        downY = ev.getRawY();
                        lastY = downY;
                        downTime = System.currentTimeMillis();
                        scrollGestureListener.onDragStart();
                        return true;
                    case MotionEvent.ACTION_MOVE:
                        float cur = ev.getRawY();
                        scrollGestureListener.onDragDelta(cur - lastY);
                        lastY = cur;
                        return true;
                    case MotionEvent.ACTION_UP:
                    case MotionEvent.ACTION_CANCEL:
                        float totalDelta = ev.getRawY() - downY;
                        long dur = System.currentTimeMillis() - downTime;
                        vt.computeCurrentVelocity(1000);
                        float vy = vt.getYVelocity();
                        vt.recycle();
                        vt = null;
                        if (Math.abs(totalDelta) < dp(activity, 10) && dur < 260) {
                            animateToState.accept(!isExpanded[0]);
                        } else {
                            scrollGestureListener.onDragRelease(vy);
                        }
                        return true;
                }
                return false;
            }
        });

        // Images Container
        LinearLayout imagesContainer = new LinearLayout(activity);
        imagesContainer.setOrientation(LinearLayout.VERTICAL);
        imagesContainer.setVisibility(View.GONE);

        LinearLayout convBar = new LinearLayout(activity);
        convBar.setOrientation(LinearLayout.HORIZONTAL);
        convBar.setGravity(Gravity.CENTER_VERTICAL);
        convBar.setPadding(0, 0, 0, dp(activity, 6));

        final CheckBox convPng = new CheckBox(activity);
        convPng.setText("Convert WebP to PNG");
        convPng.setTextColor(textColor);
        convPng.setTextSize(12);
        boolean currentAutoConv = PatchPrefs.getBoolean(activity, PatchPrefs.KEY_AUTO_CONVERT_WEBP, true);
        convPng.setChecked(currentAutoConv);
        convPng.setOnCheckedChangeListener((btn, isChecked) -> {
            PatchPrefs.setBoolean(activity, PatchPrefs.KEY_AUTO_CONVERT_WEBP, isChecked);
        });
        convBar.addView(convPng);
        imagesContainer.addView(convBar);

        final Set<MediaItem> selectedImages = new HashSet<>();
        final List<CheckBox> imageCheckBoxes = new ArrayList<>();
        final List<View> imageRowViews = new ArrayList<>();
        final Button bulkBtn = new Button(activity);

        final Runnable updateBulkButtonState = () -> {
            if (images.isEmpty()) {
                bulkBtn.setText("No Images");
                bulkBtn.setEnabled(false);
                styleButton(bulkBtn, cardBgColor, subTextColor, dp(activity, 8));
                return;
            }
            if (sBulkImagesDownloading) {
                bulkBtn.setText("DOWNLOADING IMAGES...");
                bulkBtn.setEnabled(false);
                styleButton(bulkBtn, Color.parseColor(isDark ? "#4A2800" : "#FFE0B2"), Color.parseColor(isDark ? "#FFA726" : "#E65100"), dp(activity, 8));
                return;
            }
            List<MediaItem> target = selectedImages.isEmpty() ? images : new ArrayList<>(selectedImages);
            int alreadyCount = 0;
            for (MediaItem im : target) {
                if (PatchPrefs.isMediaDownloaded(activity, im.url)) alreadyCount++;
            }
            bulkBtn.setEnabled(true);
            if (alreadyCount == target.size()) {
                bulkBtn.setText((selectedImages.isEmpty() ? "ALL DOWNLOADED ✓ (" : "SELECTED DOWNLOADED ✓ (") + target.size() + " Images)");
                styleButton(bulkBtn, Color.parseColor(isDark ? "#143D1A" : "#D4EDDA"), Color.parseColor(isDark ? "#81C784" : "#155724"), dp(activity, 8));
            } else {
                String label = selectedImages.isEmpty()
                        ? ("Download All (" + target.size() + " Images)")
                        : ("Download Selected (" + target.size() + " Images)");
                if (alreadyCount > 0) {
                    label = label + " • " + (target.size() - alreadyCount) + " new";
                }
                bulkBtn.setText(label);
                styleButton(bulkBtn, accentColor, Color.WHITE, dp(activity, 8));
            }
        };

        updateBulkButtonState.run();

        bulkBtn.setOnClickListener(v -> {
            final List<MediaItem> targetImages = selectedImages.isEmpty() ? images : new ArrayList<>(selectedImages);
            final List<MediaItem> notYetDownloaded = new ArrayList<>();
            for (MediaItem im : targetImages) {
                if (!PatchPrefs.isMediaDownloaded(activity, im.url)) {
                    notYetDownloaded.add(im);
                }
            }

            if (notYetDownloaded.isEmpty()) {
                new AlertDialog.Builder(activity)
                        .setTitle("Images Already Downloaded")
                        .setMessage("All " + targetImages.size() + " images have already been downloaded.\n\nDo you want to download them again?")
                        .setPositiveButton("Download Again", (d, w) -> {
                            launchBulkImageDownload(activity, targetImages, convPng.isChecked(), bulkBtn, isDark);
                        })
                        .setNegativeButton("Cancel", null)
                        .show();
            } else if (notYetDownloaded.size() < targetImages.size()) {
                int already = targetImages.size() - notYetDownloaded.size();
                new AlertDialog.Builder(activity)
                        .setTitle("Some Images Already Downloaded")
                        .setMessage(already + " of " + targetImages.size() + " images were already downloaded.")
                        .setPositiveButton("Download " + notYetDownloaded.size() + " New Only", (d, w) -> {
                            launchBulkImageDownload(activity, notYetDownloaded, convPng.isChecked(), bulkBtn, isDark);
                        })
                        .setNeutralButton("Download All (" + targetImages.size() + ")", (d, w) -> {
                            launchBulkImageDownload(activity, targetImages, convPng.isChecked(), bulkBtn, isDark);
                        })
                        .setNegativeButton("Cancel", null)
                        .show();
            } else {
                launchBulkImageDownload(activity, targetImages, convPng.isChecked(), bulkBtn, isDark);
            }
        });
        imagesContainer.addView(bulkBtn);

        LinearLayout.LayoutParams imgScrollLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1.0f);
        imgScrollLp.topMargin = dp(activity, 6);
        imageScrollView.setLayoutParams(imgScrollLp);
        final LinearLayout imageList = new LinearLayout(activity);
        imageList.setOrientation(LinearLayout.VERTICAL);
        imageScrollView.addView(imageList);
        imagesContainer.addView(imageScrollView);

        contentArea.addView(imagesContainer);
        root.addView(contentArea);

        // Initial videos population handled by refreshDisplayedLists() below so live scans update in-place.

        // Google Photos-style Drag Select Controller
        class DragSelectController implements DragSelectListener {
            boolean isDragSelecting = false;
            int dragStartIndex = -1;
            boolean isSelectMode = true;
            final Set<Integer> preDragSelection = new HashSet<>();
            int autoScrollStep = 0;
            final Handler handler = new Handler(Looper.getMainLooper());
            int lastRawY = 0;

            final Runnable autoScrollRunnable = new Runnable() {
                @Override
                public void run() {
                    if (isDragSelecting && autoScrollStep != 0) {
                        imageScrollView.smoothScrollBy(0, autoScrollStep);
                        updateSelectionFromTouch(lastRawY);
                        handler.postDelayed(this, 16);
                    }
                }
            };

            @Override public boolean isDragging() { return isDragSelecting; }

            @Override
            public void onStartDrag(int startIndex, View view) {
                isDragSelecting = true;
                dragStartIndex = startIndex;
                view.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
                imageScrollView.requestDisallowInterceptTouchEvent(true);
                preDragSelection.clear();
                for (int i = 0; i < images.size(); i++) {
                    if (selectedImages.contains(images.get(i))) preDragSelection.add(i);
                }
                isSelectMode = !preDragSelection.contains(startIndex);
                applyRange(startIndex, startIndex);
            }

            @Override
            public void onTouchMove(int rawY) {
                if (!isDragSelecting) return;
                lastRawY = rawY;
                updateSelectionFromTouch(rawY);
                int[] scrollLoc = new int[2];
                imageScrollView.getLocationOnScreen(scrollLoc);
                int sTop = scrollLoc[1];
                int sBottom = sTop + imageScrollView.getHeight();
                int edge = dp(activity, 48);
                if (rawY < sTop + edge) {
                    autoScrollStep = -dp(activity, 14);
                    handler.removeCallbacks(autoScrollRunnable);
                    handler.post(autoScrollRunnable);
                } else if (rawY > sBottom - edge) {
                    autoScrollStep = dp(activity, 14);
                    handler.removeCallbacks(autoScrollRunnable);
                    handler.post(autoScrollRunnable);
                } else {
                    autoScrollStep = 0;
                    handler.removeCallbacks(autoScrollRunnable);
                }
            }

            void updateSelectionFromTouch(int rawY) {
                int hoverIndex = -1;
                for (int i = 0; i < imageRowViews.size(); i++) {
                    View child = imageRowViews.get(i);
                    int[] loc = new int[2];
                    child.getLocationOnScreen(loc);
                    if (rawY >= loc[1] && rawY <= loc[1] + child.getHeight()) {
                        hoverIndex = i;
                        break;
                    }
                }
                if (hoverIndex < 0 && !imageRowViews.isEmpty()) {
                    int[] firstLoc = new int[2];
                    imageRowViews.get(0).getLocationOnScreen(firstLoc);
                    hoverIndex = (rawY < firstLoc[1]) ? 0 : (imageRowViews.size() - 1);
                }
                if (hoverIndex >= 0) applyRange(dragStartIndex, hoverIndex);
            }

            void applyRange(int start, int end) {
                int min = Math.min(start, end);
                int max = Math.max(start, end);
                for (int i = 0; i < images.size(); i++) {
                    MediaItem it = images.get(i);
                    boolean shouldSelect = (i >= min && i <= max) ? isSelectMode : preDragSelection.contains(i);
                    if (shouldSelect) {
                        selectedImages.add(it);
                        if (i < imageCheckBoxes.size()) imageCheckBoxes.get(i).setChecked(true);
                    } else {
                        selectedImages.remove(it);
                        if (i < imageCheckBoxes.size()) imageCheckBoxes.get(i).setChecked(false);
                    }
                }
                onSelectionUpdated();
            }

            @Override
            public void onEndDrag() {
                if (isDragSelecting) {
                    isDragSelecting = false;
                    autoScrollStep = 0;
                    handler.removeCallbacks(autoScrollRunnable);
                    imageScrollView.requestDisallowInterceptTouchEvent(false);
                    onSelectionUpdated();
                }
            }

            @Override
            public void onSelectionUpdated() {
                updateBulkButtonState.run();
            }
        }

        final DragSelectController dragController = new DragSelectController();

        final long[] currentRenderedGen = new long[]{ MediaRegistry.getTabGeneration(tabId) };
        final java.util.Set<String> renderedVideoUrls = new java.util.HashSet<>();
        final java.util.Set<String> renderedImageUrls = new java.util.HashSet<>();
        final Runnable refreshDisplayedLists = () -> {
            long latestGen = MediaRegistry.getTabGeneration(tabId);
            if (latestGen != currentRenderedGen[0]) {
                currentRenderedGen[0] = latestGen;
                renderedVideoUrls.clear();
                renderedImageUrls.clear();
                selectedImages.clear();
                imageCheckBoxes.clear();
                imageRowViews.clear();
                videoList.removeAllViews();
                imageList.removeAllViews();
            }

            List<MediaItem> latestVideos = MediaRegistry.getMediaForTab(tabId);
            List<MediaItem> latestImages = MediaRegistry.getImagesForTab(tabId);

            videos.clear();
            videos.addAll(latestVideos);
            images.clear();
            images.addAll(latestImages);

            tabVideos.setText("Videos / Streams (" + videos.size() + ")");
            tabImages.setText("Images (" + images.size() + ")");

            if (videos.isEmpty()) {
                if (renderedVideoUrls.isEmpty() && videoList.getChildCount() == 0) {
                    videoList.addView(createEmptyState(activity, "No video or audio streams detected on this page.", subTextColor));
                }
            } else {
                if (renderedVideoUrls.isEmpty() && videoList.getChildCount() > 0) {
                    videoList.removeAllViews();
                }
                for (int i = 0; i < videos.size(); i++) {
                    MediaItem v = videos.get(i);
                    if (v != null && v.url != null && renderedVideoUrls.add(v.url)) {
                        videoList.addView(createVideoCard(activity, v, i, videos.size(), isDark, cardBgColor, textColor, subTextColor, accentColor));
                    }
                }
            }

            if (images.isEmpty()) {
                if (renderedImageUrls.isEmpty() && imageList.getChildCount() == 0) {
                    imageList.addView(createEmptyState(activity, "No high-resolution images detected on this page.", subTextColor));
                }
            } else {
                if (renderedImageUrls.isEmpty() && imageList.getChildCount() > 0) {
                    imageList.removeAllViews();
                }
                for (int i = 0; i < images.size(); i++) {
                    final MediaItem item = images.get(i);
                    if (item != null && item.url != null && renderedImageUrls.add(item.url)) {
                        final int rowIdx = imageRowViews.size();
                        final CheckBox cb = new CheckBox(activity);
                        imageCheckBoxes.add(cb);
                        View imgCard = createImageCard(activity, item, rowIdx, cb, isDark, cardBgColor, textColor, subTextColor, selectedImages, dragController);
                        imageRowViews.add(imgCard);
                        imageList.addView(imgCard);
                    }
                }
            }
            updateBulkButtonState.run();
        };

        refreshDisplayedLists.run();

        final MediaRegistry.MediaCountListener liveListener = (changedTabId, mediaCount, imageCount) -> {
            if (changedTabId != tabId) return;
            if (!dialog.isShowing() || activity.isFinishing()) return;
            refreshDisplayedLists.run();
        };
        MediaRegistry.addListener(liveListener);
        dialog.setOnDismissListener(d -> MediaRegistry.removeListener(liveListener));

        tabVideos.setOnClickListener(v -> {
            setTabActive(activity, tabVideos, true, accentColor, cardBgColor);
            setTabActive(activity, tabImages, false, accentColor, cardBgColor);
            videoScrollView.setVisibility(View.VISIBLE);
            imagesContainer.setVisibility(View.GONE);
        });

        tabImages.setOnClickListener(v -> {
            setTabActive(activity, tabVideos, false, accentColor, cardBgColor);
            setTabActive(activity, tabImages, true, accentColor, cardBgColor);
            videoScrollView.setVisibility(View.GONE);
            imagesContainer.setVisibility(View.VISIBLE);
        });

        dialog.setContentView(overlayContainer);
        Window win = dialog.getWindow();
        if (win != null) {
            win.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            win.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            win.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            win.setWindowAnimations(0);
        }

        root.setTranslationY(expandedHeight);
        root.setLayerType(View.LAYER_TYPE_HARDWARE, null);
        dialog.show();
        scrim.animate().alpha(0.52f).setDuration(260).setInterpolator(M3_DECELERATE).start();
        root.animate()
                .translationY(halfOffset)
                .setDuration(280)
                .setInterpolator(M3_DECELERATE)
                .withEndAction(() -> root.setLayerType(View.LAYER_TYPE_NONE, null))
                .start();
    }

    private static void launchBulkImageDownload(final Activity activity, final List<MediaItem> targetImages, final boolean convertWebp, final Button bulkBtn, final boolean isDark) {
        if (targetImages == null || targetImages.isEmpty()) return;
        sBulkImagesDownloading = true;
        bulkBtn.setText("DOWNLOADING IMAGES...");
        bulkBtn.setEnabled(false);
        styleButton(bulkBtn, Color.parseColor(isDark ? "#4A2800" : "#FFE0B2"), Color.parseColor(isDark ? "#FFA726" : "#E65100"), dp(activity, 8));

        final Handler mainHandler = new Handler(Looper.getMainLooper());
        final int total = targetImages.size();
        final java.util.concurrent.atomic.AtomicInteger nextIndex = new java.util.concurrent.atomic.AtomicInteger(0);
        final java.util.concurrent.atomic.AtomicInteger finishedCount = new java.util.concurrent.atomic.AtomicInteger(0);
        final java.util.concurrent.atomic.AtomicInteger successCount = new java.util.concurrent.atomic.AtomicInteger(0);
        final int maxConcurrent = Math.min(3, total);

        final Runnable[] dispatchNextRef = new Runnable[1];
        dispatchNextRef[0] = () -> {
            int idx = nextIndex.getAndIncrement();
            if (idx >= total) return;

            final MediaItem im = targetImages.get(idx);
            String pathLower = extractPathLower(im.url);
            String mimeLower = im.mimeType != null ? im.mimeType.toLowerCase(Locale.ROOT) : "";
            String ext = ".jpg";
            String mime = "image/jpeg";
            if (mimeLower.contains("png") || pathLower.endsWith(".png")) { ext = ".png"; mime = "image/png"; }
            else if (mimeLower.contains("webp") || pathLower.endsWith(".webp")) { ext = ".webp"; mime = "image/webp"; }
            else if (mimeLower.contains("gif") || pathLower.endsWith(".gif")) { ext = ".gif"; mime = "image/gif"; }
            else if (mimeLower.contains("avif") || pathLower.endsWith(".avif")) { ext = ".avif"; mime = "image/avif"; }
            else if (mimeLower.contains("bmp") || pathLower.endsWith(".bmp")) { ext = ".bmp"; mime = "image/bmp"; }
            else if (mimeLower.contains("heic") || pathLower.endsWith(".heic") || pathLower.endsWith(".heif")) { ext = ".heic"; mime = "image/heic"; }

            String clean = getCleanFileName(im.url);
            if (clean == null || clean.isEmpty() || clean.equalsIgnoreCase("Video") || clean.equalsIgnoreCase("image")) {
                clean = "image_" + Integer.toHexString(im.url.hashCode()) + ext;
            } else if (!clean.contains(".")) {
                clean = clean + ext;
            }
            final String finalFilename = clean;
            final String finalMime = mime;
            final String expectedSavedName = (convertWebp && finalFilename.toLowerCase(Locale.ROOT).endsWith(".webp"))
                    ? (finalFilename.substring(0, finalFilename.length() - 5) + ".png")
                    : finalFilename;

            final java.util.concurrent.atomic.AtomicBoolean itemHandled = new java.util.concurrent.atomic.AtomicBoolean(false);
            final java.util.function.BiConsumer<Boolean, String> finishItem = (succeeded, actualSavedName) -> {
                if (!itemHandled.compareAndSet(false, true)) return;
                if (succeeded) {
                    successCount.incrementAndGet();
                }
                int done = finishedCount.incrementAndGet();
                if (done >= total) {
                    sBulkImagesDownloading = false;
                    final int ok = successCount.get();
                    mainHandler.post(() -> {
                        bulkBtn.setEnabled(true);
                        if (ok == total) {
                            bulkBtn.setText("SENT TO BRAVE (" + total + " Images)");
                            styleButton(bulkBtn, Color.parseColor(isDark ? "#0D3B5E" : "#D6EAFA"), Color.parseColor(isDark ? "#90CAF9" : "#0D47A1"), dp(activity, 8));
                        } else if (ok > 0) {
                            bulkBtn.setText("Sent " + ok + "/" + total + " to Brave (Tap to Retry)");
                            styleButton(bulkBtn, Color.parseColor(isDark ? "#4A2800" : "#FFE0B2"), Color.parseColor(isDark ? "#FFA726" : "#E65100"), dp(activity, 8));
                        } else {
                            bulkBtn.setText("Download Failed (Tap to Retry)");
                            styleButton(bulkBtn, Color.parseColor("#FF5500"), Color.WHITE, dp(activity, 8));
                        }
                    });
                } else {
                    mainHandler.postDelayed(dispatchNextRef[0], 120L);
                }
            };

            String relayUrl = LocalDownloadRelay.startRelay(im, finalFilename, finalMime, convertWebp, finishItem);
            if (relayUrl == null) {
                finishItem.accept(false, finalFilename);
                return;
            }
            boolean triggered = triggerChromiumNativeDownload(activity, relayUrl);
            if (!triggered) {
                LocalDownloadRelay.stopRelay(relayUrl);
                finishItem.accept(false, finalFilename);
            }
        };

        for (int w = 0; w < maxConcurrent; w++) {
            mainHandler.postDelayed(dispatchNextRef[0], w * 150L);
        }

        Toast.makeText(activity, "Sending " + total + " image(s) to Brave Downloads...", Toast.LENGTH_SHORT).show();
    }

    /**
     * Triggers Brave's OWN C++ content::DownloadManager::DownloadUrl via J.N.VOO(0x13, url, webContents).
     * This is the EXACT native path Brave uses when downloading files — downloads appear immediately
     * in Brave's Downloads section (chrome-native://downloads/) with live progress, pause/resume,
     * and native Brave download notifications!
     */
    public static boolean triggerChromiumNativeDownload(final String url) {
        return triggerChromiumNativeDownload(null, url);
    }

    public static boolean triggerChromiumNativeDownload(final Activity activity, final String url) {
        if (url == null || url.isEmpty()) return false;
        try {
            Tab activeTab = (activity != null)
                    ? ActiveTabTracker.getActiveTab(activity)
                    : ActiveTabTracker.getActiveTab();
            if (activeTab == null) return false;
            WebContents wc = activeTab.getWebContents();
            if (wc == null) return false;

            if (!sNativeDownloadLookupDone) {
                synchronized (MediaPickerBottomSheet.class) {
                    if (!sNativeDownloadLookupDone) {
                        try {
                            Class<?> jnClass = Class.forName("J.N");
                            sNativeDownloadUrlMethod = jnClass.getMethod("VOO", int.class, Object.class, Object.class);
                        } catch (Throwable t) {
                            Log.w(TAG, "Could not resolve J.N.VOO", t);
                        }
                        sNativeDownloadLookupDone = true;
                    }
                }
            }

            if (sNativeDownloadUrlMethod != null) {
                if (Looper.myLooper() == Looper.getMainLooper()) {
                    sNativeDownloadUrlMethod.invoke(null, 0x13, url, wc);
                } else {
                    new Handler(Looper.getMainLooper()).post(() -> {
                        try {
                            sNativeDownloadUrlMethod.invoke(null, 0x13, url, wc);
                        } catch (Throwable t) {
                            Log.w(TAG, "Deferred J.N.VOO(0x13) failed", t);
                        }
                    });
                }
                Log.i(TAG, "Triggered native Chromium DownloadManager (J.N.VOO 0x13) for: " + url);
                return true;
            }
        } catch (Throwable t) {
            Log.w(TAG, "triggerChromiumNativeDownload failed for " + url, t);
        }
        return false;
    }

    public interface DragSelectListener {
        void onStartDrag(int index, View v);
        void onTouchMove(int rawY);
        void onEndDrag();
        boolean isDragging();
        void onSelectionUpdated();
    }

    private static String getCleanFileName(String url) {
        if (url == null || url.isEmpty()) return "Video";
        try {
            Uri u = Uri.parse(url);
            String path = u.getLastPathSegment();
            if (path != null && !path.isEmpty()) {
                int q = path.indexOf('?');
                if (q != -1) path = path.substring(0, q);
                return path;
            }
        } catch (Throwable ignored) {}
        return "Video";
    }

    private static View createVideoCard(
            final Activity activity,
            final MediaItem item,
            final int index,
            final int totalVideos,
            boolean isDark,
            int cardBg,
            int textColor,
            int subTextColor,
            int accentColor
    ) {
        LinearLayout card = new LinearLayout(activity);
        card.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cardLp.bottomMargin = dp(activity, 10);
        card.setLayoutParams(cardLp);
        card.setPadding(dp(activity, 14), dp(activity, 12), dp(activity, 14), dp(activity, 12));

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(cardBg);
        bg.setCornerRadius(dp(activity, 12));
        card.setBackground(bg);

        LinearLayout mainRow = new LinearLayout(activity);
        mainRow.setOrientation(LinearLayout.HORIZONTAL);
        mainRow.setGravity(Gravity.CENTER_VERTICAL);
        mainRow.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        LinearLayout leftCol = new LinearLayout(activity);
        leftCol.setOrientation(LinearLayout.VERTICAL);
        leftCol.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

        TextView title = new TextView(activity);
        final String cleanName = getCleanFileName(item.url);
        final String displayTitle = (item.title != null && !item.title.isEmpty() && !item.title.startsWith("Media_")) ? item.title : cleanName;
        title.setText(totalVideos > 1 ? ("Video " + (index + 1) + ": " + displayTitle) : displayTitle);
        title.setTextColor(textColor);
        title.setTextSize(14);
        title.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        title.setSingleLine(true);
        title.setEllipsize(android.text.TextUtils.TruncateAt.END);
        leftCol.addView(title);

        LinearLayout badgesRow = new LinearLayout(activity);
        badgesRow.setOrientation(LinearLayout.HORIZONTAL);
        badgesRow.setGravity(Gravity.CENTER_VERTICAL);
        badgesRow.setPadding(0, dp(activity, 4), 0, dp(activity, 4));

        TextView typeBadge = new TextView(activity);
        String label = "VIDEO";
        if (item.type == MediaType.HLS_STREAM) label = "HLS STREAM";
        else if (item.type == MediaType.DASH_STREAM) label = "DASH STREAM";
        else if (item.type == MediaType.AUDIO) label = "AUDIO";
        if (totalVideos > 1) label = label + " " + (index + 1) + " of " + totalVideos;
        typeBadge.setText(label);
        typeBadge.setTextSize(10);
        typeBadge.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        typeBadge.setTextColor(Color.WHITE);
        typeBadge.setPadding(dp(activity, 6), dp(activity, 2), dp(activity, 6), dp(activity, 2));
        GradientDrawable typeBadgeBg = new GradientDrawable();
        typeBadgeBg.setColor(accentColor);
        typeBadgeBg.setCornerRadius(dp(activity, 4));
        typeBadge.setBackground(typeBadgeBg);
        badgesRow.addView(typeBadge);

        String qLabel = item.getQualityLabel();
        if (!qLabel.isEmpty()) {
            TextView qBadge = new TextView(activity);
            qBadge.setText(qLabel);
            qBadge.setTextSize(10);
            qBadge.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
            qBadge.setTextColor(Color.WHITE);
            qBadge.setPadding(dp(activity, 6), dp(activity, 2), dp(activity, 6), dp(activity, 2));
            GradientDrawable qBg = new GradientDrawable();
            qBg.setColor(Color.parseColor("#0088FF"));
            qBg.setCornerRadius(dp(activity, 4));
            qBadge.setBackground(qBg);
            LinearLayout.LayoutParams qLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            qLp.leftMargin = dp(activity, 6);
            qBadge.setLayoutParams(qLp);
            badgesRow.addView(qBadge);
        }
        leftCol.addView(badgesRow);

        StringBuilder subInfo = new StringBuilder();
        if (!item.getFormattedSize().isEmpty()) subInfo.append(item.getFormattedSize()).append(" • ");
        if (!item.getResolutionString().isEmpty()) subInfo.append(item.getResolutionString()).append(" • ");
        subInfo.append(item.url);
        TextView sub = new TextView(activity);
        sub.setText(subInfo.toString());
        sub.setTextColor(subTextColor);
        sub.setTextSize(11);
        sub.setSingleLine(true);
        sub.setEllipsize(android.text.TextUtils.TruncateAt.MIDDLE);
        sub.setPadding(0, 0, 0, dp(activity, 4));
        leftCol.addView(sub);

        mainRow.addView(leftCol);

        ImageView thumbView = new ImageView(activity);
        LinearLayout.LayoutParams thumbLp = new LinearLayout.LayoutParams(dp(activity, 80), dp(activity, 54));
        thumbLp.leftMargin = dp(activity, 10);
        thumbView.setLayoutParams(thumbLp);
        thumbView.setScaleType(ImageView.ScaleType.CENTER_CROP);
        GradientDrawable thumbBg = new GradientDrawable();
        thumbBg.setColor(Color.parseColor(isDark ? "#222226" : "#E5E5E8"));
        thumbBg.setCornerRadius(dp(activity, 6));
        thumbView.setBackground(thumbBg);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) thumbView.setClipToOutline(true);
        ThumbnailLoader.load(thumbView, item.thumbnailUrl, item.referer);
        mainRow.addView(thumbView);
        card.addView(mainRow);

        LinearLayout actions = new LinearLayout(activity);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setGravity(Gravity.END);
        actions.setPadding(0, dp(activity, 6), 0, 0);

        Button copyBtn = new Button(activity);
        copyBtn.setText("Copy Link");
        styleButton(copyBtn, Color.TRANSPARENT, textColor, dp(activity, 6));
        copyBtn.setOnClickListener(v -> {
            ClipboardManager cm = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
            if (cm != null) {
                cm.setPrimaryClip(ClipData.newPlainText("Media URL", item.url));
                Toast.makeText(activity, "URL copied to clipboard", Toast.LENGTH_SHORT).show();
            }
        });
        actions.addView(copyBtn);

        final Button dlBtn = new Button(activity);
        if (ACTIVE_DOWNLOAD_URLS.contains(item.url)) {
            dlBtn.setText("DOWNLOADING...");
            dlBtn.setEnabled(false);
            styleButton(dlBtn, Color.parseColor(isDark ? "#4A2800" : "#FFE0B2"), Color.parseColor(isDark ? "#FFA726" : "#E65100"), dp(activity, 6));
        } else if (PatchPrefs.isMediaDownloaded(activity, item.url)) {
            dlBtn.setText("DOWNLOADED ✓");
            styleButton(dlBtn, Color.parseColor(isDark ? "#143D1A" : "#D4EDDA"), Color.parseColor(isDark ? "#81C784" : "#155724"), dp(activity, 6));
        } else {
            dlBtn.setText("Download");
            styleButton(dlBtn, accentColor, Color.WHITE, dp(activity, 6));
        }

        dlBtn.setOnClickListener(v -> {
            if (PatchPrefs.isMediaDownloaded(activity, item.url)) {
                new AlertDialog.Builder(activity)
                        .setTitle("File Already Downloaded")
                        .setMessage("'" + displayTitle + "' has already been downloaded.\n\nDo you want to download it again?")
                        .setPositiveButton("Download Again", (d, which) -> triggerDownload(activity, item, dlBtn, isDark))
                        .setNegativeButton("Cancel", null)
                        .show();
            } else {
                triggerDownload(activity, item, dlBtn, isDark);
            }
        });
        actions.addView(dlBtn);
        card.addView(actions);
        return card;
    }

    private static void triggerDownload(final Activity activity, final MediaItem item, final Button dlBtn, final boolean isDark) {
        if (item.type == MediaType.DASH_STREAM) {
            Toast.makeText(activity, "DASH (.mpd) streams are not supported for download", Toast.LENGTH_LONG).show();
            return;
        }

        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) {
            if (activity.checkSelfPermission(android.Manifest.permission.WRITE_EXTERNAL_STORAGE) != android.content.pm.PackageManager.PERMISSION_GRANTED) {
                try {
                    activity.requestPermissions(new String[]{android.Manifest.permission.WRITE_EXTERNAL_STORAGE}, 102);
                } catch (Throwable ignored) {}
                Toast.makeText(activity, "Please grant storage permission and try again", Toast.LENGTH_LONG).show();
                return;
            }
        }

        ACTIVE_DOWNLOAD_URLS.add(item.url);
        dlBtn.setText("DOWNLOADING...");
        dlBtn.setEnabled(false);
        styleButton(dlBtn, Color.parseColor(isDark ? "#4A2800" : "#FFE0B2"), Color.parseColor(isDark ? "#FFA726" : "#E65100"), dp(activity, 6));

        if (item.type == MediaType.HLS_STREAM && item.variants.size() > 1) {
            showQualitySelectorAndDownload(activity, item, dlBtn, isDark);
        } else if (item.type == MediaType.HLS_STREAM) {
            item.trackingUrl = item.url;
            registerButtonCompletionCallback(item.url, activity, dlBtn, isDark);
            startMediaDownload(activity, item, dlBtn);
        } else {
            startDirectDownloadNative(activity, item, dlBtn, isDark);
        }
    }

    private static String extractPathLower(String url) {
        if (url == null || url.isEmpty()) return "";
        try {
            String path = Uri.parse(url).getPath();
            return path != null ? path.toLowerCase(Locale.ROOT) : "";
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static void startDirectDownloadNative(final Activity activity, final MediaItem item, final Button dlBtn, final boolean isDark) {
        String[] fmt = MediaItem.resolveContainerFormat(item.mimeType, item.url, item.type);
        String ext = fmt[0];
        String defaultMime = fmt[1];

        final String resolvedMime = NetworkSafety.sanitizeMimeType(item.mimeType, defaultMime);
        String clean = getCleanFileName(item.url);
        String lowerClean = clean.toLowerCase(Locale.ROOT);
        if (lowerClean.equals("videoplayback") || lowerClean.equals("video") || lowerClean.equals("media")
                || lowerClean.equals("index") || lowerClean.equals("master") || lowerClean.equals("playlist")) {
            String titleBase = (item.title != null && !item.title.trim().isEmpty())
                    ? item.title.trim().replaceAll("[^a-zA-Z0-9._-]", "_")
                    : "video";
            if (titleBase.length() > 40) titleBase = titleBase.substring(0, 40);
            String shortHash = Integer.toHexString(item.url.hashCode());
            clean = titleBase + "_" + shortHash + ext;
        }
        final String filename = clean.contains(".") ? clean : (clean + ext);

        // Distinguish RELAY_TRANSFERRED (handed over loopback socket to Brave DownloadManager; final disk write is native-owned)
        // from verified DOWNLOAD_COMPLETED in MediaDownloadService.
        final java.util.function.Consumer<Boolean> updateButtonOnRelayHandoff = (transferred) -> {
            ACTIVE_DOWNLOAD_URLS.remove(item.url);
            new Handler(Looper.getMainLooper()).post(() -> {
                dlBtn.setEnabled(true);
                if (transferred) {
                    dlBtn.setText("IN BRAVE DOWNLOADS");
                    styleButton(dlBtn, Color.parseColor(isDark ? "#0D3B5E" : "#D6EAFA"), Color.parseColor(isDark ? "#90CAF9" : "#0D47A1"), dp(activity, 6));
                } else {
                    dlBtn.setText("Download");
                    styleButton(dlBtn, Color.parseColor("#FF5500"), Color.WHITE, dp(activity, 6));
                    Toast.makeText(activity, "Download failed for " + filename, Toast.LENGTH_SHORT).show();
                }
            });
        };

        // 0. Adaptive HD YouTube Video + Audio mux path
        if (item.audioUrl != null && !item.audioUrl.isEmpty()) {
            Toast.makeText(activity, "Preparing HD video + audio: " + filename, Toast.LENGTH_SHORT).show();
            LocalDownloadRelay.startMuxedDownload(
                    activity.getCacheDir(),
                    item,
                    filename,
                    null,
                    muxRelayUrl -> {
                        if (!triggerChromiumNativeDownload(activity, muxRelayUrl)) {
                            LocalDownloadRelay.stopRelay(muxRelayUrl);
                            updateButtonOnRelayHandoff.accept(false);
                        }
                    },
                    updateButtonOnRelayHandoff
            );
            return;
        }

        // 1. Primary path: Stream via authenticated LocalDownloadRelay into Brave's native DownloadManager.
        // If upstream returns HTTP 401/403 (e.g. HttpOnly session cookie missing from document.cookie),
        // retry once directly via Chromium's native DownloadManager which attaches full Profile cookies.
        final Runnable onAuthFallback = () -> {
            new Handler(Looper.getMainLooper()).post(() -> {
                String refPage = (item.pageUrl != null && !item.pageUrl.isEmpty()) ? item.pageUrl : item.referer;
                boolean safe = NetworkSafety.isAllowedTargetUrl(item.url, refPage);
                if (safe && triggerChromiumNativeDownload(activity, item.url)) {
                    Toast.makeText(activity, "Retrying with Chromium session cookies: " + filename, Toast.LENGTH_SHORT).show();
                    updateButtonOnRelayHandoff.accept(true);
                } else {
                    updateButtonOnRelayHandoff.accept(false);
                }
            });
        };

        String relayUrl = LocalDownloadRelay.startRelay(
                item, filename, resolvedMime, false, onAuthFallback,
                (transferred, actualServedName) -> updateButtonOnRelayHandoff.accept(transferred)
        );

        if (relayUrl != null && triggerChromiumNativeDownload(activity, relayUrl)) {
            Toast.makeText(activity, "Sending to Brave Downloads: " + filename, Toast.LENGTH_SHORT).show();
            return;
        }
        if (relayUrl != null) {
            LocalDownloadRelay.stopRelay(relayUrl);
        }

        // 2. Secure Fallback: MediaDownloadService (SSRF DNS-pinned, scheme/host-scoped cookies, verified disk completion)
        item.trackingUrl = item.url;
        registerButtonCompletionCallback(item.url, activity, dlBtn, isDark);
        startMediaDownload(activity, item, dlBtn);
    }

    private static void showQualitySelectorAndDownload(
            final Activity activity,
            final MediaItem item,
            final Button dlBtn,
            final boolean isDark
    ) {
        final List<MediaItem.HlsVariant> variants = new ArrayList<>(item.variants);
        Collections.sort(variants);
        String[] labels = new String[variants.size()];
        for (int i = 0; i < variants.size(); i++) {
            MediaItem.HlsVariant v = variants.get(i);
            labels[i] = v.getResolutionLabel() + (v.bandwidth > 0 ? (" (" + (v.bandwidth / 1000) + " kbps)") : "");
        }

        final Runnable cancelAction = () -> {
            ACTIVE_DOWNLOAD_URLS.remove(item.url);
            dlBtn.setText("Download");
            dlBtn.setEnabled(true);
            styleButton(dlBtn, Color.parseColor("#FF5500"), Color.WHITE, dp(activity, 6));
        };

        new AlertDialog.Builder(activity)
                .setTitle("Select Stream Quality")
                .setItems(labels, (d, which) -> {
                    MediaItem.HlsVariant chosen = variants.get(which);
                    MediaItem chosenItem = new MediaItem(
                            item.id, item.type, chosen.url,
                            item.title + " (" + chosen.getResolutionLabel() + ")",
                            item.mimeType, item.sizeBytes, chosen.width, chosen.height,
                            item.durationMs, item.userAgent, item.cookie, item.referer, item.tabId
                    );
                    chosenItem.trackingUrl = item.url;
                    chosenItem.audioUrl = chosen.audioPlaylistUrl != null ? chosen.audioPlaylistUrl : "";
                    chosenItem.cookieSourceUrl = item.cookieSourceUrl;
                    chosenItem.pageUrl = item.pageUrl;
                    registerButtonCompletionCallback(item.url, activity, dlBtn, isDark);
                    startMediaDownload(activity, chosenItem, dlBtn);
                })
                .setNegativeButton("Cancel", (d, which) -> cancelAction.run())
                .setOnCancelListener(d -> cancelAction.run())
                .show();
    }

    private static View createImageCard(
            final Activity activity,
            final MediaItem item,
            final int index,
            final CheckBox cb,
            boolean isDark,
            int cardBg,
            int textColor,
            int subTextColor,
            final Set<MediaItem> selected,
            final DragSelectListener dragListener
    ) {
        final LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams rowLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        rowLp.bottomMargin = dp(activity, 8);
        row.setLayoutParams(rowLp);
        row.setPadding(dp(activity, 10), dp(activity, 8), dp(activity, 10), dp(activity, 8));

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(cardBg);
        bg.setCornerRadius(dp(activity, 8));
        row.setBackground(bg);

        cb.setOnClickListener(v -> {
            if (cb.isChecked()) selected.add(item);
            else selected.remove(item);
            if (dragListener != null) dragListener.onSelectionUpdated();
        });
        row.addView(cb);

        LinearLayout textCol = new LinearLayout(activity);
        textCol.setOrientation(LinearLayout.VERTICAL);
        textCol.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

        TextView title = new TextView(activity);
        boolean downloaded = PatchPrefs.isMediaDownloaded(activity, item.url);
        title.setText(downloaded ? ("✓ " + item.title) : item.title);
        title.setTextColor(downloaded ? Color.parseColor(isDark ? "#81C784" : "#155724") : textColor);
        title.setTextSize(13);
        title.setSingleLine(true);
        title.setEllipsize(android.text.TextUtils.TruncateAt.END);
        textCol.addView(title);

        TextView sub = new TextView(activity);
        String dim = (item.width > 0 && item.height > 0) ? (item.width + "x" + item.height + " • ") : "";
        sub.setText(dim + item.url);
        sub.setTextColor(subTextColor);
        sub.setTextSize(11);
        sub.setSingleLine(true);
        sub.setEllipsize(android.text.TextUtils.TruncateAt.MIDDLE);
        textCol.addView(sub);
        row.addView(textCol);

        ImageView imgThumb = new ImageView(activity);
        LinearLayout.LayoutParams imgThumbLp = new LinearLayout.LayoutParams(dp(activity, 54), dp(activity, 54));
        imgThumbLp.leftMargin = dp(activity, 10);
        imgThumb.setLayoutParams(imgThumbLp);
        imgThumb.setScaleType(ImageView.ScaleType.CENTER_CROP);
        GradientDrawable itBg = new GradientDrawable();
        itBg.setColor(Color.parseColor("#222226"));
        itBg.setCornerRadius(dp(activity, 6));
        imgThumb.setBackground(itBg);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) imgThumb.setClipToOutline(true);
        ThumbnailLoader.load(imgThumb, item.url, item.referer);
        row.addView(imgThumb);

        View.OnLongClickListener longClick = v -> {
            if (dragListener != null) {
                dragListener.onStartDrag(index, row);
                return true;
            }
            return false;
        };
        row.setOnLongClickListener(longClick);
        cb.setOnLongClickListener(longClick);

        View.OnTouchListener touchListener = (v, event) -> {
            if (dragListener != null) {
                int action = event.getActionMasked();
                if (action == MotionEvent.ACTION_MOVE && dragListener.isDragging()) {
                    dragListener.onTouchMove((int) event.getRawY());
                    return true;
                } else if ((action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) && dragListener.isDragging()) {
                    dragListener.onEndDrag();
                    return true;
                }
            }
            return false;
        };
        row.setOnTouchListener(touchListener);
        cb.setOnTouchListener(touchListener);

        row.setOnClickListener(v -> {
            cb.setChecked(!cb.isChecked());
            if (cb.isChecked()) selected.add(item);
            else selected.remove(item);
            if (dragListener != null) dragListener.onSelectionUpdated();
        });

        return row;
    }

    private static void startMediaDownload(Context ctx, MediaItem item, Button dlBtn) {
        String jobId = UUID.randomUUID().toString();
        try {
            MediaDownloadService.PENDING_JOBS.put(jobId, item);
            Intent intent = new Intent(ctx, MediaDownloadService.class);
            intent.setAction(MediaDownloadService.ACTION_DOWNLOAD_MEDIA);
            intent.putExtra(MediaDownloadService.EXTRA_JOB_ID, jobId);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) ctx.startForegroundService(intent);
            else ctx.startService(intent);
            String toastMsg = (item.type == MediaType.HLS_STREAM) ? "Starting HLS download..." : "Starting download...";
            Toast.makeText(ctx, toastMsg, Toast.LENGTH_SHORT).show();
        } catch (Throwable t) {
            MediaDownloadService.PENDING_JOBS.remove(jobId);
            ACTIVE_DOWNLOAD_URLS.remove(item.url);
            if (item.trackingUrl != null && !item.trackingUrl.isEmpty()) {
                ACTIVE_DOWNLOAD_URLS.remove(item.trackingUrl);
                DOWNLOAD_UI_CALLBACKS.remove(item.trackingUrl);
            }
            DOWNLOAD_UI_CALLBACKS.remove(item.url);
            if (dlBtn != null) {
                dlBtn.setText("Download");
                dlBtn.setEnabled(true);
                styleButton(dlBtn, Color.parseColor("#FF5500"), Color.WHITE, dp(ctx, 6));
            }
            Toast.makeText(ctx, "Failed starting download service: " + t.getMessage(), Toast.LENGTH_LONG).show();
        }
    }

    private static void startBulkImageDownload(Context ctx, List<MediaItem> images, boolean convertWebp) {
        String jobId = UUID.randomUUID().toString();
        try {
            MediaDownloadService.PENDING_JOBS.put(jobId, new ArrayList<>(images));
            Intent intent = new Intent(ctx, MediaDownloadService.class);
            intent.setAction(MediaDownloadService.ACTION_DOWNLOAD_IMAGES);
            intent.putExtra(MediaDownloadService.EXTRA_JOB_ID, jobId);
            intent.putExtra(MediaDownloadService.EXTRA_CONVERT_WEBP, convertWebp);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) ctx.startForegroundService(intent);
            else ctx.startService(intent);
            Toast.makeText(ctx, "Downloading " + images.size() + " images...", Toast.LENGTH_SHORT).show();
        } catch (Throwable t) {
            MediaDownloadService.PENDING_JOBS.remove(jobId);
            sBulkImagesDownloading = false;
            Toast.makeText(ctx, "Failed starting image download: " + t.getMessage(), Toast.LENGTH_LONG).show();
        }
    }

    private static Button createTabButton(Context ctx, String text, boolean active, int accent, int textColor, int cardBg) {
        Button btn = new Button(ctx);
        btn.setText(text);
        btn.setTextSize(12);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, dp(ctx, 36), 1.0f);
        lp.setMargins(dp(ctx, 4), 0, dp(ctx, 4), 0);
        btn.setLayoutParams(lp);
        setTabActive(ctx, btn, active, accent, cardBg);
        return btn;
    }

    private static void setTabActive(Context ctx, Button btn, boolean active, int accent, int cardBg) {
        GradientDrawable gd = new GradientDrawable();
        gd.setCornerRadius(dp(ctx, 18));
        if (active) {
            gd.setColor(accent);
            btn.setTextColor(Color.WHITE);
        } else {
            gd.setColor(cardBg);
            btn.setTextColor(Color.GRAY);
        }
        btn.setBackground(gd);
    }

    private static void styleButton(Button btn, int bgColor, int textColor, int radiusDp) {
        GradientDrawable gd = new GradientDrawable();
        gd.setColor(bgColor);
        gd.setCornerRadius(dp(btn.getContext(), radiusDp));
        btn.setBackground(gd);
        btn.setTextColor(textColor);
        btn.setTextSize(12);
    }

    private static TextView createEmptyState(Context ctx, String msg, int color) {
        TextView tv = new TextView(ctx);
        tv.setText(msg);
        tv.setTextColor(color);
        tv.setTextSize(13);
        tv.setGravity(Gravity.CENTER);
        tv.setPadding(0, dp(ctx, 40), 0, dp(ctx, 40));
        return tv;
    }

    private static boolean isDarkTheme(Context ctx) {
        int nightMode = ctx.getResources().getConfiguration().uiMode & android.content.res.Configuration.UI_MODE_NIGHT_MASK;
        return nightMode == android.content.res.Configuration.UI_MODE_NIGHT_YES;
    }

    private static int dp(Context ctx, int dp) {
        return Math.round(dp * ctx.getResources().getDisplayMetrics().density);
    }
}
