package app.template.extension.stayfree;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.graphics.SurfaceTexture;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.hardware.Camera;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.provider.Settings;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.Surface;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.LuminanceSource;
import com.google.zxing.PlanarYUVLuminanceSource;
import com.google.zxing.ReaderException;
import com.google.zxing.Result;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.QRCodeReader;

import java.util.Collections;
import java.util.EnumMap;
import java.util.List;
import java.util.Map;

/**
 * Full-screen QR scanner for StayFree pairing codes (like Brave's built-in scanner, but decoded
 * with ZXing so it needs no Google Play Services). Uses the {@link Camera} API: it is deprecated
 * but still present on every Android version, and gives NV21 frames ZXing reads directly.
 */
@SuppressWarnings({"deprecation", "unused"})
public final class QrScanActivity extends Activity implements TextureView.SurfaceTextureListener, Camera.PreviewCallback {
    private static final int REQUEST_CAMERA = 0x51F;
    private static final int MAX_PREVIEW_PIXELS = 1920 * 1080;
    private static final int TEXT_COLOR = 0xFFFFFFFF;
    private static final int ACCENT = 0xFF4E7CFF;

    private final Handler main = new Handler(Looper.getMainLooper());
    private final QRCodeReader reader = new QRCodeReader();
    private final Map<DecodeHintType, Object> hints = new EnumMap<>(DecodeHintType.class);

    private TextureView preview;
    private TextView status;
    private TextView torch;

    private Camera camera;
    private int previewWidth;
    private int previewHeight;
    private int displayOrientation;
    private boolean torchOn;
    private boolean permissionAsked;

    private HandlerThread decoderThread;
    private Handler decoder;
    private volatile boolean decoding;
    private volatile boolean finished;
    private int frameCount;
    private long lastRejectMs;

