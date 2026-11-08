package com.anderson.applemusic.one.screen;

import com.anderson.applemusic.one.media.MediaClient;

import java.util.List;

/** One screen's interest in a browse node, routed by {@link ScreenHost}. */
public interface ChildSink {

    void onChildren(String parentId, List<MediaClient.Item> children);

    void onFailed(String parentId);
}
