package ya;

import android.util.ArrayMap;
import b.u4;
import java.util.AbstractMap;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/* loaded from: classes2.dex */
public final class e0 {
    static {
        Map.Entry[] entryArr = {new AbstractMap.SimpleEntry("All Apps Bounce", new String[]{"launcher.apps_view_shown", "launcher.home_bounce_count"}), new AbstractMap.SimpleEntry("Hybrid Hotseat Education", new String[]{"launcher.hotseat_discovery_tip_count", "launcher.hotseat_longpress_tip_seen"}), new AbstractMap.SimpleEntry("Search Education", new String[]{"launcher.search_edu_seen", "launcher.keyboard_snackbar_count"}), new AbstractMap.SimpleEntry("Taskbar Education", new String[]{"launcher.taskbar_edu_seen"})};
        HashMap map = new HashMap(4);
        for (int i5 = 0; i5 < 4; i5++) {
            Map.Entry entry = entryArr[i5];
            Object key = entry.getKey();
            Objects.requireNonNull(key);
            Object value = entry.getValue();
            Objects.requireNonNull(value);
            if (map.put(key, value) != null) {
                throw new IllegalArgumentException(u4.h(key, "duplicate key: "));
            }
        }
        Collections.unmodifiableMap(map);
        ArrayMap arrayMap = new ArrayMap(4);
        arrayMap.put("launcher.home_bounce_count", 3);
        arrayMap.put("launcher.hotseat_discovery_tip_count", 5);
        arrayMap.put("launcher.keyboard_snackbar_count", 3);
        Collections.unmodifiableMap(arrayMap);
    }
}
