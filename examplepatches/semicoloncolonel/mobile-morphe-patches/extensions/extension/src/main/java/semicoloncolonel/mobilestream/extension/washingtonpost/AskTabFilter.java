package semicoloncolonel.mobilestream.extension.washingtonpost;

import java.util.ArrayList;
import java.util.List;

/**
 * Removes the Ask tab (Ask The Post AI) from the tabs The Washington Post
 * shows in its bottom bar.
 */
@SuppressWarnings("unused")
public final class AskTabFilter {
    private AskTabFilter() {
    }

    /** Injection point: the bottom bar's setter for its list of tabs. */
    public static List<?> withoutAsk(List<?> tabs) {
        if (tabs == null) return null;
        List<Object> filtered = new ArrayList<>(tabs.size());
        for (Object tab : tabs) {
            if (tab instanceof Enum && "Ask".equals(((Enum<?>) tab).name())) continue;
            filtered.add(tab);
        }
        return filtered;
    }
}
