package app.pablobaro.extension.spotify;

/**
 * Locates the root view of a layout inflated by {@code LayoutInflater.inflate(int, ViewGroup, boolean)}.
 */
final class InflatedAdLayout {
    /**
     * The view returned by the inflater is the inflated layout root.
     */
    static final int RETURNED_VIEW = -1;
    /**
     * The inflated layout root cannot be found.
     */
    static final int NONE = -2;

    private InflatedAdLayout() {
    }

    /**
     * When inflating with {@code attachToRoot}, the inflater appends the inflated view to the root
     * and returns the root instead.
     *
     * @param attachToRoot   The {@code attachToRoot} argument of the inflation.
     * @param returnedRoot   Whether the inflater returned the root it was given.
     * @param rootChildCount The number of children of the root after the inflation.
     * @return {@link #RETURNED_VIEW}, the index of the inflated view among the children of the root, or {@link #NONE}.
     */
    static int indexOfInflatedView(boolean attachToRoot, boolean returnedRoot, int rootChildCount) {
        if (!attachToRoot || !returnedRoot) return RETURNED_VIEW;
        return rootChildCount > 0 ? rootChildCount - 1 : NONE;
    }
}
