package app.southstar21.extension.instagram.profilepicture;

import android.Manifest;
import android.animation.ValueAnimator;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Dialog;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.util.Log;
import android.view.GestureDetector;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.PathInterpolator;
import android.view.ViewOutlineProvider;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Fullscreen viewer for a profile picture: shows the small picture straight away, swaps in
 * the full size one once it's downloaded, and saves it to Pictures/Instagram. Pinch or
 * double tap to zoom, tap to hide the controls, swipe down to close.
 * <p>
 * It opens by growing the profile page's avatar from where it sits into the fullscreen
 * picture, rounding from a circle into a square while the background fades in, and closes
 * by shrinking back into it.
 */
final class ProfilePictureViewer {
    private static final String TAG = "ViewProfilePicture";
    private static final ExecutorService executor = Executors.newCachedThreadPool();
    private static final Handler main = new Handler(Looper.getMainLooper());
    private static final int MAX_BYTES = 20 * 1024 * 1024;
    private static final int MAX_SIDE = 4096;

    private final Activity activity;
    private final View anchor;
    /** The avatar's image view inside {@link #anchor}, hidden while the picture flies from it. */
    private final ImageView sourceImage;
    private final String username;
    private final float density;
    private final Dialog dialog;
    private final FrameLayout root;
    private final ColorDrawable background;
    /** Holds the picture; moved, scaled and clipped for the transitions. */
    private final FrameLayout stage;
    private final ZoomImageView image;
    private final ProgressBar progress;
    private final TextView info;
    private final View controls;
    private final IconButton saveButton;

    /** The picture currently shown, as downloaded, so saving doesn't re-encode it. */
    private byte[] bytes;
    private String mimeType;
    private boolean isFullSize;
    private boolean saving;

    /**
     * @param anchor the view that was long pressed, which the picture opens from and closes
     *               back into.
     */
    static void show(Activity activity, View anchor, String username, String smallUrl, String hdUrl) {
        new ProfilePictureViewer(activity, anchor, username).load(smallUrl, hdUrl);
    }

