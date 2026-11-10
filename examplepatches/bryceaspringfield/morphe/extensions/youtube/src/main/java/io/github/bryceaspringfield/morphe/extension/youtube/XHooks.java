package io.github.bryceaspringfield.morphe.extension.youtube;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.patches.components.Filter;

/** Entry points the patch calls from Morphe's own classes. */
@SuppressWarnings("unused")
public final class XHooks {

    private XHooks() {
    }

    /** Appends the bundle's Litho filters to Morphe's list, as LithoFilterPatch's static initializer sets it. */
    public static Filter[] addFilters(Filter[] morphe) {
        try {
            Filter[] extra = {new XFilter(), new XLayoutFilter()};
            Filter[] out = new Filter[morphe.length + extra.length];
            System.arraycopy(morphe, 0, out, 0, morphe.length);
            System.arraycopy(extra, 0, out, morphe.length, extra.length);
            return out;
        } catch (Throwable t) {
            Logger.printException(() -> "YouTube Extras: filters not added", t);
            return morphe;
        }
    }
}
