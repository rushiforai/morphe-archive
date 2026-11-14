package app.zeta.extension.ui;

import android.app.Activity;
import android.app.AlertDialog;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import app.zeta.extension.hermes.HermesMemoryManager;
import app.zeta.extension.tps.TpsMonitor;

/**
 * チャット画面上に浮かぶフローティングHUD
 * - リアルタイム t/s (Tokens per Second) 表示
 * - タップで Hermes Memory の ON/OFF 切替 & 設定ダイアログ
 * - ドラッグして画面内の好きな位置へ移動可能
 */
public class FloatingOverlay implements TpsMonitor.TpsListener {
    private static final FloatingOverlay INSTANCE = new FloatingOverlay();

    private Activity currentActivity;
    private FrameLayout overlayContainer;
    private TextView hudBadge;

    private float dX, dY;
    private int lastAction;

    public static FloatingOverlay getInstance() {
        return INSTANCE;
    }

    public synchronized void attach(Activity activity) {
        if (activity == null || activity.isFinishing()) return;
        this.currentActivity = activity;

        ViewGroup root = (ViewGroup) activity.getWindow().getDecorView();
        View existing = root.findViewWithTag("zeta_floating_hud");
        if (existing != null) {
            root.removeView(existing);
        }

        // HUDバッジの作成
        hudBadge = new TextView(activity);
        hudBadge.setText("⚡ 0.0 t/s | Hermes: ON");
        hudBadge.setTextColor(Color.WHITE);
        hudBadge.setTextSize(11f);
        hudBadge.setPadding(24, 12, 24, 12);

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(Color.parseColor("#CC1E1E2E")); // 透け感のあるダークトーン
        bg.setCornerRadius(28f);
        bg.setStroke(2, Color.parseColor("#89B4FA"));
        hudBadge.setBackground(bg);

        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        params.gravity = Gravity.TOP | Gravity.END;
        params.topMargin = 120;
        params.rightMargin = 32;

        overlayContainer = new FrameLayout(activity);
        overlayContainer.setTag("zeta_floating_hud");
        overlayContainer.setLayoutParams(params);
        overlayContainer.addView(hudBadge);

        // タッチ & ドラッグ & クリック処理
        overlayContainer.setOnTouchListener(new View.OnTouchListener() {
            private long touchStartTime = 0;

            @Override
            public boolean onTouch(View view, MotionEvent event) {
                switch (event.getActionMasked()) {
                    case MotionEvent.ACTION_DOWN:
                        dX = view.getX() - event.getRawX();
                        dY = view.getY() - event.getRawY();
                        lastAction = MotionEvent.ACTION_DOWN;
                        touchStartTime = System.currentTimeMillis();
                        return true;

                    case MotionEvent.ACTION_MOVE:
                        view.setX(event.getRawX() + dX);
                        view.setY(event.getRawY() + dY);
                        lastAction = MotionEvent.ACTION_MOVE;
                        return true;

                    case MotionEvent.ACTION_UP:
                        long duration = System.currentTimeMillis() - touchStartTime;
                        if (duration < 250) {
                            // タップ判定 -> 設定ダイアログ表示
                            showSettingsDialog(currentActivity);
                        }
                        return true;

                    default:
                        return false;
                }
            }
        });

        root.addView(overlayContainer);

        // TPSリスナー登録
        TpsMonitor.getInstance().registerListener(this);
        updateBadgeText(0f, 0f, 0, 0f);
    }

    private void showSettingsDialog(Activity activity) {
        if (activity == null || activity.isFinishing()) return;

        AlertDialog.Builder builder = new AlertDialog.Builder(activity);
        builder.setTitle("⚡ Zeta Patch & Hermes Settings");

        LinearLayout layout = new LinearLayout(activity);
        layout.setOrientation(LinearLayout.VERTICAL);
        layout.setPadding(40, 24, 40, 24);

        // 1. Hermes Memory ON/OFF トグル
        Switch memorySwitch = new Switch(activity);
        boolean currentEnabled = HermesMemoryManager.getInstance().isEnabled();
        memorySwitch.setText("Hermes Persistent Memory");
        memorySwitch.setChecked(currentEnabled);
        memorySwitch.setTextSize(14f);
        memorySwitch.setPadding(0, 16, 0, 16);
        layout.addView(memorySwitch);

        // 2. ユーザープロファイル編集
        TextView profileLabel = new TextView(activity);
        profileLabel.setText("User Profile (USER.md):");
        profileLabel.setTextSize(12f);
        profileLabel.setTextColor(Color.GRAY);
        layout.addView(profileLabel);

        EditText profileInput = new EditText(activity);
        profileInput.setText(HermesMemoryManager.getInstance().getUserProfile());
        profileInput.setTextSize(13f);
        profileInput.setMinLines(3);
        profileInput.setMaxLines(6);
        layout.addView(profileInput);

        builder.setView(layout);

        builder.setPositiveButton("保存", (dialog, which) -> {
            HermesMemoryManager.getInstance().setEnabled(memorySwitch.isChecked());
            HermesMemoryManager.getInstance().setUserProfile(profileInput.getText().toString());
            Toast.makeText(activity, "設定を保存しました (Memory: " + (memorySwitch.isChecked() ? "ON" : "OFF") + ")", Toast.LENGTH_SHORT).show();
            updateBadgeText(0f, 0f, 0, 0f);
        });

        builder.setNegativeButton("閉じる", null);
        builder.show();
    }

    private void updateBadgeText(float instantTps, float avgTps, int tokens, float elapsedSec) {
        if (hudBadge == null || currentActivity == null) return;
        currentActivity.runOnUiThread(() -> {
            boolean mem = HermesMemoryManager.getInstance().isEnabled();
            String memStr = mem ? "ON" : "OFF";
            if (tokens > 0) {
                hudBadge.setText(String.format("⚡ %.1f t/s (avg %.1f) | %d tok | Mem:%s", instantTps, avgTps, tokens, memStr));
            } else {
                hudBadge.setText(String.format("⚡ 0.0 t/s | Mem:%s", memStr));
            }
        });
    }

    @Override
    public void onTpsUpdate(float instantTps, float avgTps, int totalTokens, float elapsedSec) {
        updateBadgeText(instantTps, avgTps, totalTokens, elapsedSec);
    }

    @Override
    public void onStreamStart() {
        updateBadgeText(0f, 0f, 0, 0f);
    }

    @Override
    public void onStreamEnd(float finalAvgTps, int totalTokens, float totalSec) {
        if (hudBadge == null || currentActivity == null) return;
        currentActivity.runOnUiThread(() -> {
            boolean mem = HermesMemoryManager.getInstance().isEnabled();
            hudBadge.setText(String.format("⚡ avg %.1f t/s (%d tok / %.1fs) | Mem:%s", finalAvgTps, totalTokens, totalSec, mem ? "ON" : "OFF"));
        });
    }
}
