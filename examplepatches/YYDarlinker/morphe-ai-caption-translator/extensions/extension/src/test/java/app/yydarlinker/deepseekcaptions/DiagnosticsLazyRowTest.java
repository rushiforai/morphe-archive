package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;
import android.app.Activity;
import android.view.*;
import android.widget.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class) @Config(sdk={28,35})
public class DiagnosticsLazyRowTest {
    @Test public void collapsedPreferenceOwnsOnlyHeaderAndHintAndReusesExpandedViews(){
        Activity activity=Robolectric.buildActivity(Activity.class).setup().visible().get();
        try {
            FrameLayout parent=new FrameLayout(activity);activity.setContentView(parent);
            DeepSeekDiagnosticsPreference preference=new DeepSeekDiagnosticsPreference(activity);
            View row=preference.getView(null,parent);parent.addView(row);
            assertNull(row.findViewWithTag("ai_diagnostics_body"));
            preference.refreshCaptionText();assertNull(row.findViewWithTag("ai_diagnostics_body"));
            Button toggle=row.findViewWithTag("ai_diagnostics_toggle");toggle.performClick();
            TextView body=row.findViewWithTag("ai_diagnostics_body");assertNotNull(body);assertTrue(body.isTextSelectable());
            toggle.performClick();toggle.performClick();
            assertSame(body,row.findViewWithTag("ai_diagnostics_body"));
            parent.removeView(row);preference.refreshCaptionText();
        } finally {activity.finish();}
    }
}
