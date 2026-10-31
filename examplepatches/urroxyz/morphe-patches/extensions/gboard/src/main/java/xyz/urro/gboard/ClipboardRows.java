package xyz.urro.gboard;

/** Display positions add one remote section without changing the native list's order or indices. */
final class ClipboardRows {
    final int insertion;
    final int added;
    final int nativeCount;

    ClipboardRows(int[] nativeTypes, int remoteItems, boolean visible) {
        if (remoteItems < 0) throw new IllegalArgumentException("Negative remote count");
        nativeCount = nativeTypes.length;
        int boundary = nativeCount;
        for (int i = 0; i < nativeCount; i++) {
            if (nativeTypes[i] != 0 && nativeTypes[i] != 1) { boundary = i; break; }
        }
        insertion = boundary;
        added = visible ? remoteItems + 1 : 0;
    }

    int count() { return nativeCount + added; }
    boolean remote(int display) { return display >= insertion && display < insertion + added; }
    int nativePosition(int display) {
        if (display < 0) return display;
        return remote(display) ? -1 : display < insertion ? display : display - added;
    }
    int displayPosition(int nativePosition) {
        return nativePosition < insertion ? nativePosition : nativePosition + added;
    }
}
