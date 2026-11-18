package nl.johninnl.mapsreplay;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
/** Test-only Activity: starts a controlled publisher in a foreground service, then leaves Maps visible. */
public final class ReplayActivity extends Activity {
 @Override public void onCreate(Bundle state){super.onCreate(state);Intent i=new Intent(this,ReplayService.class);if(getIntent().getExtras()!=null)i.putExtras(getIntent().getExtras());startForegroundService(i);finish();}
}
