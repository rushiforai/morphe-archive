package dev.personal.niagaraweather;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Switch;
import android.widget.TextView;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONObject;

/** One added settings screen; the home, forecast renderer and animations remain in Niagara. */
public final class WeatherSettingsActivity extends Activity {
  private final ExecutorService worker = Executors.newSingleThreadExecutor();
  private EditText apiKey;
  private EditText city;
  private Switch enabled;
  private android.widget.RadioButton fahrenheit;
  private WeatherSettingsView screen;
  private TextView status;
  private Button save;
  private Button clear;
  private SharedPreferences preferences;
  private boolean busy;

  @Override
  public void onCreate(Bundle state) {
    super.onCreate(state);
    getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
    getWindow().setStatusBarColor(WeatherSettingsView.BACKGROUND);
    getWindow().setNavigationBarColor(WeatherSettingsView.BACKGROUND);
    preferences = WeatherPatch.nativePreferences(this);
    WeatherPatch.recoverRestoredKey(this, preferences);
    screen = new WeatherSettingsView(this, preferences);
    apiKey = screen.apiKey;
    city = screen.city;
    enabled = screen.enabled;
    fahrenheit = screen.fahrenheit;
    status = screen.status;
    save = screen.save;
    clear = screen.clear;
    save.setOnClickListener(view -> save());
    clear.setOnClickListener(
        view ->
            new android.app.AlertDialog.Builder(this)
                .setTitle("Remove your saved key?")
                .setMessage(
                    "Weather will be disabled. You can connect OpenWeather again at any time.")
                .setNegativeButton("Keep key", null)
                .setPositiveButton("Remove", (dialog, which) -> clear())
                .show());
    screen.done.setOnClickListener(
        view -> {
          if (!busy) returnToLauncher();
        });
    if (android.os.Build.VERSION.SDK_INT >= 33) {
      getOnBackInvokedDispatcher()
          .registerOnBackInvokedCallback(
              android.window.OnBackInvokedDispatcher.PRIORITY_DEFAULT, () -> onBackPressed());
    }
  }

  private void save() {
    if (busy) return;
    if (!enabled.isChecked()) {
      preferences.edit().putBoolean(WeatherPatch.ENABLED, false).apply();
      WeatherPatch.refresh();
      showStatus("Home-screen weather is off. Your saved key is retained.", 0);
      return;
    }
    final String entered = apiKey.getText().toString().trim();
    final String location = city.getText().toString().trim();
    final boolean imperial = fahrenheit.isChecked();
    if (!entered.isEmpty() && !entered.matches("[a-fA-F0-9]{32}")) {
      apiKey.setError("Use the 32-character OpenWeather key");
      showStatus("Check your API key and try again.", 3);
      return;
    }
    setBusy(true);
    showStatus("Connecting to OpenWeather and checking your forecast…", 2);
    worker.execute(
        () -> {
          try {
            String key = entered.isEmpty() ? WeatherPatch.readKey(this) : entered;
            if (key.isEmpty()) throw new java.io.IOException("Enter your OpenWeather API key.");
            JSONObject current;
            String language = WeatherPatch.language();
            if (location.isEmpty()) {
              float latitude =
                  preferences.getFloat("bitpit.launcher.key.WEATHER_LOCATION_LAT", Float.NaN);
              float longitude =
                  preferences.getFloat("bitpit.launcher.key.WEATHER_LOCATION_LONG", Float.NaN);
              if (!Float.isFinite(latitude)
                  || !Float.isFinite(longitude)
                  || latitude == -1f
                  || longitude == -1f)
                throw new java.io.IOException("Enter a city to choose your weather location.");
              current = WeatherPatch.current(latitude, longitude, key, language);
              String payload = WeatherPatch.complete(current, key, language);
              finishSave(
                  key,
                  location,
                  imperial,
                  latitude,
                  longitude,
                  payload,
                  current.getJSONObject("main").getDouble("temp"));
            } else {
              current = WeatherPatch.current(location, key, language);
              JSONObject coordinates = current.getJSONObject("coord");
              String payload = WeatherPatch.complete(current, key, language);
              finishSave(
                  key,
                  location,
                  imperial,
                  (float) coordinates.getDouble("lat"),
                  (float) coordinates.getDouble("lon"),
                  payload,
                  current.getJSONObject("main").getDouble("temp"));
            }
          } catch (Exception error) {
            android.util.Log.w(
                "PersonalWeather", "Save failed: " + error.getClass().getSimpleName());
            final String message =
                error instanceof java.io.IOException
                    ? error.getMessage()
                    : "Could not save personal weather. Try entering your key again.";
            runOnUiThread(
                () -> {
                  if (!isDestroyed()) {
                    setBusy(false);
                    showStatus(message, 3);
                  }
                });
          }
        });
  }

