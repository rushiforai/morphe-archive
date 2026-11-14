package app.soundsync.settings;

import android.app.Activity;
import android.app.StatusBarManager;
import android.content.ComponentName;
import android.graphics.Insets;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.Icon;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.function.Consumer;

/** Main screen: the delay, when to apply it, and how to set things up. */
public class MainActivity extends Activity {
    private Controls controls;
    private TextView carStatus;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Runnable pollCar = new Runnable() {
        @Override
        public void run() {
            carStatus.setText(CarStatus.describe(MainActivity.this));
            main.postDelayed(this, 2000);
        }
    };

    @Override
    protected void onCreate(Bundle saved) {
        super.onCreate(saved);
        controls = new Controls(this);

        ScrollView scroll = new ScrollView(this);
        final LinearLayout col = new LinearLayout(this);
        col.setOrientation(LinearLayout.VERTICAL);
        final int pad = controls.dp(20);
        col.setPadding(pad, pad, pad, pad);
        scroll.addView(col);
        scroll.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() {
            @Override
            public WindowInsets onApplyWindowInsets(View v, WindowInsets insets) {
                Insets b = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
                col.setPadding(pad + b.left, pad + b.top, pad + b.right, pad + b.bottom);
                return insets;
            }
        });

        col.addView(text("SoundSync", 30, true));
        TextView sub = text("Holds the video back in patched apps, so it lines up with the sound "
                + "from the car.", 15, false);
        sub.setPadding(0, controls.dp(4), 0, controls.dp(8));
        col.addView(sub);

        LinearLayout c1 = card(col, "Video delay");
        c1.addView(controls.delayView(true));
        c1.addView(text("Start around 750 ms (the same as −750 ms in Fermata's audio delay: "
                + "there you move the sound, here you move the video). Watch someone talking "
                + "and adjust until lips match the sound. If the lips now come after the sound, "
                + "go lower. Changes apply straight away, even mid-video.", 14, false));

        LinearLayout c2 = card(col, "When to apply");
        c2.addView(controls.modeView());
        carStatus = text("", 14, false);
        carStatus.setPadding(0, controls.dp(8), 0, 0);
        c2.addView(carStatus);

        LinearLayout c3 = card(col, "Quick button");
        c3.addView(text("Adds SoundSync to your quick settings. Tap it while a video plays to "
                + "adjust the delay over the video.", 14, false));
        Button add = new Button(this);
        add.setText("Add quick-settings button");
        add.setAllCaps(false);
        add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                addTile();
            }
        });
        c3.addView(add);

        LinearLayout c4 = card(col, "Which apps");
        c4.addView(text("Only apps patched in Morphe Manager with the “Android Auto audio "
                + "sync” patch from your SoundSync patch source. Patching asks for a default "
                + "delay; this app overrides it once installed.\n\nIf the delay ever stops "
                + "updating in a patched app, add SoundSync to Never sleeping apps (Settings "
                + "→ Battery → Background usage limits).", 14, false));

        setContentView(scroll);
    }

    @Override
    protected void onResume() {
        super.onResume();
        controls.refresh();
        main.post(pollCar);
    }

    @Override
    protected void onPause() {
        super.onPause();
        main.removeCallbacks(pollCar);
    }

    private void addTile() {
        try {
            StatusBarManager sbm = getSystemService(StatusBarManager.class);
            sbm.requestAddTileService(new ComponentName(this, SyncTileService.class),
                    getString(R.string.tile_label), Icon.createWithResource(this, R.drawable.ic_tile),
                    getMainExecutor(), new Consumer<Integer>() {
                        @Override
                        public void accept(Integer result) {
                            String msg;
                            if (result == StatusBarManager.TILE_ADD_REQUEST_RESULT_TILE_ADDED) {
                                msg = "Added. Swipe down twice to see it.";
                            } else if (result == StatusBarManager.TILE_ADD_REQUEST_RESULT_TILE_ALREADY_ADDED) {
                                msg = "It's already in your quick settings.";
                            } else if (result == StatusBarManager.TILE_ADD_REQUEST_RESULT_TILE_NOT_ADDED) {
                                msg = "Not added.";
                            } else {
                                msg = "Swipe down, tap the pencil (edit) and drag SoundSync in.";
                            }
                            Toast.makeText(MainActivity.this, msg, Toast.LENGTH_LONG).show();
                        }
                    });
        } catch (Exception e) {
            Toast.makeText(this, "Swipe down, tap the pencil (edit) and drag SoundSync in.",
                    Toast.LENGTH_LONG).show();
        }
    }

    private TextView text(String s, int sp, boolean bold) {
        TextView t = new TextView(this);
        t.setText(s);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        if (bold) t.setTypeface(Typeface.DEFAULT_BOLD);
        t.setLineSpacing(0, 1.15f);
        return t;
    }

    private LinearLayout card(LinearLayout parent, String heading) {
        LinearLayout c = new LinearLayout(this);
        c.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(0x1A888888);
        bg.setCornerRadius(controls.dp(16));
        c.setBackground(bg);
        c.setPadding(controls.dp(16), controls.dp(14), controls.dp(16), controls.dp(14));
        TextView h = text(heading, 17, true);
        h.setPadding(0, 0, 0, controls.dp(6));
        c.addView(h);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = controls.dp(12);
        parent.addView(c, lp);
        return c;
    }
}
