package slick.android;

import android.app.Activity;
import android.app.Dialog;
import android.content.Intent;
import android.graphics.fonts.Font;
import android.net.Uri;
import android.os.Bundle;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;

public final class FontActivity extends Activity {
  private Dialog progress;
  private boolean busy;

  @Override
  public void onCreate(Bundle state) {
    super.onCreate(state);
    if (state == null) choose();
    else finish(); // Never leave an empty translucent host after recreation.
  }

  private void choose() {
    NativeDialogs.show(
            this,
            "Text font · " + Fonts.label(),
            null,
            new String[] {"System default", "Lexend", "Import TTF / OTF (up to 8 MiB)…"},
            (d, which) -> {
              if (which < 2) save(which == 0 ? "default" : "lexend", null);
              else
                try {
                  startActivityForResult(
                      new Intent(Intent.ACTION_OPEN_DOCUMENT)
                          .setType("*/*")
                          .addCategory(Intent.CATEGORY_OPENABLE),
                      713);
                } catch (RuntimeException e) {
                  error("No document picker available. Your font is unchanged.");
                }
            },
            null,
            null,
            "Cancel",
            (d, which) -> finish())
        .setOnCancelListener(d -> finish());
  }

  private void error(String message) {
    NativeDialogs.show(
            this,
            "Could not change font",
            message,
            null,
            null,
            "Close",
            (d, which) -> finish(),
            null,
            null)
        .setOnCancelListener(d -> finish());
  }

  @Override
  protected void onActivityResult(int request, int result, Intent data) {
    super.onActivityResult(request, result, data);
    if (request != 713) return;
    if (result == RESULT_OK && data != null && data.getData() != null) save(null, data.getData());
    else finish();
  }

  private void save(String choice, Uri uri) {
    if (busy) return;
    busy = true;
    progress =
        NativeDialogs.show(
            this, "Text font", "Checking and saving font…", null, null, null, null, null, null);
    progress.setCancelable(false);
    new Thread(
            () -> {
              String failure = store(choice, uri);
              runOnUiThread(() -> {
                busy = false;
                if (isFinishing() || isDestroyed()) return;
                progress.dismiss();
                // Reselecting a saved font still offers restart: Later may have left
                // the old process-lifetime font cache active.
                if (failure == null) Restart.offer(this, this::finish);
                else error(failure);
              });
            },
            "slick-font-import")
        .start();
  }

  private String store(String choice, Uri uri) {
    File temporary = null;
    try {
      String selected = choice;
      if (uri != null) {
        if (!"content".equals(uri.getScheme()))
          throw new IllegalArgumentException("Use the document picker");
        File directory = new File(getNoBackupFilesDir(), "slick-fonts");
        if (!directory.isDirectory() && !directory.mkdirs())
          throw new IOException("Cannot create font directory");
        temporary = File.createTempFile("import-", ".tmp", directory);
        try (InputStream input = getContentResolver().openInputStream(uri)) {
          selected = FontImport.copy(input, temporary);
        }
        new Font.Builder(temporary).build();
        File target = new File(directory, selected);
        if (!target.exists()) Files.move(temporary.toPath(), target.toPath());
      } else if ("lexend".equals(choice)) {
        new Font.Builder(getAssets(), "slick/Lexend.ttf").build();
      }
      if (!selected.equals(Settings.preferences.getString("text_font", "default"))
          && !Settings.preferences.edit().putString("text_font", selected).commit())
        throw new IOException("Could not save selection");
      return null;
    } catch (Exception e) {
      return "Could not import/save font. Use a valid TTF/OTF under 8 MiB. Your existing font files"
          + " have not been overwritten.";
    } finally {
      if (temporary != null) temporary.delete();
    }
  }
}