    private final Runnable autoFocus = new Runnable() {
        @Override
        public void run() {
            Camera c = camera;
            if (c == null) return;
            try {
                c.autoFocus((success, cam) -> main.postDelayed(autoFocus, 1500));
            } catch (RuntimeException e) {
                main.postDelayed(autoFocus, 1500);
            }
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        getWindow().setStatusBarColor(Color.TRANSPARENT);
        getWindow().setNavigationBarColor(Color.TRANSPARENT);

        hints.put(DecodeHintType.POSSIBLE_FORMATS, Collections.singletonList(BarcodeFormat.QR_CODE));
        hints.put(DecodeHintType.TRY_HARDER, Boolean.TRUE);
        hints.put(DecodeHintType.CHARACTER_SET, "UTF-8");

        setContentView(buildLayout());
    }

    // region UI

    private int dp(float value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value, getResources().getDisplayMetrics()));
    }

    private View buildLayout() {
        FrameLayout root = new FrameLayout(this);
        root.setBackgroundColor(Color.BLACK);

        preview = new TextureView(this);
        preview.setSurfaceTextureListener(this);
        root.addView(preview, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        root.addView(new Viewfinder(this), new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        LinearLayout top = new LinearLayout(this);
        top.setOrientation(LinearLayout.HORIZONTAL);
        top.setGravity(Gravity.CENTER_VERTICAL);
        top.setPadding(dp(8), dp(8), dp(16), dp(8));
        TextView close = button("✕", false);
        close.setContentDescription("Close");
        close.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        close.setOnClickListener(v -> finish());
        top.addView(close, new LinearLayout.LayoutParams(dp(48), dp(48)));
        TextView title = text("Scan QR code", 20, true);
        title.setPadding(dp(12), 0, 0, 0);
        top.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        root.addView(top, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP));

        LinearLayout bottom = new LinearLayout(this);
        bottom.setOrientation(LinearLayout.VERTICAL);
        bottom.setGravity(Gravity.CENTER_HORIZONTAL);
        bottom.setPadding(dp(24), dp(16), dp(24), dp(24));

        status = text("Point the camera at the QR code shown by the StayFree browser extension or desktop app.", 15, false);
        status.setGravity(Gravity.CENTER);
        bottom.addView(status, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        String address = QrPairing.localSyncAddress();
        if (address != null) {
            TextView hint = text("This phone's local sync address: " + address, 13, false);
            hint.setAlpha(0.75f);
            hint.setGravity(Gravity.CENTER);
            hint.setPadding(0, dp(8), 0, 0);
            hint.setTextIsSelectable(true);
            bottom.addView(hint, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }

        LinearLayout actions = new LinearLayout(this);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setGravity(Gravity.CENTER);
        actions.setPadding(0, dp(20), 0, 0);
        torch = button("Flashlight", false);
        torch.setVisibility(View.GONE);
        torch.setOnClickListener(v -> toggleTorch());
        LinearLayout.LayoutParams torchParams = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, dp(48));
        torchParams.setMarginEnd(dp(12));
        actions.addView(torch, torchParams);
        TextView manual = button("Enter code instead", true);
        manual.setOnClickListener(v -> finish());
        actions.addView(manual, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, dp(48)));
        bottom.addView(actions, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        GradientDrawable scrim = new GradientDrawable(GradientDrawable.Orientation.BOTTOM_TOP, new int[]{0xCC000000, 0x00000000});
        bottom.setBackground(scrim);
        root.addView(bottom, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM));

        // targetSdk 35+: the window is always edge-to-edge, keep the bars clear of the controls.
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            int topInset;
            int bottomInset;
            if (Build.VERSION.SDK_INT >= 30) {
                android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
                topInset = bars.top;
                bottomInset = bars.bottom;
            } else {
                topInset = insets.getSystemWindowInsetTop();
                bottomInset = insets.getSystemWindowInsetBottom();
            }
            top.setPadding(dp(8), dp(8) + topInset, dp(16), dp(8));
            bottom.setPadding(dp(24), dp(16), dp(24), dp(24) + bottomInset);
            return insets;
        });
        return root;
    }

    private TextView text(String value, float sp, boolean bold) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextColor(TEXT_COLOR);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        if (bold) view.setTypeface(Typeface.DEFAULT_BOLD);
        view.setShadowLayer(dp(3), 0, 0, 0x99000000);
        return view;
    }

    private TextView button(String label, boolean primary) {
        TextView view = text(label, 15, true);
        view.setShadowLayer(0, 0, 0, 0);
        view.setGravity(Gravity.CENTER);
        view.setPadding(dp(20), 0, dp(20), 0);
        view.setClickable(true);
        view.setFocusable(true);
        GradientDrawable shape = new GradientDrawable();
        shape.setCornerRadius(dp(24));
        shape.setColor(primary ? ACCENT : 0x33FFFFFF);
        view.setBackground(new RippleDrawable(ColorStateList.valueOf(0x40FFFFFF), shape, null));
        return view;
    }

    /** Dims everything but a centred square and draws its corners. */
    private static final class Viewfinder extends View {
        private final Paint dim = new Paint();
        private final Paint clear = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint corners = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF frame = new RectF();
        private final Path path = new Path();

        Viewfinder(Context context) {
            super(context);
            setLayerType(LAYER_TYPE_HARDWARE, null);
            dim.setColor(0x99000000);
            clear.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
            corners.setColor(Color.WHITE);
            corners.setStyle(Paint.Style.STROKE);
            corners.setStrokeCap(Paint.Cap.ROUND);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float w = getWidth();
            float h = getHeight();
            float side = Math.min(w, h) * 0.68f;
            float density = getResources().getDisplayMetrics().density;
            frame.set((w - side) / 2f, (h - side) / 2f - h * 0.04f, (w + side) / 2f, (h + side) / 2f - h * 0.04f);
            float radius = 20 * density;
            canvas.drawRect(0, 0, w, h, dim);
            canvas.drawRoundRect(frame, radius, radius, clear);

            corners.setStrokeWidth(4 * density);
            float arm = side * 0.14f;
            path.reset();
            // top-left, top-right, bottom-right, bottom-left
            path.moveTo(frame.left, frame.top + arm);
            path.lineTo(frame.left, frame.top + radius);
            path.quadTo(frame.left, frame.top, frame.left + radius, frame.top);
            path.lineTo(frame.left + arm, frame.top);
            path.moveTo(frame.right - arm, frame.top);
            path.lineTo(frame.right - radius, frame.top);
            path.quadTo(frame.right, frame.top, frame.right, frame.top + radius);
            path.lineTo(frame.right, frame.top + arm);
            path.moveTo(frame.right, frame.bottom - arm);
            path.lineTo(frame.right, frame.bottom - radius);
            path.quadTo(frame.right, frame.bottom, frame.right - radius, frame.bottom);
            path.lineTo(frame.right - arm, frame.bottom);
            path.moveTo(frame.left + arm, frame.bottom);
            path.lineTo(frame.left + radius, frame.bottom);
            path.quadTo(frame.left, frame.bottom, frame.left, frame.bottom - radius);
            path.lineTo(frame.left, frame.bottom - arm);
            canvas.drawPath(path, corners);
        }
    }

    // endregion

    // region Lifecycle and permission

    @Override
    protected void onResume() {
        super.onResume();
        decoderThread = new HandlerThread("StayFreeQrDecoder");
        decoderThread.start();
        decoder = new Handler(decoderThread.getLooper());

        if (checkSelfPermission(Manifest.permission.CAMERA) == PackageManager.PERMISSION_GRANTED) {
            startCameraIfReady();
        } else if (!permissionAsked) {
            permissionAsked = true;
            requestPermissions(new String[]{Manifest.permission.CAMERA}, REQUEST_CAMERA);
        }
    }

    @Override
    protected void onPause() {
        stopCamera();
        if (decoderThread != null) {
            decoderThread.quitSafely();
            decoderThread = null;
            decoder = null;
        }
        super.onPause();
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] results) {
        if (requestCode != REQUEST_CAMERA) return;
        if (results.length > 0 && results[0] == PackageManager.PERMISSION_GRANTED) {
            startCameraIfReady();
            return;
        }
        status.setText("StayFree needs camera access to scan the QR code. You can also close this and type the code.");
        if (!shouldShowRequestPermissionRationale(Manifest.permission.CAMERA)) {
            // "Don't ask again": the only way left is the app's settings page.
            torch.setVisibility(View.VISIBLE);
            torch.setText("Allow camera");
            torch.setOnClickListener(v -> {
                permissionAsked = false;
                startActivity(new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS, Uri.fromParts("package", getPackageName(), null)));
            });
        } else {
            permissionAsked = false;
        }
    }

    // endregion

    // region Camera

    @Override
    public void onSurfaceTextureAvailable(SurfaceTexture surface, int width, int height) {
        startCameraIfReady();
    }

    @Override
    public void onSurfaceTextureSizeChanged(SurfaceTexture surface, int width, int height) {
        applyCenterCrop();
    }

    @Override
    public boolean onSurfaceTextureDestroyed(SurfaceTexture surface) {
        stopCamera();
        return true;
    }

    @Override
    public void onSurfaceTextureUpdated(SurfaceTexture surface) {
    }

    private void startCameraIfReady() {
        if (camera != null || finished || !preview.isAvailable()
                || checkSelfPermission(Manifest.permission.CAMERA) != PackageManager.PERMISSION_GRANTED) {
            return;
        }
        int cameraId = backCameraId();
        if (cameraId < 0) {
            status.setText("No camera found on this device. Close this and type the code instead.");
            return;
        }
        try {
            Camera c = Camera.open(cameraId);
            Camera.Parameters parameters = c.getParameters();
            Camera.Size size = choosePreviewSize(parameters.getSupportedPreviewSizes());
            parameters.setPreviewSize(size.width, size.height);
            previewWidth = size.width;
            previewHeight = size.height;

            List<String> focusModes = parameters.getSupportedFocusModes();
            boolean continuous = focusModes != null && focusModes.contains(Camera.Parameters.FOCUS_MODE_CONTINUOUS_PICTURE);
            boolean auto = focusModes != null && focusModes.contains(Camera.Parameters.FOCUS_MODE_AUTO);
            if (continuous) parameters.setFocusMode(Camera.Parameters.FOCUS_MODE_CONTINUOUS_PICTURE);
            else if (auto) parameters.setFocusMode(Camera.Parameters.FOCUS_MODE_AUTO);
            c.setParameters(parameters);

            Camera.CameraInfo info = new Camera.CameraInfo();
            Camera.getCameraInfo(cameraId, info);
            displayOrientation = (info.orientation - displayRotationDegrees() + 360) % 360;
            c.setDisplayOrientation(displayOrientation);

            c.setPreviewTexture(preview.getSurfaceTexture());
            int bufferSize = previewWidth * previewHeight * 3 / 2;
            c.addCallbackBuffer(new byte[bufferSize]);
            c.addCallbackBuffer(new byte[bufferSize]);
            c.setPreviewCallbackWithBuffer(this);
            c.startPreview();
            camera = c;
            applyCenterCrop();

            List<String> flashModes = parameters.getSupportedFlashModes();
            if (flashModes != null && flashModes.contains(Camera.Parameters.FLASH_MODE_TORCH)) {
                torch.setVisibility(View.VISIBLE);
                torch.setText("Flashlight");
                torch.setOnClickListener(v -> toggleTorch());
            }
            if (!continuous && auto) main.postDelayed(autoFocus, 500);
        } catch (Exception e) {
            Log.e(QrPairing.TAG, "Could not open the camera", e);
            stopCamera();
            status.setText("The camera is not available. Close this and type the code instead.");
        }
    }

    private void stopCamera() {
        main.removeCallbacks(autoFocus);
        Camera c = camera;
        camera = null;
        torchOn = false;
        if (c == null) return;
        try {
            c.setPreviewCallbackWithBuffer(null);
            c.stopPreview();
        } catch (RuntimeException ignored) {
        }
        c.release();
    }

    private static int backCameraId() {
        int count = Camera.getNumberOfCameras();
        Camera.CameraInfo info = new Camera.CameraInfo();
        for (int i = 0; i < count; i++) {
            Camera.getCameraInfo(i, info);
            if (info.facing == Camera.CameraInfo.CAMERA_FACING_BACK) return i;
        }
        return count > 0 ? 0 : -1;
    }

    private int displayRotationDegrees() {
        int rotation = Build.VERSION.SDK_INT >= 30 && getDisplay() != null
                ? getDisplay().getRotation()
                : getWindowManager().getDefaultDisplay().getRotation();
        switch (rotation) {
            case Surface.ROTATION_90: return 90;
            case Surface.ROTATION_180: return 180;
            case Surface.ROTATION_270: return 270;
            default: return 0;
        }
    }

    /** Largest size up to 1080p whose shape is closest to the screen's. */
    private Camera.Size choosePreviewSize(List<Camera.Size> sizes) {
        float viewRatio = (float) Math.max(preview.getWidth(), preview.getHeight())
                / Math.max(1, Math.min(preview.getWidth(), preview.getHeight()));
        Camera.Size best = null;
        float bestScore = Float.MAX_VALUE;
        for (Camera.Size size : sizes) {
            int pixels = size.width * size.height;
            if (pixels > MAX_PREVIEW_PIXELS || pixels < 320 * 240) continue;
            float ratio = (float) Math.max(size.width, size.height) / Math.min(size.width, size.height);
            // Shape first, then resolution.
            float score = Math.abs(ratio - viewRatio) * 4f + (1f - (float) pixels / MAX_PREVIEW_PIXELS);
            if (score < bestScore) {
                bestScore = score;
                best = size;
            }
        }
        return best != null ? best : sizes.get(0);
    }

    /** The TextureView stretches the preview to its bounds; scale it back so it fills, uncropped shape. */
    private void applyCenterCrop() {
        float viewWidth = preview.getWidth();
        float viewHeight = preview.getHeight();
        if (camera == null || viewWidth == 0 || viewHeight == 0) return;
        boolean rotated = displayOrientation % 180 != 0;
        float contentWidth = rotated ? previewHeight : previewWidth;
        float contentHeight = rotated ? previewWidth : previewHeight;
        float scale = Math.max(viewWidth / contentWidth, viewHeight / contentHeight);
        Matrix matrix = new Matrix();
        matrix.setScale(contentWidth * scale / viewWidth, contentHeight * scale / viewHeight, viewWidth / 2f, viewHeight / 2f);
        preview.setTransform(matrix);
    }

    private void toggleTorch() {
        Camera c = camera;
        if (c == null) return;
        try {
            Camera.Parameters parameters = c.getParameters();
            torchOn = !torchOn;
            parameters.setFlashMode(torchOn ? Camera.Parameters.FLASH_MODE_TORCH : Camera.Parameters.FLASH_MODE_OFF);
            c.setParameters(parameters);
            torch.setText(torchOn ? "Flashlight off" : "Flashlight");
        } catch (RuntimeException e) {
            torchOn = false;
        }
    }

    // endregion

    // region Decoding

    @Override
    public void onPreviewFrame(byte[] data, Camera c) {
        Handler handler = decoder;
        if (finished || decoding || handler == null || data == null) {
            recycle(c, data);
            return;
        }
        decoding = true;
        final int width = previewWidth;
        final int height = previewHeight;
        final boolean inverted = (++frameCount % 3) == 0;
        handler.post(() -> {
            String text = decode(data, width, height, inverted);
            decoding = false;
            recycle(camera, data);
            if (text != null) main.post(() -> onScanned(text));
        });
    }

    private static void recycle(Camera c, byte[] data) {
        if (c == null || data == null) return;
        try {
            c.addCallbackBuffer(data);
        } catch (RuntimeException ignored) {
            // Camera released meanwhile.
        }
    }

    private String decode(byte[] data, int width, int height, boolean inverted) {
        if (width <= 0 || height <= 0 || data.length < width * height) return null;
        // The centre of the frame, a bit larger than the on-screen square.
        int side = Math.round(Math.min(width, height) * 0.9f);
        int left = (width - side) / 2;
        int top = (height - side) / 2;
        try {
            LuminanceSource source = new PlanarYUVLuminanceSource(data, width, height, left, top, side, side, false);
            // Every third frame: light-on-dark codes (e.g. a QR code drawn in a dark theme).
            if (inverted) source = source.invert();
            Result result = reader.decode(new BinaryBitmap(new HybridBinarizer(source)), hints);
            return result.getText();
        } catch (ReaderException | IllegalArgumentException e) {
            return null;
        } finally {
            reader.reset();
        }
    }

    private void onScanned(String text) {
        if (finished) return;
        String code = QrPairing.pairingCode(text);
        if (code == null) {
            long now = System.currentTimeMillis();
            if (now - lastRejectMs > 2500) {
                lastRejectMs = now;
                status.setText("That isn't a StayFree pairing QR code. Scan the one shown by the browser extension or desktop app.");
            }
            return;
        }
        finished = true;
        preview.performHapticFeedback(Build.VERSION.SDK_INT >= 30
                ? HapticFeedbackConstants.CONFIRM
                : HapticFeedbackConstants.VIRTUAL_KEY);
        status.setText("Pairing…");
        stopCamera();
        try {
            QrPairing.openPairing(this, code);
        } catch (RuntimeException e) {
            Log.e(QrPairing.TAG, "Could not hand the pairing code to StayFree", e);
        }
        finish();
    }

    // endregion
}
