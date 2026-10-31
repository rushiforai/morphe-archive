package t.fonttest;

import android.app.Activity;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.os.Bundle;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

public class Main extends Activity {
    static final String SAMPLE = "Bạn đang nghĩ gì? Xem thêm 0123 agR";

    static class PaintLine extends View {
        final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        final String label;
        PaintLine(Context c, String label, Typeface tf) {
            super(c);
            this.label = label;
            paint.setTypeface(tf);
            paint.setTextSize(48);
            paint.setColor(Color.BLACK);
        }
        @Override protected void onMeasure(int w, int h) { setMeasuredDimension(MeasureSpec.getSize(w), 140); }
        @Override protected void onDraw(Canvas canvas) {
            Paint small = new Paint(Paint.ANTI_ALIAS_FLAG);
            small.setTextSize(28);
            small.setColor(Color.RED);
            canvas.drawText(label, 20, 34, small);
            canvas.drawText(SAMPLE, 20, 110, paint);
        }
    }

    @Override protected void onCreate(Bundle b) {
        super.onCreate(b);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(Color.WHITE);
        root.setPadding(0, 120, 0, 0);
        TextView label = new TextView(this);
        label.setText("1 TextView default");
        label.setTextColor(Color.RED);
        root.addView(label);
        TextView tv = new TextView(this);
        tv.setText(SAMPLE);
        tv.setTextSize(0, 48);
        tv.setTextColor(Color.BLACK);
        root.addView(tv);
        root.addView(new PaintLine(this, "2 Paint Typeface.DEFAULT", Typeface.DEFAULT));
        root.addView(new PaintLine(this, "3 create(DEFAULT, 400, false)", Typeface.create(Typeface.DEFAULT, 400, false)));
        root.addView(new PaintLine(this, "4 create(DEFAULT, 700, false)", Typeface.create(Typeface.DEFAULT, 700, false)));
        root.addView(new PaintLine(this, "5 create(DEFAULT, BOLD)", Typeface.create(Typeface.DEFAULT, Typeface.BOLD)));
        root.addView(new PaintLine(this, "6 create(\"sans-serif\", NORMAL)", Typeface.create("sans-serif", Typeface.NORMAL)));
        root.addView(new PaintLine(this, "7 create(\"roboto\", NORMAL)", Typeface.create("roboto", Typeface.NORMAL)));
        setContentView(root);
    }
}
