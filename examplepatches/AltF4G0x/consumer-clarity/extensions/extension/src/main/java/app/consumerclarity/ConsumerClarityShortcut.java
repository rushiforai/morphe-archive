package app.consumerclarity;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

public final class ConsumerClarityShortcut {
    private ConsumerClarityShortcut() {}

    public static void install(Activity activity) {
        new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(() -> {
            ViewGroup root = activity.getWindow().getDecorView().findViewById(android.R.id.content);
            installNow(activity, root);
        }, 1000);
    }

    private static void installNow(Activity activity, ViewGroup root) {
        android.util.Log.i("ConsumerClarity", "Installing home shortcut");
        View existing = root.findViewWithTag("consumerclarity_home_shortcut");
        if (!ConsumerClaritySettings.enabled("home_shortcut")) {
            if (existing != null) root.removeView(existing);
            return;
        }
        if (existing != null) return;
        TextView shortcut = new TextView(activity);
        shortcut.setTag("consumerclarity_home_shortcut");
        shortcut.setText("CLARITY");
        shortcut.setTextColor(Color.WHITE);
        shortcut.setTextSize(12);
        shortcut.setGravity(android.view.Gravity.CENTER);
        int horizontal = dp(activity, 14);
        int vertical = dp(activity, 10);
        shortcut.setPadding(horizontal, vertical, horizontal, vertical);
        GradientDrawable background = new GradientDrawable();
        background.setColor(Color.rgb(255, 90, 0));
        background.setCornerRadius(dp(activity, 22));
        shortcut.setBackground(background);
        shortcut.setElevation(dp(activity, 8));
        FrameLayout.LayoutParams initial = new FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        initial.gravity = android.view.Gravity.BOTTOM | android.view.Gravity.END;
        initial.bottomMargin = dp(activity, 84);
        initial.rightMargin = dp(activity, 18);
        root.addView(shortcut, initial);
        shortcut.setOnClickListener(view -> open(activity));
        shortcut.setOnTouchListener(new DragListener(shortcut));
    }

    private static int dp(Activity activity, int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }

    private static final class DragListener implements View.OnTouchListener {
        private final View view;
        private FrameLayout.LayoutParams params;
        private float startX;
        private float startY;
        private int startLeft;
        private int startTop;

        DragListener(View view) {
            this.view = view;
        }

        @Override
        public boolean onTouch(View target, MotionEvent event) {
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    params = (FrameLayout.LayoutParams) view.getLayoutParams();
                    int[] location = new int[2];
                    view.getLocationOnScreen(location);
                    params.gravity = android.view.Gravity.TOP | android.view.Gravity.START;
                    params.leftMargin = location[0];
                    params.topMargin = location[1];
                    view.setLayoutParams(params);
                    startX = event.getRawX();
                    startY = event.getRawY();
                    startLeft = params.leftMargin;
                    startTop = params.topMargin;
                    return true;
                case MotionEvent.ACTION_MOVE:
                    params.leftMargin = clamp(startLeft + Math.round(event.getRawX() - startX), 0,
                        ((ViewGroup) view.getParent()).getWidth() - view.getWidth());
                    params.topMargin = clamp(startTop + Math.round(event.getRawY() - startY), 0,
                        ((ViewGroup) view.getParent()).getHeight() - view.getHeight());
                    view.setLayoutParams(params);
                    return true;
                case MotionEvent.ACTION_UP:
                    if (Math.abs(event.getRawX() - startX) < 12 && Math.abs(event.getRawY() - startY) < 12) {
                        view.performClick();
                    }
                    return true;
                default:
                    return false;
            }
        }

        private static int clamp(int value, int minimum, int maximum) {
            return Math.max(minimum, Math.min(maximum, value));
        }
    }

    public static void open(Activity activity) {
        activity.startActivity(new Intent(activity, ConsumerClarityActivity.class));
    }
}
