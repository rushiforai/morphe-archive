package semicoloncolonel.mobilestream.extension.siriusxm;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Insets;
import android.graphics.Typeface;
import android.os.Bundle;
import android.os.Process;
import android.text.InputType;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/**
 * The "Hidden names" screen, opened from the app icon's long-press menu.
 * It edits the list that {@link ContentFilter} hides, one name per line,
 * and the Also hide mentions switch. Saving restarts SiriusXM, so pages it has
 * already loaded are read again with the new list.
 */
@SuppressWarnings("unused")
public final class HiddenNamesActivity extends Activity {
    private EditText names;
    private CheckBox hideMentions;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // The screen has its own heading, so the theme's title bar would repeat it.
        requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout layout = new LinearLayout(this);
        layout.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(20);
        layout.setPadding(pad, pad, pad, pad);

        TextView heading = new TextView(this);
        heading.setText("Hidden names");
        heading.setTextSize(TypedValue.COMPLEX_UNIT_SP, 24);
        heading.setTypeface(Typeface.DEFAULT_BOLD);
        layout.addView(heading);

        TextView help = new TextView(this);
        help.setText("Enter one name per line: a person, show, podcast, or channel. SiriusXM hides the "
                + "channels and shows with the name in their title, their episodes, and the episodes "
                + "that list the person as a host or guest. Letter case and accents do not matter, and "
                + "a name must match whole words.");
        help.setPadding(0, dp(8), 0, dp(12));
        layout.addView(help);

        names = new EditText(this);
        names.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE
                | InputType.TYPE_TEXT_FLAG_CAP_WORDS);
        names.setMinLines(5);
        names.setGravity(Gravity.TOP | Gravity.START);
        names.setHint("One name per line");
        names.setText(ContentFilter.savedNames(this));
        layout.addView(names, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        hideMentions = new CheckBox(this);
        hideMentions.setText("Also hide mentions");
        hideMentions.setChecked(ContentFilter.savedHideMentions(this));
        hideMentions.setPadding(0, dp(12), 0, 0);
        layout.addView(hideMentions);

        TextView mentionsHelp = new TextView(this);
        mentionsHelp.setText("Hides everything that mentions a name, such as an episode of another show "
                + "that talks about the person.");
        mentionsHelp.setPadding(0, 0, 0, dp(16));
        layout.addView(mentionsHelp);

        LinearLayout buttons = new LinearLayout(this);
        buttons.setOrientation(LinearLayout.HORIZONTAL);
        buttons.setGravity(Gravity.END);
        Button cancel = new Button(this);
        cancel.setText("Cancel");
        cancel.setOnClickListener(v -> finish());
        Button save = new Button(this);
        save.setText("Save and restart");
        save.setOnClickListener(v -> save());
        buttons.addView(cancel);
        buttons.addView(save);
        layout.addView(buttons);

        ScrollView scroll = new ScrollView(this);
        scroll.addView(layout);
        // Keep the content clear of the status and navigation bars.
        scroll.setOnApplyWindowInsetsListener((view, insets) -> {
            Insets bars = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.ime());
            view.setPadding(bars.left, bars.top, bars.right, bars.bottom);
            return insets;
        });
        setContentView(scroll);
    }

    private void save() {
        ContentFilter.save(this, names.getText().toString(), hideMentions.isChecked());
        Intent launch = getPackageManager().getLaunchIntentForPackage(getPackageName());
        if (launch != null) {
            launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            startActivity(launch);
        }
        finishAffinity();
        Process.killProcess(Process.myPid());
    }

    private int dp(int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                getResources().getDisplayMetrics()));
    }
}
