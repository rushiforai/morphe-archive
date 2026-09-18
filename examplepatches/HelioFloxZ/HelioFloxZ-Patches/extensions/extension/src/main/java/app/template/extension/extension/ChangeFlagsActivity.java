package app.template.extension.extension;

import android.app.Activity;
import android.os.Bundle;
import android.graphics.Color;
import android.graphics.Typeface;
import android.view.Gravity;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

@SuppressWarnings("unused")
public class ChangeFlagsActivity extends Activity {

    private int dp(float value) {
        return (int) (value * getResources().getDisplayMetrics().density + 0.5f);
    }

    private TextView createText(
            String text,
            float size,
            int style
    ) {
        TextView view = new TextView(this);
        view.setText(text);
        view.setTextSize(size);
        view.setTypeface(Typeface.DEFAULT, style);
        return view;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setTitle("Change flags");

        ScrollView scrollView = new ScrollView(this);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(
                dp(20),
                dp(20),
                dp(20),
                dp(32)
        );

        scrollView.addView(root);

        TextView title = createText(
                "Change flags",
                28,
                Typeface.BOLD
        );

        root.addView(
                title,
                new LinearLayout.LayoutParams(
                        -1,
                        -2
                )
        );

        TextView subtitle = createText(
                "Customize available Google Phone feature flags.",
                15,
                Typeface.NORMAL
        );

        LinearLayout.LayoutParams subtitleParams =
                new LinearLayout.LayoutParams(-1, -2);

        subtitleParams.topMargin = dp(6);

        root.addView(subtitle, subtitleParams);

        addSection(root, "CALL RECORDING");

        LinearLayout callRecordingRow =
                new LinearLayout(this);

        callRecordingRow.setOrientation(
                LinearLayout.HORIZONTAL
        );

        callRecordingRow.setGravity(
                Gravity.CENTER_VERTICAL
        );

        TextView callRecordingText =
                createText(
                        "Force eligibility",
                        17,
                        Typeface.NORMAL
                );

        LinearLayout textContainer =
                new LinearLayout(this);

        textContainer.setOrientation(
                LinearLayout.VERTICAL
        );

        TextView description =
                createText(
                        "Allow the call-recording eligibility check to return enabled.",
                        13,
                        Typeface.NORMAL
                );

        textContainer.addView(
                callRecordingText,
                new LinearLayout.LayoutParams(-1, -2)
        );

        LinearLayout.LayoutParams descriptionParams =
                new LinearLayout.LayoutParams(-1, -2);

        descriptionParams.topMargin = dp(3);

        textContainer.addView(
                description,
                descriptionParams
        );

        callRecordingRow.addView(
                textContainer,
                new LinearLayout.LayoutParams(
                        0,
                        -2,
                        1
                )
        );

        Switch forceSwitch = new Switch(this);

        forceSwitch.setChecked(
                ChangeFlags.isCallRecordingForced(this)
        );

        forceSwitch.setOnCheckedChangeListener(
                new CompoundButton.OnCheckedChangeListener() {
                    @Override
                    public void onCheckedChanged(
                            CompoundButton button,
                            boolean checked
                    ) {
                        ChangeFlags.setCallRecordingForced(
                                ChangeFlagsActivity.this,
                                checked
                        );
                    }
                }
        );

        callRecordingRow.addView(
                forceSwitch,
                new LinearLayout.LayoutParams(
                        -2,
                        -2
                )
        );

        LinearLayout.LayoutParams rowParams =
                new LinearLayout.LayoutParams(-1, -2);

        rowParams.topMargin = dp(12);

        root.addView(
                callRecordingRow,
                rowParams
        );

        addSection(root, "OTHER FLAGS");

        TextView comingSoon =
                createText(
                        "More flags will appear here as they are added.",
                        15,
                        Typeface.NORMAL
                );

        LinearLayout.LayoutParams comingSoonParams =
                new LinearLayout.LayoutParams(-1, -2);

        comingSoonParams.topMargin = dp(8);

        root.addView(
                comingSoon,
                comingSoonParams
        );

        setContentView(scrollView);
    }

    private void addSection(
            LinearLayout root,
            String title
    ) {
        TextView section =
                createText(
                        title,
                        13,
                        Typeface.BOLD
                );

        LinearLayout.LayoutParams params =
                new LinearLayout.LayoutParams(-1, -2);

        params.topMargin = dp(28);
        params.bottomMargin = dp(4);

        root.addView(section, params);
    }
}
