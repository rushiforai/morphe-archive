package app.template.extension.googlemessages;

import android.app.Activity;
import android.os.Bundle;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

@SuppressWarnings("unused")
public class KeywordSettingsActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setTitle("Keyword Filter");

        final int m = (int) (16 * getResources().getDisplayMetrics().density);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setFitsSystemWindows(true);

        TextView hint = new TextView(this);
        hint.setText("One keyword per line. Incoming SMS/RCS containing any of them "
            + "(case-insensitive) are dropped permanently. Empty list = nothing dropped.");
        LinearLayout.LayoutParams hintLp = new LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        hintLp.setMargins(m, m, m, m / 2);
        root.addView(hint, hintLp);

        final EditText edit = new EditText(this);
        edit.setGravity(Gravity.TOP | Gravity.START);
        edit.setInputType(InputType.TYPE_CLASS_TEXT
            | InputType.TYPE_TEXT_FLAG_MULTI_LINE
            | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        edit.setText(KeywordFilter.readRaw(this));
        LinearLayout.LayoutParams editLp = new LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT, 0, 1f);
        editLp.setMargins(m, 0, m, 0);
        root.addView(edit, editLp);

        Button save = new Button(this);
        save.setText("Save");
        save.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    int n = KeywordFilter.write(KeywordSettingsActivity.this,
                        edit.getText().toString());
                    Toast.makeText(KeywordSettingsActivity.this,
                        "Saved " + n + " keyword(s)", Toast.LENGTH_SHORT).show();
                } catch (Throwable t) {
                    Toast.makeText(KeywordSettingsActivity.this,
                        "Save failed: " + t, Toast.LENGTH_LONG).show();
                }
            }
        });
        LinearLayout.LayoutParams saveLp = new LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        saveLp.setMargins(m, m / 2, m, m);
        root.addView(save, saveLp);

        setContentView(root);
    }
}
