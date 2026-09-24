package app.morphe.extension.music.jam;

import android.content.Context;
import android.preference.Preference;
import android.util.AttributeSet;

/** Player-settings entry for selecting the approved local Jam Layer package. */
@SuppressWarnings("deprecation")
public final class JamCompanionPackagePreference extends Preference {

  public JamCompanionPackagePreference(Context context, AttributeSet attrs) {
    super(context, attrs);
    setPersistent(false);
  }

  @Override
  protected void onClick() {
    JamUi.configureCompanion(getContext());
  }
}
