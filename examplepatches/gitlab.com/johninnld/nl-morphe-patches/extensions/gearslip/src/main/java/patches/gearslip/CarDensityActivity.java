package patches.gearslip;

import android.app.Activity;
import android.graphics.Insets;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.MenuItem;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.TextView;

/** Phone-side control. Reconnect instead of resizing a running app's surface underneath it. */
public final class CarDensityActivity extends Activity {
    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        setTitle(DrawerApps.text("Dichtheid autoscherm", "Car display density"));
        if (getActionBar() != null) getActionBar().setDisplayHomeAsUpEnabled(true);

        ScrollView scroll = new ScrollView(this);
        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(content);
        scroll.setOnApplyWindowInsetsListener((view, insets) -> {
            Insets bars = insets.getInsets(WindowInsets.Type.systemBars());
            content.setPadding(dp(20), bars.top + dp(16), dp(20), bars.bottom + dp(16));
            return insets;
        });

        TextView explanation = new TextView(this);
        explanation.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        explanation.setText(DrawerApps.text(
                "Een hogere DPI maakt tekst en knoppen groter, ook in navigatie-apps. De resolutie blijft gelijk. Probeer eerst 200 DPI. Stel Gearslips Grootte eerst in op Normaal; Groter en Extra groot vergroten nog verder.",
                "Higher DPI makes text and controls larger, including in navigation apps. Resolution stays the same. Try 200 DPI first. Start with Gearslip's Size set to Normal; Large and Extra large enlarge it further."));
        content.addView(explanation);

        RadioGroup choices = new RadioGroup(this);
        int selected = CarDensity.selected(this);
        for (int dpi : new int[]{0, 160, 180, 200, 220, 240}) {
            RadioButton choice = new RadioButton(this);
            choice.setId(android.view.View.generateViewId());
            choice.setText(dpi == 0 ? DrawerApps.text("Van de auto (standaard)", "From car (default)") : dpi + " DPI");
            choice.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
            choice.setMinHeight(dp(56));
            choices.addView(choice, new RadioGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            choice.setChecked(dpi == selected);
            choice.setOnCheckedChangeListener((button, checked) -> { if (checked) CarDensity.save(this, dpi); });
        }
        content.addView(choices);

        TextView note = new TextView(this);
        note.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        note.setText(DrawerApps.text(
                "Opgeslagen zodra je kiest. Verbind opnieuw met de auto of sluit en heropen het autovoorbeeld. Bij afgesneden knoppen: kies een lagere DPI of Van de auto. Het telefoonscherm en schermspiegeling veranderen niet.",
                "Saved when selected. Reconnect to the car or close and reopen the car preview. If controls are clipped, choose a lower DPI or From car. The phone screen and phone mirroring are unaffected."));
        content.addView(note);
        setContentView(scroll);
    }

    @Override public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == android.R.id.home) { finish(); return true; }
        return super.onOptionsItemSelected(item);
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}
