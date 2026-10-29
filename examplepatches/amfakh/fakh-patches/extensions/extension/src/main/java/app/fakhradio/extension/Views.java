package app.fakhradio.extension;

import android.view.View;
import android.widget.ImageView;

import java.util.HashMap;
import java.util.Map;

/** Looks up the app's own views by their id name, since this module has no access to the app's R class. */
final class Views {
    private static final Map<String, Integer> IDS = new HashMap<>();

    private Views() {
    }

    /** The id of [idName]. Resolving a name is slow, and the views that look things up do it on every frame. */
    private static int id(View from, String idName) {
        Integer id = IDS.get(idName);
        if (id == null) {
            id = from.getResources().getIdentifier(idName, "id", from.getContext().getPackageName());
            IDS.put(idName, id);
        }
        return id;
    }

    /** The view named [idName] in the window [from] sits in, or null when it is not there. */
    static View view(View from, String idName) {
        int id = id(from, idName);
        return id == 0 ? null : from.getRootView().findViewById(id);
    }

    /** The image view named [idName] in the window [from] sits in, or null when it is not there. */
    static ImageView image(View from, String idName) {
        View view = view(from, idName);
        return view instanceof ImageView ? (ImageView) view : null;
    }
}
