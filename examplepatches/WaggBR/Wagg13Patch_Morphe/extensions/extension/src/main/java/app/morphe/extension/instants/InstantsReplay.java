package app.morphe.extension.instants;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Outline;
import android.graphics.Path;
import android.graphics.SurfaceTexture;
import android.media.MediaPlayer;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.Surface;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

/**
 * Full-screen replay of the last passed Instant, laid out like a post of the viewer: the media in
 * the squircle frame and, below it, the author with the age of the post. A tap anywhere closes it.
 */
final class InstantsReplay {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final long POLL_MS = 250L;

    private InstantsReplay() {}

    static void show(Activity activity, InstantsGoBack.Snapshot snapshot) {
        final Dialog dialog = new Dialog(activity, android.R.style.Theme_Black_NoTitleBar_Fullscreen);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        final FrameLayout root = new FrameLayout(activity);
        root.setBackgroundColor(Color.BLACK);
        root.setOnClickListener(v -> dialog.dismiss());

        // Media frame: a square as wide as the screen allows, centered a bit above the middle.
        android.util.DisplayMetrics metrics = activity.getResources().getDisplayMetrics();
        int side = Math.round(Math.min(metrics.widthPixels * 0.92f, metrics.heightPixels * 0.55f));
        final SquircleFrame frame = new SquircleFrame(activity);
        FrameLayout.LayoutParams frameParams = new FrameLayout.LayoutParams(side, side);
        frameParams.gravity = Gravity.TOP | Gravity.CENTER_HORIZONTAL;
        frameParams.topMargin = Math.round(metrics.heightPixels * 0.17f);
        root.addView(frame, frameParams);

        final ProgressBar spinner = new ProgressBar(activity);
        FrameLayout.LayoutParams spinnerParams = new FrameLayout.LayoutParams(dp(activity, 40), dp(activity, 40));
        spinnerParams.gravity = Gravity.CENTER;
        frame.addView(spinner, spinnerParams);

        // Author row: avatar, name and age.
        final LinearLayout author = new LinearLayout(activity);
        author.setOrientation(LinearLayout.HORIZONTAL);
        author.setGravity(Gravity.CENTER_VERTICAL);
        FrameLayout.LayoutParams authorParams = new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.WRAP_CONTENT, FrameLayout.LayoutParams.WRAP_CONTENT);
        authorParams.gravity = Gravity.TOP | Gravity.CENTER_HORIZONTAL;
        authorParams.topMargin = frameParams.topMargin + side + dp(activity, 20);
        root.addView(author, authorParams);