  private void finishSave(
      String key,
      String location,
      boolean imperial,
      float latitude,
      float longitude,
      String payload,
      double temperature)
      throws Exception {
    WeatherPatch.validatePayload(payload);
    WeatherPatch.saveKey(this, key);
    WeatherPatch.secrets(this).edit().putString("city", location).commit();
    // Write a key-free response that the existing Niagara cache reader can consume.
    File temporary = new File(getCacheDir(), "personal-weather.tmp");
    Files.write(temporary.toPath(), payload.getBytes(StandardCharsets.UTF_8));
    Files.move(
        temporary.toPath(),
        new File(getCacheDir(), "weather2").toPath(),
        java.nio.file.StandardCopyOption.REPLACE_EXISTING);
    runOnUiThread(
        () -> {
          if (isDestroyed()) return;
          preferences
              .edit()
              .putBoolean(WeatherPatch.READY, true)
              .putBoolean("bitpit.launcher.key.WEATHER_LOCATION_IS_DYNAMIC", false)
              .putFloat("bitpit.launcher.key.WEATHER_LOCATION_LAT", latitude)
              .putFloat("bitpit.launcher.key.WEATHER_LOCATION_LONG", longitude)
              .putString("bitpit.launcher.key.WEATHER_LOCATION_NAME", location)
              .putInt("bitpit.launcher.key.WEATHER_TEMPERATURE_UNIT", imperial ? 1 : 0)
              .putBoolean(WeatherPatch.ENABLED, true)
              .apply();
          apiKey.setText("");
          screen.setSavedKey(true);
          setBusy(false);
          double shown = imperial ? temperature * 1.8 + 32 : temperature;
          showStatus(
              String.format(
                  java.util.Locale.getDefault(),
                  "Weather loaded successfully · %.0f°%s\nReturn to Niagara to view the weather.",
                  shown,
                  imperial ? "F" : "C"),
              1);
          try {
            if (!WeatherPatch.publish(payload)) WeatherPatch.refresh();
          } catch (Exception error) {
            status.append("\nSaved. Reopen Niagara to refresh its display.");
          }
        });
  }

  private void clear() {
    if (busy) return;
    WeatherPatch.secrets(this).edit().clear().apply();
    preferences
        .edit()
        .putBoolean(WeatherPatch.READY, false)
        .putBoolean(WeatherPatch.ENABLED, false)
        .apply();
    new File(getCacheDir(), "weather2").delete();
    apiKey.setText("");
    screen.setSavedKey(false);
    enabled.setChecked(false);
    showStatus("Key removed. Connect again whenever you’re ready.", 0);
    WeatherPatch.refresh();
  }

  private void setBusy(boolean value) {
    busy = value;
    screen.setBusy(value);
  }

  private void showStatus(String message, int tone) {
    status.setText(message);
    screen.setStatusTone(tone);
  }

  private void returnToLauncher() {
    android.content.Intent home =
        new android.content.Intent()
            .setClassName(getPackageName(), "bitpit.launcher.ui.HomeActivity")
            .addFlags(
                android.content.Intent.FLAG_ACTIVITY_NEW_TASK
                    | android.content.Intent.FLAG_ACTIVITY_CLEAR_TOP);
    startActivity(home);
    finish();
  }

  @Override
  protected void onDestroy() {
    worker.shutdown();
    super.onDestroy();
  }

  @Override
  public void onBackPressed() {
    if (busy) {
      android.widget.Toast.makeText(
              this,
              "Please wait for the weather check to finish.",
              android.widget.Toast.LENGTH_SHORT)
          .show();
      return;
    }
    returnToLauncher();
  }
}
