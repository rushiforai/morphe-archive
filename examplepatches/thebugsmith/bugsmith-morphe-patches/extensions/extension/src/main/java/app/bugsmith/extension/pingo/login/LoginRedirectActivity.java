package app.bugsmith.extension.pingo.login;

import android.app.Activity;
import android.net.Uri;
import android.os.Bundle;

/**
 * Receives the OAuth redirect (custom scheme com.googleusercontent.apps.456815495379-cbq2...:/oauth2redirect)
 * from the browser and forwards it to LoginFlow. Declared in the patched AndroidManifest.xml by
 * the "Pingo Google login (manifest)" resource patch; the browser-flow sign-in launched by
 * LoginFlow.signIn() completes here.
 *
 * The activity has the app's default task affinity, so the browser's FLAG_ACTIVITY_NEW_TASK
 * redirect brings the app's task to the foreground with this translucent activity on top;
 * it forwards the code and finishes immediately.
 */
public class LoginRedirectActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Uri data = getIntent() == null ? null : getIntent().getData();
        LoginFlow.handleRedirect(data);
        finish();
    }
}
