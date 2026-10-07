package app.s.chzzk.extension;

import android.app.Activity;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.os.Bundle;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.lang.reflect.Proxy;
import java.util.List;
import java.util.Map;

public final class ChatUi {
    static int dragPercent = -1;
    private static WeakReference<Activity> activity = new WeakReference<>(null);
    private static WeakReference<Object> coordinates = new WeakReference<>(null);
    private static ResizeHandle handle;
    private static Object positionCallback;
    private static WeakReference<Object> clickOwner = new WeakReference<>(null);
    private static Object liveClick;
    private static Object menuClick;

    private ChatUi() {}

    static void attach(Activity host) {
        if (activity.get() == host) return;
        if (handle != null) {
            handle.removeCallbacks(handle);
            if (handle.getParent() instanceof ViewGroup) ((ViewGroup) handle.getParent()).removeView(handle);
            handle = null;
        }
        activity = new WeakReference<>(host);
        coordinates.clear();
        dragPercent = -1;
    }

    public static String deviceType(Object message) { return ""; }
    public static long nicknameSize(Object style, Object density) { return 0; }
    public static void appendText(Object builder, String text, long size) {}
    public static void appendDevice(Object builder, Map<?, ?> inline, int device, long size) {}
    public static Object resizeModifier(Object modifier) { return modifier; }
    public static float[] chatBounds(Object coordinates) { return null; }
    public static boolean seekToLive(Object viewModel) { return false; }
    public static void renderCatchUp(Object viewModel, Object composer) {}
    public static void addPlayerSettings(List<?> items) {}

    public static int catchUpIcon() {
        Activity host = activity.get();
        return host == null ? 0 : host.getResources().getIdentifier("s_chzzk_live_catchup", "drawable", host.getPackageName());
    }

    public static Object playerSettingsClick() {
        if (menuClick == null) menuClick = callback("kotlin.jvm.functions.Function1", args -> {
            Activity host = activity.get();
            if (host != null && !host.isFinishing() && !host.isDestroyed()) ChzzkSettings.showSettings(host);
        });
        return menuClick;
    }

    public static void appendHeader(Object builder, Object message, Object style, Object density, Map<?, ?> inline) {
        if (!"USER".equals(ChzzkSettings.messageKind(message))) return;
        boolean showTime = ChzzkSettings.enabled("timestamps");
        boolean showDevice = ChzzkSettings.enabled("device_icons");
        if (!showTime && !showDevice) return;
        long size = nicknameSize(style, density);
        if (showTime) {
            String time = ChzzkSettings.chatTime(ChzzkSettings.messageTime(message));
            if (!time.isEmpty()) {
                float scaled = Float.intBitsToFloat((int) size) * ChzzkSettings.number("timestamp_size", 80) / 100f;
                long timeSize = (size & 0xffffffff00000000L) | (Float.floatToRawIntBits(scaled) & 0xffffffffL);
                appendText(builder, time + "\u00a0 ", timeSize);
            }
        }
        if (showDevice) {
            String type = deviceType(message);
            if ("PC".equals(type)) appendDevice(builder, inline, 1, size);
            else if ("AOS".equals(type)) appendDevice(builder, inline, 2, size);
            else if ("IOS".equals(type)) appendDevice(builder, inline, 3, size);
        }
    }

