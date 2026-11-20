package app.template.extension.shazam;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

/**
 * Catches Spotify's {@code shazam-spotifyoauth://spotifylogincallback/...} redirect at the end of
 * the browser login and hands it to {@link SpotifyBrowserLoginPatch}. Added to the manifest by the
 * patch; shows nothing and finishes at once.
 */
@SuppressWarnings("unused")
public final class SpotifyRedirectReceiverActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Intent intent = getIntent();
        SpotifyBrowserLoginPatch.onRedirect(intent == null ? null : intent.getData());
        finish();
    }
}
