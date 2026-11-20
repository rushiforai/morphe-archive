package app.template.extension.hevalcontrols;

import java.util.Collection;
import java.util.Map;

/**
 * Persistence behind {@link HevalSettings}. {@link PrefsStore} is the real one; unit tests use an
 * in-memory fake. Implementations may throw: the engine treats any failure as "stock behaviour".
 */
interface Store {
    /** Every stored value (Boolean, String or a Set of String). */
    Map<String, ?> readAll();

    /** Applies [puts] and [removes] in one synchronous commit; false when nothing was saved. */
    boolean commit(Map<String, Object> puts, Collection<String> removes);

    /** Called after another writer changed the store (may be on any thread). */
    void setOnChange(Runnable listener);
}
