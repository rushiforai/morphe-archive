package app.template.extension.shatteredpixeldungeon;

import android.content.Context;
import android.util.Log;

import com.watabou.noosa.Image;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * The patches' own icons: PNG files added to the game with the patches, loaded like the game's own pictures. Add one by putting its PNG in
 * patches/src/main/resources/cloverlord/icons and its name in that folder's index.txt, or let tools/merge_icons.py make it from layers of
 * other pictures. Tags and other icon choices can use one as "CUSTOM:name".
 */
final class CustomIcons {

	static final String PREFIX = "CUSTOM:";
	static final String EQUIPMENT = "equipment";

	private static final String TAG = "CustomIcons";
	private static final String FOLDER = "cloverlord/icons/";
	private static final String INDEX = FOLDER + "index.txt";

	private static List<String> names;

	private CustomIcons() {
	}

	/**
	 * Every custom icon's name, read once from the index added with them.
	 */
	static synchronized List<String> names() {
		if (names != null) return names;
		List<String> found = new ArrayList<>();
		Context context = SaveLocation.getContext();
		if (context != null) {
			try (InputStream in = context.getAssets().open(INDEX); BufferedReader reader = new BufferedReader(new InputStreamReader(in))) {
				for (String line = reader.readLine(); line != null; line = reader.readLine()) {
					String name = line.trim();
					if (!name.isEmpty()) found.add(name);
				}
			} catch (Throwable e) {
				Log.e(TAG, "Could not read the custom icons", e);
			}
		}
		names = Collections.unmodifiableList(found);
		return names;
	}

	/**
	 * The custom icon [name], or null when there is none.
	 */
	static Image image(String name) {
		if (!names().contains(name)) return null;
		try {
			return new Image(FOLDER + name + ".png");
		} catch (Throwable e) {
			Log.e(TAG, "Could not load the icon " + name, e);
			return null;
		}
	}
}
