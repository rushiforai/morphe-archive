package dev.utaa.cutlog.extension.editor;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.view.View;
import dev.utaa.cutlog.extension.pref.Feature;
import dev.utaa.cutlog.extension.pref.Prefs;

/** 撮影画面のシャッターの右（フラッシュと左右対称の位置）に置く「ファイルから」ボタン。 */
@SuppressLint("ViewConstructor")
public final class ImportButton extends View {
    private static final String TAG = "cutlog-import-button";

    private final Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final RectF frame = new RectF();
    private final Path mountain = new Path();

    private ImportButton(Context context, Runnable onClick) {
        super(context);
        setContentDescription("ファイルから");
        setClickable(true);
        setOnClickListener(v -> onClick.run());
        stroke.setColor(Color.WHITE);
        stroke.setStyle(Paint.Style.STROKE);
        stroke.setStrokeJoin(Paint.Join.ROUND);
        stroke.setStrokeCap(Paint.Cap.ROUND);
    }

    /** 撮影画面の View にボタンを足す。シャッターが見つからなければ何もしない。 */
    public static void attach(View cameraRoot, Runnable onClick) {
        Context context = cameraRoot.getContext();
        CameraChrome.place(cameraRoot, new ImportButton(context, onClick), TAG, 1f,
                () -> Prefs.isEnabled(context, Feature.IMPORT));
    }

    /** 写真ライブラリの形（角丸の枠に山と太陽）。フラッシュボタンと同じく白い線で描く。 */
    @Override
    protected void onDraw(Canvas canvas) {
        float w = getWidth();
        float h = getHeight();
        // フラッシュのアイコンと同じくらいの大きさ（ボタンの約半分）に描く。
        float unit = Math.min(w, h) / 36f;
        stroke.setStrokeWidth(unit * 1.8f);
        float cx = w / 2f;
        float cy = h / 2f;
        frame.set(cx - unit * 8, cy - unit * 7, cx + unit * 8, cy + unit * 7);
        canvas.drawRoundRect(frame, unit * 2.5f, unit * 2.5f, stroke);
        mountain.reset();
        mountain.moveTo(cx - unit * 8, cy + unit * 4);
        mountain.lineTo(cx - unit * 2.5f, cy - unit * 1.5f);
        mountain.lineTo(cx + unit * 2, cy + unit * 3);
        mountain.lineTo(cx + unit * 4, cy + unit * 1);
        mountain.lineTo(cx + unit * 8, cy + unit * 5);
        canvas.drawPath(mountain, stroke);
        canvas.drawCircle(cx + unit * 3.5f, cy - unit * 3, unit * 1.5f, stroke);
    }
}
