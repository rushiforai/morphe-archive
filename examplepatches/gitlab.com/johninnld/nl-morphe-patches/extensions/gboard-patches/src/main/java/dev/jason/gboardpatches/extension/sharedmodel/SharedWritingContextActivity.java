package dev.jason.gboardpatches.extension.sharedmodel;
import android.app.Activity;
import android.os.Bundle;
/** Compatibility entry: writing preferences are rendered by the existing themed Patches screen. */
public final class SharedWritingContextActivity extends Activity {
 @Override public void onCreate(Bundle saved){super.onCreate(saved);SharedModelSetupActivity.openContextSettings(this);finish();}
}
