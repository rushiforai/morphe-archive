package app.bitchord.telegram;

import java.util.*;

/** Isolated v1.8.1 registry adapter; preserves the user's enable/disable choice. */
public final class NativeSource {
    static final String ID = "telegram-native";

    private NativeSource() {}

    public static boolean register(String url) throws Exception {
        Class<?> configType = Class.forName("com.music.bitchord.data.sources.SourceConfig");
        Class<?> kindType = Class.forName("com.music.bitchord.data.sources.SourceKind");
        Class<?> registry = Class.forName("com.music.bitchord.data.sources.SourceRegistry");
        Class<?> stateFlow = Class.forName("kotlinx.coroutines.flow.StateFlow");
        Object flow = registry.getField("configs").get(null);
        List<?> existing = (List<?>) stateFlow.getMethod("getValue").invoke(flow);
        boolean enabled = true;
        Object previous = null;
        for (Object row : existing)
            if (ID.equals(configType.getMethod("getId").invoke(row))) {
                previous = row;
                enabled = (Boolean) configType.getMethod("getEnabled").invoke(row);
                break;
            }
        if (previous != null && url.equals(configType.getMethod("getBaseUrl").invoke(previous)))
            return false;
        Object kind = kindType.getField("ADDON").get(null);
        Object source =
                configType
                        .getConstructor(
                                String.class,
                                kindType,
                                String.class,
                                String.class,
                                boolean.class,
                                boolean.class,
                                boolean.class)
                        .newInstance(ID, kind, "Unofficial Telegram", url, enabled, true, false);
        ArrayList<Object> next = new ArrayList<>();
        boolean inserted = false;
        for (Object row : existing) {
            if (ID.equals(configType.getMethod("getId").invoke(row))) {
                if (!inserted) {
                    next.add(source);
                    inserted = true;
                }
            } else next.add(row);
        }
        if (!inserted) next.add(source);
        registry.getMethod("publish", ArrayList.class, boolean.class).invoke(null, next, true);
        return true;
    }
}
