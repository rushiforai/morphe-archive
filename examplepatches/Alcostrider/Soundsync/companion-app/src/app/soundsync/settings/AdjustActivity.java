package app.soundsync.settings;

import android.app.Activity;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * Small panel opened from the quick-settings button. It floats over the video app, which keeps
 * playing behind it, so you can match lips to sound and see the result straight away.
 */
public class AdjustActivity extends Activity {
    private Controls controls;

    @Override
    protected void onCreate(Bundle saved) {
        super.onCreate(saved);
        controls = new Controls(this);
        LinearLayout col = new LinearLayout(this);
        col.setOrientation(LinearLayout.VERTICAL);
        int pad = controls.dp(20);
        col.setPadding(pad, pad, pad, controls.dp(12));

        TextView title = new TextView(this);
        title.setText("SoundSync");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
        col.addView(title);

        col.addView(controls.delayView(false));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = controls.dp(12);
        col.addView(controls.modeView(), lp);

        Button done = new Button(this);
        done.setText("Done");
        done.setAllCaps(false);
        done.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
        LinearLayout.LayoutParams dl = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        dl.topMargin = controls.dp(8);
        dl.gravity = android.view.Gravity.END;
        col.addView(done, dl);

        setContentView(col);
        getWindow().setLayout(Math.round(getResources().getDisplayMetrics().widthPixels * 0.9f),
                ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    @Override
    protected void onResume() {
        super.onResume();
        controls.refresh();
    }
}
