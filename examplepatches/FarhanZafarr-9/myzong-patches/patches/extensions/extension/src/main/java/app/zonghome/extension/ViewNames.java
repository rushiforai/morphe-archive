package app.zonghome.extension;

import android.util.SparseArray;
import android.view.View;
import java.util.HashMap;

final class ViewNames {
    private ViewNames() {}
    private static final SparseArray<String> NAMES = new SparseArray<>();
    private static final HashMap<String, Integer> IDS = new HashMap<>();
    static String name(View view) {
        int id = view.getId();
        if (id == View.NO_ID) return "";
        String name = NAMES.get(id);
        if (name == null) {
            try { name = view.getResources().getResourceEntryName(id); }
            catch (android.content.res.Resources.NotFoundException ignored) { name = ""; }
            NAMES.put(id, name);
        }
        return name;
    }
    static View find(View root, String name) {
        Integer id = IDS.get(name);
        if (id == null) {
            id = root.getResources().getIdentifier(name, "id", "com.zong.customercare");
            IDS.put(name, id);
        }
        return id == 0 ? null : root.findViewById(id);
    }
}