    public static String roleBadge(String value) { return ChzzkSettings.enabled("hide_role_badge") ? null : value; }
    public static String nicknameText(String value) { return ChzzkSettings.enabled("hide_nickname") ? "" : value; }
    public static Object subscriptionBadge(Object value) { return ChzzkSettings.enabled("hide_subscription_badge") ? null : value; }
    public static Object donationBadge(Object value) { return ChzzkSettings.enabled("hide_donation_badge") ? null : value; }
    public static List<?> activityBadges(List<?> value) { return ChzzkSettings.enabled("hide_activity_badge") ? null : value; }
    public static boolean verifiedBadge(boolean value) { return value && !ChzzkSettings.enabled("hide_verified_badge"); }
    public static Object channelBadges(Object value) { return ChzzkSettings.enabled("hide_channel_badge") ? null : value; }
    public static boolean hideClip() { return ChzzkSettings.enabled("hide_clip_button"); }
    public static boolean hideCast() { return ChzzkSettings.enabled("hide_cast_button"); }
    public static boolean hideShare() { return ChzzkSettings.enabled("hide_share_button"); }
    public static boolean showCatchUp() { return ChzzkSettings.enabledByDefault("live_catch_up"); }

    public static Object catchUpClick(Object viewModel) {
        if (clickOwner.get() == viewModel && liveClick != null) return liveClick;
        WeakReference<Object> owner = new WeakReference<>(viewModel);
        clickOwner = owner;
        liveClick = callback("kotlin.jvm.functions.Function0", args -> {
            Activity host = activity.get();
            Object player = owner.get();
            boolean moved = player != null && seekToLive(player);
            if (host != null) Toast.makeText(host, moved ? "실시간 위치로 이동했습니다" : "실시간 이동을 사용할 수 없는 영상입니다", Toast.LENGTH_SHORT).show();
        });
        return liveClick;
    }

    private interface Callback { void invoke(Object[] args); }

    private static Object callback(String type, Callback action) {
        try {
            Class<?> function = Class.forName(type);
            return Proxy.newProxyInstance(function.getClassLoader(), new Class<?>[] {function}, (proxy, method, args) -> {
                switch (method.getName()) {
                    case "invoke": action.invoke(args); return ChzzkSettings.kotlinUnit();
                    case "hashCode": return System.identityHashCode(proxy);
                    case "equals": return proxy == args[0];
                    case "toString": return "S Chzzk player control";
                    default: throw new UnsupportedOperationException(method.getName());
                }
            });
        } catch (ClassNotFoundException e) {
            throw new IllegalStateException(e);
        }
    }

    public static Object positionCallback() {
        if (positionCallback == null) positionCallback = callback("kotlin.jvm.functions.Function1", args -> {
            coordinates = new WeakReference<>(args[0]);
            Activity host = activity.get();
            if (host == null || host.isFinishing() || host.isDestroyed()) return;
            if (handle == null) {
                ViewGroup root = (ViewGroup) host.getWindow().getDecorView();
                handle = new ResizeHandle(host);
                root.addView(handle, new FrameLayout.LayoutParams(handle.dp(80), handle.dp(88), Gravity.TOP | Gravity.LEFT));
            }
            handle.removeCallbacks(handle);
            handle.post(handle);
        });
        return positionCallback;
    }

    private static final class ResizeHandle extends View implements Runnable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF rect = new RectF();
        private final int[] origin = new int[2];
        private float startX;
        private float startWidth;
        private int startScale;
        private boolean dragging;
        private final Activity host;

        ResizeHandle(Activity host) {
            super(host);
            this.host = host;
            setClickable(true);
            setFocusable(true);
            setElevation(dp(8));
            setContentDescription("채팅 폭 조절. 좌우로 드래그하거나 눌러 빠른 설정을 여세요.");
        }

        int dp(float value) { return Math.round(value * getResources().getDisplayMetrics().density); }

        @Override public void run() {
            Object position = coordinates.get();
            float[] bounds = position == null ? null : chatBounds(position);
            View root = host.getWindow().getDecorView();
            root.getLocationInWindow(origin);
            boolean visible = bounds != null && ChzzkSettings.enabledByDefault("drag_chat_width")
                && bounds[0] - origin[0] > root.getWidth() * 0.15f
                && bounds[2] - bounds[0] >= dp(90) && bounds[3] - bounds[1] >= dp(100)
                && !host.isFinishing() && !host.isDestroyed();
            setVisibility(visible ? VISIBLE : GONE);
            if (visible) {
                rect.set(bounds[0], bounds[1], bounds[2], bounds[3]);
                setX(rect.left - origin[0] - getWidth() / 2f);
                setY(rect.centerY() - origin[1] - getHeight() / 2f);
                invalidate();
            }
            if (bounds != null && !host.isDestroyed()) postDelayed(this, 200);
        }

