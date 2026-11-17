package semicoloncolonel.mobilestream.extension.netflix.categories;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Netflix — "Surprise me".
 *
 * A screenless shortcut target: it picks a random category from the bundled
 * list (the same content-verified genre codes used by the Hidden Categories
 * screen) and opens it inside Netflix through the app's own deep-link handler,
 * then closes. A quick way to land somewhere unexpected to browse.
 */
@SuppressWarnings("unused")
public final class SurpriseMeActivity extends Activity {

    private static final String ASSET = "netflix_hidden_genres.tsv";
    private static final String GENRE_URL = "https://www.netflix.com/browse/genre/";
    private static final String NETFLIX_PKG = "com.netflix.mediaclient";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            List<String> ids = new ArrayList<>();
            try (InputStream in = getAssets().open(ASSET);
                 BufferedReader r = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8))) {
                String line;
                while ((line = r.readLine()) != null) {
                    int tab = line.indexOf('\t');
                    if (tab > 0) ids.add(line.substring(0, tab));
                }
            }
            if (ids.isEmpty()) {
                Toast.makeText(this, "No categories to surprise you with.", Toast.LENGTH_SHORT).show();
            } else {
                String id = ids.get(new Random().nextInt(ids.size()));
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(GENRE_URL + id));
                intent.setPackage(NETFLIX_PKG);
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            }
        } catch (Exception ex) {
            Toast.makeText(this, "Could not pick a surprise.", Toast.LENGTH_SHORT).show();
        }
        finish();
    }
}
