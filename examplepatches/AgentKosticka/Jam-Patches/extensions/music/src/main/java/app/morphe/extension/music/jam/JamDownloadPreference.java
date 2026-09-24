package app.morphe.extension.music.jam;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.preference.Preference;
import android.util.AttributeSet;

/** Opens the latest Jam Layer release in the user's browser. */
@SuppressWarnings("deprecation")
public final class JamDownloadPreference extends Preference {

  private static final Uri RELEASES = Uri.parse(
    "https://github.com/AgentKosticka/Jam-Layer/releases/latest"
  );

  public JamDownloadPreference(Context context, AttributeSet attrs) {
    super(context, attrs);
    setPersistent(false);
  }

  @Override
  protected void onClick() {
    try {
      getContext().startActivity(new Intent(Intent.ACTION_VIEW, RELEASES));
    } catch (RuntimeException error) {
      JamUi.toast(
        getContext(),
        "No browser is available to download Jam Layer"
      );
    }
  }
}