        @Override protected void onDraw(Canvas canvas) {
            float center = getWidth() / 2f;
            paint.setColor(dragging ? 0xff00ffa3 : 0xff969ba5);
            canvas.drawRoundRect(center - dp(2), dp(35), center + dp(2), dp(65), dp(2), dp(2), paint);
            if (dragging) {
                paint.setColor(0xe6202227);
                canvas.drawRoundRect(0, 0, getWidth(), dp(27), dp(8), dp(8), paint);
                paint.setColor(0xfff2f4f7);
                paint.setTextSize(dp(12));
                paint.setTextAlign(Paint.Align.CENTER);
                canvas.drawText("채팅 " + dragPercent + "%", center, dp(18), paint);
            }
        }

        @Override public boolean onTouchEvent(MotionEvent event) {
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    if (Math.abs(event.getX() - getWidth() / 2f) > dp(16)) return false;
                    startX = event.getRawX();
                    startWidth = rect.width();
                    startScale = ChzzkSettings.number("chat_width_scale", 100);
                    dragging = false;
                    getParent().requestDisallowInterceptTouchEvent(true);
                    return true;
                case MotionEvent.ACTION_MOVE:
                    float delta = event.getRawX() - startX;
                    if (!dragging && Math.abs(delta) < ViewConfiguration.get(getContext()).getScaledTouchSlop()) return true;
                    dragging = true;
                    float maxWidth = host.getWindow().getDecorView().getWidth() - dp(96);
                    int percent = Math.round(Math.min(maxWidth, startWidth - delta) * startScale / Math.max(1, startWidth));
                    int next = Math.max(50, Math.min(300, percent));
                    if (next != dragPercent) { dragPercent = next; ChzzkSettings.changed(); }
                    invalidate();
                    return true;
                case MotionEvent.ACTION_UP:
                    if (dragging) ChzzkSettings.setNumber("chat_width_scale", dragPercent);
                    else performClick();
                    finishDrag();
                    return true;
                case MotionEvent.ACTION_CANCEL:
                    finishDrag();
                    return true;
                default: return super.onTouchEvent(event);
            }
        }

        private void finishDrag() {
            dragging = false;
            dragPercent = -1;
            ChzzkSettings.changed();
            getParent().requestDisallowInterceptTouchEvent(false);
            invalidate();
        }

        @Override public boolean performClick() {
            super.performClick();
            ChzzkSettings.showQuickSettings(host);
            return true;
        }

        @Override public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
            super.onInitializeAccessibilityNodeInfo(info);
            info.setClassName("android.widget.SeekBar");
            info.setRangeInfo(AccessibilityNodeInfo.RangeInfo.obtain(AccessibilityNodeInfo.RangeInfo.RANGE_TYPE_INT,
                50, 300, ChzzkSettings.number("chat_width_scale", 100)));
            info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_FORWARD);
            info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_BACKWARD);
        }

        @Override public boolean performAccessibilityAction(int action, Bundle args) {
            if (action == AccessibilityNodeInfo.ACTION_SCROLL_FORWARD || action == AccessibilityNodeInfo.ACTION_SCROLL_BACKWARD) {
                int current = ChzzkSettings.number("chat_width_scale", 100);
                ChzzkSettings.setNumber("chat_width_scale", Math.max(50, Math.min(300,
                    current + (action == AccessibilityNodeInfo.ACTION_SCROLL_FORWARD ? 5 : -5))));
                return true;
            }
            return super.performAccessibilityAction(action, args);
        }
    }
}
