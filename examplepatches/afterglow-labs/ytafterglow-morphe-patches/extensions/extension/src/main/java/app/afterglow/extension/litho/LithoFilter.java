package app.afterglow.extension.litho;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Hides Litho components by their path or identifier.
 *
 * <p>A filter registers {@link StringFilterGroup}s in its constructor, each
 * gated by the iOS preference keys of the thing it hides. When an enabled
 * group's pattern is found in a component's identifier or path,
 * {@link #isFiltered} decides; the default hides the component. Override it to
 * narrow the match, for example by the component's accessibility id or by
 * bytes in its proto buffer.
 *
 * <p>Register the filter in {@link LithoFilters}. Filters run on Litho's
 * layout threads, often thousands of times a second while scrolling: keep
 * {@code isFiltered} free of I/O, locks and allocation where possible.
 */
public abstract class LithoFilter {

    /** What the matched group's pattern was found in. */
    public enum MatchType {
        /** The element identifier ({@link LithoComponent#identifier()}). */
        IDENTIFIER,
        /** The component path ({@link LithoComponent#path()}). */
        PATH
    }

    final List<StringFilterGroup> identifierCallbacks = new ArrayList<>();
    final List<StringFilterGroup> pathCallbacks = new ArrayList<>();

    /** Calls {@link #isFiltered} when a group's pattern is in a component's identifier. */
    protected final void addIdentifierCallbacks(StringFilterGroup... groups) {
        identifierCallbacks.addAll(Arrays.asList(groups));
    }

    /** Calls {@link #isFiltered} when a group's pattern is in a component's path. */
    protected final void addPathCallbacks(StringFilterGroup... groups) {
        pathCallbacks.addAll(Arrays.asList(groups));
    }

    /**
     * Called when a pattern of one of this filter's groups was found and the
     * group is on.
     *
     * @param component    the component; valid only during this call.
     * @param matchedGroup the group whose pattern was found.
     * @param matchType    whether it was found in the identifier or the path.
     * @param matchIndex   index of the pattern in the identifier or path.
     * @return true to hide the component.
     */
    public boolean isFiltered(LithoComponent component, StringFilterGroup matchedGroup,
                              MatchType matchType, int matchIndex) {
        return true;
    }
}
