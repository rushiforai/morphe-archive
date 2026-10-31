/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.common;
import android.content.*;import android.preference.*;import android.widget.Toast;
import app.morphe.extension.shared.Logger;import app.morphe.extension.shared.settings.BaseSettings;
/** Use the existing debug switch/export. No timed capture or independent report store. */
@SuppressWarnings("deprecation")
public final class DiagnosticsPage {
 private DiagnosticsPage(){}
 public static void install(PreferenceFragment fragment){
  Context c=fragment.getActivity();FeatureDiagnostics.configure(c);PreferenceScreen root=fragment.getPreferenceScreen();
  if(root.findPreference("morphe_debug_screen")!=null)return;
  PreferenceScreen page=fragment.getPreferenceManager().createPreferenceScreen(c);page.setKey("morphe_debug_screen");page.setTitle("Debugging");page.setOrder(7);root.addPreference(page);
  SwitchPreference toggle=app.bdcrusher.ytmusic.common.FeaturePreferences.toggle(c);toggle.setTitle("Enable debug logging");toggle.setSummary("Include Lyrics, sources, frame deadlines and Shaders in Morphe logs.");toggle.setPersistent(false);toggle.setChecked(BaseSettings.DEBUG.get());toggle.setOnPreferenceChangeListener((p,v)->{BaseSettings.DEBUG.save((Boolean)v);PersonalRuntime.diagnosticsChanged();return true;});page.addPreference(toggle);
  Preference copy=app.bdcrusher.ytmusic.common.FeaturePreferences.action(c);copy.setTitle("Export debug logs");copy.setOnPreferenceClickListener(p->{((ClipboardManager)c.getSystemService(Context.CLIPBOARD_SERVICE)).setPrimaryClip(ClipData.newPlainText("Morphe debug logs",Logger.getFilteredLogs()));Toast.makeText(c,"Debug logs copied",Toast.LENGTH_SHORT).show();return true;});page.addPreference(copy);
 }
}
