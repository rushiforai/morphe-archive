package com.ss.android.ugc.aweme.series.innerfeed.viewmodel;

import java.util.ArrayList;
import java.util.List;

/**
 * The series model as the full screen player reaches it, by class name and reflection. A request
 * adds {@link #growsWith} to the list when it's set, and otherwise the page never arrives.
 */
public final class SeriesInnerFeedViewModel {
    public final List<Integer> modes = new ArrayList<>();
    public boolean hasNext;
    public Object growsWith;
    private final List<Object> awemes;

    public SeriesInnerFeedViewModel(List<Object> awemes) {
        this.awemes = awemes;
    }

    public List<Object> getAwemeList() {
        return awemes;
    }

    public boolean hasNext() {
        return hasNext;
    }

    public boolean isLoading() {
        return false;
    }

    public void request(int mode, Object params, int pageType, boolean refresh) {
        modes.add(mode);
        if (growsWith != null) awemes.add(growsWith);
    }
}