    @SuppressLint("SetTextI18n")
    private ProfilePictureViewer(Activity activity, View anchor, String username) {
        this.activity = activity;
        this.anchor = anchor;
        this.sourceImage = largestImage(anchor);
        this.username = username;
        this.density = activity.getResources().getDisplayMetrics().density;

        root = new FrameLayout(activity);
        background = new ColorDrawable(Color.BLACK);
        background.setAlpha(0);
        root.setBackground(background);

        stage = new FrameLayout(activity);
        stage.setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View view, Outline outline) {
                float radius = corner * Math.min(pictureRect.width(), pictureRect.height());
                outline.setRoundRect(Math.round(pictureRect.left), Math.round(pictureRect.top),
                        Math.round(pictureRect.right), Math.round(pictureRect.bottom), radius);
            }
        });
        root.addView(stage, match());

        image = new ZoomImageView(activity);
        image.onTap = this::toggleControls;
        image.dragListener = new ZoomImageView.DragListener() {
            @Override
            public void onDrag(float dy) {
                drag(dy);
            }

            @Override
            public void onDragEnd(float dy, float velocityY) {
                endDrag(dy, velocityY);
            }
        };
        stage.addView(image, match());

        // Instagram's already loaded avatar, so there's a picture to fly from straight away.
        Bitmap placeholder = sourceImage == null ? null : bitmapOf(sourceImage);
        if (placeholder != null) image.setPicture(placeholder);

        progress = new ProgressBar(activity);
        progress.setIndeterminate(true);
        progress.setAlpha(0f);
        int size = dp(40);
        root.addView(progress, new FrameLayout.LayoutParams(size, size, Gravity.CENTER));

        // Top bar: close, username, save.
        LinearLayout bar = new LinearLayout(activity);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPadding(dp(4), dp(4), dp(4), dp(4));
        GradientDrawable shade = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,
                new int[]{0x99000000, 0x00000000});
        bar.setBackground(shade);

        IconButton close = new IconButton(activity, IconButton.CLOSE);
        close.setContentDescription("Close");
        close.setOnClickListener(v -> close());
        bar.addView(close, new LinearLayout.LayoutParams(dp(48), dp(48)));

        TextView title = new TextView(activity);
        title.setText(username != null ? username : "Profile picture");
        title.setTextColor(Color.WHITE);
        title.setTextSize(16);
        title.setTypeface(title.getTypeface(), android.graphics.Typeface.BOLD);
        title.setSingleLine(true);
        title.setEllipsize(android.text.TextUtils.TruncateAt.END);
        title.setPadding(dp(8), 0, dp(8), 0);
        bar.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        saveButton = new IconButton(activity, IconButton.DOWNLOAD);
        saveButton.setContentDescription("Save");
        saveButton.setOnClickListener(v -> save());
        saveButton.setEnabled(false);
        bar.addView(saveButton, new LinearLayout.LayoutParams(dp(48), dp(48)));

        // Bottom: the resolution, so it's clear whether the full size picture loaded.
        info = new TextView(activity);
        info.setTextColor(0xCCFFFFFF);
        info.setTextSize(13);
        info.setGravity(Gravity.CENTER);
        info.setPadding(dp(16), dp(24), dp(16), dp(20));
        info.setBackground(new GradientDrawable(GradientDrawable.Orientation.BOTTOM_TOP,
                new int[]{0x99000000, 0x00000000}));

        FrameLayout controlsLayer = new FrameLayout(activity);
        controlsLayer.addView(bar, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP));
        controlsLayer.addView(info, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM));
        controls = controlsLayer;
        controls.setAlpha(0f);
        root.addView(controlsLayer, match());

        // The picture goes edge to edge, behind the status and navigation bars, so keep the
        // controls clear of them (and of a notch in landscape).
        root.setOnApplyWindowInsetsListener((v, insets) -> {
            int left, top, right, bottom;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars()
                        | WindowInsets.Type.displayCutout());
                left = bars.left;
                top = bars.top;
                right = bars.right;
                bottom = bars.bottom;
            } else {
                left = insets.getSystemWindowInsetLeft();
                top = insets.getSystemWindowInsetTop();
                right = insets.getSystemWindowInsetRight();
                bottom = insets.getSystemWindowInsetBottom();
                android.view.DisplayCutout cutout = insets.getDisplayCutout();
                if (cutout != null) {
                    left = Math.max(left, cutout.getSafeInsetLeft());
                    top = Math.max(top, cutout.getSafeInsetTop());
                    right = Math.max(right, cutout.getSafeInsetRight());
                }
            }
            bar.setPadding(dp(4) + left, dp(4) + top, dp(4) + right, dp(4));
            info.setPadding(dp(16) + left, dp(24), dp(16) + right, dp(20) + bottom);
            return insets;
        });

        dialog = new Dialog(activity, android.R.style.Theme_DeviceDefault_NoActionBar) {
            @Override
            public void onBackPressed() {
                close();
            }
        };
        dialog.setContentView(root);
        // Never leave the avatar hidden, however the viewer goes away.
        dialog.setOnDismissListener(d -> {
            if (sourceImage != null) sourceImage.setAlpha(1f);
        });
        Window window = dialog.getWindow();
        if (window != null) {
            window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            // Transparent, so the profile page shows until the background fades in.
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            window.setDimAmount(0f);
            window.setWindowAnimations(0);
            window.setStatusBarColor(Color.TRANSPARENT);
            window.setNavigationBarColor(Color.TRANSPARENT);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                window.getAttributes().layoutInDisplayCutoutMode =
                        WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                window.setDecorFitsSystemWindows(false);
                WindowInsetsController controller = window.getInsetsController();
                if (controller != null) {
                    // White status and navigation bar icons on the dark viewer.
                    controller.setSystemBarsAppearance(0, WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                            | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
                }
            } else {
                root.setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                        | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                        | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION);
            }
        }
        dialog.show();
        root.requestApplyInsets();
        root.getViewTreeObserver().addOnPreDrawListener(new android.view.ViewTreeObserver.OnPreDrawListener() {
            @Override
            public boolean onPreDraw() {
                if (root.getWidth() == 0) return true;
                root.getViewTreeObserver().removeOnPreDrawListener(this);
                open();
                return true;
            }
        });
    }

    // region Transitions

    private static final long OPEN_MS = 360;
    private static final long CLOSE_MS = 300;
    private static final long SETTLE_MS = 240;
    private static final PathInterpolator EMPHASIZED = new PathInterpolator(0.2f, 0f, 0f, 1f);
    private static final PathInterpolator STANDARD = new PathInterpolator(0.3f, 0f, 0.1f, 1f);

    /** The picture's rect in the stage at rest, which the outline clips to. */
    private final RectF pictureRect = new RectF();
    private float tx, ty, scale = 1f;
    /** Outline corner radius, as a fraction of the picture's shorter side: 0.5 is a circle. */
    private float corner;
    private ValueAnimator transition;
    private boolean closing;

    private interface Frame {
        void at(float t);
    }

    private void open() {
        image.fittedRect(pictureRect);
        RectF avatar = avatarRect();
        if (avatar != null) {
            toAvatar(avatar);
            stage.setAlpha(1f);
            if (sourceImage != null) sourceImage.setAlpha(0f);
        } else {
            // Avatar not on screen: grow in from the middle instead.
            scaleAboutCenter(0.86f, 0f);
            corner = 0.08f;
            stage.setAlpha(0f);
        }
        stage.setClipToOutline(true);
        applyStage();

        float fromTx = tx, fromTy = ty, fromScale = scale, fromCorner = corner, fromAlpha = stage.getAlpha();
        run(OPEN_MS, EMPHASIZED, t -> {
            tx = lerp(fromTx, 0, t);
            ty = lerp(fromTy, 0, t);
            scale = lerp(fromScale, 1, t);
            corner = lerp(fromCorner, 0, t);
            stage.setAlpha(lerp(fromAlpha, 1, Math.min(1f, t * 2)));
            background.setAlpha(Math.round(255 * t));
            applyStage();
        }, () -> stage.setClipToOutline(false));

        controls.setTranslationY(-dp(8));
        controls.animate().alpha(1f).translationY(0).setStartDelay(OPEN_MS / 2).setDuration(220)
                .setInterpolator(STANDARD).start();
        progress.animate().alpha(1f).setStartDelay(OPEN_MS).setDuration(200).start();
    }

    /** Closes the viewer, shrinking the picture back into the avatar if it's still on screen. */
    private void close() {
        if (closing) return;
        closing = true;
        if (transition != null) transition.cancel();
        // Measure where the picture sits unzoomed, but keep it where it is on screen.
        image.resetZoom();
        image.fittedRect(pictureRect);
        controls.animate().cancel();
        controls.animate().alpha(0f).setStartDelay(0).setDuration(120).start();
        progress.animate().cancel();
        progress.animate().alpha(0f).setStartDelay(0).setDuration(120).start();
        stage.setClipToOutline(true);

        float fromTx = tx, fromTy = ty, fromScale = scale, fromCorner = corner;
        float fromBackground = background.getAlpha() / 255f;
        RectF avatar = avatarRect();
        float toTx, toTy, toScale, toCorner, toAlpha;
        if (avatar != null) {
            toAvatar(avatar);
            toAlpha = 1f;
        } else {
            scaleAboutCenter(0.86f, fromTy + dp(48));
            corner = 0.08f;
            toAlpha = 0f;
        }
        toTx = tx;
        toTy = ty;
        toScale = scale;
        toCorner = corner;
        float fromAlpha = stage.getAlpha();
        tx = fromTx;
        ty = fromTy;
        scale = fromScale;
        corner = fromCorner;

        run(CLOSE_MS, STANDARD, t -> {
            tx = lerp(fromTx, toTx, t);
            ty = lerp(fromTy, toTy, t);
            scale = lerp(fromScale, toScale, t);
            corner = lerp(fromCorner, toCorner, t);
            stage.setAlpha(lerp(fromAlpha, toAlpha, t));
            background.setAlpha(Math.round(255 * fromBackground * (1 - t)));
            applyStage();
        }, () -> {
            if (sourceImage != null) sourceImage.setAlpha(1f);
            dismiss();
        });
    }

    /** Follows a downward (or upward) drag: the picture shrinks a little and the page shows. */
    private void drag(float dy) {
        if (closing || (transition != null && transition.isRunning())) return;
        image.fittedRect(pictureRect);
        float progress = Math.min(1f, Math.abs(dy) / (root.getHeight() * 0.45f));
        scaleAboutCenter(1f - 0.25f * progress, dy);
        corner = 0.06f * progress;
        stage.setClipToOutline(true);
        background.setAlpha(Math.round(255 * (1f - progress)));
        if (controls.getVisibility() == View.VISIBLE) controls.setAlpha(1f - Math.min(1f, progress * 3));
        if (sourceImage != null) sourceImage.setAlpha(0f);
        applyStage();
    }

    private void endDrag(float dy, float velocityY) {
        if (closing) return;
        boolean flung = Math.abs(velocityY) > dp(900) && Math.signum(velocityY) == Math.signum(dy);
        if (Math.abs(dy) > dp(110) || flung) {
            close();
            return;
        }
        // Not far enough: settle back.
        float fromTx = tx, fromTy = ty, fromScale = scale, fromCorner = corner;
        float fromBackground = background.getAlpha() / 255f;
        float fromControls = controls.getAlpha();
        run(SETTLE_MS, STANDARD, t -> {
            tx = lerp(fromTx, 0, t);
            ty = lerp(fromTy, 0, t);
            scale = lerp(fromScale, 1, t);
            corner = lerp(fromCorner, 0, t);
            background.setAlpha(Math.round(255 * lerp(fromBackground, 1, t)));
            if (controls.getVisibility() == View.VISIBLE) controls.setAlpha(lerp(fromControls, 1, t));
            applyStage();
        }, () -> stage.setClipToOutline(false));
    }

    /** Sets the transform that puts the picture exactly over the avatar, as a circle. */
    private void toAvatar(RectF avatar) {
        float side = Math.min(avatar.width(), avatar.height());
        scale = side / Math.min(pictureRect.width(), pictureRect.height());
        tx = avatar.centerX() - scale * pictureRect.centerX();
        ty = avatar.centerY() - scale * pictureRect.centerY();
        corner = 0.5f;
    }

    /** Scales the picture about its own center, then moves it down by {@code dy}. */
    private void scaleAboutCenter(float s, float dy) {
        scale = s;
        tx = pictureRect.centerX() * (1 - s);
        ty = pictureRect.centerY() * (1 - s) + dy;
    }

    private void applyStage() {
        stage.setPivotX(0);
        stage.setPivotY(0);
        stage.setTranslationX(tx);
        stage.setTranslationY(ty);
        stage.setScaleX(scale);
        stage.setScaleY(scale);
        stage.invalidateOutline();
    }

    private void run(long duration, PathInterpolator interpolator, Frame frame, Runnable end) {
        if (transition != null) transition.cancel();
        ValueAnimator animator = ValueAnimator.ofFloat(0f, 1f);
        animator.setDuration(duration);
        animator.setInterpolator(interpolator);
        animator.addUpdateListener(a -> frame.at((float) a.getAnimatedValue()));
        animator.addListener(new android.animation.AnimatorListenerAdapter() {
            private boolean cancelled;

            @Override
            public void onAnimationCancel(android.animation.Animator animation) {
                cancelled = true;
            }

            @Override
            public void onAnimationEnd(android.animation.Animator animation) {
                if (!cancelled && end != null) end.run();
            }
        });
        transition = animator;
        animator.start();
    }

    private static float lerp(float from, float to, float t) {
        return from + (to - from) * t;
    }

    /** Where the avatar is, in the viewer's coordinates, or null if it's gone or off screen. */
    private RectF avatarRect() {
        View source = sourceImage != null ? sourceImage : anchor;
        if (source == null || !source.isAttachedToWindow() || !source.isShown()
                || source.getWidth() == 0 || root.getWidth() == 0) {
            return null;
        }
        int[] at = new int[2];
        int[] origin = new int[2];
        source.getLocationOnScreen(at);
        root.getLocationOnScreen(origin);
        float left = at[0] - origin[0], top = at[1] - origin[1];
        RectF rect = new RectF(left, top, left + source.getWidth(), top + source.getHeight());
        if (!RectF.intersects(rect, new RectF(0, 0, root.getWidth(), root.getHeight()))) return null;
        return rect;
    }

    /** The biggest image view with a picture in it, which is the avatar inside its frame. */
    private static ImageView largestImage(View view) {
        if (view == null || view.getVisibility() != View.VISIBLE) return null;
        if (view instanceof ImageView) {
            return ((ImageView) view).getDrawable() != null ? (ImageView) view : null;
        }
        ImageView best = null;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                ImageView found = largestImage(group.getChildAt(i));
                if (found != null && (best == null
                        || found.getWidth() * found.getHeight() > best.getWidth() * best.getHeight())) {
                    best = found;
                }
            }
        }
        return best;
    }

    private static Bitmap bitmapOf(ImageView view) {
        try {
            Drawable drawable = view.getDrawable();
            if (drawable instanceof BitmapDrawable) {
                Bitmap bitmap = ((BitmapDrawable) drawable).getBitmap();
                if (bitmap != null && !bitmap.isRecycled()) return bitmap;
            }
            int w = drawable.getIntrinsicWidth() > 0 ? drawable.getIntrinsicWidth() : view.getWidth();
            int h = drawable.getIntrinsicHeight() > 0 ? drawable.getIntrinsicHeight() : view.getHeight();
            if (w <= 0 || h <= 0) return null;
            Bitmap bitmap = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
            Rect bounds = drawable.copyBounds();
            drawable.setBounds(0, 0, w, h);
            drawable.draw(new Canvas(bitmap));
            drawable.setBounds(bounds);
            return bitmap;
        } catch (Throwable t) {
            // E.g. a hardware bitmap that can't be drawn in software; the download will do.
            return null;
        }
    }

    // endregion

    // region Loading

    private void load(String smallUrl, String hdUrl) {
        // The small picture is a few KB, so something shows while the full size one loads.
        if (smallUrl != null && !smallUrl.equals(hdUrl)) fetch(smallUrl, false);
        if (hdUrl != null) {
            fetch(hdUrl, true);
        } else {
            info.setText("Full size picture not available");
        }
    }

    private void fetch(String url, boolean fullSize) {
        executor.execute(() -> {
            try {
                Download download = download(url);
                Bitmap bitmap = decode(download.data);
                if (bitmap == null) throw new IllegalStateException("Not an image");
                main.post(() -> onLoaded(download, bitmap, fullSize));
            } catch (Throwable t) {
                Log.e(TAG, "Failed to load " + (fullSize ? "full size" : "small") + " picture", t);
                main.post(() -> onFailed(fullSize));
            }
        });
    }

    private void onLoaded(Download download, Bitmap bitmap, boolean fullSize) {
        if (!dialog.isShowing()) return;
        // The small picture can arrive after the full size one.
        if (isFullSize && !fullSize) return;
        isFullSize = fullSize;
        bytes = download.data;
        mimeType = download.mimeType;
        image.setPicture(bitmap);
        saveButton.setEnabled(true);
        if (fullSize) progress.setVisibility(View.GONE);
        info.setText(String.format(Locale.US, "%d × %d%s", bitmap.getWidth(), bitmap.getHeight(),
                fullSize ? "" : "  ·  loading full size…"));
    }

    private void onFailed(boolean fullSize) {
        if (!dialog.isShowing()) return;
        if (fullSize) {
            progress.setVisibility(View.GONE);
            if (bytes == null) {
                info.setText("Couldn't load the picture");
            } else {
                info.setText(info.getText().toString().replace("  ·  loading full size…",
                        "  ·  full size failed to load"));
            }
        } else if (!isFullSize && bytes == null) {
            info.setText("Loading full size…");
        }
    }

    private static final class Download {
        final byte[] data;
        final String mimeType;

        Download(byte[] data, String mimeType) {
            this.data = data;
            this.mimeType = mimeType;
        }
    }

    private static Download download(String url) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setConnectTimeout(15000);
        connection.setReadTimeout(20000);
        try {
            int code = connection.getResponseCode();
            if (code / 100 != 2) throw new IllegalStateException("HTTP " + code);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            try (InputStream in = connection.getInputStream()) {
                byte[] buffer = new byte[16 * 1024];
                int read;
                while ((read = in.read(buffer)) != -1) {
                    out.write(buffer, 0, read);
                    if (out.size() > MAX_BYTES) throw new IllegalStateException("Too large");
                }
            }
            String type = connection.getContentType();
            if (type != null) type = type.split(";")[0].trim().toLowerCase(Locale.US);
            if (type == null || !type.startsWith("image/")) type = "image/jpeg";
            return new Download(out.toByteArray(), type);
        } finally {
            connection.disconnect();
        }
    }

    private static Bitmap decode(byte[] data) {
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(data, 0, data.length, bounds);
        BitmapFactory.Options options = new BitmapFactory.Options();
        int sample = 1;
        while (Math.max(bounds.outWidth, bounds.outHeight) / sample > MAX_SIDE) sample *= 2;
        options.inSampleSize = sample;
        return BitmapFactory.decodeByteArray(data, 0, data.length, options);
    }

    // endregion

    // region Saving

    private void save() {
        if (bytes == null || saving) return;
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q
                && activity.checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE)
                != PackageManager.PERMISSION_GRANTED) {
            activity.requestPermissions(new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE}, 0x5321);
            toast("Allow storage access, then tap save again");
            return;
        }
        saving = true;
        byte[] data = bytes;
        String mime = mimeType;
        String name = fileName(mime);
        Context app = activity.getApplicationContext();
        executor.execute(() -> {
            boolean ok;
            try {
                write(app, data, mime, name);
                ok = true;
            } catch (Throwable t) {
                Log.e(TAG, "Failed to save picture", t);
                ok = false;
            }
            boolean saved = ok;
            main.post(() -> {
                saving = false;
                toast(saved ? "Saved to Pictures/Instagram" : "Couldn't save the picture");
            });
        });
    }

    private String fileName(String mime) {
        String base = username == null ? "profile" : username.replaceAll("[^A-Za-z0-9._-]", "_");
        String extension;
        switch (mime) {
            case "image/webp":
                extension = "webp";
                break;
            case "image/png":
                extension = "png";
                break;
            case "image/heic":
                extension = "heic";
                break;
            default:
                extension = "jpg";
        }
        return base + "_profile_picture_" + System.currentTimeMillis() + "." + extension;
    }

    private static void write(Context context, byte[] data, String mime, String name) throws Exception {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            ContentResolver resolver = context.getContentResolver();
            ContentValues values = new ContentValues();
            values.put(MediaStore.Images.Media.DISPLAY_NAME, name);
            values.put(MediaStore.Images.Media.MIME_TYPE, mime);
            values.put(MediaStore.Images.Media.RELATIVE_PATH, Environment.DIRECTORY_PICTURES + "/Instagram");
            values.put(MediaStore.Images.Media.IS_PENDING, 1);
            Uri uri = resolver.insert(MediaStore.Images.Media.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY), values);
            if (uri == null) throw new IllegalStateException("MediaStore refused the file");
            try (OutputStream out = resolver.openOutputStream(uri)) {
                if (out == null) throw new IllegalStateException("No output stream");
                out.write(data);
            } catch (Exception e) {
                resolver.delete(uri, null, null);
                throw e;
            }
            values.clear();
            values.put(MediaStore.Images.Media.IS_PENDING, 0);
            resolver.update(uri, values, null, null);
        } else {
            File dir = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES),
                    "Instagram");
            if (!dir.isDirectory() && !dir.mkdirs()) throw new IllegalStateException("Can't create " + dir);
            File file = new File(dir, name);
            try (OutputStream out = new FileOutputStream(file)) {
                out.write(data);
            }
            MediaScannerConnection.scanFile(context, new String[]{file.getAbsolutePath()},
                    new String[]{mime}, null);
        }
    }

    // endregion

    private void toggleControls() {
        controls.animate().cancel();
        if (controls.getVisibility() != View.VISIBLE) {
            controls.setAlpha(0f);
            controls.setVisibility(View.VISIBLE);
            controls.animate().alpha(1f).setDuration(180).start();
        } else {
            // Invisible, not just transparent, so the buttons stop catching taps.
            controls.animate().alpha(0f).setDuration(180)
                    .withEndAction(() -> controls.setVisibility(View.INVISIBLE)).start();
        }
    }

    private void dismiss() {
        dialog.dismiss();
    }

    private void toast(String text) {
        Toast.makeText(activity, text, Toast.LENGTH_SHORT).show();
    }

    private int dp(float value) {
        return Math.round(value * density);
    }

    private static FrameLayout.LayoutParams match() {
        return new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT);
    }

    /** ImageView that fits its picture and zooms with pinch and double tap. */
    @SuppressLint({"ViewConstructor", "AppCompatCustomView"})
    private static final class ZoomImageView extends ImageView {
        private static final float MAX_SCALE = 6f;
        private static final float DOUBLE_TAP_SCALE = 2.5f;

        private final Matrix base = new Matrix();
        private final Matrix zoom = new Matrix();
        private final Matrix draw = new Matrix();
        private final RectF rect = new RectF();
        private final ScaleGestureDetector scaler;
        private final GestureDetector gestures;
        private float scale = 1f;
        Runnable onTap;
        DragListener dragListener;
        private boolean dragging;
        private float dragDy;
        private float flingVelocityY;

        /** Vertical drags while not zoomed, for swipe to close. */
        interface DragListener {
            void onDrag(float dy);

            void onDragEnd(float dy, float velocityY);
        }

        ZoomImageView(Context context) {
            super(context);
            setScaleType(ScaleType.MATRIX);
            scaler = new ScaleGestureDetector(context, new ScaleGestureDetector.SimpleOnScaleGestureListener() {
                @Override
                public boolean onScale(ScaleGestureDetector detector) {
                    float next = Math.max(1f, Math.min(MAX_SCALE, scale * detector.getScaleFactor()));
                    float factor = next / scale;
                    scale = next;
                    zoom.postScale(factor, factor, detector.getFocusX(), detector.getFocusY());
                    apply();
                    return true;
                }
            });
            gestures = new GestureDetector(context, new GestureDetector.SimpleOnGestureListener() {
                @Override
                public boolean onDown(MotionEvent e) {
                    return true;
                }

                @Override
                public boolean onScroll(MotionEvent e1, MotionEvent e2, float dx, float dy) {
                    if (scale <= 1f) {
                        // Raw coordinates: the view itself moves while it's dragged.
                        if (e1 == null || dragListener == null || scaler.isInProgress()
                                || e2.getPointerCount() > 1) {
                            return false;
                        }
                        float totalX = e2.getRawX() - e1.getRawX();
                        float totalY = e2.getRawY() - e1.getRawY();
                        if (!dragging && Math.abs(totalY) > Math.abs(totalX)) dragging = true;
                        if (dragging) {
                            dragDy = totalY;
                            dragListener.onDrag(totalY);
                        }
                        return true;
                    }
                    zoom.postTranslate(-dx, -dy);
                    apply();
                    return true;
                }

                @Override
                public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX, float velocityY) {
                    flingVelocityY = velocityY;
                    return false;
                }

                @Override
                public boolean onDoubleTap(MotionEvent e) {
                    if (scale > 1.01f) {
                        zoom.reset();
                        scale = 1f;
                    } else {
                        zoom.postScale(DOUBLE_TAP_SCALE, DOUBLE_TAP_SCALE, e.getX(), e.getY());
                        scale = DOUBLE_TAP_SCALE;
                    }
                    apply();
                    return true;
                }

                @Override
                public boolean onSingleTapConfirmed(MotionEvent e) {
                    if (onTap != null) onTap.run();
                    return true;
                }
            });
        }

        /** The picture's rect when not zoomed: fitted and centered. */
        void fittedRect(RectF out) {
            Drawable drawable = getDrawable();
            int w = getWidth(), h = getHeight();
            if (drawable == null || drawable.getIntrinsicWidth() <= 0 || drawable.getIntrinsicHeight() <= 0) {
                float side = Math.min(w, h);
                out.set((w - side) / 2f, (h - side) / 2f, (w + side) / 2f, (h + side) / 2f);
                return;
            }
            out.set(0, 0, drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight());
            base.mapRect(out);
        }

        void resetZoom() {
            zoom.reset();
            scale = 1f;
            apply();
        }

        /** Shows a picture, keeping the zoom: the small and full size ones have the same shape. */
        void setPicture(Bitmap bitmap) {
            setImageBitmap(bitmap);
            fit();
        }

        @Override
        protected void onSizeChanged(int w, int h, int oldw, int oldh) {
            super.onSizeChanged(w, h, oldw, oldh);
            fit();
        }

        private void fit() {
            Drawable drawable = getDrawable();
            int vw = getWidth(), vh = getHeight();
            if (drawable == null || vw == 0 || vh == 0) return;
            int dw = drawable.getIntrinsicWidth(), dh = drawable.getIntrinsicHeight();
            if (dw <= 0 || dh <= 0) return;
            float s = Math.min(vw / (float) dw, vh / (float) dh);
            base.setScale(s, s);
            base.postTranslate((vw - dw * s) / 2f, (vh - dh * s) / 2f);
            apply();
        }

        /** Keeps the picture centered when it's smaller than the view, and edge to edge when not. */
        private void apply() {
            Drawable drawable = getDrawable();
            if (drawable == null) return;
            draw.set(base);
            draw.postConcat(zoom);
            rect.set(0, 0, drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight());
            draw.mapRect(rect);
            float dx = offset(rect.left, rect.right, getWidth());
            float dy = offset(rect.top, rect.bottom, getHeight());
            if (dx != 0 || dy != 0) {
                zoom.postTranslate(dx, dy);
                draw.postTranslate(dx, dy);
            }
            setImageMatrix(draw);
        }

        private static float offset(float start, float end, int size) {
            float length = end - start;
            if (length <= size) return (size - length) / 2f - start;
            if (start > 0) return -start;
            if (end < size) return size - end;
            return 0;
        }

        @SuppressLint("ClickableViewAccessibility")
        @Override
        public boolean onTouchEvent(MotionEvent event) {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                dragging = false;
                dragDy = 0;
                flingVelocityY = 0;
            } else if (action == MotionEvent.ACTION_POINTER_DOWN && dragging) {
                // A second finger: it's a pinch, not a swipe.
                dragging = false;
                dragListener.onDragEnd(0, 0);
            }
            scaler.onTouchEvent(event);
            gestures.onTouchEvent(event);
            if ((action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) && dragging) {
                dragging = false;
                dragListener.onDragEnd(action == MotionEvent.ACTION_UP ? dragDy : 0,
                        action == MotionEvent.ACTION_UP ? flingVelocityY : 0);
            }
            return true;
        }
    }

    /** A white close or download icon, drawn in code like the menu's icons. */
    @SuppressLint("ViewConstructor")
    private static final class IconButton extends View {
        static final int CLOSE = 0;
        static final int DOWNLOAD = 1;

        private final int type;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final float density;

        IconButton(Context context, int type) {
            super(context);
            this.type = type;
            density = context.getResources().getDisplayMetrics().density;
            paint.setColor(Color.WHITE);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            paint.setStrokeWidth(2f * density);
            setClickable(true);
            setFocusable(true);
            android.util.TypedValue ripple = new android.util.TypedValue();
            if (context.getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless, ripple, true)) {
                setBackgroundResource(ripple.resourceId);
            }
        }

        @Override
        public void setEnabled(boolean enabled) {
            super.setEnabled(enabled);
            setAlpha(enabled ? 1f : 0.4f);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float s = 24 * density;
            float l = (getWidth() - s) / 2f, t = (getHeight() - s) / 2f;
            path.reset();
            if (type == CLOSE) {
                path.moveTo(l + s * 0.22f, t + s * 0.22f);
                path.lineTo(l + s * 0.78f, t + s * 0.78f);
                path.moveTo(l + s * 0.78f, t + s * 0.22f);
                path.lineTo(l + s * 0.22f, t + s * 0.78f);
            } else {
                // Arrow down into a tray.
                path.moveTo(l + s * 0.5f, t + s * 0.14f);
                path.lineTo(l + s * 0.5f, t + s * 0.64f);
                path.moveTo(l + s * 0.3f, t + s * 0.45f);
                path.lineTo(l + s * 0.5f, t + s * 0.65f);
                path.lineTo(l + s * 0.7f, t + s * 0.45f);
                path.moveTo(l + s * 0.16f, t + s * 0.66f);
                path.lineTo(l + s * 0.16f, t + s * 0.84f);
                path.lineTo(l + s * 0.84f, t + s * 0.84f);
                path.lineTo(l + s * 0.84f, t + s * 0.66f);
            }
            canvas.drawPath(path, paint);
        }
    }
}