        final ImageView avatar = new ImageView(activity);
        avatar.setScaleType(ImageView.ScaleType.CENTER_CROP);
        avatar.setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View view, Outline outline) {
                outline.setOval(0, 0, view.getWidth(), view.getHeight());
            }
        });
        avatar.setClipToOutline(true);
        author.addView(avatar, new LinearLayout.LayoutParams(dp(activity, 40), dp(activity, 40)));

        TextView name = new TextView(activity);
        name.setTextColor(Color.WHITE);
        name.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        name.setText(snapshot.username != null ? snapshot.username : "");
        LinearLayout.LayoutParams nameParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        nameParams.leftMargin = dp(activity, 10);
        author.addView(name, nameParams);

        String age = ageText(snapshot.timeMillis);
        if (age != null) {
            TextView time = new TextView(activity);
            time.setTextColor(0xFFA8A8A8);
            time.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
            time.setText("  \u2022  " + age);
            author.addView(time);
        }

        // Close button (top right).
        TextView close = new TextView(activity);
        close.setText("\u2715");
        close.setTextColor(Color.WHITE);
        close.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22);
        close.setPadding(dp(activity, 16), dp(activity, 16), dp(activity, 16), dp(activity, 16));
        close.setOnClickListener(v -> dialog.dismiss());
        FrameLayout.LayoutParams closeParams = new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.WRAP_CONTENT, FrameLayout.LayoutParams.WRAP_CONTENT);
        closeParams.gravity = Gravity.TOP | Gravity.RIGHT;
        closeParams.topMargin = dp(activity, 24);
        root.addView(close, closeParams);

        final MediaPlayer[] player = new MediaPlayer[1];
        dialog.setOnDismissListener(d -> {
            if (player[0] != null) {
                try {
                    player[0].release();
                } catch (Throwable ignored) {
                    // Already released.
                }
                player[0] = null;
            }
        });

        dialog.setContentView(root);
        dialog.show();

        // The media may still be downloading (the pill can be tapped right after a pass).
        new Runnable() {
            @Override
            public void run() {
                if (!dialog.isShowing()) return;
                if (snapshot.failed) {
                    Toast.makeText(activity, InstantsStrings.postUnavailable(activity), Toast.LENGTH_SHORT).show();
                    dialog.dismiss();
                    return;
                }
                if (!snapshot.ready) {
                    MAIN.postDelayed(this, POLL_MS);
                    return;
                }
                frame.removeView(spinner);
                try {
                    if (snapshot.avatarFile != null) {
                        Bitmap bitmap = BitmapFactory.decodeFile(snapshot.avatarFile.getAbsolutePath());
                        if (bitmap != null) avatar.setImageBitmap(bitmap);
                    }
                    if (snapshot.video) {
                        player[0] = playVideo(activity, frame, snapshot.mediaFile.getAbsolutePath());
                    } else {
                        ImageView image = new ImageView(activity);
                        image.setScaleType(ImageView.ScaleType.CENTER_CROP);
                        image.setImageBitmap(BitmapFactory.decodeFile(snapshot.mediaFile.getAbsolutePath()));
                        frame.addView(image, new FrameLayout.LayoutParams(
                                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
                    }
                } catch (Throwable t) {
                    Log.e(InstantsGoBack.TAG, "Unable to show the replay", t);
                    dialog.dismiss();
                }
            }
        }.run();
    }

    // A looping video that covers the frame (the frame crops what overflows it).
    private static MediaPlayer playVideo(Context context, FrameLayout frame, String path) throws Exception {
        final TextureView texture = new TextureView(context);
        final FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        params.gravity = Gravity.CENTER;
        frame.addView(texture, params);

        final MediaPlayer player = new MediaPlayer();
        player.setDataSource(path);
        player.setLooping(true);
        player.setOnVideoSizeChangedListener((mp, width, height) -> {
            if (width <= 0 || height <= 0) return;
            float scale = Math.max((float) frame.getWidth() / width, (float) frame.getHeight() / height);
            params.width = Math.round(width * scale);
            params.height = Math.round(height * scale);
            texture.setLayoutParams(params);
        });
        player.setOnPreparedListener(MediaPlayer::start);
        texture.setSurfaceTextureListener(new TextureView.SurfaceTextureListener() {
            @Override
            public void onSurfaceTextureAvailable(SurfaceTexture surface, int width, int height) {
                try {
                    player.setSurface(new Surface(surface));
                    player.prepareAsync();
                } catch (Throwable t) {
                    Log.e(InstantsGoBack.TAG, "Unable to start the video", t);
                }
            }

            @Override
            public void onSurfaceTextureSizeChanged(SurfaceTexture surface, int width, int height) {}

            @Override
            public boolean onSurfaceTextureDestroyed(SurfaceTexture surface) {
                return true;
            }

            @Override
            public void onSurfaceTextureUpdated(SurfaceTexture surface) {}
        });
        return player;
    }

    // "5 min", "9 h" or "2 d"; null when the time is unknown.
    private static String ageText(long timeMillis) {
        if (timeMillis <= 0) return null;
        long minutes = Math.max(0, (System.currentTimeMillis() - timeMillis) / 60000L);
        if (minutes < 60) return Math.max(1, minutes) + " min";
        long hours = minutes / 60;
        if (hours < 24) return hours + " h";
        return (hours / 24) + " d";
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    /** A frame that crops its children to a squircle, the shape the viewer gives its posts. */
    private static final class SquircleFrame extends FrameLayout {
        private final Path path = new Path();

        SquircleFrame(Context context) {
            super(context);
            setWillNotDraw(false);
        }

        @Override
        protected void onSizeChanged(int w, int h, int oldw, int oldh) {
            super.onSizeChanged(w, h, oldw, oldh);
            path.reset();
            float cx = w / 2f;
            float cy = h / 2f;
            final int steps = 180;
            for (int i = 0; i <= steps; i++) {
                double t = 2 * Math.PI * i / steps;
                double c = Math.cos(t);
                double s = Math.sin(t);
                // Superellipse of exponent 4: |x|^4 + |y|^4 = 1.
                float x = (float) (cx + cx * Math.signum(c) * Math.sqrt(Math.abs(c)));
                float y = (float) (cy + cy * Math.signum(s) * Math.sqrt(Math.abs(s)));
                if (i == 0) path.moveTo(x, y);
                else path.lineTo(x, y);
            }
            path.close();
        }

        @Override
        protected void dispatchDraw(Canvas canvas) {
            int saved = canvas.save();
            canvas.clipPath(path);
            super.dispatchDraw(canvas);
            canvas.restoreToCount(saved);
        }
    }
}
