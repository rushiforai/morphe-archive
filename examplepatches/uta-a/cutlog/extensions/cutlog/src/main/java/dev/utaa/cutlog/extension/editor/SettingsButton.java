package dev.utaa.cutlog.extension.editor;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.view.View;
import dev.utaa.cutlog.extension.record.RecordDuration;

/**
 * 撮影画面のシャッターの並びの右端（長さのボタンと左右対称の位置）に置く、cutlog の設定を開く歯車ボタン。
 * どの機能を OFF にしても設定へ戻れるよう、このボタンは常に出す。
 */
@SuppressLint("ViewConstructor")
public final class SettingsButton extends View {
    private static final String TAG = "cutlog-settings-button";
    private static final int TEETH = 8;

    private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path gear = new Path();

    private SettingsButton(Context context) {
        super(context);
        setContentDescription("cutlog の設定");
        setClickable(true);
        setOnClickListener(v -> open());
        stroke.setColor(Color.WHITE);
        stroke.setStyle(Paint.Style.STROKE);
        stroke.setStrokeJoin(Paint.Join.ROUND);
    }

    /** 撮影画面の View にボタンを足す。シャッターが見つからなければ何もしない。 */
    public static void attach(View cameraRoot) {
        CameraChrome.place(cameraRoot, new SettingsButton(cameraRoot.getContext()), TAG, 2f);
    }

    private void open() {
        if (RecordDuration.isRecording()) {
            // 録画中に別の画面を重ねると、本体が録画を中断して破棄する。
            return;
        }
        new SettingsDialog(getContext(), () -> CameraChrome.refresh(this)).show();
    }

    /** 歯車の形。フラッシュボタンと同じく白い線で、ボタンの約半分の大きさに描く。 */
    @Override
    protected void onDraw(Canvas canvas) {
        float w = getWidth();
        float h = getHeight();
        float unit = Math.min(w, h) / 36f;
        stroke.setStrokeWidth(unit * 1.8f);
        float cx = w / 2f;
        float cy = h / 2f;
        float outer = unit * 8.5f;
        float inner = unit * 6.3f;
        gear.reset();
        // 歯 1 つを「外周の平らな部分」と「谷の平らな部分」の 4 点で作る。
        double step = 2 * Math.PI / TEETH;
        for (int i = 0; i < TEETH; i++) {
            double base = i * step - Math.PI / 2;
            double[] angles = {base - step * 0.18, base + step * 0.18, base + step * 0.32, base + step * 0.68};
            float[] radii = {outer, outer, inner, inner};
            for (int j = 0; j < angles.length; j++) {
                float x = cx + (float) Math.cos(angles[j]) * radii[j];
                float y = cy + (float) Math.sin(angles[j]) * radii[j];
                if (i == 0 && j == 0) {
                    gear.moveTo(x, y);
                } else {
                    gear.lineTo(x, y);
                }
            }
        }
        gear.close();
        canvas.drawPath(gear, stroke);
        canvas.drawCircle(cx, cy, unit * 2.6f, stroke);
    }
}
